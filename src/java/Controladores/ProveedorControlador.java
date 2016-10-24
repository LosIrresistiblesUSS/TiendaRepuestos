package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iProveedorLogica;
import Logica.ProveedorLogica;
import Modelo.Proveedor;
import Modelo.TipoDocumento;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

@WebServlet(name = "ProveedorControlador", urlPatterns = {"/ProveedorControlador"})/*url para el navegador*/

public class ProveedorControlador extends HttpServlet{
    private static Logger logger = Logger.getLogger(ProveedorControlador.class.getName());
    
    private iProveedorLogica proveedorService;
    private Proveedor proveedor;
    private TipoDocumento tipoDocumento;
    
    private int flgOperacion = 0;
    private String mensaje = null;
    
    private HttpSession sesion;
    
     //--------------------------------------------------------------------------
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    String accion = request.getParameter("accion");

    logger.info("processRequest:" +accion);

        if (accion != null) {
            if (accion.equals("insertar")) {
                insertar(request, response);
                return;
            }
            if (accion.equals("buscar")) {
                buscar(request, response);
                return;
            } 
            if (accion.equals("obtenerPorId")) {
                obtenerPorId(request, response);
                return;
            }
            if (accion.equals("actualizar")) {
                actualizar(request, response);
                return;
            }
            if (accion.equals("eliminar")) {
                eliminar(request, response);
            }
        }
    }
        protected void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("insertar");
        
        String razonComercial = request.getParameter("razonComercial") == null ? "" : request.getParameter("razonComercial");
        String numeroDocumento = request.getParameter("numeroDocumento") == null ? "" : request.getParameter("numeroDocumento");
        String direccion = request.getParameter("direccion") == null ? "" : request.getParameter("direccion");
        String telefono = request.getParameter("telefono") == null ? "" : request.getParameter("telefono");
        String email = request.getParameter("email") == null ? "" : request.getParameter("email");
        int idTipoDocumento = Integer.parseInt(request.getParameter("idTipoDocumento") == null ? "0" : request.getParameter("idTipoDocumento"));
        
        try{
            proveedor = new Proveedor();
            tipoDocumento= new TipoDocumento();
       
            proveedor.setRazonComercial(razonComercial);
            proveedor.setNumeroDocumento(numeroDocumento);
            proveedor.setDireccion(direccion);
            proveedor.setTelefono(telefono);
            proveedor.setEmail(email);
            
            tipoDocumento.setIdTipoDocumento(idTipoDocumento);
            proveedor.setTipoDocumento(tipoDocumento);
            
            proveedorService = new ProveedorLogica();
            flgOperacion = proveedorService.insertar(proveedor);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("Proveedor", razonComercial);
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("Proveedor con Nro. de Documento ", numeroDocumento);
                    break;
                default:
                    mensaje = FuncionesMensajes.insertarError("Proveedor", razonComercial);
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaProveedor");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("proveedorActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
            
        }catch(Exception e){
            logger.error("insertar Proveedor Controlador: " + e.getMessage());
        }
    }

        protected void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("buscar");
        String razonComercial = request.getParameter("razonComercial") == null ? "" : request.getParameter("razonComercial");
        int pagina = Integer.parseInt(request.getParameter("pag") == null ? "1" : request.getParameter("pag"));
        int registrosPorPagina = Integer.parseInt(request.getParameter("nro") == null ? "10" : request.getParameter("nro"));
        
        int inicio = (pagina > 1) ? (pagina * registrosPorPagina - registrosPorPagina): 0;
       
        try{
            sesion = request.getSession();
            sesion.removeAttribute("listaProveedor");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("proveedorActualizar");
            
            proveedorService = new ProveedorLogica();
            List<Proveedor> lstProveedor = proveedorService.buscar(razonComercial, inicio, registrosPorPagina);
            int totalRegistros = proveedorService.totalRegistros(razonComercial, inicio, registrosPorPagina);
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("razonComercial", razonComercial);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            if(lstProveedor.size() > 0){
                if (!"".equals(razonComercial)) {
                    mensaje = FuncionesMensajes.buscarExitoso(razonComercial);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaProveedor", lstProveedor);
            }else{
                mensaje = FuncionesMensajes.buscarError("Proveedor", razonComercial);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("ProveedorLst.jsp");
        }catch(Exception e){
            logger.error("buscar:" + e.getMessage());
        }
    }

        protected void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            busca(request, response);
            sesion.removeAttribute("msgPostOperacion");
        }
        
        protected void obtenerPorId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("obtenerPorId");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        
        try{
            proveedorService = new ProveedorLogica();
            proveedor = proveedorService.obtenerPorId(id);
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaProveedor");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("proveedorActualizar");
            sesion.setAttribute("proveedorActualizar", proveedor);
            response.sendRedirect("ProveedorMnt.jsp");
        }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
        }
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("actualizar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        String razonComercial = request.getParameter("razonComercial") == null ? "" : request.getParameter("razonComercial");
        String numeroDocumento = request.getParameter("numeroDocumento") == null ? "" : request.getParameter("numeroDocumento");
        String direccion = request.getParameter("direccion") == null ? "" : request.getParameter("direccion");
        String telefono = request.getParameter("telefono") == null ? "" : request.getParameter("telefono");
        String email = request.getParameter("email") == null ? "" : request.getParameter("email");
        int idTipoDocumento = Integer.parseInt(request.getParameter("idTipoDocumento") == null ? "0" : request.getParameter("idTipoDocumento"));

        try{
            proveedor = new Proveedor();
            tipoDocumento= new TipoDocumento();
            
            proveedor.setIdProveedor(id);
            proveedor.setRazonComercial(razonComercial);
            proveedor.setNumeroDocumento(numeroDocumento);
            proveedor.setDireccion(direccion);
            proveedor.setTelefono(telefono);
            proveedor.setEmail(email);
            
            tipoDocumento.setIdTipoDocumento(idTipoDocumento);
            proveedor.setTipoDocumento(tipoDocumento);
            
            proveedorService = new ProveedorLogica();
            flgOperacion = proveedorService.actualizar(proveedor);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.actualizarExitoso2("Proveedor", proveedor.getRazonComercial());
                    break;
                case 2:
                    mensaje = FuncionesMensajes.actualizarAdvertencia2("Proveedor", proveedor.getNumeroDocumento());
                    break;
                default:
                    mensaje = FuncionesMensajes.actualizarError2("Proveedor", proveedor.getRazonComercial());
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaProveedor");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("proveedorActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            
            busca(request, response);
        }catch(Exception e){
            logger.error("actualizar: " + e.getMessage());
        }
    }

    protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("eliminar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        try{
            proveedorService = new ProveedorLogica();
            Proveedor proveedorEliminar = new Proveedor();
            proveedorEliminar = proveedorService.obtenerPorId(id);
            flgOperacion = proveedorService.eliminar(id);
            
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.eliminarExitoso("Proveedor ", proveedorEliminar.getRazonComercial());
            }else{
                mensaje = FuncionesMensajes.eliminarError("Proveedor", proveedorEliminar.getRazonComercial());
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaProveedor");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("proveedorActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
}