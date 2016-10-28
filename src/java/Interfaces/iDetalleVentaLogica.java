package Interfaces;

import Modelo.ComprobanteVenta;
import Modelo.DetalleOperacionRepuesto;
import Modelo.DetalleVenta;
import java.util.List;

public interface iDetalleVentaLogica {
    public int insertar(DetalleVenta detalleVenta);
    public int insertarDOR(DetalleOperacionRepuesto detalleOperacionRepuesto, int idOperacion, int idComprobanteVenta);
    public List<ComprobanteVenta> buscar(String nombres, int inicio, int registroPorPagina);
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina);
    public ComprobanteVenta obtenerPorId(int id);
    public int eliminar(int id);
}
