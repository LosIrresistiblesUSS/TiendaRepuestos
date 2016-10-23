package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iRepuestoLogica;
import Logica.RepuestoLogica; 
import Modelo.Repuesto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

@WebServlet(name = "RepuestoControlador", urlPatterns = {"/RepuestoControlador"})/*url para el navegador*/
public class RepuestoControlador extends HttpServlet {
    
    private static Logger logger = Logger.getLogger(RepuestoControlador.class.getName());
    
    private iRepuestoLogica repuestoService;
    private Repuesto repuesto;
    
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

        String descripcion = request.getParameter("descripcion") == null ? "" : request.getParameter("descripcion");
        int stock = Integer.parseInt(request.getParameter("stock") == null ? "0" : request.getParameter("stock"));
        double precio = Double.parseDouble(request.getParameter("precio") == null ? "0" : request.getParameter("precio"));
        double precioPorMayor = Double.parseDouble(request.getParameter("precioPorMayor") == null ? "0" : request.getParameter("precioPorMayor"));
        
        try{
            repuesto = new Repuesto();

            repuesto.setDescripcion(descripcion);
            repuesto.setStock(stock);
            repuesto.setPrecio(precio);
            repuesto.setPreciomayor(precioPorMayor);

            repuestoService = new RepuestoLogica();
            flgOperacion = repuestoService.insertar(repuesto);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("Repuesto", descripcion);
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("Repuesto", descripcion);
                    break;
                default:
                    mensaje = FuncionesMensajes.insertarError("Repuesto", descripcion);
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaRepuesto");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("productoActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
            
        }catch(Exception e){
            logger.error("insertar: " + e.getMessage());
        }
    }

        protected void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
        logger.info("buscar");
        
        String desc = request.getParameter("desc") == null ? "" : request.getParameter("desc");
        int pagina = Integer.parseInt(request.getParameter("pag") == null ? "1" : request.getParameter("pag"));
        int registrosPorPagina = Integer.parseInt(request.getParameter("nro") == null ? "10" : request.getParameter("nro"));
        int inicio = (pagina > 1) ? (pagina * registrosPorPagina - registrosPorPagina): 0;
       
        try{
            sesion = request.getSession();
            sesion.removeAttribute("listaRepuesto");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("repuestoActualizar");
            
            repuestoService = new RepuestoLogica();
            List<Repuesto> lstRepuesto = repuestoService.buscar(desc, inicio, registrosPorPagina);

            int totalRegistros = repuestoService.totalRegistros(desc, inicio, registrosPorPagina);
            
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("descripcion", desc);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            
            if(lstRepuesto.size() > 0){
                if (!"".equals(desc)) {
                    mensaje = FuncionesMensajes.buscarExitoso(desc);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaRepuesto", lstRepuesto);
            }else{
                mensaje = FuncionesMensajes.buscarError("Repuesto", desc);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("RepuestoLst.jsp");
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
            repuestoService = new RepuestoLogica();
           repuesto = repuestoService.obtenerPorId(id);
            //System.out.println("DESCRIOPCION: "+repuesto.getDescripcion());
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaProducto");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("productoActualizar");
            sesion.setAttribute("repuestoActualizar", repuesto);
            response.sendRedirect("RepuestoMnt.jsp");
        }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
        }
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("actualizar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        int idproducto = Integer.parseInt(request.getParameter("idproducto") == null ? "0" : request.getParameter("idproducto"));
        String descripcion = request.getParameter("descripcion") == null ? "" : request.getParameter("descripcion");
        int stock = Integer.parseInt(request.getParameter("stock") == null ? "0" : request.getParameter("stock"));
        double precio = Double.parseDouble(request.getParameter("precio") == null ? "0" : request.getParameter("precio"));
        double precioPorMayor = Double.parseDouble(request.getParameter("precioPorMayor") == null ? "0" : request.getParameter("precprecioPorMayor"));
        try{
            repuesto = new Repuesto();
            repuesto.setIdproducto(id);
            repuesto.setIdproducto(idproducto);
            repuesto.setDescripcion(descripcion);
            repuesto.setStock(stock);
            repuesto.setPrecio(precio);
            repuesto.setPreciomayor(precioPorMayor);
            
            
            Repuesto repuestoAnterior;
            repuestoAnterior = (Repuesto) sesion.getAttribute("repuestoActualizar");
            
            repuestoService = new RepuestoLogica();
            flgOperacion = repuestoService.actualizar(repuesto);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.actualizarExitoso("Repuesto", repuestoAnterior.getDescripcion(), repuesto.getDescripcion());
                    break;
                case 2:
                    mensaje = FuncionesMensajes.actualizarAdvertencia("Repuesto", repuesto.getDescripcion());
                    break;
                default:
                    mensaje = FuncionesMensajes.actualizarError("Repuesto", repuestoAnterior.getDescripcion(),repuesto.getDescripcion());
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaRepuesto");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("productoActualizar");
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
            repuestoService = new RepuestoLogica();
            Repuesto repuestoEliminar = new Repuesto();
            repuestoEliminar = repuestoService.obtenerPorId(id);
            flgOperacion = repuestoService.eliminar(id);
            System.out.println(flgOperacion);
            System.out.println(id);
            
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.eliminarExitoso("Repuesto", repuestoEliminar.getDescripcion());
            }else{
                mensaje = FuncionesMensajes.eliminarError("Repuesto", repuestoEliminar.getDescripcion());
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaRepuesto");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("repuestoActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
}