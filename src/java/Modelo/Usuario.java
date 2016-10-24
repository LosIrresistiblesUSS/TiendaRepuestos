package Modelo;

public class Usuario {
    private int idLogin;
    private int idEmpleado;
    private String nombres;
    private String cargo;
    private String usuario;
    private String password;
    private String imagen;

    public Usuario() {
    }

    public Usuario(int idLogin, int idEmpleado, String nombres, String cargo, String usuario, String password, String imagen) {
        this.idLogin = idLogin;
        this.idEmpleado = idEmpleado;
        this.nombres = nombres;
        this.cargo = cargo;
        this.usuario = usuario;
        this.password = password;
        this.imagen = imagen;
    }

    public int getIdLogin() {
        return idLogin;
    }

    public void setIdLogin(int idLogin) {
        this.idLogin = idLogin;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
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

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}