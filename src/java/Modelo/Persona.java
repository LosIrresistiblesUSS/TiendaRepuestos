package Modelo;

public class Persona{
    protected int idPersona;
    protected String numeroDocumento;
    protected String nombres;
    protected String direccion;
    protected String telefono;
    protected String email;
    protected TipoDocumento tipoDocumento;

    public Persona() {
        tipoDocumento = new TipoDocumento();
    }

    public Persona(int idPersona, String numeroDocumento, String nombres, String direccion, String telefono, String email, TipoDocumento tipoDocumento) {
        this.idPersona = idPersona;
        this.numeroDocumento = numeroDocumento;
        this.nombres = nombres;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.tipoDocumento = tipoDocumento;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }
}