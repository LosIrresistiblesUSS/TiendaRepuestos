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
    public byte insertar(TipoServicio ts) {
        logger.info("Insertando TipoServicio");
        String sql= "INSERT Into TipoServicio(idTipoServicio, descripcion)";
        sql+=" VALUES (?,?)";
        try{
           con=new Conexion();
           cn=con.getConexion();
           cn.setAutoCommit(false);
           ps=cn.prepareStatement(sql);
           ps.setInt(1, ts.getIdTipoServicio());
           ps.setString(2, ts.getDecripcion());
           
           flgOperacion=ps.executeUpdate();
           
           if(flgOperacion>0){
               cn.commit();
           }else{
               cn.rollback();
           }
       }catch(Exception e){
        logger.info("Error al insertar" + e.getMessage());
       }finally{
           con.cerrarConexion(cn);
       }
       return (byte)flgOperacion;
    }

    @Override
    public List<TipoServicio> buscar(String descripcion) {
        logger.info("buscar");
        sql = "select idTipoServicio, descripcion "
                + "from tiposervicio "
                + "where descripcion like '"+ (descripcion.trim()) + "%'";
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
    public byte actualizar(TipoServicio ts) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    @Override
    public byte eliminar(int id) {
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
       return (byte)flgOperacion;
    }
}