package DAO;
import Interfaces.iRepuestoDAO;
import Modelo.Repuesto;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class RepuestoDAO implements iRepuestoDAO {
    private static Logger logger = Logger.getLogger(RepuestoDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;

    @Override
    public int insertar(Repuesto repuesto) {
        logger.info("Insertando Repuesto");
        sql= "{CALL P_Insertar_Repuesto(?,?,?,?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());

           cs.setString(1, repuesto.getDescripcion().trim());
           cs.setDouble(2, repuesto.getStock());
            cs.setDouble(3, repuesto.getPrecio());
            cs.setDouble(4, repuesto.getpreciopormayor()); 
            cs.registerOutParameter(5, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(5).toString());
            if(flgOperacion==1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Error  al insertar" + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }

    @Override
    public List<Repuesto> buscar(String descripcion,int inicio, int registrosPorPagina) {
        logger.info("buscar");
        sql = "select "  +
                "r.idrepuesto " +
                ",p.idproducto " +
                ",p.descripcion " +
                ",p.stock " +
                ",p.precio " +
                ",p.preciopormayor " +
                "from producto p " +
                "inner join repuesto as r " +
                "on p.idproducto=r.idproducto " +          
                "where descripcion like '%" + (descripcion.trim()) + "%' "
            + "order by idrepuesto desc LIMIT " + inicio + ", " + registrosPorPagina;

        List<Repuesto> lstRepuesto = null;
        
        Repuesto repuesto;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstRepuesto = new ArrayList<Repuesto>();
            while(rs.next()){
                repuesto = new Repuesto();
                repuesto.setIdrepuesto(rs.getInt("idrepuesto"));
                repuesto.setIdproducto(rs.getInt("idproducto")); 
                repuesto.setDescripcion(rs.getString("descripcion")); 
                repuesto.setStock(rs.getInt("stock")); 
                repuesto.setPrecio(rs.getDouble("precio"));
                repuesto.setPreciomayor(rs.getDouble("preciopormayor"));
                lstRepuesto.add(repuesto);
            }
        }catch(Exception e){
            logger.info("Error buscar: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstRepuesto;        
    }
    
    @Override
    public int totalRegistros(String descripcion, int inicio, int registrosPorPagina) {
        
        int total = 0;
        logger.info("Total de Registros");
        sql = "select count(*) as total "
                + "from producto p " +
                "inner join repuesto as r " +
                "on p.idproducto=r.idproducto " +          
                "where descripcion like '%" + (descripcion.trim()) + "%'";
        
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                total = rs.getInt("total");
                System.out.println(total);
            }
        }catch(Exception e){
            logger.info("Error en Total de Registros: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return total;
        
    }
    
    
    @Override
    public Repuesto obtenerPorId(int id) {
        logger.info("buscarPorId");
        sql = "select r.idrepuesto, p.idproducto, p.descripcion,p.stock,p.precio,p.precioporMayor "
                + "from producto p " +
                "inner join repuesto as r " +
                "on p.idproducto=r.idproducto " +          
                 "where r.idrepuesto = ?";
        Repuesto repuesto = null;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                repuesto = new Repuesto();
                repuesto.setIdrepuesto(rs.getInt("idrepuesto"));
                repuesto.setIdproducto(rs.getInt("idproducto"));
                repuesto.setDescripcion(rs.getString("descripcion"));
                repuesto.setStock(rs.getInt("stock"));
                repuesto.setPrecio(rs.getDouble("precio"));
                repuesto.setPreciomayor(rs.getDouble("precioPorMayor"));

            }
        }catch(Exception e){
            logger.info("buscarPorId: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return repuesto;
    }



    @Override
    public int actualizar(Repuesto repuesto) {
        
        logger.info("actualizar");
        sql = "{CALL P_Actualizar_Repuesto(?,?,?,?,?,?,?)}";
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            
            cs.setInt(1, repuesto.getIdrepuesto());
            cs.setInt(2, repuesto.getIdproducto());
            cs.setString(3,repuesto.getDescripcion().trim());
            cs.setInt(4, repuesto.getStock());
            cs.setDouble(5,repuesto.getPrecio());
            cs.setDouble(6,repuesto.getpreciopormayor());
            cs.registerOutParameter(7, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(7).toString());
            if(flgOperacion == 1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Eror al actualizar: " + e.getMessage() + " --> "+repuesto.getIdrepuesto());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }
    

    
    @Override
    public int eliminar(int id) {
        logger.info("Eliminar Repuesto");
        sql= "DELETE FROM Repuesto where idrepuesto = ?";
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