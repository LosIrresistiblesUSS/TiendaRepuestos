package Interfaces;

import Modelo.Cliente;
import java.util.List;

public interface iClienteDAO {
    public int insertar(Cliente c);
    public List<Cliente> buscar(String nombres, int inicio, int registrosPorPagina);
    
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina);
    public Cliente obtenerPorId(int id);
    public int actualizar(Cliente c);
    public int eliminar(int id);
}
