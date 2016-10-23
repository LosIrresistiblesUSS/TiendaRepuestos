package Logica;

import DAO.DetalleVentaDAO;
import Helpers.ListasObjetos;
import Modelo.Cliente;
import Modelo.ComprobanteVenta;
import Modelo.DetalleOperacion;
import Modelo.DetalleOperacionRepuesto;
import Modelo.Empleado;
import Modelo.OperacionRepuesto;
import Modelo.Producto;
import Modelo.Repuesto;
import Modelo.TipoDocumento;
import Modelo.TipoEmpleado;
import Modelo.Vehiculo;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class test {
        
    public static void main(String[] args) {

//        List<TipoDocumento> lstTipoDocumento = ListasObjetos.listaTipoDocumento();
//        for (TipoDocumento tipoDocumento : lstTipoDocumento){
//            System.out.println(tipoDocumento.getIdTipoDocumento()+" "+tipoDocumento.getDescripcion());
//        }
//        
//        List<TipoEmpleado> lstTipoEmpleado = ListasObjetos.listaTipoEmpleado();
//        for (TipoEmpleado tipoEmpleado : lstTipoEmpleado){
//            System.out.println(tipoEmpleado.getIdTipoEmpleado()+" "+tipoEmpleado.getDescripcion());
//        }

//        DetalleOperacion detalleOperacion = new DetalleOperacion();
//        
//        detalleOperacion.setIdDetalleOperacion(1);
//        
//            OperacionRepuesto operacionRepuesto = new OperacionRepuesto();
//            operacionRepuesto.setIdOperacionRepuesto(1);
//            operacionRepuesto.setEstado(true);
//
//                Cliente cliente = new Cliente();
//                cliente.setIdCliente(10);
//                cliente.setNombres("Cantos");
//
//            operacionRepuesto.setCliente(cliente);
//
//                Empleado empleado = new Empleado();
//                empleado.setIdEmpleado(10);
//                empleado.setNombres("Acuña");
//
//            operacionRepuesto.setEmpleado(empleado);
//
//                Vehiculo vehiculo = new Vehiculo();
//                vehiculo.setIdVehiculo(20);
//                vehiculo.setMarca("Toyota");
//                vehiculo.setModelo("Hiunday");
//
//            operacionRepuesto.setVehiculo(vehiculo);
//        
//        
//        detalleOperacion.setOperacionRespuesto(operacionRepuesto);
//        
//        
//        List<DetalleOperacionRepuesto> lista = new ArrayList<>();
        
        
//            DetalleOperacionRepuesto repuesto1 = new DetalleOperacionRepuesto();
//                repuesto1.setIdDetalleVentaRepuesto(1);
//                repuesto1.setCantidad(20);
//                repuesto1.setPrecio(10.5);
//                repuesto1.setSubTotal(210);
//
//                    Repuesto re1 = new Repuesto();
//                    re1.setDescripcion("llanta");
//
//            repuesto1.setRepuesto(re1);
//            lista.add(repuesto1);
//            
//            DetalleOperacionRepuesto repuesto2 = new DetalleOperacionRepuesto();
//
//                repuesto2.setIdDetalleVentaRepuesto(2);
//                repuesto2.setCantidad(10);
//                repuesto2.setPrecio(10);
//                repuesto2.setSubTotal(100);
//
//                    Repuesto re2 = new Repuesto();
//                    re2.setDescripcion("timon");
//
//            repuesto2.setRepuesto(re2);
//            lista.add(repuesto2);
//            
//            
//            DetalleOperacionRepuesto repuesto3 = new DetalleOperacionRepuesto();
//
//                repuesto3.setIdDetalleVentaRepuesto(3);
//                repuesto3.setCantidad(30);
//                repuesto3.setPrecio(1);
//                repuesto3.setSubTotal(30);
//
//                    Repuesto re3 = new Repuesto();
//                    re3.setDescripcion("Parabrisas");
//
//            repuesto3.setRepuesto(re3);
//            lista.add(repuesto3);
//            
            
//            
//            detalleOperacion.setLstDetalleVentaRepuesto(lista);
//            
//           
//            System.out.println("El CLiente: " + detalleOperacion.getOperacionRespuesto().getCliente().getNombres());
//            System.out.println("El Empleado: " + detalleOperacion.getOperacionRespuesto().getEmpleado().getNombres());
//            System.out.println("Con vehiculo: " + detalleOperacion.getOperacionRespuesto().getVehiculo().getMarca());
//     
//            System.out.println("");
//            System.out.println("Productos:");
//            System.out.println("---------");
//            for(DetalleOperacionRepuesto temp : detalleOperacion.getLstDetalleVentaRepuesto()){
//                System.out.println(temp.getIdDetalleVentaRepuesto() +  " " + temp.getRepuesto().getDescripcion() + " " +temp.getPrecio() + " " + temp.getSubTotal());
//            }
//   
        
        DetalleVentaDAO detalle = new DetalleVentaDAO();
        List<ComprobanteVenta> lista = new ArrayList<>();
        
        lista = detalle.buscar("", 0, 30);
        
        
        for(ComprobanteVenta cv : lista){
            System.out.println(cv.getIdComprobanteVenta() + " " + cv.getFecha() + " " + cv.getCliente());
        }
        


    }
}