package Helpers;

import Modelo.TipoCliente;
import Modelo.TipoComprobanteVenta;
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
    
    public static List<TipoComprobanteVenta> listaTipoComprobanteVenta(){
        logger.info("listaTipoComprobanteVenta");
        sql = "select idTipoComprobanteVenta, descripcion from TipoComprobanteVenta";
        List<TipoComprobanteVenta> lstTipoComprobanteVenta = null;
        TipoComprobanteVenta tipoComprobanteVenta;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            lstTipoComprobanteVenta = new ArrayList<>();
            while(rs.next()){
                tipoComprobanteVenta = new TipoComprobanteVenta();
                tipoComprobanteVenta.setIdTipoComprobanteventa(rs.getInt("idTipoComprobanteVenta"));
                tipoComprobanteVenta.setDescripcion(rs.getString("descripcion"));
                lstTipoComprobanteVenta.add(tipoComprobanteVenta);
            }
        } catch (Exception e) {
            logger.info("Error listaTipoComprobanteVenta: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        return lstTipoComprobanteVenta;
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
    
    public static String ultimoNumeroBoleta(){
        logger.info("ultimoNumeroBoleta");
        sql = "select " +
            "numero " +
            "from comprobanteVenta as cv " +
            "inner join TipoComprobanteVenta as tcv " +
            "on cv.idTipoComprobanteVenta = tcv.idTipoComprobanteVenta " +
            "where tcv.descripcion = 'boleta' " +
            "order by numero desc limit 1";
        String number = null;
        String numeroGeneral = null;
        String numero = null;
        String codigo = null;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                number = rs.getString("numero");
            }
        } catch (Exception e) {
            logger.info("Error ultimoNumeroBoleta: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        
        String num = number.substring(6);
        String cod = number.substring(2, 5);
        
        int numEntero = Integer.parseInt(num);
        int codEntero = Integer.parseInt(cod);
        
        if(numEntero != 999999){
            numEntero = numEntero + 1;
            String numEnteroString = String.valueOf(numEntero);
            char[] arrayNumEntero = numEnteroString.toCharArray();
            int totalCaracteresNumEntero = arrayNumEntero.length;
            
            switch (totalCaracteresNumEntero) {
                case 1:
                    numero = "00000" + numEnteroString;
                    break;
                case 2:
                    numero = "0000" + numEnteroString;
                    break;
                case 3:
                    numero = "000" + numEnteroString;
                    break;
                case 4:
                    numero = "00" + numEnteroString;
                    break;
                case 5:
                    numero = "0" + numEnteroString;
                    break;
                case 6:
                    numero = numEnteroString;
                    break;
                default:
                    break;
            }
            codigo = cod;
            numeroGeneral = "B-"+codigo+"-"+numero;
        } else {
            if (codEntero != 999) {
                codEntero = codEntero + 1;
                String codEnteroString = String.valueOf(codEntero);
                char[] arrayCodEntero = codEnteroString.toCharArray();
                int totalCaracteresCodEntero = arrayCodEntero.length;
                
                switch (totalCaracteresCodEntero) {
                    case 1:
                        codigo = "00" + codEnteroString;
                        break;
                    case 2:
                        codigo = "0" + codEnteroString;
                        break;
                    case 3:
                        codigo = codEnteroString;
                        break;
                    default:
                        break;
                }
                numero = "000001";
                numeroGeneral = "B-"+codigo+"-"+numero;
            } else {
                numeroGeneral = "Ya no existen codigos disponibles";
            }
        }
        return numeroGeneral;
    }
    
    public static String ultimoNumeroFactura(){
        logger.info("ultimoNumeroFactura");
        sql = "select " +
            "numero " +
            "from comprobanteVenta as cv " +
            "inner join TipoComprobanteVenta as tcv " +
            "on cv.idTipoComprobanteVenta = tcv.idTipoComprobanteVenta " +
            "where tcv.descripcion = 'factura' " +
            "order by numero desc limit 1";
        String number = null;
        String numeroGeneral = null;
        String numero = null;
        String codigo = null;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                number = rs.getString("numero");
            }
        } catch (Exception e) {
            logger.info("Error ultimoNumeroFactura: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        
        String num = number.substring(6);
        String cod = number.substring(2, 5);
        
        int numEntero = Integer.parseInt(num);
        int codEntero = Integer.parseInt(cod);
        
        if(numEntero != 999999){
            numEntero = numEntero + 1;
            String numEnteroString = String.valueOf(numEntero);
            char[] arrayNumEntero = numEnteroString.toCharArray();
            int totalCaracteresNumEntero = arrayNumEntero.length;
            
            switch (totalCaracteresNumEntero) {
                case 1:
                    numero = "00000" + numEnteroString;
                    break;
                case 2:
                    numero = "0000" + numEnteroString;
                    break;
                case 3:
                    numero = "000" + numEnteroString;
                    break;
                case 4:
                    numero = "00" + numEnteroString;
                    break;
                case 5:
                    numero = "0" + numEnteroString;
                    break;
                case 6:
                    numero = numEnteroString;
                    break;
                default:
                    break;
            }
            codigo = cod;
            numeroGeneral = "F-"+codigo+"-"+numero;
        } else {
            if (codEntero != 999) {
                codEntero = codEntero + 1;
                String codEnteroString = String.valueOf(codEntero);
                char[] arrayCodEntero = codEnteroString.toCharArray();
                int totalCaracteresCodEntero = arrayCodEntero.length;
                
                switch (totalCaracteresCodEntero) {
                    case 1:
                        codigo = "00" + codEnteroString;
                        break;
                    case 2:
                        codigo = "0" + codEnteroString;
                        break;
                    case 3:
                        codigo = codEnteroString;
                        break;
                    default:
                        break;
                }
                numero = "000001";
                numeroGeneral = "F-"+codigo+"-"+numero;
            } else {
                numeroGeneral = "Ya no existen codigos disponibles";
            }
        }
        return numeroGeneral;
    }
    
    public static int ultimoIdOperacion(){
        logger.info("ultimoIdOperacion");
        sql = "select idOperacion from operacion order by idOperacion desc limit 1";
        int cod = 0;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cod = rs.getInt("idOperacion");
            }
        } catch (Exception e) {
            logger.info("Error ultimoIdOperacion: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        return cod+1;
    }
    
    public static int ultimoIdComprobanteVenta(){
        logger.info("ultimoIdComprobanteVenta");
        sql = "select idComprobanteVenta from ComprobanteVenta order by idComprobanteVenta desc limit 1";
        int cod = 0;
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cod = rs.getInt("idComprobanteVenta");
            }
        } catch (Exception e) {
            logger.info("Error ultimoIdComprobanteVenta: " + e.getMessage());
        } finally{
            con.cerrarConexion(cn);
        }
        return cod+1;
    }
}
