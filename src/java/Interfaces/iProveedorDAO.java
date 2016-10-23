package Interfaces;

import Modelo.Proveedor;
import java.util.List;

public interface iProveedorDAO {
    public int insertar(Proveedor proveedor);
    public List<Proveedor> buscar(String razoncomercial, int inicio, int registrosPorPagina);
    public int totalRegistros(String razoncomercial, int inicio, int registrosPorPagina);
    public Proveedor obtenerPorId(int id);
    public int actualizar(Proveedor proveedor);
    public int eliminar(int id);
}