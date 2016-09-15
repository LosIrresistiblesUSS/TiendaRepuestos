package Interfaces;

import Modelo.TipoServicio;
import java.util.List;

public interface iTipoServicioLogica {
    public int insertar(TipoServicio tipoServicio);
    public List<TipoServicio> buscar(String descipcion);
    public TipoServicio obtenerPorId(int id);
    public int actualizar(TipoServicio tipoServicio);
    public int eliminar(int id);
}
