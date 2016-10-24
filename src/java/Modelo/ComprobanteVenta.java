package Modelo;

import java.util.Date;

public class ComprobanteVenta {
    private int idComprobanteVenta;
    private String numero;
    private Date fecha;
    private String descripcion;
    private double importe;
    private boolean estado;
    private TipoComprobanteVenta tipoComprobanteVenta;
    private String _nombres;
    private String _apellidosRazonSocial;

    public ComprobanteVenta() {
        fecha = new Date();
        tipoComprobanteVenta = new TipoComprobanteVenta();
    }

    public ComprobanteVenta(int idComprobanteVenta, String numero, Date fecha, String descripcion, double importe, boolean estado, TipoComprobanteVenta tipoComprobanteVenta, String _nombres, String _apellidosRazonSocial) {
        this.idComprobanteVenta = idComprobanteVenta;
        this.numero = numero;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.importe = importe;
        this.estado = estado;
        this.tipoComprobanteVenta = tipoComprobanteVenta;
        this._nombres = _nombres;
        this._apellidosRazonSocial = _apellidosRazonSocial;
    }

    public int getIdComprobanteVenta() {
        return idComprobanteVenta;
    }

    public void setIdComprobanteVenta(int idComprobanteVenta) {
        this.idComprobanteVenta = idComprobanteVenta;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
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

    public TipoComprobanteVenta getTipoComprobanteVenta() {
        return tipoComprobanteVenta;
    }

    public void setTipoComprobanteVenta(TipoComprobanteVenta tipoComprobanteVenta) {
        this.tipoComprobanteVenta = tipoComprobanteVenta;
    }

    public String getNombres() {
        return _nombres;
    }

    public void setNombres(String _nombres) {
        this._nombres = _nombres;
    }

    public String getApellidosRazonSocial() {
        return _apellidosRazonSocial;
    }

    public void setApellidosRazonSocial(String _apellidosRazonSocial) {
        this._apellidosRazonSocial = _apellidosRazonSocial;
    }
}
