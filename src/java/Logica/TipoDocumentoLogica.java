
package Logica;

import DAO.TipoDocumentoDAO;
import Interfaces.iTipoDocumentoLogica;
import Modelo.TipoDocumento;
import java.util.List;

public class TipoDocumentoLogica implements iTipoDocumentoLogica{
    private TipoDocumentoDAO tipoDocumentoDAO;
    
    @Override
    public int insertar(TipoDocumento tipoDocumento) {
     tipoDocumentoDAO= new TipoDocumentoDAO();
     return tipoDocumentoDAO.insertar(tipoDocumento);

    }

    @Override
    public List<TipoDocumento> buscar(String descipcion, int inicio, int registrosPorPagina) {
        tipoDocumentoDAO=new TipoDocumentoDAO();
        return tipoDocumentoDAO.buscar(descipcion, inicio, registrosPorPagina);
        

    }

    @Override
    public int totalRegistros(String descipcion, int inicio, int registrosPorPagina) {
       tipoDocumentoDAO= new TipoDocumentoDAO();
       return tipoDocumentoDAO.totalRegistros(descipcion, inicio, registrosPorPagina);
    }

    @Override
    public TipoDocumento obtenerPorId(int id) {
        tipoDocumentoDAO=new TipoDocumentoDAO();
        return tipoDocumentoDAO.obtenerPorId(id);

    }

    @Override
    public int actualizar(TipoDocumento tipoDocumento) {
    tipoDocumentoDAO=new TipoDocumentoDAO();
    return tipoDocumentoDAO.actualizar(tipoDocumento);
    }

    @Override
    public int eliminar(int id) {
    tipoDocumentoDAO=new TipoDocumentoDAO();  
    return tipoDocumentoDAO.eliminar(id);
    }
    
}
