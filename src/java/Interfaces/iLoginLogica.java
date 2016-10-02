package Interfaces;

import Modelo.Usuario;

public interface iLoginLogica {
    public Usuario iniciarSesion(String user, String pass);
    public boolean cerrarSesion();
}
