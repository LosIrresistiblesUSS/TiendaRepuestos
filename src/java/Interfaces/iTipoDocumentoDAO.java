package Interfaces;

import Modelo.TipoDocumento;
import java.util.List;

public interface iTipoDocumentoDAO {
    public int insertar(TipoDocumento td);
    public List<TipoDocumento> buscar(String nts, int inicio, int registrosPorPagina);
    public int totalRegistros(String nts, int inicio, int registrosPorPagina);
    public TipoDocumento obtenerPorId(int id);
    public int actualizar(TipoDocumento td);
    public int eliminar(int id);
}
