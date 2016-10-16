package Logica;

import DAO.RepuestoDAO;
import Interfaces.iRepuestoLogica;
import Modelo.Repuesto;
import java.util.List;

public class RepuestoLogica implements iRepuestoLogica {
    private RepuestoDAO repuestoDAO;
    
    @Override
    public int insertar(Repuesto repuesto) {
        repuestoDAO = new RepuestoDAO();
        return repuestoDAO.insertar(repuesto);
    }

    @Override
    public List<Repuesto> buscar(String descripcion, int inicio, int registrosPorPagina) {
        repuestoDAO = new RepuestoDAO();
        return  repuestoDAO.buscar(descripcion, inicio, registrosPorPagina);
    }
   
    @Override
    public int totalRegistros(String descripcion,  int inicio, int registrosPorPagina) {
     repuestoDAO = new RepuestoDAO();
     
     return repuestoDAO.totalRegistros(descripcion, inicio, registrosPorPagina);
     
     
     
    }

    @Override
    public Repuesto obtenerPorId(int id) {
        repuestoDAO = new RepuestoDAO();
        return repuestoDAO.obtenerPorId(id);
    }

    @Override
    public int actualizar(Repuesto repuesto) {
        repuestoDAO = new RepuestoDAO();
        return repuestoDAO.actualizar(repuesto);
    }

    @Override
    public int eliminar(int id) {
        repuestoDAO = new RepuestoDAO();
        return repuestoDAO.eliminar(id);
    }


    

   
}
