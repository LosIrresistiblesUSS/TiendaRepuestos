package DAO;

import Interfaces.iLoginDAO;
import Modelo.Usuario;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;

public class LoginDAO implements iLoginDAO {
    private static Logger logger = Logger.getLogger(LoginDAO.class.getName());
    private Conexion con;
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private CallableStatement cs;
    private int flgOperacion = 0;
    private String sql;

    @Override
    public Usuario iniciarSesion(String user, String pass) {
        logger.info("iniciarSesion");
        sql ="SELECT l.idLogin,l.usuario,l.pass,l.imagen,p.nombres,te.descripcion,e.idEmpleado " +
            "FROM Login AS l " +
            "inner join Persona AS p " +
            "ON l.idPersona = p.idPersona " +
            "inner join Empleado AS e " +
            "ON p.idPersona = e.idPersona " +
            "inner join TipoEmpleado AS te " +
            "ON e.idTipoEmpleado = te.idTipoEmpleado " +
            "where l.usuario = '"+ (user.trim()) +"' and l.pass = '"+ (pass.trim()) +"'";
        
        Usuario usuario = null;
        
        try {
            con = new Conexion();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                usuario = new Usuario();
                usuario.setIdLogin(rs.getInt("idLogin"));
                usuario.setIdEmpleado(rs.getInt("idEmpleado"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setCargo(rs.getString("descripcion"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setPassword(rs.getString("pass"));
                usuario.setImagen(rs.getString("imagen"));
            }
        } catch (Exception e) {
            logger.info("Error Iniciar Sesion: " + e.getMessage());
        }finally{
            con.cerrarConexion(cn);
        }
        return usuario;
}
        
    @Override
    public boolean cerrarSesion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}