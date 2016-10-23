package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iTipoDocumentoLogica;
import Logica.TipoDocumentoLogica;
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

@WebServlet(name = "TipoDocumentoControlador", urlPatterns = {"/TipoDocumentoControlador"})/*url para el navegador*/

public class TipoDocumentoControlador extends HttpServlet{
    private static Logger logger = Logger.getLogger(TipoDocumentoControlador.class.getName());
    
    private iTipoDocumentoLogica tipoDocumentoService;
    private TipoDocumento tipoDocumento;
    
    private int flgOperacion = 0;
    private String mensaje = null;
    
    private HttpSession sesion;
    
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
            tipoDocumento = new TipoDocumento();
            tipoDocumento.setDescripcion(descripcion);
            
            tipoDocumentoService = new TipoDocumentoLogica();
            flgOperacion = tipoDocumentoService.insertar(tipoDocumento);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("Tipo de Documento", descripcion);
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("Tipo de Documento", descripcion);
                    break;
                default:
                    mensaje = FuncionesMensajes.insertarError("Tipo de Documento", descripcion);
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoDocumento");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoDocumentoActualizar");
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
            sesion.removeAttribute("listaTipoDocumento");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoDocumentoActualizar");
            
            tipoDocumentoService = new TipoDocumentoLogica();
            List<TipoDocumento> lstTipoDocumento= tipoDocumentoService.buscar((String)desc, inicio, registrosPorPagina);
            int totalRegistros = tipoDocumentoService.totalRegistros(desc, inicio, registrosPorPagina);
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("descripcion", desc);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            if(lstTipoDocumento.size() > 0){
                if (!"".equals(desc)) {
                    mensaje = FuncionesMensajes.buscarExitoso(desc);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaTipoDocumento", lstTipoDocumento);
            }else{
                mensaje = FuncionesMensajes.buscarError("Tipos de Documento", desc);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("TipoDocumentoLst.jsp");
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
            tipoDocumentoService = new TipoDocumentoLogica();
            tipoDocumento = tipoDocumentoService.obtenerPorId(id);
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoDocumento");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoDocumentoActualizar");
            sesion.setAttribute("tipoDocumentoActualizar", tipoDocumento);
            response.sendRedirect("TipoDocumentoMnt.jsp");
        }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
        }
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("actualizar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        String descripcion = request.getParameter("descripcion") == null ? "" : request.getParameter("descripcion");
        try{
            tipoDocumento = new TipoDocumento();
            tipoDocumento.setIdTipoDocumento(id);
            tipoDocumento.setDescripcion(descripcion);
            
            TipoDocumento tipoDocumentoAnterior = new TipoDocumento();
            tipoDocumentoAnterior = (TipoDocumento) sesion.getAttribute("tipoDocumentoActualizar");
            
            tipoDocumentoService = new TipoDocumentoLogica();
            flgOperacion = tipoDocumentoService.actualizar(tipoDocumento);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.actualizarExitoso("Tipo de Documento", tipoDocumentoAnterior.getDescripcion(), tipoDocumento.getDescripcion());
                    break;
                case 2:
                    mensaje = FuncionesMensajes.actualizarAdvertencia("Tipo de Documento", tipoDocumento.getDescripcion());
                    break;
                default:
                    mensaje = FuncionesMensajes.actualizarError("Tipo de Documento",tipoDocumentoAnterior.getDescripcion(), tipoDocumento.getDescripcion());
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoDocumento");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoDocumentoActualizar");
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
            tipoDocumentoService = new TipoDocumentoLogica();
            TipoDocumento tipoDocumentoEliminar = new TipoDocumento();
            tipoDocumentoEliminar = tipoDocumentoService.obtenerPorId(id);
            flgOperacion = tipoDocumentoService.eliminar(id);
            System.out.println(flgOperacion);
            System.out.println(id);
            
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.eliminarExitoso("Tipo de Documento", tipoDocumentoEliminar.getDescripcion());
            }else{
                mensaje = FuncionesMensajes.eliminarError("Tipo de Documento", tipoDocumentoEliminar.getDescripcion());
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaTipoDocumento");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoDocumentoActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
    
    
    
    
    
}
