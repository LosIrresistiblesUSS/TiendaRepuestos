package Logica;

import DAO.EmpleadoDAO;
import Interfaces.iEmpleadoLogica;
import Modelo.Empleado;
import java.util.List;

public class EmpleadoLogica implements iEmpleadoLogica{
    private EmpleadoDAO empleadoDAO;
    
    @Override
    public int insertar(Empleado empleado) {
        empleadoDAO = new EmpleadoDAO();
        return empleadoDAO.insertar(empleado);
    }

    @Override
    public List<Empleado> buscar(String nombres, int inicio, int registrosPorPagina) {
        empleadoDAO = new EmpleadoDAO();
        return empleadoDAO.buscar(nombres, inicio, registrosPorPagina);
    }

    @Override
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina) {
        empleadoDAO = new EmpleadoDAO();
        return empleadoDAO.totalRegistros(nombres, inicio, registrosPorPagina);
    }

    @Override
    public Empleado obtenerPorId(int id) {
        empleadoDAO = new EmpleadoDAO();
        return empleadoDAO.obtenerPorId(id);
    }

    @Override
    public int actualizar(Empleado empleado) {
        empleadoDAO = new EmpleadoDAO();
        return empleadoDAO.actualizar(empleado);
    }

    @Override
    public int eliminar(int id) {
         empleadoDAO = new EmpleadoDAO();
        return empleadoDAO.eliminar(id);
    }
}