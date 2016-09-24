package Modelo;

public class TipoServicio {
    private int idTipoServicio;
    private String descripcion;

    public TipoServicio() {
    }

    public TipoServicio(int idTipoServicio, String Decripcion) {
        this.idTipoServicio = idTipoServicio;
        this.descripcion = Decripcion;
    }

    public int getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(int idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }

    public String getDecripcion() {
        return descripcion;
    }

    public void setDecripcion(String Decripcion) {
        this.descripcion = Decripcion;
    }
    
@Override
    public String toString() {
    return idTipoServicio + ", " +descripcion;
    }
}