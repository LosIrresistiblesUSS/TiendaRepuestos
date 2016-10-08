package Logica;

import DAO.LoginDAO;
import Interfaces.iLoginLogica;
import Modelo.Usuario;

public class LoginLogica implements iLoginLogica {
    private LoginDAO loginDAO;
    
    @Override
    public Usuario iniciarSesion(String user, String pass) {
        loginDAO = new LoginDAO();
        return loginDAO.iniciarSesion(user, pass);
    }

    @Override
    public boolean cerrarSesion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}