package Modelo;

public class Cliente extends Persona {
    
    protected int idCliente;
    protected String razonSocial;

    public Cliente() {
    }

    public Cliente(int idCliente, String razonSocial, int idPersona, String numeroDocumento, String nombres, String direccion, String telefono, String email, TipoDocumento tipoDocumento) {
        super(idPersona, numeroDocumento, nombres, direccion, telefono, email, tipoDocumento);
        this.idCliente = idCliente;
        this.razonSocial = razonSocial;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
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