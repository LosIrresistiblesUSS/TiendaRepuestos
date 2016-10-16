package Interfaces;

import Modelo.Repuesto;


import java.util.List;

public interface iRepuestoDAO {
    public int insertar(Repuesto repuesto);
    
    public List<Repuesto> buscar(String descripcion , int inicio, int registrosPorPagina);
    public int totalRegistros( String descripcion,  int inicio, int registrosPorPagina);
    public Repuesto obtenerPorId(int id);
    public int actualizar(Repuesto repuesto);
    public int eliminar(int id);
}