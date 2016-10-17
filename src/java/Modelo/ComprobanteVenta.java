package Modelo;

import java.util.Date;

public class ComprobanteVenta {
    private int idComprobanteVenta;
    private Date fecha;
    private String descripcion;
    private double importe;
    private boolean estado;
    private String _tipoComprobante;
    private String _cliente;

    public ComprobanteVenta() {
        fecha = new Date();
    }

    public ComprobanteVenta(int idComprobanteVenta, Date fecha, String descripcion, double importe, boolean estado, String _tipoComprobante, String _cliente) {
        this.idComprobanteVenta = idComprobanteVenta;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.importe = importe;
        this.estado = estado;
        this._tipoComprobante = _tipoComprobante;
        this._cliente = _cliente;
    }

    public int getIdComprobanteVenta() {
        return idComprobanteVenta;
    }

    public void setIdComprobanteVenta(int idComprobanteVenta) {
        this.idComprobanteVenta = idComprobanteVenta;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getTipoComprobante() {
        return _tipoComprobante;
    }

    public void setTipoComprobante(String _tipoComprobante) {
        this._tipoComprobante = _tipoComprobante;
    }

    public String getCliente() {
        return _cliente;
    }

    public void setCliente(String _cliente) {
        this._cliente = _cliente;
    }
}
