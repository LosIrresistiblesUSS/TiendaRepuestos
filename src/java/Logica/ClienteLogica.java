
package Logica;

import DAO.ClienteDAO;
import Interfaces.iClienteLogica;
import Modelo.Cliente;
import java.util.List;


public class ClienteLogica implements iClienteLogica{
    private ClienteDAO clienteDAO;

    @Override
    public int insertar(Cliente cliente) {
        clienteDAO = new ClienteDAO();
        return clienteDAO.insertar(cliente);
    }

    @Override
    public List<Cliente> buscar(String nombres, int inicio, int registrosPorPagina) {
        clienteDAO = new ClienteDAO();
        return clienteDAO.buscar(nombres, inicio, registrosPorPagina);
    }

    @Override
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina) {
        clienteDAO = new ClienteDAO();
        return clienteDAO.totalRegistros(nombres, inicio, registrosPorPagina);
    }
    
    @Override
    public Cliente obtenerPorId(int id) {
        clienteDAO = new ClienteDAO();
        return clienteDAO.obtenerPorId(id);
    }

    @Override
    public int actualizar(Cliente cliente) {
        clienteDAO = new ClienteDAO();
        return clienteDAO.actualizar(cliente);
    }

    @Override
    public int eliminar(int id) {
        clienteDAO = new ClienteDAO();
        return clienteDAO.eliminar(id);
    }
}
