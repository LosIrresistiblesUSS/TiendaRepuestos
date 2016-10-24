package Controladores;

import Helpers.FuncionesMensajes;
import Interfaces.iClienteLogica;
import Logica.ClienteLogica;
import Modelo.Cliente;
import Modelo.TipoCliente;
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

@WebServlet(name = "ClienteControlador", urlPatterns = {"/ClienteControlador"})/*url para el navegador*/
public class ClienteControlador extends HttpServlet{
    
    private static Logger logger = Logger.getLogger(ClienteControlador.class.getName());
    
    private iClienteLogica clienteService;
    private Cliente cliente;
    
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
        String razonSocial = request.getParameter("razonSocial") == null ? "" : request.getParameter("razonSocial");
        //int idpersona = Integer.parseInt(request.getParameter("idPersona") == null ? "0" : request.getParameter("idPersona"));
        String nombres=request.getParameter("nombres")==null ? "" : request.getParameter("nombres");
         String apellidos = request.getParameter("apellidos") == null ? "" : request.getParameter("apellidos");
        String ndocumento = request.getParameter("numeroDocumento") == null ? "" : request.getParameter("numeroDocumento");
        String direccion=request.getParameter("direccion")==null ? "" : request.getParameter("direccion");
        String telefono = request.getParameter("telefono") == null ? "" : request.getParameter("telefono");
        String email=request.getParameter("email")==null ? "" : request.getParameter("email");
        int idtipod = Integer.parseInt(request.getParameter("idtipodocumento") == null ? "0" : request.getParameter("idtipodocumento"));
        int idtipoc = Integer.parseInt(request.getParameter("idtipocliente") == null ? "0" : request.getParameter("idtipocliente"));
        // String descripcion=request.getParameter("descripcion")==null ? "" : request.getParameter("descripcion");
        TipoDocumento tipodocumento;
        TipoCliente tipocliente;
        try{
            cliente = new Cliente();
            cliente.setRazonSocial(razonSocial);
            cliente.setNombres(nombres);
            cliente.setApellidos(nombres);
            tipocliente =new TipoCliente();
            tipocliente.setIdTipoCliente(idtipoc);
            cliente.setTipoCliente(tipocliente);
            
            cliente.setNumeroDocumento(ndocumento);
            cliente.setDireccion(direccion);
            cliente.setTelefono(telefono);
            cliente.setEmail(email);
            
            tipodocumento=new TipoDocumento();
            tipodocumento.setIdTipoDocumento(idtipod);
            cliente.setTipoDocumento(tipodocumento);
            
            flgOperacion = clienteService.insertar(cliente);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("cliente", nombres);
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("cliente con numemero de documento", ndocumento);
                    break;             
                default:
                    mensaje = FuncionesMensajes.insertarError("cliente", nombres);
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaCliente");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("ClienteActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
            
            }catch(Exception e){
            logger.error("Insertar Cliente: " + e.getMessage());
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
            sesion.removeAttribute("listaCliente");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("ClienteActualizar");
            
            clienteService = new ClienteLogica();
            List<Cliente> lstCliente = clienteService.buscar(nom, inicio, registrosPorPagina);
            
            int totalRegistros = clienteService.totalRegistros(nom, inicio, registrosPorPagina);
            
            int numeroPaginas = (int)Math.ceil((double)totalRegistros / registrosPorPagina);
            sesion.setAttribute("pagina", pagina);
            sesion.setAttribute("nroPaginas", numeroPaginas);
            sesion.setAttribute("nombres", nom);
            sesion.setAttribute("registrosPorPagina", registrosPorPagina);
            if(lstCliente.size() > 0){
                if (!"".equals(nom)) {
                    mensaje = FuncionesMensajes.buscarExitoso(nom);
                    sesion.setAttribute("msgListado", mensaje);
                }
                sesion.setAttribute("listaCliente", lstCliente);
                
            }else{
                mensaje = FuncionesMensajes.buscarError("Cliente", nom);
                sesion.setAttribute("msgListado", mensaje);
            }
            response.sendRedirect("ClienteLst.jsp");
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
            clienteService = new ClienteLogica();
            cliente = clienteService.obtenerPorId(id);
            
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaCliente");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("ClienteActualizar");
            sesion.setAttribute("ClienteActualizar", cliente);
            response.sendRedirect("ClienteMnt.jsp");
            }catch(Exception e){
            logger.error("obtenerPorId: " + e.getMessage());
            }
        }

        protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("actualizar");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
        String razonSocial = request.getParameter("razonSocial") == null ? "" : request.getParameter("razonSocial");
        int idpersona = Integer.parseInt(request.getParameter("idPersona") == null ? "0" : request.getParameter("idPersona"));
        String nombres=request.getParameter("nombres")==null ? "" : request.getParameter("nombres");
        String ndocumento = request.getParameter("numeroDcocumento") == null ? "" : request.getParameter("numeroDcocumento");
        String apellidos = request.getParameter("apellidos") == null ? "" : request.getParameter("apellidos");
        String direccion=request.getParameter("direccion")==null ? "" : request.getParameter("direccion");
        String telefono = request.getParameter("telefono") == null ? "" : request.getParameter("telefono");
        String email=request.getParameter("email")==null ? "" : request.getParameter("email");
        int idtipod = Integer.parseInt(request.getParameter("idtipod") == null ? "0" : request.getParameter("idtipod"));
        String descripcion=request.getParameter("descripcion")==null ? "" : request.getParameter("descrpcion");
        TipoDocumento tipoDocumento;
        try{
            cliente = new Cliente();
            tipoDocumento=new TipoDocumento();
            cliente.setIdCliente(id);
            cliente.setRazonSocial(razonSocial);
            cliente.setIdPersona(idpersona);
            cliente.setNombres(nombres);
            cliente.setApellidos(apellidos);
            cliente.setNumeroDocumento(ndocumento);
            cliente.setDireccion(direccion);
            cliente.setTelefono(telefono);
            cliente.setEmail(email);
            
            tipoDocumento.setIdTipoDocumento(idtipod);
            tipoDocumento.setDescripcion(descripcion);
            
            cliente.setTipoDocumento(tipoDocumento);
            
            Cliente clienteAnterior = new Cliente();
            clienteAnterior = (Cliente) sesion.getAttribute("ClienteActualizar");
            
            clienteService = new ClienteLogica();
            flgOperacion = clienteService.actualizar(cliente);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.actualizarExitoso("Cliente", clienteAnterior.getNombres(), cliente.getNombres());
                    break;
                case 2:
                    mensaje = FuncionesMensajes.actualizarAdvertencia("Cliente", cliente.getNombres());                
                    break;
                default:
                    mensaje = FuncionesMensajes.actualizarError("Cliente", clienteAnterior.getNombres(), cliente.getNombres());                   
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaCliente");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("ClienteActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            
            busca(request, response);
            }catch(Exception e){
            logger.error("actualizar: " + e.getMessage());
            }
        }

        protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("Eliminar Cliente");
        int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));

        try{
            clienteService = new ClienteLogica();
            Cliente clienteEliminar = new Cliente();
            clienteEliminar = clienteService.obtenerPorId(id);
            flgOperacion = clienteService.eliminar(id);
            System.out.println(flgOperacion + " operacion");
            System.out.println(id + " iddd");
            
            if(flgOperacion > 0){
                mensaje = FuncionesMensajes.eliminarExitoso("Cliente", clienteEliminar.getApellidos());
            }else{
                mensaje = FuncionesMensajes.eliminarError("Cliente",  clienteEliminar.getApellidos());
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaCliete");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("ClienteActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
}