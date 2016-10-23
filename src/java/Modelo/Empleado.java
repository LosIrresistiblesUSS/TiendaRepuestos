package Modelo;

public class Empleado extends Persona{
    private int idEmpleado;
    private String apellidos;
    private TipoEmpleado tipoEmpleado;

    public Empleado() {
        tipoEmpleado = new TipoEmpleado();
    }

    public Empleado(int idEmpleado, String apellidos, TipoEmpleado tipoEmpleado, int idPersona, String numeroDocumento, String nombres, String direccion, String telefono, String email, TipoDocumento tipoDocumento) {
        super(idPersona, numeroDocumento, nombres, direccion, telefono, email, tipoDocumento);
        this.idEmpleado = idEmpleado;
        this.apellidos = apellidos;
        this.tipoEmpleado = tipoEmpleado;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public TipoEmpleado getTipoEmpleado() {
        return tipoEmpleado;
    }

    public void setTipoEmpleado(TipoEmpleado tipoEmpleado) {
        this.tipoEmpleado = tipoEmpleado;
    }

    @Override
    public int getIdPersona() {
        return idPersona;
    }

    @Override
    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    @Override
    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    @Override
    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    @Override
    public String getNombres() {
        return nombres;
    }

    @Override
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    @Override
    public String getDireccion() {
        return direccion;
    }

    @Override
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String getTelefono() {
        return telefono;
    }

    @Override
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    @Override
    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }
}