package Interfaces;

import Modelo.DetalleOperacion;
import java.util.List;

public interface iDetalleOperacionLogica {
    public int insertar(DetalleOperacion detalleOperacion);
    public List<DetalleOperacion> buscar(int id, int inicio, int registrosPorPagina);
    public int totalRegistros(int id, int inicio, int registrosPorPagina);
    public DetalleOperacion obtenerPorId(int id);
    public int actualizar(DetalleOperacion detalleOperacion);
    public int eliminar(int id);
}