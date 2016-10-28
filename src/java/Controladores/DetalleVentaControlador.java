package Controladores;

import Helpers.FuncionesMensajes;
import Helpers.ListasObjetos;
import Interfaces.iClienteLogica;
import Interfaces.iDetalleVentaLogica;
import Interfaces.iRepuestoLogica;
import Logica.ClienteLogica;
import Logica.DetalleVentaLogica;
import Logica.RepuestoLogica;
import Modelo.Cliente;
import Modelo.ComprobanteVenta;
import Modelo.DetalleOperacion;
import Modelo.DetalleOperacionRepuesto;
import Modelo.DetalleVenta;
import Modelo.Empleado;
import Modelo.OperacionRepuesto;
import Modelo.Repuesto;
import Modelo.TipoComprobanteVenta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
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
    private iClienteLogica clienteService;
    private iRepuestoLogica repuestoService;
    
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
            if (accion.equals("buscarCliente")) {
                buscarCliente(request, response);
            }
            if (accion.equals("buscarRepuesto")) {
                buscarRepuesto(request, response);
            }
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        logger.info("insertar");
        
        int idCliente = Integer.parseInt(request.getParameter("idCliente") == null ? "0" : request.getParameter("idCliente"));
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado") == null ? "0" : request.getParameter("idEmpleado"));
        int tipoComprobante = Integer.parseInt(request.getParameter("tipoComprobante") == null ? "0" : request.getParameter("tipoComprobante"));
        String nroDocumento = request.getParameter("nroDocumento") == null ? "" : request.getParameter("nroDocumento");
        String fecha = request.getParameter("fecha") == null ? "" : request.getParameter("fecha");
        String descripcion = request.getParameter("descripcion") == null ? "" : request.getParameter("descripcion");
        Double importe = Double.parseDouble(request.getParameter("importe") == null ? "0" : request.getParameter("importe"));
        
        int  tamano = Integer.parseInt(request.getParameter("tamano") == null ? "0" : request.getParameter("tamano"));
        
        List<DetalleOperacionRepuesto> lstDetalleRepuesto = new ArrayList<>();
        
        for(int i=1; i <= tamano ; i++){
            Repuesto repuesto = new Repuesto();
            DetalleOperacionRepuesto detalleOperacionRepuesto = new DetalleOperacionRepuesto();
            int idRepuesto = Integer.parseInt(request.getParameter("id"+i) == null ? "0" : request.getParameter("id"+i));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"+i) == null ? "0" : request.getParameter("cantidad"+i));
            Double precio = Double.parseDouble(request.getParameter("precio"+i) == null ? "0" : request.getParameter("precio"+i));
            Double total = Double.parseDouble(request.getParameter("total"+i) == null ? "0" : request.getParameter("total"+i));
            
            repuesto.setIdrepuesto(idRepuesto);
            detalleOperacionRepuesto.setRepuesto(repuesto);
            detalleOperacionRepuesto.setCantidad(cantidad);
            detalleOperacionRepuesto.setPrecio(precio);
            detalleOperacionRepuesto.setSubTotal(total);
            lstDetalleRepuesto.add(detalleOperacionRepuesto);
        }
        
        System.out.println("");
        for(DetalleOperacionRepuesto item : lstDetalleRepuesto){
            System.out.println("Repuesto: " + item.getRepuesto().getIdrepuesto() + " Cantidad: " + item.getCantidad() + " Precio: " + item.getPrecio() + " Total: " + item.getSubTotal());
        }
        System.out.println("");
        
        
        System.out.println("IdCliente: "+idCliente);
        System.out.println("IdEmpleado: "+idEmpleado);
        System.out.println("TipoComprobante: "+tipoComprobante);
        System.out.println("nroDocumento: "+nroDocumento);
        System.out.println("Fecha: "+fecha);
        System.out.println("Descripcion: "+descripcion);
        System.out.println("Importe: "+importe);
        
        System.out.println("");
        
        try{
            OperacionRepuesto operacionRepuesto = new OperacionRepuesto();
            Cliente cliente = new Cliente();
            Empleado empleado = new Empleado();
            cliente.setIdCliente(idCliente);
            empleado.setIdEmpleado(idEmpleado);
            operacionRepuesto.setIdOperacionRepuesto(ListasObjetos.ultimoIdOperacion());
            operacionRepuesto.setCliente(cliente);
            operacionRepuesto.setEmpleado(empleado);
            
            ComprobanteVenta comprobanteV= new ComprobanteVenta();
            TipoComprobanteVenta tipoComprobanteVenta = new TipoComprobanteVenta();
            tipoComprobanteVenta.setIdTipoComprobanteventa(tipoComprobante);
            comprobanteV.setIdComprobanteVenta(ListasObjetos.ultimoIdComprobanteVenta());
            comprobanteV.setTipoComprobanteVenta(tipoComprobanteVenta);
            comprobanteV.setNumero(nroDocumento);
            comprobanteV.setFecha(Date.valueOf(fecha));
            comprobanteV.setDescripcion(descripcion);
            comprobanteV.setImporte(importe);
            
            DetalleOperacion detalleOperacion = new DetalleOperacion();
            detalleOperacion.setOperacionRespuesto(operacionRepuesto);
            detalleOperacion.setLstDetalleRepuesto(lstDetalleRepuesto);
            
            DetalleVenta detalleVenta = new DetalleVenta();
            detalleVenta.setComprobanteVenta(comprobanteV);
            detalleVenta.setDetalleOperacion(detalleOperacion);
            
            detalleVentaService = new DetalleVentaLogica();
            flgOperacion = detalleVentaService.insertar(detalleVenta);
            
            switch (flgOperacion) {
                case 1:
                    mensaje = FuncionesMensajes.insertarExitoso("Venta de", "Repuestos");
                    break;
                case 2:
                    mensaje = FuncionesMensajes.insertarAdvertencia("Venta de", "Repuestos");
                    break;
                default:
                    mensaje = FuncionesMensajes.insertarError("Venta de", "Repuestos");
                    break;
            }
            sesion = request.getSession();
            sesion.removeAttribute("msgPostOperacion");
            sesion.removeAttribute("listaComprobanteVenta");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("comprobanteVentaActualizar");
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
            
        }catch(Exception e){
            logger.error("insertar VentaControlador: " + e.getMessage());
        }
        
    }

    private void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        logger.info("buscar");
        String nom = request.getParameter("nom") == null ? "" : request.getParameter("nom");
        int pagina = Integer.parseInt(request.getParameter("pag") == null ? "1" : request.getParameter("pag"));
        int registrosPorPagina = Integer.parseInt(request.getParameter("nro") == null ? "10" : request.getParameter("nro"));
        
        int inicio = (pagina > 1) ? (pagina * registrosPorPagina - registrosPorPagina): 0;
       
        try{
            sesion = request.getSession();
            sesion.removeAttribute("listaComprobanteVenta");
            sesion.removeAttribute("msgListado");
            sesion.removeAttribute("comprobanteVentaActualizar");
            
            detalleVentaService = new DetalleVentaLogica();
            List<ComprobanteVenta> lstComprobanteVenta = detalleVentaService.buscar(nom, inicio, registrosPorPagina);
            
            int totalRegistros = detalleVentaService.totalRegistros(nom, inicio, registrosPorPagina);
            
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
            /*ComprobanteVenta comprobanteVentaEliminar = new ComprobanteVenta();
            comprobanteVentaEliminar = detalleVentaService.obtenerPorId(id);*/
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
            sesion.removeAttribute("detalleVentaActualizar");
            
            sesion.setAttribute("msgPostOperacion", mensaje);
            busca(request, response);
        }catch(Exception e){
            logger.error("eliminar: " + e.getMessage());
        }
    }
    
    
    private void buscarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        logger.info("buscarCliente");
        
        String desc = request.getParameter("desc") == null ? "" : request.getParameter("desc");
        int pagina = Integer.parseInt(request.getParameter("pag") == null ? "1" : request.getParameter("pag"));
        int registrosPorPagina = 10;
        int inicio = (pagina > 1) ? (pagina * registrosPorPagina - registrosPorPagina): 0;
        
        try{
            PrintWriter out = response.getWriter();
            clienteService = new ClienteLogica();
            List<Cliente> lstCliente = clienteService.buscar(desc, inicio, registrosPorPagina);
            int total = clienteService.totalRegistros(desc, inicio, registrosPorPagina);
            int numeroPaginas = (int)Math.ceil((double)total / registrosPorPagina);
            StringBuilder sb = new StringBuilder("");
            sb.append(pagina).append("*").append(numeroPaginas).append("*").append(registrosPorPagina).append("*");
            for(Cliente cliente : lstCliente){
                sb.append(cliente.getIdCliente()).append("_").append(cliente.getNombres()).append("_").append(cliente.getApellidos())
                        .append(cliente.getRazonSocial()).append("_").append(cliente.getTipoCliente().getNomDescripcion()).append("_")
                        .append(cliente.getTipoDocumento().getDescripcion()).append("_").append(cliente.getNumeroDocumento()).append(":");
            }
            out.write(sb.toString());
        }catch(Exception e){
            logger.error("buscarCliente: " + e.getMessage());
        }
    }
    
    private void buscarRepuesto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        logger.info("buscarRepuesto");
        
        String desc = request.getParameter("desc") == null ? "" : request.getParameter("desc");
        int pagina = Integer.parseInt(request.getParameter("pag") == null ? "1" : request.getParameter("pag"));
        int registrosPorPagina = 10;
        int inicio = (pagina > 1) ? (pagina * registrosPorPagina - registrosPorPagina): 0;
        
        try{
            PrintWriter out = response.getWriter();
            repuestoService = new RepuestoLogica();
            List<Repuesto> lstRepuesto = repuestoService.buscar(desc, inicio, registrosPorPagina);
            int total = repuestoService.totalRegistros(desc, inicio, registrosPorPagina);
            int numeroPaginas = (int)Math.ceil((double)total / registrosPorPagina);
            StringBuilder sb = new StringBuilder("");
            sb.append(pagina).append("*").append(numeroPaginas).append("*").append(registrosPorPagina).append("*");
            for(Repuesto repuesto : lstRepuesto){
                sb.append(repuesto.getIdrepuesto()).append("_").append(repuesto.getDescripcion()).append("_")
                        .append(repuesto.getStock()).append("_").append(repuesto.getPrecio()).append("_")
                        .append(repuesto.getPreciopormayor()).append(":");
            }
            out.write(sb.toString());
        }catch(Exception e){
            logger.error("buscarRepuesto: " + e.getMessage());
        }
    }
    
}