package Modelo;

public class Proveedor extends Persona{
    private int idProveedor;
    private String razonComercial;

    public Proveedor() {
    }

    public Proveedor(int idProveedor, String razonComercial) {
        this.idProveedor = idProveedor;
        this.razonComercial = razonComercial;
    }

    public Proveedor(int idProveedor, String razonComercial, int idPersona, String numeroDocumento, String nombres, String direccion, String telefono, String email, TipoDocumento tipoDocumento) {
        super(idPersona, numeroDocumento, nombres, direccion, telefono, email, tipoDocumento);
        this.idProveedor = idProveedor;
        this.razonComercial = razonComercial;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getRazonComercial() {
        return razonComercial;
    }

    public void setRazonComercial(String razonComercial) {
        this.razonComercial = razonComercial;
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