package Interfaces;

import Modelo.TipoEmpleado;
import java.util.List;

public interface iTipoEmpleadoLogica {
    public int insertar(TipoEmpleado tipoEmpleado);
    public List<TipoEmpleado> buscar(String descipcion, int inicio, int registrosPorPagina);
    public int totalRegistros(String descipcion, int inicio, int registrosPorPagina);
    public TipoEmpleado obtenerPorId(String id);
    public int actualizar(TipoEmpleado tipoEmpleado);
    public int eliminar(String id);
}