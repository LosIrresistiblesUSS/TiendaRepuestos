package DAO;

import Interfaces.iEmpleadoDAO;
import Modelo.Empleado;
import Modelo.TipoDocumento;
import Modelo.TipoEmpleado;
import Util.Conexion;
import java.util.List;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Logger;

public class EmpleadoDAO implements iEmpleadoDAO{

    private static Logger logger = Logger.getLogger(EmpleadoDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;
    
    @Override
    public int insertar(Empleado empleado) {
    logger.info("Insertando Empleado");
        sql= "{CALL P_Insertar_Empleado(?,?,?,?,?,?,?,?,?)}";
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setString(1, empleado.getNumeroDocumento().trim());
            cs.setString(2, empleado.getNombres().trim());
            cs.setString(3, empleado.getApellidos().trim());
            cs.setString(4, empleado.getDireccion().trim());
            cs.setString(5, empleado.getTelefono().trim());
            cs.setString(6, empleado.getEmail().trim());
            cs.setInt(7, empleado.getTipoDocumento().getIdTipoDocumento());
            cs.setString(8, empleado.getTipoEmpleado().getIdTipoEmpleado().trim());
            cs.registerOutParameter(9, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(9).toString());
            
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
    public List<Empleado> buscar(String nombres, int inicio, int registrosPorPagina) {
        logger.info("buscar");
        sql = "select e.idEmpleado, p.nombres, e.apellidos, td.descripcion, p.numerodocumento, p.email, p.direccion, p.telefono, te.descripcion "
                + "from tipoempleado as te inner join empleado as e " +
                "on te.idtipoempleado=e.idtipoempleado " +
                "inner join persona as p " +
                "on e.idpersona=p.idpersona inner join tipodocumento as td " +
                "on p.idtipodocumento=td.idtipodocumento "
                + "where nombres like '%" + (nombres.trim()) + "%' "
                + "order by idEmpleado desc LIMIT " + inicio + ", " + registrosPorPagina;
        
        List<Empleado> lstEmpleado = null;
        Empleado empleado;
        TipoDocumento tipoDocumento;
        TipoEmpleado tipoEmpleado;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstEmpleado = new ArrayList<>();
            while(rs.next()){
                //Todos los campos que vamos a mostrar de la consulta
                empleado = new Empleado();
                tipoEmpleado = new TipoEmpleado();
                tipoDocumento = new TipoDocumento();
                
                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setApellidos(rs.getString("apellidos"));
                
                tipoDocumento.setDescripcion(rs.getString("td.descripcion"));
                empleado.setTipoDocumento(tipoDocumento);
                
                empleado.setNumeroDocumento(rs.getString("numerodocumento")); 
                empleado.setEmail(rs.getString("email"));
                empleado.setDireccion(rs.getString("direccion")); 
                empleado.setTelefono(rs.getString("telefono"));              
                
                tipoEmpleado.setDescripcion(rs.getString("te.descripcion"));
                empleado.setTipoEmpleado(tipoEmpleado);

                lstEmpleado.add(empleado);
            }
        }catch(Exception e){
            logger.info("Error buscar: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstEmpleado;
    }

    @Override
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina){
        int total = 0;
        logger.info("Total de Registros");
        //cuenta total de registros que existen con el mismo nombre
        sql = "select count(*) as total "
                + "from empleado e " +
                    "inner join persona p " +
                    "on e.idPersona=p.idPersona "
                + "where nombres like '%" + (nombres.trim()) + "%'";
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
    public Empleado obtenerPorId(int id) {
        logger.info("buscarPorId");
        sql = "select e.idEmpleado, p.idpersona, p.nombres, e.apellidos, td.idTipoDocumento, p.numerodocumento, "
                + "p.direccion, p.telefono, p.email, te.idtipoempleado, te.descripcion "
                + "from tipoempleado as te inner join empleado as e "
                + "on te.idtipoempleado=e.idtipoempleado "
                + "inner join persona as p "
                + "on e.idpersona=p.idpersona "
                + "inner join tipodocumento as td "
                + "on p.idtipodocumento=td.idtipodocumento "
                + "where idEmpleado = ?";
        Empleado empleado = null;
        TipoEmpleado tipoEmpleado = null;
        TipoDocumento tipoDocumento =  null;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                empleado = new Empleado();
                //Todos los campos del empleado que se actualizara por ID
                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setNumeroDocumento(rs.getString("numerodocumento"));
                empleado.setNombres(rs.getString("nombres")); 
                empleado.setApellidos(rs.getString("apellidos")); 
                empleado.setDireccion(rs.getString("direccion")); 
                empleado.setTelefono(rs.getString("telefono"));
                empleado.setEmail(rs.getString("email"));
                
                tipoDocumento = new TipoDocumento();
                tipoDocumento.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                empleado.setTipoDocumento(tipoDocumento);
                
                tipoEmpleado =  new TipoEmpleado();
                tipoEmpleado.setIdTipoEmpleado(rs.getString("idTipoEmpleado"));
                empleado.setTipoEmpleado(tipoEmpleado);
            }
        }catch(Exception e){
            logger.info("buscarPorId: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return empleado;
    }

    @Override
    public int actualizar(Empleado empleado) {
        logger.info("actualizar");
        sql = "{CALL P_Actualizar_Empleado(?,?,?,?,?,?,?,?,?,?)}";
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setInt(1, empleado.getIdEmpleado());
            cs.setString(2, empleado.getNumeroDocumento().trim());
            cs.setString(3, empleado.getNombres().trim());
            cs.setString(4, empleado.getApellidos().trim());
            cs.setString(5, empleado.getDireccion().trim());
            cs.setString(6, empleado.getTelefono().trim());
            cs.setString(7, empleado.getEmail().trim());
            cs.setInt(8, empleado.getTipoDocumento().getIdTipoDocumento());
            cs.setString(9, empleado.getTipoEmpleado().getIdTipoEmpleado().trim());
            cs.registerOutParameter(10, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(10).toString());
            if(flgOperacion == 1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Eror al actualizar: " + e.getMessage() + " --> "+empleado.getIdEmpleado());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }

    @Override
    public int eliminar(int id) {
        logger.info("Eliminar Empleado");
        sql= "{CALL P_Eliminar_Empleado(?,?)}";
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