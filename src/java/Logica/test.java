package Logica;

import Funciones.ListasObjetos;
import Modelo.TipoDocumento;
import Modelo.TipoEmpleado;
import java.util.Iterator;
import java.util.List;

public class test {
        
    public static void main(String[] args) {

//        List<TipoDocumento> lstTipoDocumento = ListasObjetos.listaTipoDocumento();
//        for (TipoDocumento tipoDocumento : lstTipoDocumento){
//            System.out.println(tipoDocumento.getIdTipoDocumento()+" "+tipoDocumento.getDescripcion());
//        }
//        
//        List<TipoEmpleado> lstTipoEmpleado = ListasObjetos.listaTipoEmpleado();
//        for (TipoEmpleado tipoEmpleado : lstTipoEmpleado){
//            System.out.println(tipoEmpleado.getIdTipoEmpleado()+" "+tipoEmpleado.getDescripcion());
//        }
        
        
        String sCadena = "Hola Mundo";
        String sSubCadena = sCadena.substring(5,10);
        System.out.println(sSubCadena);
        
//---------------------------------------------------------
        
        String cadena ="EMP919";
        String cadena2 = cadena.substring(3);
        int cadenaInt = Integer.parseInt(cadena2)+1;
        String cadenaIntString = String.valueOf(cadenaInt);

        char[] arrayCadena = cadenaIntString.toCharArray();
        int totalCaracteres = arrayCadena.length;

        String codigo = null;
        switch (totalCaracteres) {
            case 1:
                codigo = "EMP00" + cadenaIntString;
                break;
            case 2:
                codigo = "EMP0" + cadenaIntString;
                break;
            case 3:
                codigo = "EMP" + cadenaIntString;
                break;
            default:
                break;
        }
        
        System.out.println(codigo);


//                int cadenaTrans = Integer.parseInt(cadena);

//                
//                
        char[] arrayChar = cadena.toCharArray();

        int total = arrayChar.length;
        
//        
    }
}