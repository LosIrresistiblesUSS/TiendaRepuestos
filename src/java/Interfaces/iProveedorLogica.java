package Interfaces;

import Modelo.Proveedor;
import java.util.List;

public interface iProveedorLogica {
    public int insertar(Proveedor proveedor);
    public List<Proveedor> buscar(String descripcion, int inicio, int registrosPorPagina);
    public int totalRegistros(String descripcion, int inicio, int registrosPorPagina);
    public Proveedor obtenerPorId(int id);
    public int actualizar(Proveedor proveedor);
    public int eliminar(int id);
}
