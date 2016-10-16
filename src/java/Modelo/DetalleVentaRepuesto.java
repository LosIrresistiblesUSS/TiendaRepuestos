package Modelo;

public class DetalleVentaRepuesto {
    private int idDetalleVentaRepuesto;
    private int cantidad;
    private double precio;
    private double subTotal;
    private Repuesto repuesto;


    public DetalleVentaRepuesto() {
        this.repuesto = new Repuesto();
    }

    public DetalleVentaRepuesto(int idDetalleVentaRepuesto, int cantidad, double precio, double subTotal, Repuesto repuesto) {
        this.idDetalleVentaRepuesto = idDetalleVentaRepuesto;
        this.cantidad = cantidad;
        this.precio = precio;
        this.subTotal = subTotal;
        this.repuesto = repuesto;
    }

    public int getIdDetalleVentaRepuesto() {
        return idDetalleVentaRepuesto;
    }

    public void setIdDetalleVentaRepuesto(int idDetalleVentaRepuesto) {
        this.idDetalleVentaRepuesto = idDetalleVentaRepuesto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public Repuesto getRepuesto() {
        return repuesto;
    }

    public void setRepuesto(Repuesto repuesto) {
        this.repuesto = repuesto;
    }
}