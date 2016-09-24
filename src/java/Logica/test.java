package Logica;

import Interfaces.iTipoServicioLogica;
import Modelo.TipoServicio;
import java.util.ArrayList;
import java.util.List;

public class test {
        
    public static void main(String[] args) {
        iTipoServicioLogica logica = new TipoServicioLogica();
        TipoServicio servicio = new TipoServicio();
//        List<TipoServicio> lstTipoServicio = null;
        
//        lstTipoServicio = logica.buscar("Mante");
//        
//        for (int i = 0; i < lstTipoServicio.size(); i++) {
//            System.out.println(lstTipoServicio.get(i).getIdTipoServicio());
//            System.out.println(lstTipoServicio.get(i).getDecripcion());
//        }

        servicio.setDecripcion("Otero.. nose baña");

        logica.insertar(servicio);
        
//        logica.eliminar(10);   
    }
}