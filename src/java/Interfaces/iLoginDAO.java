package Interfaces;

import Modelo.Usuario;

public interface iLoginDAO {
    public Usuario iniciarSesion(String user, String pass);
    public boolean cerrarSesion();
}
