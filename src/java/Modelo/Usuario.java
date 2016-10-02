package Modelo;

public class Usuario {
    private int idLogin;
    private String nombres;
    private String cargo;
    private String usuario;
    private String password;

    public Usuario() {
    }

    public Usuario(int idLogin, String nombres, String cargo, String usuario, String password) {
        this.idLogin = idLogin;
        this.nombres = nombres;
        this.cargo = cargo;
        this.usuario = usuario;
        this.password = password;
    }

    public int getIdLogin() {
        return idLogin;
    }

    public void setIdLogin(int idLogin) {
        this.idLogin = idLogin;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
