package Interfaces;

import Modelo.TipoEmpleado;
import java.util.List;

public interface iTipoEmpleadoDAO {
    public int insertar(TipoEmpleado te);
    public List<TipoEmpleado> buscar(String nts, int inicio, int registrosPorPagina);
    public int totalRegistros(String nts, int inicio, int registrosPorPagina);
    public TipoEmpleado obtenerPorId(String id);
    public int actualizar(TipoEmpleado te);
    public int eliminar(String id);
}