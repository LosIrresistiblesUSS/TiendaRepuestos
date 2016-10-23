package Helpers;

public class Constantes {
    
    final int NRO_REGISTROS_POR_PAGINA[];

    public Constantes() {
        this.NRO_REGISTROS_POR_PAGINA = new int[]{5, 10, 15, 20, 25,30};
    }

    public int[] getNRO_REGISTROS_POR_PAGINA() {
        return NRO_REGISTROS_POR_PAGINA;
    }
}