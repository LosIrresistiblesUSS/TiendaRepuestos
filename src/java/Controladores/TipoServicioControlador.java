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
            //insertar(request, response);
            return;
        }
        if (accion.equals("buscar")) {
            buscar(request, response);
            return;
        }
        if (accion.equals("obtenerPorId")) {
            //obtenerPorId(request, response);
            return;
        }
        if (accion.equals("actualizar")) {
            //actualizar(request, response);
            return;
        }
        if (accion.equals("eliminar")) {
            //eliminar(request, response);
        }
    }
    }
        
        protected void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("buscar");
        String desc = request.getParameter("descipcion") == null ? "" : request.getParameter("descipcion");
        try{
            sesion = request.getSession();
            sesion.removeAttribute("listaTipoServicio");
            sesion.removeAttribute("msgListado");
            
            if(sesion.getAttribute("msgPostOperacion") != null){
                desc = "";
            }
            tipoServicioService = new TipoServicioLogica();
            List<TipoServicio> lstTipoSevicio = tipoServicioService.buscar(desc);
            if(lstTipoSevicio.size() > 0){
                sesion.setAttribute("listaTipoServicio", lstTipoSevicio);
            }else{
                mensaje = "No existen Tipos de Sertvicio.";
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("TipoServicioLst.jsp");
        }catch(Exception e){
            logger.error("buscar: " + e.getMessage());
        }
    }

}