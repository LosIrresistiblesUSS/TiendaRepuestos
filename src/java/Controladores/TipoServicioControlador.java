package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iTipoServicioLogica;
import Logica.TipoServicioLogica;
import Modelo.TipoServicio;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

@WebServlet(name = "TipoServicioControlador", urlPatterns = {"/TipoServicioControlador"})/*url para el navegador*/
public class TipoServicioControlador extends HttpServlet {
    
    private static Logger logger = Logger.getLogger(TipoServicioControlador.class.getName());
    
    private iTipoServicioLogica tipoServicioService;
    private TipoServicio tipoServicio;
    
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
        
        try{
            tipoServicio = new TipoServicio();
            tipoServicio.setDescripcion(descripcion);
            
            tipoServicioService = new TipoServicioLogica();
            flgOperacion = tipoServicioService.insertar(tipoServicio);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("Tipo de Servicio", descripcion);
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("Tipo de Servicio", descripcion);
                    break;
                default:
                    mensaje = FuncionesMensajes.insertarError("Tipo de Servicio", descripcion);
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoServicio");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoServicioActualizar");
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
            sesion.removeAttribute("listaTipoServicio");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoServicioActualizar");
            
            tipoServicioService = new TipoServicioLogica();
            List<TipoServicio> lstTipoSevicio = tipoServicioService.buscar(desc, inicio, registrosPorPagina);
            int totalRegistros = tipoServicioService.totalRegistros(desc, inicio, registrosPorPagina);
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("descripcion", desc);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            if(lstTipoSevicio.size() > 0){
                if (!"".equals(desc)) {
                    mensaje = FuncionesMensajes.buscarExitoso(desc);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaTipoServicio", lstTipoSevicio);
            }else{
                mensaje = FuncionesMensajes.buscarError("Tipos de Servicio", desc);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("TipoServicioLst.jsp");
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
            tipoServicioService = new TipoServicioLogica();
            tipoServicio = tipoServicioService.obtenerPorId(id);
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoServicio");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoServicioActualizar");
            sesion.setAttribute("tipoServicioActualizar", tipoServicio);
            response.sendRedirect("TipoServicioMnt.jsp");
        }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
        }
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("actualizar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        String descripcion = request.getParameter("descripcion") == null ? "" : request.getParameter("descripcion");
        try{
            tipoServicio = new TipoServicio();
            tipoServicio.setIdTipoServicio(id);
            tipoServicio.setDescripcion(descripcion);
            
            TipoServicio tipoServicioAnterior = new TipoServicio();
            tipoServicioAnterior = (TipoServicio) sesion.getAttribute("tipoServicioActualizar");
            
            tipoServicioService = new TipoServicioLogica();
            flgOperacion = tipoServicioService.actualizar(tipoServicio);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.actualizarExitoso("Tipo de Servicio", tipoServicioAnterior.getDescripcion(), tipoServicio.getDescripcion());
                    break;
                case 2:
                    mensaje = FuncionesMensajes.actualizarAdvertencia("Tipo de Servicio", tipoServicio.getDescripcion());
                    break;
                default:
                    mensaje = FuncionesMensajes.actualizarError("Tipo de Servicio", tipoServicioAnterior.getDescripcion(), tipoServicio.getDescripcion());
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoServicio");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoServicioActualizar");
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
            tipoServicioService = new TipoServicioLogica();
            TipoServicio tipoServicioEliminar = new TipoServicio();
            tipoServicioEliminar = tipoServicioService.obtenerPorId(id);
            flgOperacion = tipoServicioService.eliminar(id);
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.eliminarExitoso("Tipo de Servicio", tipoServicioEliminar.getDescripcion());
            }else{
                mensaje = FuncionesMensajes.eliminarError("Tipo de Servicio", tipoServicioEliminar.getDescripcion());
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoServicio");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoServicioActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
}