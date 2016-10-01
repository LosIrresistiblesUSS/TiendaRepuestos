package Controladores;

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
            tipoServicio.setDecripcion(descripcion);
            
            tipoServicioService = new TipoServicioLogica();
            flgOperacion = tipoServicioService.insertar(tipoServicio);
            
            if(flgOperacion == 1){
                mensaje = "<div class='alert alert-success alert-dismissible' role='alert'>"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                        + "<strong><span class='glyphicon glyphicon-file'></span></strong> Tipo de Servicio <strong>"
                        + tipoServicio.getDecripcion()
                        + "</strong> insertado correctamente.</div>";
            }else if(flgOperacion == 2){
                mensaje = "<div class='alert alert-warning alert-dismissible' role='alert'>"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                        + "<strong><span class='glyphicon glyphicon-warning-sign'></span></strong> Tipo de Servicio <strong>"
                        + tipoServicio.getDecripcion()
                        + "</strong> ya se encuentra registrado.</div>";
            }else{
                mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'>"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                        + "<strong><span class='glyphicon glyphicon-file'></span></strong> Error al intentar insertar el Tipo de Servicio <strong>"
                        + tipoServicio.getDecripcion()
                        + ".</strong></div>";
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
        try{
            sesion = request.getSession();
            sesion.removeAttribute("listaTipoServicio");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("tipoServicioActualizar");
            tipoServicioService = new TipoServicioLogica();
            List<TipoServicio> lstTipoSevicio = tipoServicioService.buscar(desc);
            if(lstTipoSevicio.size() > 0){
                sesion.setAttribute("listaTipoServicio", lstTipoSevicio);
            }else{
                mensaje = "No existen Tipos de Servicio que contengan el siguiente texto: <strong>" + desc + "</strong>.";
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
            tipoServicio.setDecripcion(descripcion);
            
            TipoServicio tipoServicioAnterior = new TipoServicio();
            tipoServicioAnterior = (TipoServicio) sesion.getAttribute("tipoServicioActualizar");
            
            tipoServicioService = new TipoServicioLogica();
            flgOperacion = tipoServicioService.actualizar(tipoServicio);
            
            if(flgOperacion == 1){
                mensaje = "<div class='alert alert-success alert-dismissible' role='alert'>"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                        + "<strong><span class='glyphicon glyphicon-pencil'></span> </strong>Tipo de Servicio <strong>"
                        + tipoServicioAnterior.getDecripcion()
                        + "</strong> actualizado correctamente por <strong>" + tipoServicio.getDecripcion() + "</strong>.</div>";
            }else if(flgOperacion == 0){
                mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'>"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                        + "<strong><span class='glyphicon glyphicon-pencil'></span> </strong>Error al intentar actualizar el Tipo de Servicio <strong>"
                        + tipoServicioAnterior.getDecripcion()+ "</strong>"
                        + " por <strong>" + tipoServicio.getDecripcion() + "</div>";
            }else{
                /*Para cuando esté listo el PROC*/
                mensaje = "Descripción duplicado.";
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
            System.out.println(flgOperacion);
            System.out.println(id);
            
            if(flgOperacion > 0){
                mensaje = "<div class='alert alert-success alert-dismissible' role='alert'>"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                        + "<strong><span class='glyphicon glyphicon-trash'></span> </strong>Tipo de Servicio <strong>"
                        + tipoServicioEliminar.getDecripcion()
                        + "</strong> eliminado correctamente.</div>";
            }else{
                mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'>"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                        + "<strong>Advertencia! </strong>Error al intentar eliminar el Tipo de Servicio <strong>"
                        + tipoServicio.getDecripcion()+ "</strong>.</div>";
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