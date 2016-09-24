package Interfaces;

import Modelo.TipoServicio;
import java.util.List;

public interface iTipoServicioDAO {
    public byte insertar(TipoServicio ts);
    public List<TipoServicio> buscar(String nts);
    public TipoServicio obtenerPorId(int id);
    public byte actualizar(TipoServicio ts);
    public byte eliminar(int id);
}