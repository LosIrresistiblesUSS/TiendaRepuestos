package Interfaces;

import Modelo.DetalleOperacion;
import Modelo.DetalleVentaRepuesto;
import java.util.List;

public interface iDetalleOperacionDAO {
    public int insertar(DetalleOperacion detalleOperracion);
    public int insertarDVR(DetalleVentaRepuesto detalleVentaRepuesto);
    public List<DetalleOperacion> buscar(int id, int inicio, int registrosPorPagina);
    public int totalRegistros(int id, int inicio, int registrosPorPagina);
    public DetalleOperacion obtenerPorId(int id);
    public int actualizar(DetalleOperacion dop);
    public int eliminar(int id);
}