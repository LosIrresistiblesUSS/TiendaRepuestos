/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Leonardo Euler
 */
public class Repuesto extends Producto {
    private int idrepuesto;

    public Repuesto() {
    }
    
    public Repuesto(int idrepuesto, int idproducto, String descripcion, int stock, double precio, double preciopormayor) {
        super(idproducto, descripcion, stock, precio, preciopormayor);
        this.idrepuesto = idrepuesto;
    }
    
    public int getIdrepuesto() {
        return idrepuesto;
    }

    public void setIdrepuesto(int idrepuesto) {
        this.idrepuesto = idrepuesto;
    }

    @Override
    public int getIdproducto() {
        return idproducto;
    }

    @Override
    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    @Override
    public String getDescripcion() {
        return descripcion;
    }

    @Override
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int getStock() {
        return stock;
    }

    @Override
    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public double getPrecio() {
        return precio;
    }

    @Override
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getPreciopormayor() {
        return preciopormayor;
    }

    public void setPreciopormayor(double preciopormayor) {
        this.preciopormayor = preciopormayor;
    }
}
