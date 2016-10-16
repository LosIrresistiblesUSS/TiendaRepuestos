package DAO;

import Interfaces.iTipoEmpleadoDAO;
import Modelo.TipoEmpleado;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class TipoEmpleadoDAO implements iTipoEmpleadoDAO{
 private static Logger logger = Logger.getLogger(TipoEmpleadoDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;

    @Override
    public int insertar(TipoEmpleado tipoEmpleado) {
        logger.info("Insertando TipoEmpleado");
        sql= "{CALL P_Insertar_TipoEmpleado(?,?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setString(1, tipoEmpleado.getIdTipoEmpleado().trim());
            cs.setString(2, tipoEmpleado.getDescripcion().trim());
            cs.registerOutParameter(3, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(3).toString());
            if(flgOperacion==1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Error al insertar" + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }

    @Override
    public List<TipoEmpleado> buscar(String descripcion, int inicio, int registrosPorPagina) {
        logger.info("buscar");
        sql = "select idTipoEmpleado, descripcion "
                + "from TipoEmpleado "
                + "where descripcion like '%" + (descripcion.trim()) + "%' "
                + "order by idTipoEmpleado desc LIMIT " + inicio + ", " + registrosPorPagina;
        List<TipoEmpleado> lstTipoEmpleado = null;
        TipoEmpleado tipoEmpleado;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstTipoEmpleado = new ArrayList<TipoEmpleado>();
            while(rs.next()){
                tipoEmpleado = new TipoEmpleado();
                tipoEmpleado.setIdTipoEmpleado(rs.getString("idTipoEmpleado"));
                tipoEmpleado.setDescripcion(rs.getString("descripcion"));
                lstTipoEmpleado.add(tipoEmpleado);
            }
        }catch(Exception e){
            logger.info("Error al buscarDAO: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstTipoEmpleado;
    }
    
    @Override
    public int totalRegistros(String descripcion, int inicio, int registrosPorPagina){
        int total = 0;
        logger.info("Total de Registros");
        sql = "select count(*) as total "
                + "from tipoempleado "
                + "where descripcion like '%" + (descripcion.trim()) + "%'";
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
    public TipoEmpleado obtenerPorId(String id) {
        logger.info("BuscarPorId TipoEmpleado");
        sql = "select idTipoEmpleado, descripcion "
                + "from TipoEmpleado "
                + "where idTipoEmpleado = ?";
        TipoEmpleado tipoEmpleado = null;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                tipoEmpleado = new TipoEmpleado();
                tipoEmpleado.setIdTipoEmpleado(rs.getString("idTipoEmpleado"));
                tipoEmpleado.setDescripcion(rs.getString("descripcion"));
            }
        }catch(Exception e){
            logger.info("buscarPorId TipoEmpleado: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return tipoEmpleado;
    }

    @Override
    public int actualizar(TipoEmpleado tipoEmpleado) {
        logger.info("actualizar");
        sql = "{CALL P_Actualizar_TipoEmpleado(?,?,?)}";
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setString(1, tipoEmpleado.getIdTipoEmpleado().trim());
            cs.setString(2, tipoEmpleado.getDescripcion().trim());
            cs.registerOutParameter(3, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(3).toString());
            if(flgOperacion == 1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Eror al actualizar: " + e.getMessage() + " --> "+tipoEmpleado.getIdTipoEmpleado());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }

    @Override
    public int eliminar(String id) {
        logger.info("Eliminar TipoEmpelado");
        sql= "DELETE FROM TipoEmpleado where idTipoEmpleado = ?";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            ps=cn.prepareStatement(sql);
            ps.setString(1, id);
            flgOperacion=ps.executeUpdate();
            if(flgOperacion>0){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Error al Eliminar TipoEmpleado" + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }
}