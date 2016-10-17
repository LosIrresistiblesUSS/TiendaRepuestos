package Modelo;

public class DetalleOperacionRepuesto {
    private int idDetalleOperacionRepuesto;
    private int cantidad;
    private double precio;
    private double subTotal;
    private Repuesto repuesto;


    public DetalleOperacionRepuesto() {
        this.repuesto = new Repuesto();
    }

    public DetalleOperacionRepuesto(int idDetalleOperacionRepuesto, int cantidad, double precio, double subTotal, Repuesto repuesto) {
        this.idDetalleOperacionRepuesto = idDetalleOperacionRepuesto;
        this.cantidad = cantidad;
        this.precio = precio;
        this.subTotal = subTotal;
        this.repuesto = repuesto;
    }

    public int getIdDetalleOperacionRepuesto() {
        return idDetalleOperacionRepuesto;
    }

    public void setIdDetalleOperacionRepuesto(int idDetalleOperacionRepuesto) {
        this.idDetalleOperacionRepuesto = idDetalleOperacionRepuesto;
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