package Modelo;

public class OperacionRepuesto {
    private  int idOperacionRepuesto;
    private boolean estado;
    private Cliente cliente;
    private Empleado empleado;
    private Vehiculo vehiculo;

    public OperacionRepuesto() {
        this.cliente = new Cliente();
        this.empleado = new Empleado();
        this.vehiculo = new Vehiculo();
    }

    public OperacionRepuesto(int idOperacionRepuesto, boolean estado, Cliente cliente, Empleado empleado, Vehiculo vehiculo) {
        this.idOperacionRepuesto = idOperacionRepuesto;
        this.estado = estado;
        this.cliente = cliente;
        this.empleado = empleado;
        this.vehiculo = vehiculo;
    }

    public int getIdOperacionRepuesto() {
        return idOperacionRepuesto;
    }

    public void setIdOperacionRepuesto(int idOperacionRepuesto) {
        this.idOperacionRepuesto = idOperacionRepuesto;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
}