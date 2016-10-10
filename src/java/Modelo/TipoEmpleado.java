package Modelo;

public class TipoEmpleado {
    private String idTipoEmpleado;
    private String descripcion;

    public TipoEmpleado() {
    }

    public TipoEmpleado(String idTipoEmpleado, String descripcion) {
        this.idTipoEmpleado = idTipoEmpleado;
        this.descripcion = descripcion;
    }

    public String getIdTipoEmpleado() {
        return idTipoEmpleado;
    }

    public void setIdTipoEmpleado(String idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}