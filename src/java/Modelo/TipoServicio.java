package Modelo;

public class TipoServicio {
    private int idTipoServicio;
    private String descripcion;

    public TipoServicio() {
    }

    public TipoServicio(int idTipoServicio, String Descripcion) {
        this.idTipoServicio = idTipoServicio;
        this.descripcion = Descripcion;
    }

    public int getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(int idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.descripcion = Descripcion;
    }
}