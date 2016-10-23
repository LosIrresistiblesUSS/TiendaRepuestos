/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iDetalleVentaLogica;
import Logica.DetalleVentaLogica;
import Logica.EmpleadoLogica;
import Modelo.ComprobanteVenta;
import Modelo.Empleado;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author erick
 */
@WebServlet(name = "DetalleVentaControlador", urlPatterns = {"/DetalleVentaControlador"})

public class DetalleVentaControlador extends HttpServlet {
    private static Logger logger = Logger.getLogger(DetalleVentaControlador.class.getName());

    private iDetalleVentaLogica detalleVentaService;
    private ComprobanteVenta comprobanteVenta;
    
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

    private void insertar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        logger.info("buscar");
        String nom = request.getParameter("nom") == null ? "" : request.getParameter("nom");
        String pag = request.getParameter("pag") == null ? "1" : request.getParameter("pag");
        int pagina = Integer.parseInt(pag);
        int registrosPorPagina = 5; //Numero de registros por pagina 
        int inicio = (pagina > 1) ? (pagina * registrosPorPagina - registrosPorPagina): 0;
       
        try{
            sesion = request.getSession();
            sesion.removeAttribute("listaComprobanteVenta");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("comprobanteVentaActualizar");
            
            detalleVentaService = new DetalleVentaLogica();
            List<ComprobanteVenta> lstComprobanteVenta = detalleVentaService.buscar(nom, inicio, registrosPorPagina);
            
            int totalRegistros = detalleVentaService.totalRegistros(nom, inicio, registrosPorPagina);

            System.out.println("");
            System.out.println(totalRegistros);
            System.out.println("");
            
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("nombres", nom);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            if(lstComprobanteVenta.size() > 0){
                if (!"".equals(nom)) {
                    mensaje = FuncionesMensajes.buscarExitoso(nom);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaComprobanteVenta", lstComprobanteVenta);
            }else{
                mensaje = FuncionesMensajes.buscarError("Comprobante Venta", nom);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("OperacionVentaRepuestosLst.jsp");
        }catch(Exception e){
            logger.error("buscar: " + e.getMessage());
        }
    }
    
    private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        busca(request, response);
        sesion.removeAttribute("msgPostOperacion");
    }

    private void obtenerPorId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        logger.info("obtenerPorId");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        try{
            detalleVentaService = new DetalleVentaLogica();
            comprobanteVenta = detalleVentaService.obtenerPorId(id);
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaComprobanteVenta");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("comprobanteVentaActualizar");
            sesion.setAttribute("comprobanteVentaActualizar", comprobanteVenta);
            response.sendRedirect("EmpleadoMnt.jsp");
        }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
        }
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        logger.info("eliminar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        try{
            detalleVentaService = new DetalleVentaLogica();
            ComprobanteVenta comprobanteVentaEliminar = new ComprobanteVenta();
            comprobanteVentaEliminar = detalleVentaService.obtenerPorId(id);
            flgOperacion = detalleVentaService.eliminar(id);
            
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.AnularExitoso("Venta");
            }else{
                mensaje = FuncionesMensajes.AnularError("Empleado");
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
