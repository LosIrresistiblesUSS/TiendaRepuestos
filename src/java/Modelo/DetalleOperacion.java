package Modelo;

import java.util.ArrayList;
import java.util.List;

public class DetalleOperacion {
    private int idDetalleOperacion;
    private OperacionRepuesto operacionRespuesto;
    private List<DetalleOperacionRepuesto> lstDetalleRepuesto;

    public DetalleOperacion() {
        this.operacionRespuesto = new OperacionRepuesto();
        this.lstDetalleRepuesto = new ArrayList<>();
    }

    public DetalleOperacion(int idDetalleOperacion, OperacionRepuesto operacionRespuesto, List<DetalleOperacionRepuesto> lstDetalleRepuesto) {
        this.idDetalleOperacion = idDetalleOperacion;
        this.operacionRespuesto = operacionRespuesto;
        this.lstDetalleRepuesto = lstDetalleRepuesto;
    }

    public int getIdDetalleOperacion() {
        return idDetalleOperacion;
    }

    public void setIdDetalleOperacion(int idDetalleOperacion) {
        this.idDetalleOperacion = idDetalleOperacion;
    }

    public OperacionRepuesto getOperacionRespuesto() {
        return operacionRespuesto;
    }

    public void setOperacionRespuesto(OperacionRepuesto operacionRespuesto) {
        this.operacionRespuesto = operacionRespuesto;
    }

    public List<DetalleOperacionRepuesto> getLstDetalleRepuesto() {
        return lstDetalleRepuesto;
    }

    public void setLstDetalleRepuesto(List<DetalleOperacionRepuesto> lstDetalleRepuesto) {
        this.lstDetalleRepuesto = lstDetalleRepuesto;
    }
}