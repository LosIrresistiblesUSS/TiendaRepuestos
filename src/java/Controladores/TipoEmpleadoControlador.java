package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iTipoEmpleadoLogica;
import Logica.TipoEmpleadoLogica;
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

@WebServlet(name = "TipoEmpleadoControlador", urlPatterns = {"/TipoEmpleadoControlador"})/*url para el navegador*/
public class TipoEmpleadoControlador extends HttpServlet{
    
    private static Logger logger = Logger.getLogger(TipoEmpleadoControlador.class.getName());
    
    private iTipoEmpleadoLogica tipoEmpleadoService;
    private TipoEmpleado tipoEmpleado;
    
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
        logger.info("Insertar Tipo de Empleado");
        String idTe = request.getParameter("id") == null ? "" : request.getParameter("id");
        String descripcion = request.getParameter("descripcion") == null ? "" : request.getParameter("descripcion");
        
        try{
            tipoEmpleado = new TipoEmpleado();
            tipoEmpleado.setIdTipoEmpleado(idTe);
            tipoEmpleado.setDescripcion(descripcion);
            
            tipoEmpleadoService = new TipoEmpleadoLogica();
            flgOperacion = tipoEmpleadoService.insertar(tipoEmpleado);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("Tipo de Empelado", descripcion);
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("Tipo de Empelado", descripcion);
                    break;
                default:
                    mensaje = FuncionesMensajes.insertarError("Tipo de Empelado", descripcion);
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoEmpleadoActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
            
            }catch(Exception e){
            logger.error("Insertar Tipo de Empleado: " + e.getMessage());
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
            sesion.removeAttribute("listaTipoEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoEmpleadoActualizar");
            
            tipoEmpleadoService = new TipoEmpleadoLogica();
            List<TipoEmpleado> lstTipoEmpleado = tipoEmpleadoService.buscar(desc, inicio, registrosPorPagina);
            int totalRegistros = tipoEmpleadoService.totalRegistros(desc, inicio, registrosPorPagina);
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("descripcion", desc);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            if(lstTipoEmpleado.size() > 0){
                if (!"".equals(desc)) {
                    mensaje = FuncionesMensajes.buscarExitoso(desc);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaTipoEmpleado", lstTipoEmpleado);
            }else{
                mensaje = FuncionesMensajes.buscarError("Tipos de Empleado", desc);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("TipoEmpleadoLst.jsp");
            }catch(Exception e){
            logger.error("Error al buscar: " + e.getMessage());
            }
        }
     
        protected void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            busca(request, response);
            sesion.removeAttribute("msgPostOperacion");
        }
        
        protected void obtenerPorId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("obtenerPorId");
        String idTe = request.getParameter("idTe") == null ? "" : request.getParameter("idTe");
        try{
            tipoEmpleadoService = new TipoEmpleadoLogica();
            tipoEmpleado = tipoEmpleadoService.obtenerPorId(idTe);
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoEmpleadoActualizar");
            sesion.setAttribute("tipoEmpleadoActualizar", tipoEmpleado);
            response.sendRedirect("TipoEmpleadoMnt.jsp");
            }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
            }
        }

        protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("actualizar");
        String idTe = request.getParameter("idTe") == null ? "" : request.getParameter("idTe");
        String descripcion = request.getParameter("descripcion") == null ? "" : request.getParameter("descripcion");
        try{
            tipoEmpleado = new TipoEmpleado();
            tipoEmpleado.setIdTipoEmpleado(idTe);
            tipoEmpleado.setDescripcion(descripcion);
            
            TipoEmpleado tipoEmpleadoAnterior = new TipoEmpleado();
            tipoEmpleadoAnterior = (TipoEmpleado) sesion.getAttribute("tipoEmpleadoActualizar");
            
            tipoEmpleadoService = new TipoEmpleadoLogica();
            flgOperacion = tipoEmpleadoService.actualizar(tipoEmpleado);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.actualizarExitoso("Tipo de Empleado", tipoEmpleadoAnterior.getDescripcion(), tipoEmpleado.getDescripcion());
                    break;
                case 2:
                    mensaje = FuncionesMensajes.actualizarAdvertencia("Tipo de Empleado", tipoEmpleado.getDescripcion());                
                    break;
                default:
                    mensaje = FuncionesMensajes.actualizarError("Tipo de Empleado", tipoEmpleadoAnterior.getDescripcion(), tipoEmpleado.getDescripcion());                   
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoEmpleadoActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            
            busca(request, response);
            }catch(Exception e){
            logger.error("actualizar: " + e.getMessage());
            }
        }

        protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("Eliminar TipoEmpleado");
        String idTe = request.getParameter("idTe") == null ? "" : request.getParameter("idTe");
        try{
            tipoEmpleadoService = new TipoEmpleadoLogica();
            TipoEmpleado tipoEmpleadoEliminar = new TipoEmpleado();
            tipoEmpleadoEliminar = tipoEmpleadoService.obtenerPorId(idTe);

            flgOperacion = tipoEmpleadoService.eliminar(idTe);
            
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.eliminarExitoso("Tipo de Empleado", tipoEmpleadoEliminar.getDescripcion());
            }else{
                mensaje = FuncionesMensajes.eliminarError("Tipo de Empleado", tipoEmpleadoEliminar.getDescripcion());
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoEmpleado");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoEmpleadoActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
} 