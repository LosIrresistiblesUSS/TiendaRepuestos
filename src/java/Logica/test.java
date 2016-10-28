package Logica;

import Helpers.ListasObjetos;

public class test {

    public static void main(String[] args) {

//        String number = "B-999-999998";
//        String numeroGeneral = null;
//        String numero = null;
//        String codigo = null;
//        
//        String num = number.substring(6);
//        String cod = number.substring(2, 5);
//        
//        int numEntero = Integer.parseInt(num);
//        int codEntero = Integer.parseInt(cod);
//        
//        if(numEntero != 999999){
//            numEntero = numEntero + 1;
//            String numEnteroString = String.valueOf(numEntero);
//            char[] arrayNumEntero = numEnteroString.toCharArray();
//            int totalCaracteresNumEntero = arrayNumEntero.length;
//            
//            switch (totalCaracteresNumEntero) {
//                case 1:
//                    numero = "00000" + numEnteroString;
//                    break;
//                case 2:
//                    numero = "0000" + numEnteroString;
//                    break;
//                case 3:
//                    numero = "000" + numEnteroString;
//                    break;
//                case 4:
//                    numero = "00" + numEnteroString;
//                    break;
//                case 5:
//                    numero = "0" + numEnteroString;
//                    break;
//                case 6:
//                    numero = numEnteroString;
//                    break;
//                default:
//                    break;
//            }
//            codigo = cod;
//            numeroGeneral = "B-"+codigo+"-"+numero;
//        } else {
//            if (codEntero != 999) {
//                codEntero = codEntero + 1;
//                String codEnteroString = String.valueOf(codEntero);
//                char[] arrayCodEntero = codEnteroString.toCharArray();
//                int totalCaracteresCodEntero = arrayCodEntero.length;
//                
//                switch (totalCaracteresCodEntero) {
//                    case 1:
//                        codigo = "00" + codEnteroString;
//                        break;
//                    case 2:
//                        codigo = "0" + codEnteroString;
//                        break;
//                    case 3:
//                        codigo = codEnteroString;
//                        break;
//                    default:
//                        break;
//                }
//                numero = "000001";
//                numeroGeneral = "B-"+codigo+"-"+numero;
//            } else {
//                numeroGeneral = "Ya no existen codigos disponibles";
//            }
//        }
//        
//        System.out.println(numeroGeneral);
//        System.out.println(ListasObjetos.ultimoNumeroBoleta());
//        System.out.println(ListasObjetos.ultimoNumeroFactura());


        System.out.println(ListasObjetos.ultimoIdComprobanteVenta());

    }
}
