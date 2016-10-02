package DAO;

import Interfaces.iTipoServicioDAO;
import Modelo.TipoServicio;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class TipoServicioDAO implements iTipoServicioDAO  {
    //atributos
    private static Logger logger = Logger.getLogger(TipoServicioDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;

    @Override
    public int insertar(TipoServicio tipoServicio) {
        logger.info("Insertando TipoServicio");
        sql= "{CALL P_Insertar_TipoServicio(?,?)}";
        try{
           con=new Conexion();
           cn=con.getConexion();
           cn.setAutoCommit(false);
           cs = cn.prepareCall(sql.trim());
           cs.setString(1, tipoServicio.getDecripcion().trim());
           cs.registerOutParameter(2, java.sql.Types.INTEGER);
           cs.executeUpdate();
           flgOperacion = Integer.parseInt(cs.getObject(2).toString());
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
    public List<TipoServicio> buscar(String descripcion) {
        logger.info("buscar");
        sql = "select idTipoServicio, descripcion "
                + "from tiposervicio "
                + "where descripcion like '%" + (descripcion.trim()) + "%'"
                + "order by idTipoServicio desc";
        List<TipoServicio> lstTipoServicio = null;
        TipoServicio tipoServicio = null;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            //ps.setString(1, razSocial);
            rs = ps.executeQuery();
            lstTipoServicio = new ArrayList<TipoServicio>();
            while(rs.next()){
                tipoServicio = new TipoServicio();
                tipoServicio.setIdTipoServicio(rs.getInt("idTipoServicio"));
                tipoServicio.setDecripcion(rs.getString("descripcion")); 
                
                lstTipoServicio.add(tipoServicio);
            }
        }catch(Exception e){
            logger.info("Error buscar: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstTipoServicio;
    }

    @Override
    public TipoServicio obtenerPorId(int id) {
        logger.info("buscarPorId");
        sql = "select idTipoServicio, descripcion "
                + "from TipoServicio "
                + "where idTipoServicio = ?";
        TipoServicio tipoServicio = null;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                tipoServicio = new TipoServicio();
                tipoServicio.setIdTipoServicio(rs.getInt("idTipoServicio"));
                tipoServicio.setDecripcion(rs.getString("descripcion"));
            }
        }catch(Exception e){
            logger.info("buscarPorId: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return tipoServicio;
    }

    @Override
    public int actualizar(TipoServicio tipoServicio) {
        logger.info("actualizar");
        sql = "{CALL P_Actualizar_TipoServicio(?,?,?)}";
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setInt(1, tipoServicio.getIdTipoServicio());
            cs.setString(2, tipoServicio.getDecripcion().trim());
            cs.registerOutParameter(3, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(3).toString());
            if(flgOperacion == 1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Eror al actualizar: " + e.getMessage() + " --> "+tipoServicio.getIdTipoServicio());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }

    @Override
    public int eliminar(int id) {
        logger.info("Eliminar TipoServicio");
        String sql= "DELETE FROM TipoServicio where idTipoServicio = ?";

        try{
           con=new Conexion();
           cn=con.getConexion();
           cn.setAutoCommit(false);
           ps=cn.prepareStatement(sql);
           ps.setInt(1, id);
           
           flgOperacion=ps.executeUpdate();
           
           if(flgOperacion>0){
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