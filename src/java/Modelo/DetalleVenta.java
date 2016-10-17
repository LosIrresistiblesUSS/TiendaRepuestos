package Modelo;

public class DetalleVenta {
    private int idDetalleVenta;
    private ComprobanteVenta comprobanteVenta;
    private DetalleOperacion detalleOperacion;

    public DetalleVenta() {
        comprobanteVenta = new ComprobanteVenta();
        detalleOperacion = new DetalleOperacion();
    }

    public DetalleVenta(int idDetalleVenta, ComprobanteVenta comprobanteVenta, DetalleOperacion detalleOperacion) {
        this.idDetalleVenta = idDetalleVenta;
        this.comprobanteVenta = comprobanteVenta;
        this.detalleOperacion = detalleOperacion;
    }

    public int getIdDetalleVenta() {
        return idDetalleVenta;
    }

    public void setIdDetalleVenta(int idDetalleVenta) {
        this.idDetalleVenta = idDetalleVenta;
    }

    public ComprobanteVenta getComprobanteVenta() {
        return comprobanteVenta;
    }

    public void setComprobanteVenta(ComprobanteVenta comprobanteVenta) {
        this.comprobanteVenta = comprobanteVenta;
    }

    public DetalleOperacion getDetalleOperacion() {
        return detalleOperacion;
    }

    public void setDetalleOperacion(DetalleOperacion detalleOperacion) {
        this.detalleOperacion = detalleOperacion;
    }
}
