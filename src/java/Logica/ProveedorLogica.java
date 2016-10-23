package Logica;

import DAO.ProveedorDAO;
import Interfaces.iProveedorLogica;
import Modelo.Proveedor;
import java.util.List;


public class ProveedorLogica  implements iProveedorLogica{
    private ProveedorDAO proveedorDAO;
    
    @Override
    public int insertar(Proveedor proveedor) {
        proveedorDAO= new ProveedorDAO();
        return proveedorDAO.insertar(proveedor);
    }

    @Override
    public List<Proveedor> buscar(String razoncomercial, int inicio, int registrosPorPagina) {
        proveedorDAO=new ProveedorDAO();
        return proveedorDAO.buscar(razoncomercial, inicio, registrosPorPagina);
    }

    @Override
    public int totalRegistros(String razoncomercial, int inicio, int registrosPorPagina) {
        proveedorDAO= new ProveedorDAO();
        return proveedorDAO.totalRegistros(razoncomercial, inicio, registrosPorPagina);

    }

    @Override
    public Proveedor obtenerPorId(int id) {
        proveedorDAO=new ProveedorDAO();
        return proveedorDAO.obtenerPorId(id);
    }

    @Override
    public int actualizar(Proveedor proveedor) {
        proveedorDAO=new ProveedorDAO();
        return proveedorDAO.actualizar(proveedor);
    }

    @Override
    public int eliminar(int id) {
        proveedorDAO=new ProveedorDAO();
        return proveedorDAO.eliminar(id);
    }  
}