package Modelo;

import java.util.ArrayList;
import java.util.List;

public class DetalleOperacion {
    private int idDetalleOperacion;
    private OperacionRepuesto operacionRespuesto;
    
    private List<DetalleVentaRepuesto> lstDetalleVentaRepuesto;

    public DetalleOperacion() {
        this.operacionRespuesto = new OperacionRepuesto();
        this.lstDetalleVentaRepuesto = new ArrayList<>();
    }

    public DetalleOperacion(int idDetalleOperacion, OperacionRepuesto operacionRespuesto, List<DetalleVentaRepuesto> lstDetalleVentaRepuesto) {
        this.idDetalleOperacion = idDetalleOperacion;
        this.operacionRespuesto = operacionRespuesto;
        this.lstDetalleVentaRepuesto = lstDetalleVentaRepuesto;
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

    public List<DetalleVentaRepuesto> getLstDetalleVentaRepuesto() {
        return lstDetalleVentaRepuesto;
    }

    public void setLstDetalleVentaRepuesto(List<DetalleVentaRepuesto> lstDetalleVentaRepuesto) {
        this.lstDetalleVentaRepuesto = lstDetalleVentaRepuesto;
    } 
}