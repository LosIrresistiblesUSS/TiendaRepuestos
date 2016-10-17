package Interfaces;

import Modelo.Proveedor;
import java.util.List;

public interface iProveedorDAO {
    public int insertar(Proveedor pro);
    public List<Proveedor> buscar(String nombre, int inicio, int registrosPorPagina);
    public int totalRegistros(String nombre, int inicio, int registrosPorPagina);
    public Proveedor obtenerPorId(int id);
    public int actualizar(Proveedor pro);
    public int eliminar(int id);
}
