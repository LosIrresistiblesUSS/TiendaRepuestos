package Modelo;

public class TipoComprobanteVenta {
    private int idTipoComprobanteventa;
    private String descripcion;

    public TipoComprobanteVenta() {
    }

    public TipoComprobanteVenta(int idTipoComprobanteventa, String descripcion) {
        this.idTipoComprobanteventa = idTipoComprobanteventa;
        this.descripcion = descripcion;
    }

    public int getIdTipoComprobanteventa() {
        return idTipoComprobanteventa;
    }

    public void setIdTipoComprobanteventa(int idTipoComprobanteventa) {
        this.idTipoComprobanteventa = idTipoComprobanteventa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
