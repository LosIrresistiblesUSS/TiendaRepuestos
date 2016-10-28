package Logica;

import DAO.DetalleVentaDAO;
import Interfaces.iDetalleVentaLogica;
import Modelo.ComprobanteVenta;
import Modelo.DetalleOperacionRepuesto;
import Modelo.DetalleVenta;
import java.util.List;

public class DetalleVentaLogica implements iDetalleVentaLogica {
    private DetalleVentaDAO detalleVentaDAO;

    @Override
    public int insertar(DetalleVenta detalleVenta) {
        detalleVentaDAO = new DetalleVentaDAO();
        return detalleVentaDAO.insertar(detalleVenta);
    }

    @Override
    public int insertarDOR(DetalleOperacionRepuesto detalleOperacionRepuesto, int idOperacion, int idComprobanteVenta) {
        detalleVentaDAO = new DetalleVentaDAO();
        return detalleVentaDAO.insertarDOR(detalleOperacionRepuesto, idOperacion, idComprobanteVenta);
    }

    @Override
    public List<ComprobanteVenta> buscar(String nombres, int inicio, int registroPorPagina) {
        detalleVentaDAO = new DetalleVentaDAO();
        return detalleVentaDAO.buscar(nombres, inicio, registroPorPagina);
    }

    @Override
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina) {
        detalleVentaDAO = new DetalleVentaDAO();
        return detalleVentaDAO.totalRegistros(nombres, inicio, registrosPorPagina);
    }

    @Override
    public ComprobanteVenta obtenerPorId(int id) {
        detalleVentaDAO = new DetalleVentaDAO();
        return detalleVentaDAO.obtenerPorId(id);
    }

    @Override
    public int eliminar(int id) {
        detalleVentaDAO = new DetalleVentaDAO();
        return detalleVentaDAO.eliminar(id);
    }
}
