package Logica;

import DAO.TipoEmpleadoDAO;
import Interfaces.iTipoEmpleadoLogica;
import Modelo.TipoEmpleado;
import java.util.List;

public class TipoEmpleadoLogica implements iTipoEmpleadoLogica{
    private TipoEmpleadoDAO tipoEmpleadoDAO;

    @Override
    public int insertar(TipoEmpleado tipoEmpleado) {
        tipoEmpleadoDAO = new TipoEmpleadoDAO();
        return tipoEmpleadoDAO.insertar(tipoEmpleado);
    }

    @Override
    public List<TipoEmpleado> buscar(String id, int inicio, int registrosPorPagina) {
        tipoEmpleadoDAO = new TipoEmpleadoDAO();
        return tipoEmpleadoDAO.buscar(id, inicio, registrosPorPagina);
    }

    @Override
    public int totalRegistros(String descipcion, int inicio, int registrosPorPagina) {
        tipoEmpleadoDAO = new TipoEmpleadoDAO();
        return tipoEmpleadoDAO.totalRegistros(descipcion, inicio, registrosPorPagina);
    }
    
    @Override
    public TipoEmpleado obtenerPorId(String id) {
        tipoEmpleadoDAO = new TipoEmpleadoDAO();
        return tipoEmpleadoDAO.obtenerPorId(id);
    }

    @Override
    public int actualizar(TipoEmpleado tipoEmpleado) {
        tipoEmpleadoDAO = new TipoEmpleadoDAO();
        return tipoEmpleadoDAO.actualizar(tipoEmpleado);
    }

    @Override
    public int eliminar(String id) {
        tipoEmpleadoDAO = new TipoEmpleadoDAO();
        return tipoEmpleadoDAO.eliminar(id);
    }
}