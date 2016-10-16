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
public class Producto {
    protected int idproducto;
    protected String descripcion;
    protected int stock;
    protected double precio;
    protected double preciopormayor;

    public Producto() {
    }

    public Producto(int idproducto, String descripcion, int stock, double precio, double preciopormayor) {
        this.idproducto = idproducto;
        this.descripcion = descripcion;
        this.stock = stock;
        this.precio = precio;
        this.preciopormayor = preciopormayor;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getpreciopormayor() {
        return preciopormayor;
    }

    public void setPreciomayor(double preciopormayor) {
        this.preciopormayor = preciopormayor;
    }

    
         
    
    
}
