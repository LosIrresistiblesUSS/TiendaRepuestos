package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import org.apache.log4j.Logger;

public class Conexion {
    private static Logger logger=Logger.getLogger(Conexion.class.getName());
   
    private Connection con;
    private static ResourceBundle rb=ResourceBundle.getBundle("jdbc");
   
    public Conexion(){
        logger.info("Iniciando Conexión");
        String driver = rb.getString("driver");

        //Enchufar el driver
        try{
            Class.forName(driver);
        }catch(ClassNotFoundException e){
            logger.error("Error no se puede cargar el driver..."
                   +e.getMessage());
        }

        //Para establecer conexion
        try{
            String usuario = rb.getString("usr");
            String pass = rb.getString("pwd");
            String url = rb.getString("url");
            con=DriverManager.getConnection(url,usuario,pass);
        }catch(SQLException e){
            logger.error("Error al conectar: "+e.getMessage());
        }
    }
    
    public Connection getConexion(){
        logger.info("Devolviendo la conexion");
        return con;
    }
    
    public void cerrarConexion(Connection con){
        logger.info("Cerrando la conexión");
        try{
            con.close();
        }catch(SQLException e){
            logger.error("Error al cerrar la conexión "+e.getMessage());
        }
    }
}