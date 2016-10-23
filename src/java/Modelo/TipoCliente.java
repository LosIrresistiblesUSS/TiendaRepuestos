
package Modelo;


public class TipoCliente {
    
    
    protected int idTipoCliente;
    protected String  nomDescripcion;

    public TipoCliente() {
    }

    public TipoCliente(int idTipoCliente, String nomDescripcion) {
        this.idTipoCliente = idTipoCliente;
        this.nomDescripcion = nomDescripcion;
    }

    public int getIdTipoCliente() {
        return idTipoCliente;
    }

    public void setIdTipoCliente(int idTipoCliente) {
        this.idTipoCliente = idTipoCliente;
    }

    public String getNomDescripcion() {
        return nomDescripcion;
    }

    public void setNomDescripcion(String nomDescripcion) {
        this.nomDescripcion = nomDescripcion;
    }

  
   
    
    
    
}
