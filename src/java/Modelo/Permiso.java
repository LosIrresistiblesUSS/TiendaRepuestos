package Modelo;

public class Permiso {
    private int idDetallePermiso;
    private String permiso;
    private char accion;
    private boolean estado;

    public Permiso() {
    }

    public Permiso(int idDetallePermiso, String permiso, char accion, boolean estado) {
        this.idDetallePermiso = idDetallePermiso;
        this.permiso = permiso;
        this.accion = accion;
        this.estado = estado;
    }

    public int getIdDetallePermiso() {
        return idDetallePermiso;
    }

    public void setIdDetallePermiso(int idDetallePermiso) {
        this.idDetallePermiso = idDetallePermiso;
    }

    public String getPermiso() {
        return permiso;
    }

    public void setPermiso(String permiso) {
        this.permiso = permiso;
    }

    public char getAccion() {
        return accion;
    }

    public void setAccion(char accion) {
        this.accion = accion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}