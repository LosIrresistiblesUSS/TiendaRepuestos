package Controladores;

import Interfaces.iLoginLogica;
import Logica.LoginLogica;
import Modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})/*url para el navegador*/
public class LoginControlador extends HttpServlet {
    
    private static Logger logger = Logger.getLogger(TipoServicioControlador.class.getName());
    
    private iLoginLogica loginService;
    
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
            if (accion.equals("iniciarSesion")) {
                iniciarSesion(request, response);
                return;
            }
            if (accion.equals("cerrarSesion")) {
                cerrarSesion(request, response);
            } 
        }
    }

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("iniciar Sesion");
        String usuario = request.getParameter("usuario") == null ? "" : request.getParameter("usuario");
        String password = request.getParameter("password") == null ? "" : request.getParameter("password");
        
        try {
            sesion = request.getSession();

            loginService = new LoginLogica();
            Usuario user = loginService.iniciarSesion(usuario, password);
            
            if (user != null) {
                sesion.setAttribute("usuario", user);
            } else {
                mensaje = "Usuario y/o Contraseña incorrectos";
                sesion.setAttribute("msgSesion", mensaje);
            }
            response.sendRedirect("TipoServicioLst.jsp");
        } catch (Exception e) {
            logger.error("Iniciar Sesion: " + e.getMessage());
        }
    }

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
