package DAO;

import Interfaces.iDetalleVentaDAO;
import Modelo.ComprobanteVenta;
import Modelo.DetalleOperacionRepuesto;
import Modelo.DetalleVenta;
import Modelo.TipoComprobanteVenta;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DetalleVentaDAO implements iDetalleVentaDAO {

    private static Logger logger = Logger.getLogger(DetalleVentaDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private int flgOperacion2 = 0;
    private String sql;
    
    @Override
    public int insertar(DetalleVenta detalleVenta) {
        logger.info("Insertando Venta");
        sql= "{CALL P_Insertar_VentaRepuestos(?,?,?,?,?,?,?,?,?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            //OPERACION
            cs.setInt(1, detalleVenta.getDetalleOperacion().getOperacionRespuesto().getIdOperacionRepuesto());
            cs.setInt(2, detalleVenta.getDetalleOperacion().getOperacionRespuesto().getCliente().getIdCliente());
            cs.setInt(3, detalleVenta.getDetalleOperacion().getOperacionRespuesto().getEmpleado().getIdEmpleado());
            
            //COMPROBANTE VENTA
            cs.setInt(4, detalleVenta.getComprobanteVenta().getIdComprobanteVenta());
            cs.setString(5, detalleVenta.getComprobanteVenta().getNumero());
            cs.setDate(6, (java.sql.Date) detalleVenta.getComprobanteVenta().getFecha());
            cs.setString(7, detalleVenta.getComprobanteVenta().getDescripcion());
            cs.setDouble(8, detalleVenta.getComprobanteVenta().getImporte());
            cs.setDouble(9, detalleVenta.getComprobanteVenta().getTipoComprobanteVenta().getIdTipoComprobanteventa());
            
            cs.registerOutParameter(10, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(10).toString());
  
            //DETALLE OPERACION
                List<DetalleOperacionRepuesto> lstDetalleOperacionRepuesto = detalleVenta.getDetalleOperacion().getLstDetalleRepuesto();
                for(DetalleOperacionRepuesto detalleOperacionRepuesto : lstDetalleOperacionRepuesto){
                    insertarDOR(detalleOperacionRepuesto, detalleVenta.getDetalleOperacion().getOperacionRespuesto().getIdOperacionRepuesto(),detalleVenta.getComprobanteVenta().getIdComprobanteVenta());
                }
            
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
    public int insertarDOR(DetalleOperacionRepuesto detalleOperacionRepuesto, int idOperacion, int idComprobanteVenta) {
        logger.info("Insertando Otra Venta");
        sql= "{CALL P_Insertar_VentaRepuestos2(?,?,?,?,?,?,?)}";
        try{
            
            System.out.println("ENTREEEEEEEEEEEEEE");
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setInt(1, detalleOperacionRepuesto.getCantidad());
            cs.setDouble(2, detalleOperacionRepuesto.getPrecio());
            cs.setDouble(3, detalleOperacionRepuesto.getSubTotal());
            cs.setInt(4, idOperacion);
            cs.setInt(5, idComprobanteVenta);
            cs.setInt(6, detalleOperacionRepuesto.getRepuesto().getIdrepuesto());
            cs.registerOutParameter(7, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(7).toString());
            
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
    public List<ComprobanteVenta> buscar(String nombres, int inicio, int registroPorPagina) {
        logger.info("buscar");
        sql = "select DISTINCT " +
            "cv.idComprobanteVenta " +
            ",p.nombres " +
            ",c.apellidos" +
            ",c.razonSocial" +
            ",tcv.descripcion as tipoComprobante " +
            ",cv.numero " +
            ",cv.fecha " +
            ",cv.importe " +
            ",cv.estado " +
            "from ComprobanteVenta as cv inner join DetalleVenta dv " +
            "on cv.idComprobanteVenta = dv.idComprobanteVenta " +
            "inner join DetalleOperacion as deo " +
            "on dv.idDetalleOperacion = deo.idDetalleOperacion " +
            "inner join Operacion as o " +
            "on deo.idOperacion = o.idOperacion " +
            "inner join Persona as p " +
            "on o.idPersonaCliente = p.idPersona " +
            "inner join Cliente as c " +
            "on p.idPersona = c.idPersona " +
            "inner join TipoComprobanteVenta as tcv " +
            "on cv.idTipoComprobanteVenta = tcv.idTipoComprobanteVenta " +
            "where p.nombres like '%" + (nombres.trim()) + "%' " +
            "order by cv.idComprobanteVenta desc LIMIT " + inicio + ", " + registroPorPagina;
        
        List<ComprobanteVenta> lstComprobanteVenta = null;
        ComprobanteVenta comprobanteVenta;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstComprobanteVenta = new ArrayList<>();
            while(rs.next()){
                comprobanteVenta = new ComprobanteVenta();
                comprobanteVenta.setIdComprobanteVenta(rs.getInt("idComprobanteVenta"));
                comprobanteVenta.setNumero(rs.getString("numero"));
                comprobanteVenta.setFecha(rs.getDate("fecha"));
                comprobanteVenta.setImporte(rs.getDouble("importe"));
                comprobanteVenta.setEstado(rs.getBoolean("estado"));
                comprobanteVenta.setNombres(rs.getString("nombres"));
                comprobanteVenta.setApellidosRazonSocial(rs.getString("apellidos") + " " + rs.getString("razonSocial"));
                TipoComprobanteVenta tipoComprobanteVenta = new TipoComprobanteVenta();
                tipoComprobanteVenta.setDescripcion(rs.getString("tipoComprobante"));
                comprobanteVenta.setTipoComprobanteVenta(tipoComprobanteVenta);
                lstComprobanteVenta.add(comprobanteVenta);
            }
            
        }catch(Exception e){
            logger.info("Error buscar: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstComprobanteVenta;
        
    }

    @Override
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina) {
        int total = 0;
        logger.info("Total de Comprobante Logica");
        //cuenta total de registros que existen con el mismo nombre
        sql = "select " +
            "count(*) as total " +
            "from ComprobanteVenta as cv inner join DetalleVenta dv " +
            "on cv.idComprobanteVenta = dv.idComprobanteVenta " +
            "inner join DetalleOperacion as deo " +
            "on dv.idDetalleOperacion = deo.idDetalleOperacion " +
            "inner join Operacion as o " +
            "on deo.idOperacion = o.idOperacion " +
            "inner join Persona as p " +
            "on o.idPersonaCliente = p.idPersona " +
            "inner join Cliente as c " +
            "on p.idPersona = c.idPersona " +
            "where p.nombres like '%" + (nombres.trim()) + "%'";
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                total = rs.getInt("total");
            }
        }catch(Exception e){
            logger.info("Error en Total de Registros: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return total;
    }

    @Override
    public ComprobanteVenta obtenerPorId(int id) {   
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int eliminar(int id) {
            logger.info("Eliminar Venta");
        sql= "{CALL P_Anular_ComprobanteVenta(?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            
            cs = cn.prepareCall(sql.trim());
            cs.setInt(1, id);
            cs.registerOutParameter(2, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(2).toString());
            
            if(flgOperacion == 1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Error al Eliminar" + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }
}