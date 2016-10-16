package Modelo;

public class TipoDocumento {
    protected int idTipoDocumento;
    protected String descripcion;

    public TipoDocumento() {
    }

    public TipoDocumento(int idTipoDocumento, String descripcion) {
        this.idTipoDocumento = idTipoDocumento;
        this.descripcion = descripcion;
    }
   
    public int getIdTipoDocumento() {
        return idTipoDocumento;
    }

    public void setIdTipoDocumento(int idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}