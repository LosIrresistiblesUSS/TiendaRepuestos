package Logica;

import DAO.TipoServicioDAO;
import Interfaces.iTipoServicioLogica;
import Modelo.TipoServicio;
import java.util.List;

public class TipoServicioLogica implements iTipoServicioLogica{
    private TipoServicioDAO tipoServicioDAO;
    
    @Override
    public int insertar(TipoServicio tipoServicio) {
        tipoServicioDAO = new TipoServicioDAO();
        return tipoServicioDAO.insertar(tipoServicio);
    }

    @Override
    public List<TipoServicio> buscar(String descipcion, int inicio, int registrosPorPagina) {
        tipoServicioDAO = new TipoServicioDAO();
        return tipoServicioDAO.buscar(descipcion, inicio, registrosPorPagina);
    }

    @Override
    public int totalRegistros(String descipcion, int inicio, int registrosPorPagina) {
        tipoServicioDAO = new TipoServicioDAO();
        return tipoServicioDAO.totalRegistros(descipcion, inicio, registrosPorPagina);
    }
    
    @Override
    public TipoServicio obtenerPorId(int id) {
        tipoServicioDAO = new TipoServicioDAO();
        return tipoServicioDAO.obtenerPorId(id);
    }

    @Override
    public int actualizar(TipoServicio tipoServicio) {
        tipoServicioDAO = new TipoServicioDAO();
        return tipoServicioDAO.actualizar(tipoServicio);
    }

    @Override
    public int eliminar(int id) {
        tipoServicioDAO = new TipoServicioDAO();
        return tipoServicioDAO.eliminar(id);
    }
}