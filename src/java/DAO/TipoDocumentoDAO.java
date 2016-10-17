package DAO;

import Interfaces.iTipoDocumentoDAO;
import Modelo.TipoDocumento;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class TipoDocumentoDAO implements iTipoDocumentoDAO{
private static Logger logger = Logger.getLogger(TipoDocumentoDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;
    
    @Override
    public int insertar(TipoDocumento td) {
        logger.info("Insertando TipoDocumento");
                sql= "{CALL P_Insertar_TipoDocumento(?,?)}";
                try{
                    con=new Conexion();
                    cn=con.getConexion();
                    cn.setAutoCommit(false);
                    cs = cn.prepareCall(sql.trim());
                    cs.setString(1,td.getDescripcion().trim());
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
    public List<TipoDocumento> buscar(String nts, int inicio, int registrosPorPagina) {
    logger.info("buscar");
            sql = "select idTipoDocumento, descripcion "
                    + "from tipodocumento "
                    + "where descripcion like '%" + (nts.trim()) + "%'"
                    + "order by idTipoDocumento desc LIMIT " + inicio + ", " + registrosPorPagina;
            List<TipoDocumento> lstTipoDocumento = null;
            TipoDocumento tipoDocumento;
            try{
                con = new Conexion();
                cn = con.getConexion();
                cn.setAutoCommit(false);
                ps = cn.prepareStatement(sql);
                rs = ps.executeQuery();
                lstTipoDocumento = new ArrayList<TipoDocumento>();
                while(rs.next()){
                    tipoDocumento = new TipoDocumento();
                    tipoDocumento.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                    tipoDocumento.setDescripcion(rs.getString("descripcion")); 
                    lstTipoDocumento.add(tipoDocumento);
                }
            }catch(Exception e){
                logger.info("Error buscar: " + e.getMessage());
            }finally{
                con.cerrarConexion(cn);
            }
            return lstTipoDocumento;
        }

   
    @Override
    public int totalRegistros(String nts, int inicio, int registrosPorPagina) {
        int total = 0;
               logger.info("Total de Registros");
               sql = "select count(*) as total "
                       + "from tipodocumento "
                       + "where descripcion like '%" + (nts.trim()) + "%'";
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
    public TipoDocumento obtenerPorId(int id) {
        logger.info("buscarPorId");
               sql = "select idTipoDocumento, descripcion "
                       + "from TipoDocumento "
                       + "where idTipoDocumento = ?";
               TipoDocumento tipoDocumento = null;
               try{
                   con = new Conexion();
                   cn = con.getConexion();
                   cn.setAutoCommit(false);
                   ps = cn.prepareStatement(sql);
                   ps.setInt(1, id);
                   rs = ps.executeQuery();
                   while(rs.next()){
                       tipoDocumento = new TipoDocumento();
                       tipoDocumento.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                       tipoDocumento.setDescripcion(rs.getString("descripcion"));
                   }
               }catch(Exception e){
                   logger.info("buscarPorId: " + e.getMessage());
               }finally{
                   con.cerrarConexion(cn);
               }
               return tipoDocumento;
    }

    @Override
    public int actualizar(TipoDocumento td) {
        logger.info("actualizar");
                sql = "{CALL P_Actualizar_TipoDocumento(?,?,?)}";
                try{
                    con = new Conexion();
                    cn = con.getConexion();
                    cn.setAutoCommit(false);
                    cs = cn.prepareCall(sql.trim());
                    cs.setInt(1, td.getIdTipoDocumento());
                    cs.setString(2, td.getDescripcion().trim());
                    cs.registerOutParameter(3, java.sql.Types.INTEGER);
                    cs.executeUpdate();
                    flgOperacion = Integer.parseInt(cs.getObject(3).toString());
                    if(flgOperacion == 1){
                        cn.commit();
                    }else{
                        cn.rollback();
                    }
                }catch(Exception e){
                    logger.info("Eror al actualizar: " + e.getMessage() + " --> "+td.getIdTipoDocumento());
                }finally{
                    con.cerrarConexion(cn);
                }
                return flgOperacion;  
    }

    @Override
    public int eliminar(int id) {
        logger.info("Eliminar TipoDocumento");
                sql= "DELETE FROM TipoDocumento where idTipoDocumento = ?";
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
