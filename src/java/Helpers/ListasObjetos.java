package Helpers;

import Modelo.TipoCliente;
import Modelo.TipoDocumento;
import Modelo.TipoEmpleado;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class ListasObjetos {
    private static Logger logger = Logger.getLogger(ListasObjetos.class.getName());
    private static Conexion con;
    private static Connection cn;
    private static ResultSet rs;
    private static PreparedStatement ps;
    private static String sql;
    
    public static List<TipoDocumento> listaTipoDocumento(){
        logger.info("listaTipoDocumento");
        sql = "select idTipoDocumento, descripcion from TipoDocumento";
        List<TipoDocumento> lstTipoDocumento = null;
        TipoDocumento tipoDocumento;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstTipoDocumento = new ArrayList<>();
            while(rs.next()){
                tipoDocumento = new TipoDocumento();
                tipoDocumento.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                tipoDocumento.setDescripcion(rs.getString("descripcion"));
                lstTipoDocumento.add(tipoDocumento);
            }
        } catch (Exception e) {
            logger.info("Error listaTipoDocumento: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        return lstTipoDocumento;
    }
    
    public static List<TipoEmpleado> listaTipoEmpleado(){
        logger.info("listaTipoEmpleado");
        sql = "select idTipoEmpleado, descripcion from TipoEmpleado";
        List<TipoEmpleado> lstTipoEmpleado = null;
        TipoEmpleado tipoEmpleado;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstTipoEmpleado = new ArrayList<>();
            while(rs.next()){
                tipoEmpleado = new TipoEmpleado();
                tipoEmpleado.setIdTipoEmpleado(rs.getString("idTipoEmpleado"));
                tipoEmpleado.setDescripcion(rs.getString("descripcion"));
                lstTipoEmpleado.add(tipoEmpleado);
            }
        } catch (Exception e) {
            logger.info("Error listaTipoEmpleado: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        return lstTipoEmpleado;
    }
    
    public static String ultimoCodigoEmpleado(){
        logger.info("ultimoCodigoEmpleado");
        sql = "select idTipoEmpleado from TipoEmpleado order by idTipoEmpleado desc limit 1";
        String cod = null;
        String codigo = null;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cod = rs.getString("idTipoEmpleado");
            }
        } catch (Exception e) {
            logger.info("Error ultimoCodigoEmpleado: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        
        if (cod != null) {
            String cadena2 = cod.substring(3);
            int cadenaInt = Integer.parseInt(cadena2)+1;
            String cadenaIntString = String.valueOf(cadenaInt);

            char[] arrayCadena = cadenaIntString.toCharArray();
            int totalCaracteres = arrayCadena.length;

            switch (totalCaracteres) {
                case 1:
                    codigo = "EMP00" + cadenaIntString;
                    break;
                case 2:
                    codigo = "EMP0" + cadenaIntString;
                    break;
                case 3:
                    codigo = "EMP" + cadenaIntString;
                    break;
                default:
                    break;
            }
        }
        return codigo;
    }
    
    public static List<TipoCliente> listaTipoCliente(){
        logger.info("listaTipoCliente");
        sql = "select idTipoCliente, descripcion from TipoCliente";
        List<TipoCliente> lstTipoCliente = null;
        TipoCliente tipoCliente;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstTipoCliente = new ArrayList<>();
            while(rs.next()){
                tipoCliente = new TipoCliente();
                tipoCliente.setIdTipoCliente(rs.getInt("idTipoCliente"));
                tipoCliente.setNomDescripcion(rs.getString("descripcion"));
                lstTipoCliente.add(tipoCliente);
            }
        } catch (Exception e) {
            logger.info("Error listaTipoEmpleado: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        return lstTipoCliente;
    }
}
