package DAO;

import Interfaces.iDetalleOperacionDAO;
import Modelo.Cliente;
import Modelo.DetalleOperacion;
import Modelo.DetalleVentaRepuesto;
import Modelo.Empleado;
import Modelo.OperacionRepuesto;
import Modelo.Repuesto;
import Modelo.Vehiculo;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

public class DetalleOperacionDAO implements iDetalleOperacionDAO{

    private static Logger logger = Logger.getLogger(EmpleadoDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;
    
    @Override
    public int insertar(DetalleOperacion detalleOperacion) {
    logger.info("Insertando DetalleOperacion");
        sql= "{CALL P_Insertar_DetalleOperacion(?,?,?,?,?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setInt(1, detalleOperacion.getOperacionRespuesto().getIdOperacionRepuesto());
            cs.setBoolean(2, detalleOperacion.getOperacionRespuesto().getEstado());
            cs.setInt(3, detalleOperacion.getOperacionRespuesto().getCliente().getIdCliente());
            cs.setInt(4, detalleOperacion.getOperacionRespuesto().getEmpleado().getIdEmpleado());
            cs.setInt(5, detalleOperacion.getOperacionRespuesto().getVehiculo().getIdVehiculo());
            cs.registerOutParameter(6, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(6).toString());
            
            if(flgOperacion==1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Error al insertar " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;    
    }

    @Override
    public int insertarDVR(DetalleVentaRepuesto detalleVentaRepuesto) {
    logger.info("Insertando DetalleVentaRepuesto");
        sql= "{CALL P_Insertar_DetalleVentaRepuesto(?,?,?,?,?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setInt(1, detalleVentaRepuesto.getIdDetalleVentaRepuesto());
            cs.setInt(2, detalleVentaRepuesto.getCantidad());
            cs.setDouble(3, detalleVentaRepuesto.getPrecio());
            cs.setDouble(4, detalleVentaRepuesto.getSubTotal());
            cs.setInt(5, detalleVentaRepuesto.getRepuesto().getIdrepuesto());
            cs.registerOutParameter(6, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(6).toString());
            
            if(flgOperacion==1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Error al insertar " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;    
    }
    
    @Override
    public List<DetalleOperacion> buscar(int id, int inicio, int registrosPorPagina) {
        logger.info("buscar");
        sql = "select idEmpleado,p.idpersona, p.nombres, td.descripcion, p.numerodocumento, p.email, p.direccion, p.telefono, te.descripcion "
                + "from tipoempleado as te inner join empleado as e " +
                "on te.idtipoempleado=e.idtipoempleado " +
                "inner join persona as p " +
                "on e.idpersona=p.idpersona inner join tipodocumento as td " +
                "on p.idtipodocumento=td.idtipodocumento "
                + "where nombres like '%" + (id) + "%' "
                + "order by idEmpleado desc LIMIT " + inicio + ", " + registrosPorPagina;
        
        List<DetalleOperacion> lstDetalleOperacion = null;
        DetalleOperacion detalleOperacion;
        OperacionRepuesto operacionRepuesto;
        Cliente cliente;
        Empleado empleado;
        Vehiculo vehiculo;
        DetalleVentaRepuesto detalleVentaRepuesto;
        Repuesto repuesto;
        
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstDetalleOperacion = new ArrayList<DetalleOperacion>();
            while(rs.next()){
                //Todos los campos que vamos a mostrar de la consulta
                detalleOperacion = new DetalleOperacion();
                operacionRepuesto = new OperacionRepuesto();
                cliente = new Cliente();
                empleado = new Empleado();
                vehiculo = new Vehiculo();
                detalleVentaRepuesto = new DetalleVentaRepuesto();
                repuesto = new Repuesto();
               
                
                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setIdPersona(rs.getInt("idpersona"));
                empleado.setNombres(rs.getString("nombres"));
               
                

                lstDetalleOperacion.add(detalleOperacion);
            }
        }catch(Exception e){
            logger.info("Error buscar: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstDetalleOperacion;
    }

//    @Override
//    public int totalRegistros(String nombres, int inicio, int registrosPorPagina){
//        int total = 0;
//        logger.info("Total de Registros");
//        //cuenta total de registros que existen con el mismo nombre
//        sql = "select count(*) as total "
//                + "from empleado e " +
//                    "inner join persona p " +
//                    "on e.idPersona=p.idPersona "
//                + "where nombres like '%" + (nombres.trim()) + "%'";
//        try{
//            con = new Conexion();
//            cn = con.getConexion();
//            cn.setAutoCommit(false);
//            ps = cn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while(rs.next()){
//                total = rs.getInt("total");
//            }
//        }catch(Exception e){
//            logger.info("Error en Total de Registros: " + e.getMessage());
//        }finally{
//            con.cerrarConexion(cn);
//        }
//        return total;
//    }

//    @Override
//    public Empleado obtenerPorId(int id) {
//        logger.info("buscarPorId");
//        sql = "select idEmpleado,p.idpersona, p.nombres, td.idTipoDocumento, p.numerodocumento, "
//                + "p.direccion, p.telefono, p.email, te.idtipoempleado, te.descripcion "
//                + "from tipoempleado as te inner join empleado as e "
//                + "on te.idtipoempleado=e.idtipoempleado "
//                + "inner join persona as p "
//                + "on e.idpersona=p.idpersona "
//                + "inner join tipodocumento as td "
//                + "on p.idtipodocumento=td.idtipodocumento "
//                + "where idEmpleado = ?";
//        Empleado empleado = null;
//        TipoEmpleado tipoEmpleado = null;
//        TipoDocumento tipoDocumento =  null;
//        try{
//            con = new Conexion();
//            cn = con.getConexion();
//            cn.setAutoCommit(false);
//            ps = cn.prepareStatement(sql);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            while(rs.next()){
//                empleado = new Empleado();
//                //Todos los campos del empleado que se actualizara por ID
//                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
//                empleado.setNumeroDocumento(rs.getString("numerodocumento"));
//                empleado.setNombres(rs.getString("nombres")); 
//                empleado.setDireccion(rs.getString("direccion")); 
//                empleado.setTelefono(rs.getString("telefono"));
//                empleado.setEmail(rs.getString("email"));
//                
//            }
//        }catch(Exception e){
//            logger.info("buscarPorId: " + e.getMessage());
//        }finally{
//            con.cerrarConexion(cn);
//        }
//        return empleado;
//    }

    @Override
    public int totalRegistros(int id, int inicio, int registrosPorPagina) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public DetalleOperacion obtenerPorId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int actualizar(DetalleOperacion dop) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}