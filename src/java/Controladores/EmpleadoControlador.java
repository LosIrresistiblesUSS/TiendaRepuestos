package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iEmpleadoLogica;
import Logica.EmpleadoLogica;
import Modelo.Empleado;
import Modelo.TipoDocumento;
import Modelo.TipoEmpleado;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;


@WebServlet(name = "EmpleadoControlador", urlPatterns = {"/EmpleadoControlador"})/*url para el navegador*/

public class EmpleadoControlador extends HttpServlet {
    private static Logger logger = Logger.getLogger(EmpleadoControlador.class.getName());
    
    private iEmpleadoLogica empleadoService;
    private Empleado empleado;
    private TipoEmpleado tipoEmpleado;
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

    logger.info("processRequest: " + accion);

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
        
        String nombres = request.getParameter("nombres") == null ? "" : request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos") == null ? "" : request.getParameter("apellidos");
        String direccion = request.getParameter("direccion") == null ? "" : request.getParameter("direccion");
        String telefono = request.getParameter("telefono") == null ? "" : request.getParameter("telefono");
        String email = request.getParameter("email") == null ? "" : request.getParameter("email");
        int  idTipoDocumento = Integer.parseInt(request.getParameter("idTipoDocumento") == null ? "0" : request.getParameter("idTipoDocumento"));
        String nroDocumento = request.getParameter("nroDocumento") == null ? "" : request.getParameter("nroDocumento");
        String idTipoEmpleado = request.getParameter("idTipoEmpleado") == null ? "" : request.getParameter("idTipoEmpleado");
        try{
            empleado = new Empleado();
            
            empleado.setNombres(nombres);
            empleado.setApellidos(apellidos);
            empleado.setDireccion(direccion);
            empleado.setTelefono(telefono);
            empleado.setEmail(email);
            
            tipoDocumento = new TipoDocumento();
            tipoDocumento.setIdTipoDocumento(idTipoDocumento);
            empleado.setTipoDocumento(tipoDocumento);
            
            empleado.setNumeroDocumento(nroDocumento);
            
            tipoEmpleado = new TipoEmpleado();
            tipoEmpleado.setIdTipoEmpleado(idTipoEmpleado);
            empleado.setTipoEmpleado(tipoEmpleado);
    
            empleadoService = new EmpleadoLogica();
            flgOperacion = empleadoService.insertar(empleado);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("Empleado", nombres);
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("Empleado con Nro. de Documento ", nroDocumento);
                    break;
                default:
                    mensaje = FuncionesMensajes.insertarError("Empleado", nombres);
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("empleadoActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
            
        }catch(Exception e){
            logger.error("insertar Empleado Controlador: " + e.getMessage());
        }
    }

        protected void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("buscar");
        String nom = request.getParameter("nom") == null ? "" : request.getParameter("nom");
        int pagina = Integer.parseInt(request.getParameter("pag") == null ? "1" : request.getParameter("pag"));
        int registrosPorPagina = Integer.parseInt(request.getParameter("nro") == null ? "10" : request.getParameter("nro"));
        
        int inicio = (pagina > 1) ? (pagina * registrosPorPagina - registrosPorPagina): 0;
       
        try{
            sesion = request.getSession();
            sesion.removeAttribute("listaEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("empleadoActualizar");
            
            empleadoService = new EmpleadoLogica();
            List<Empleado> lstEmpleado = empleadoService.buscar(nom, inicio, registrosPorPagina);
            int totalRegistros = empleadoService.totalRegistros(nom, inicio, registrosPorPagina);
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("nombres", nom);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            if(lstEmpleado.size() > 0){
                if (!"".equals(nom)) {
                    mensaje = FuncionesMensajes.buscarExitoso(nom);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaEmpleado", lstEmpleado);
            }else{
                mensaje = FuncionesMensajes.buscarError("Empleado", nom);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("EmpleadoLst.jsp");
        }catch(Exception e){
            logger.error("buscar: " + e.getMessage());
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
            empleadoService = new EmpleadoLogica();
            empleado = empleadoService.obtenerPorId(id);
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("empleadoActualizar");
            sesion.setAttribute("empleadoActualizar", empleado);
            response.sendRedirect("EmpleadoMnt.jsp");
        }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
        }
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("actualizar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        String nombres = request.getParameter("nombres") == null ? "" : request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos") == null ? "" : request.getParameter("apellidos");
        String direccion = request.getParameter("direccion") == null ? "" : request.getParameter("direccion");
        String telefono = request.getParameter("telefono") == null ? "" : request.getParameter("telefono");
        String email = request.getParameter("email") == null ? "" : request.getParameter("email");
        int  idTipoDocumento = Integer.parseInt(request.getParameter("idTipoDocumento") == null ? "0" : request.getParameter("idTipoDocumento"));
        String nroDocumento = request.getParameter("nroDocumento") == null ? "" : request.getParameter("nroDocumento");
        String idTipoEmpleado = request.getParameter("idTipoEmpleado") == null ? "" : request.getParameter("idTipoEmpleado");
        try{
            empleado = new Empleado();
            
            empleado.setIdEmpleado(id);
            empleado.setNombres(nombres);
            empleado.setApellidos(apellidos);
            empleado.setDireccion(direccion);
            empleado.setTelefono(telefono);
            empleado.setEmail(email);
            
            tipoDocumento = new TipoDocumento();
            tipoDocumento.setIdTipoDocumento(idTipoDocumento);
            empleado.setTipoDocumento(tipoDocumento);
            
            empleado.setNumeroDocumento(nroDocumento);
            
            tipoEmpleado = new TipoEmpleado();
            tipoEmpleado.setIdTipoEmpleado(idTipoEmpleado);
            empleado.setTipoEmpleado(tipoEmpleado);
            
            empleadoService = new EmpleadoLogica();
            flgOperacion = empleadoService.actualizar(empleado);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.actualizarExitoso2("Empleado(a)", empleado.getNombres());
                    break;
                case 2:
                    mensaje = FuncionesMensajes.actualizarAdvertencia2("Empleado(a)", empleado.getNumeroDocumento());
                    break;
                default:
                    mensaje = FuncionesMensajes.actualizarError2("Empleado(a)", empleado.getNombres());
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("empleadoActualizar");
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
            empleadoService = new EmpleadoLogica();
            Empleado empleadoEliminar = new Empleado();
            empleadoEliminar = empleadoService.obtenerPorId(id);
            flgOperacion = empleadoService.eliminar(id);
            
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.eliminarExitoso("Empleado", empleadoEliminar.getNombres());
            }else{
                mensaje = FuncionesMensajes.eliminarError("Empleado", empleadoEliminar.getNombres());
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("empleadoActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
}