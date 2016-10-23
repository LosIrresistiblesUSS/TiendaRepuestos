package DAO;

import Interfaces.iProveedorDAO;
import Modelo.Proveedor;
import Modelo.TipoDocumento;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class ProveedorDAO implements iProveedorDAO{
    private static Logger logger = Logger.getLogger(ProveedorDAO.class.getName());
       private Conexion con;
       private Connection cn;
       private ResultSet rs;
       private PreparedStatement ps;
       private CallableStatement cs;
       private int flgOperacion = 0;
       private String sql;
       
    @Override
    public int insertar(Proveedor pro) {
        logger.info("Insertando Proveedor");
        sql= "{CALL P_Insertar_Proveedor(?,?,?,?,?,?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setString(1,pro.getNumeroDocumento().trim());
            cs.setString(2,pro.getRazonComercial().trim());
            cs.setString(3,pro.getDireccion().trim());
            cs.setString(4,pro.getTelefono().trim());
            cs.setString(5,pro.getEmail().trim());
            cs.setInt(6,pro.getTipoDocumento().getIdTipoDocumento());
            
            cs.registerOutParameter(7, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(7).toString());
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
        return flgOperacion;    }

    @Override
    public List<Proveedor> buscar(String razonComercial, int inicio, int registrosPorPagina) {
        logger.info("buscar");
        sql = "select " +
                "pr.idProveedor" +
                ",p.idPersona " +
                ",pr.razonComercial " +
                ",p.numeroDocumento " +
                ",td.descripcion " +
                ",p.direccion " +
                ",p.telefono " +
                ",p.email " +
                ",p.idTipoDocumento " +
                "from proveedor pr " +
                "inner join persona as p " +
                "on pr.idpersona=p.idpersona " +
                "inner join tipodocumento as td " +
                "on p.idtipodocumento=td.idtipodocumento " +
                "where razonComercial like '%" + (razonComercial.trim()) + "%' "+
                "order by idpersona desc Limit "+ inicio + ", " + registrosPorPagina;
        
        List<Proveedor> lstProveedor = null;
        Proveedor proveedor;
        TipoDocumento tipoDocumento;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstProveedor = new ArrayList<Proveedor>();
            tipoDocumento = new TipoDocumento();
            while(rs.next()){
                proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                proveedor.setRazonComercial(rs.getString("razonComercial"));
                proveedor.setNumeroDocumento(rs.getString("numeroDocumento"));
                proveedor.setDireccion(rs.getString("direccion"));
                proveedor.setTelefono(rs.getString("telefono"));
                proveedor.setEmail(rs.getString("email"));
                tipoDocumento.setDescripcion(rs.getString("descripcion"));
                
                proveedor.setTipoDocumento(tipoDocumento);
                
                lstProveedor.add(proveedor);
            }
        }catch(Exception e){
            logger.info("Error buscar: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstProveedor;
    }

    @Override
    public int totalRegistros(String razonComercial, int inicio, int registrosPorPagina) {
        int total = 0;
        logger.info("Total de Registros");
        sql = "select count(*) as total "
                + "from proveedor "
                + "where razonComercial like '%" + (razonComercial.trim()) + "%'";
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
    public Proveedor obtenerPorId(int id) {
    logger.info("buscarPorId");
           sql = "select " +
                "p.idPersona " +
                ",p.nombres " +
                ",pr.razonSocial " +
                ",p.numeroDocumento " +
                ",td.descripcion " +
                ",p.direccion " +
                ",p.telefono " +
                ",p.email " +
                ",p.idTipoDocumento " +
                "from proveedor pr " +
                "inner join persona as p " +
                "on pr.idpersona=p.idpersona " +
                "inner join tipodocumento as td " +
                "on p.idtipodocumento=td.idtipodocumento " +
                "where idProveedor =?" ;
        
            Proveedor proveedor = null;
            TipoDocumento tipoDocumento;
            try{
                con = new Conexion();
                cn = con.getConexion();
                cn.setAutoCommit(false);
                ps = cn.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                while(rs.next()){
                    proveedor = new Proveedor();
                    tipoDocumento = new TipoDocumento();
                    proveedor.setIdPersona(rs.getInt("idPersona"));
                    proveedor.setNombres(rs.getString("nombres"));
                    proveedor.setRazonComercial(rs.getString("razonsocial"));
                    proveedor.setNumeroDocumento(rs.getString("numeroDocumento"));
                    proveedor.setDireccion(rs.getString("direccion"));
                    proveedor.setTelefono(rs.getString("telefono"));
                    proveedor.setEmail(rs.getString("email"));   
                    
                    tipoDocumento.setDescripcion(rs.getString("descripcion"));
                
                    proveedor.setTipoDocumento(tipoDocumento);
                    
                }
            }catch(Exception e){
                logger.info("buscarPorId: " + e.getMessage());
            }finally{
                con.cerrarConexion(cn);
            }
            return proveedor;
        }
    
    @Override
    public int actualizar(Proveedor pro) {
    logger.info("actualizar");
        sql = "{CALL P_Actualizar_Proveedor(?,?,?,?,?,?,?,?,?)}";
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setString(1,pro.getNombres());
            cs.setString(2,pro.getRazonComercial().trim());
            cs.setString(3,pro.getNumeroDocumento().trim());
            cs.setString(4,pro.getTipoDocumento().getDescripcion().trim());
            cs.setString(5,pro.getDireccion().trim());
            cs.setString(6,pro.getTelefono().trim());
            cs.setString(7,pro.getEmail().trim());
            cs.setInt(8,pro.getTipoDocumento().getIdTipoDocumento());
            cs.registerOutParameter(9, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(9).toString());
            if(flgOperacion == 1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Eror al actualizar: " + e.getMessage() + " --> "+pro.getIdProveedor());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }

    @Override
    public int eliminar(int id) {
    logger.info("Eliminar Proveedor");
        sql= "DELETE FROM proveedor where idProveedor = ?";
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