package DAO;

import Interfaces.iDetalleVentaDAO;
import Modelo.ComprobanteVenta;
import Modelo.DetalleOperacionRepuesto;
import Modelo.DetalleVenta;
import Modelo.Empleado;
import Modelo.TipoDocumento;
import Modelo.TipoEmpleado;
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
    private String sql;
    
    @Override
    public int insertar(DetalleVenta detalleVenta) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insertarDOR(DetalleOperacionRepuesto detalleOperacionRepuesto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ComprobanteVenta> buscar(String nombres, int inicio, int registroPorPagina) {
        logger.info("buscar");
        sql = "select " +
            "cv.idComprobanteVenta " +
            ",cv.fecha " +
            ",cv.importe " +
            ",cv.estado " +
            ",p.nombres " +
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
                comprobanteVenta.setFecha(rs.getDate("fecha"));
                comprobanteVenta.setImporte(rs.getDouble("importe"));
                comprobanteVenta.setEstado(rs.getBoolean("estado"));
                comprobanteVenta.setCliente(rs.getString("nombres"));
                
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
        logger.info("buscarPorId");
        sql = "select " +
            "cv.idComprobanteVenta " +
            ",cv.fecha " +
            ",cv.importe " +
            ",cv.estado " +
            ",p.nombres " +
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
            "where cv.idComprobanteVenta = ? ";
        ComprobanteVenta comprobanteVenta = null;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                comprobanteVenta = new ComprobanteVenta();
                comprobanteVenta.setIdComprobanteVenta(rs.getInt("idComprobanteVenta"));
                comprobanteVenta.setFecha(rs.getDate("fecha"));
                comprobanteVenta.setImporte(rs.getDouble("importe"));
                comprobanteVenta.setEstado(rs.getBoolean("estado"));
                comprobanteVenta.setCliente(rs.getString("nombres"));
            }
        }catch(Exception e){
            logger.info("buscarPorId: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return comprobanteVenta;
    }

    @Override
    public int eliminar(int id) {
        logger.info("Anular Comprobante Venta");
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
