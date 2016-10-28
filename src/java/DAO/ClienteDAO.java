package DAO;

import Interfaces.iClienteDAO;
import Modelo.Cliente;
import Modelo.TipoCliente;
import Modelo.TipoDocumento;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class ClienteDAO implements iClienteDAO{
    private static Logger logger = Logger.getLogger(ClienteDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;

    @Override
    public int insertar(Cliente cliente) {
        logger.info("Insertando Cliente");
        sql= "{CALL P_Insertar_Cliente(?,?,?,?,?,?,?,?)}";
         
        try{
            con=new Conexion();
            cn=con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
           
            cs.setString(1,cliente.getNumeroDocumento().trim());
            cs.setString(2,cliente.getNombres().trim());
            cs.setString(3,cliente.getRazonSocial().trim());
            cs.setString(4,cliente.getDireccion().trim());
            cs.setString(5,cliente.getTelefono().trim());
            cs.setString(6,cliente.getEmail().trim());
            cs.setInt(7, cliente.getTipoDocumento().getIdTipoDocumento());
            cs.registerOutParameter(8, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(8).toString());
            
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
    public List<Cliente> buscar(String nombres, int inicio, int registrosPorPagina) {
        logger.info("buscar");
        sql = "select " + 
                "c.idCliente " +
                ",c.razonSocial " +
                ",p.nombres"+
                ",c.apellidos " +
                ",tc.descripcion as tipocliente" +
                ",tp.descripcion as tipodocumento" +
                ",p.numeroDocumento " +
                ",p.direccion " +
                ",p.telefono " +
               ",p.idpersona " +
                ",p.email " +
                "from cliente c " +
                "inner join persona p " +
                "on c.idPersona = p.idPersona " +
                "inner join tipodocumento tp " +
                "on tp.idTipoDocumento = p.idTipoDocumento " +
                "inner join tipocliente tc " +
                "on tc.idTipoCliente = c.idTipoCliente " +
                "where c.apellidos like '%" + (nombres.trim()) + "%' or c.razonSocial like '%" + (nombres.trim()) + "%' "
                + "order by idCliente desc LIMIT " + inicio + ", " + registrosPorPagina;

        List<Cliente> lstCliente = null;
        Cliente cliente;
        TipoDocumento tipodocumento;
        TipoCliente tipocliente;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstCliente = new ArrayList<Cliente>();
            
            while(rs.next()){
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("IdCliente"));
             
                cliente.setIdPersona(rs.getInt("idpersona"));
                cliente.setRazonSocial(rs.getString("razonSocial"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
               
                tipocliente=new TipoCliente();
                tipocliente.setNomDescripcion(rs.getString("tipocliente"));
                cliente.setTipoCliente(tipocliente);
                
                
                cliente.setNumeroDocumento(rs.getString("numeroDocumento"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setEmail(rs.getString("email"));
                
                tipodocumento= new TipoDocumento();
                tipodocumento.setDescripcion(rs.getString("tipodocumento"));
                cliente.setTipoDocumento(tipodocumento);
           
                lstCliente.add(cliente);
                
            }
            
        }catch(Exception e){
            logger.info("Error al buscar: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return lstCliente;
    }
    
    @Override
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina){
        int total = 0;
        logger.info("Total de Registros");
        sql = "select count(*) as total " +
              "from cliente c " +
              "inner join persona p " +
              "on c.idpersona = p.idpersona " +
              "inner join tipocliente tc "+
               "on tc.idTipoCliente=c.idTipoCliente " +
               "where apellidos like '%" + (nombres.trim()) + "%' or razonSocial like '%" + (nombres.trim()) + "%'";
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
    public Cliente obtenerPorId(int id) {
        logger.info("buscarPorId");
        sql = "select c.idCliente, c.razonSocial, c.apellidos, p.numeroDocumento, "
                + "p.direccion, p.telefono, p.email "
                + "from cliente c inner join persona p "
                + "on c.idpersona=p.idpersona " +
                "inner join tipodocumento tp " +
                "on tp.idTipoDocumento = p.idTipoDocumento "
                + "where idcliente = ? ";
        Cliente cliente = null;
        TipoDocumento tipodocumento;
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                tipodocumento=new TipoDocumento();
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setRazonSocial(rs.getString("RazonSocial"));
                cliente.setApellidos(rs.getString("nombres"));
                cliente.setNumeroDocumento(rs.getString("numeroDocumento"));
                cliente.setDireccion(rs.getString("Direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setEmail(rs.getString("email"));
                tipodocumento.setDescripcion(rs.getString("descripcion"));
                cliente.setTipoDocumento(tipodocumento);
            }
        }catch(Exception e){
            logger.info("buscarPorId Cliente: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return cliente;
    }

    @Override
    public int actualizar(Cliente cliente) {
        logger.info("actualizar");
        sql = "{CALL P_Actualizar_cliente(?,?,?)}";
        try{
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            cs = cn.prepareCall(sql.trim());
            cs.setString(1, cliente.getRazonSocial().trim());
            cs.setInt   (2,cliente.getIdPersona());
            cs.setString(3,cliente.getNumeroDocumento().trim());
            cs.setString(4,cliente.getNombres().trim() );
            cs.setString(5,cliente.getDireccion().trim());
            cs.setString(6,cliente.getTelefono().trim());
            cs.setString(7,cliente.getEmail().trim());
           
            cs.registerOutParameter(8, java.sql.Types.INTEGER);
            cs.executeUpdate();
            flgOperacion = Integer.parseInt(cs.getObject(3).toString());
            if(flgOperacion == 1){
                cn.commit();
            }else{
                cn.rollback();
            }
        }catch(Exception e){
            logger.info("Eror al actualizar: " + e.getMessage() + " --> "+cliente.getIdCliente());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }

    @Override
    public int eliminar(int id) {
        logger.info("Eliminar Cliente");
        sql= "DELETE FROM cliente where idcliente = ?";
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
            logger.info("Error al Eliminar cliente" + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return flgOperacion;
    }
}