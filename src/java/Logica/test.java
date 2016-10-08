package Logica;

import DAO.LoginDAO;
import Modelo.Usuario;
/*import org.apache.commons.codec.digest.DigestUtils;*/

public class test {
        
    public static void main(String[] args) {
        LoginLogica login = new LoginLogica();
        Usuario usuario = new Usuario();
        
        String textoSinEncriptar="48221945"; 
        /*String textoEncriptadoConMD5=DigestUtils.md5Hex(textoSinEncriptar);
        
        usuario = login.iniciarSesion("acotrinae", textoEncriptadoConMD5); */
        
        System.out.println(usuario.getIdLogin());
        System.out.println(usuario.getNombres());
        System.out.println(usuario.getCargo());
        System.out.println(usuario.getUsuario());
        System.out.println(usuario.getPassword());
        
    }
}