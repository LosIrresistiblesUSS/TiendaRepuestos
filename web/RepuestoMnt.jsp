<%-- 
    Document   : TipoServicioMnt
    Created on : 24-sep-2016, 14:45:55
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.Repuesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    Repuesto repuesto = (Repuesto) session.getAttribute("repuestoActualizar");
    repuesto = repuesto == null ? new Repuesto() : repuesto;
    
    String descripcion;
    int idproducto,stock;
    double precio,preciopormayor;
    
    if (repuesto != null) {
        idproducto = repuesto.getIdproducto();
        
        descripcion = repuesto.getDescripcion();
        stock = repuesto.getStock();
        precio = repuesto.getPrecio();
        preciopormayor = repuesto.getPreciopormayor();
        
    }else{
        idproducto = 0;
        descripcion = " ";
        stock = 0;
        precio = 0;
        preciopormayor = 0;
        
    }

 
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Mantenimiento de Repuestos</title>
        <script type="text/javascript">
            function insertar(){
                
                var idproducto = document.getElementById("txtidproducto").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                var stock = document.getElementById("txtStock").value;
                var precio = document.getElementById("txtPrecio").value;
                var precioxmayor = document.getElementById("txtPreciopormayor").value;
                
                if(idproducto == "" || descripcion == "" || stock == "" || precio == "" || precioxmayor == ""){
                    alert("Todos los campos son obligatorio.");
                }else{
                    document.frmMnt.action = "RepuestoControlador?accion=insertar&idproducto=" + idproducto + "&descripcion=" + descripcion + "&stock=" + stock   + "&precio=" + precio  + "&precioxmayor=" + precioxmayor   ;
                    
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
                var idproducto = document.getElementById("txtidproducto").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                var stock = document.getElementById("txtStock").value;
                var precio = document.getElementById("txtPrecio").value;
                var precioxmayor = document.getElementById("txtPreciopormayor").value;
                if(idproducto == "" || descripcion == "" || stock == "" || precio == "" || precioxmayor == ""){
                    
                    alert("Todos los campos son obligatorio.");
                }else{
                    document.frmMnt.action = "RepuestoControlador?accion=actualizar&idproducto=" + idproducto + "&descripcion=" + descripcion + "&stock=" + stock   + "&precio=" + precio  + "&precioxmayor=" + precioxmayor   ;
                    document.frmMnt.submit();
                }
            }
            
            function cancelar(){
                document.location = "RepuestoControlador?accion=buscar";
            }
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Repuestos</strong></h2>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("repuestoActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Repuesto</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                            <div class="form-group">
                                    <label class="control-label col-md-3" for="txtidproducto">Id Producto</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtidproducto" value="<%=idproducto%>" autofocus="autofocus"/>
                                        

                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDescripcion">Descripcion:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDescripcion" value="<%=descripcion%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                    <div class="form-group">
                                    <label class="control-label col-md-3" for="txtStock">Stock</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtStock" value="<%=stock%>" autofocus="autofocus" />
                                    </div>
                                </div>
                               
                                    <div class="form-group">
                                    <label class="control-label col-md-3" for="txtPrecio">Precio:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtPrecio" value="<%=precio%>" autofocus="autofocus" />
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="control-label col-md-3" for="txtPreciopormayor">Precio por Mayor:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtPreciopormayor" value="<%=preciopormayor%>" autofocus="autofocus" />
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("productoActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=repuesto.getIdrepuesto()%>)" id="btnActualizar" />
                                        <% } %>
                                        <input class="btn btn-primary" type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                                    </div>
                                </div>
                        </form>
                    </div>
                    <div class="panel-heading panel-heading-2"></div>
                </div>
            </section>
        </main>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>