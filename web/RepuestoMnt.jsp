<%-- 
    Document   : RepuestoMnt
    Created on : 17/10/2016, 02:12:43 PM
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
    int idRepuesto = (String.valueOf(repuesto.getIdrepuesto()) == null) ? 0 : repuesto.getIdrepuesto();
    String descripcion = repuesto.getDescripcion() == null ? "" : repuesto.getDescripcion() ;
    int stock  = (String.valueOf(repuesto.getStock()) == null) ? 0 : repuesto.getStock();
    double precio  = (String.valueOf(repuesto.getPrecio()) == null) ? 0 : repuesto.getPrecio();
    double PrecioPorMayor  = (String.valueOf(repuesto.getPreciopormayor()) == null) ? 0 : repuesto.getPreciopormayor();
    %>
    
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Mantenimiento de Repuestos</title>
        <script type="text/javascript">
            function insertar(){
                var descripcion = document.getElementById("txtDescripcion").value;
                var stock = document.getElementById("txtStock").value;
                var precio = document.getElementById("txtPrecio").value;
                var PrecioPorMayor = document.getElementById("txtPrecioPorMayor").value;
                
                if(descripcion == "" || stock == "" || precio == "" || PrecioPorMayor == ""){
                    alert("Todos los campos son obligatorio.");
                }else{
                    document.frmMnt.action = "RepuestoControlador?accion=insertar&descripcion=" + descripcion  + "&stock=" + stock   + "&precio=" + precio  + "&precioPorMayor=" + PrecioPorMayor  ;
                    
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
               
                var descripcion = document.getElementById("txtDescripcion").value;
                var stock = document.getElementById("txtStock").value;
                var precio = document.getElementById("txtPrecio").value;
                var PrecioPorMayor = document.getElementById("txtPreciopormayor").value;
                if(descripcion == "" || stock == "" || precio == "" || PrecioPorMayor == ""){
                    
                    alert("Todos los campos son obligatorio.");
                }else{
                    document.frmMnt.action = "RepuestoControlador?accion=actualizar&id=" + id + "&descripcion=" + descripcion + "&stock=" + stock   + "&precio=" + precio  + "&precioPorMayor=" + PrecioPorMayor;
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
                                    <label class="control-label col-md-3" for="txtPrecioPorMayor">Precio por Mayor:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtPrecioPorMayor" value="<%=PrecioPorMayor%>" autofocus="autofocus" />
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("productoActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        
                                        
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=idRepuesto%>)" id="btnActualizar" />
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