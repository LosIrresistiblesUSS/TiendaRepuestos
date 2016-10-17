package Interfaces;

import Modelo.TipoDocumento;
import java.util.List;

public interface iTipoDocumentoLogica {
    public int insertar(TipoDocumento tipoDocumento);
    public List<TipoDocumento> buscar(String descipcion, int inicio, int registrosPorPagina);
    public int totalRegistros(String descipcion, int inicio, int registrosPorPagina);
    public TipoDocumento obtenerPorId(int id);
    public int actualizar(TipoDocumento tipoDocumento);
    public int eliminar(int id);
}
