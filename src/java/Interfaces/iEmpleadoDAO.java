package Interfaces;

import Modelo.Empleado;
import java.util.List;

public interface iEmpleadoDAO{
    public int insertar(Empleado empleado);
    public List<Empleado> buscar(String nombres, int inicio, int registrosPorPagina);
    public int totalRegistros(String nombres, int inicio, int registrosPorPagina);
    public Empleado obtenerPorId(int id);
    public int actualizar(Empleado e);
    public int eliminar(int id);
}