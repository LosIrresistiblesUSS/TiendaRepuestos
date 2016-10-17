<%-- 
    Document   : Empleado
    Created on : 10-oct-2016, 16:40:50
    Author     : Los Irresistibles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

﻿<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Operacion Venta Repuesto</title>
        <script type="text/javascript">
            function insertar(){
                var nombres = document.getElementById("txtNombresCl").value;
                var nombres = document.getElementById("txtNombresEmp").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                var cantidad = document.getElementById("txtCantidad").value;
                var precio = document.getElementById("txtprecio").value;
                var subtotal = document.getElementById("txtSubTotal").value; 
                if(nombres === "" || nombres === "" || descripcion === "" || cantidad=== "" || precio === "" || subtotal === ""){
                    alert("Todos los campos son obligatorios.");
                }else{
                    document.frmMnt.action = "OperacionVentaRepuestoControlador?accion=insertar&nombres=" + nombres + "&nombres2=" + nombres + "&descripcion=" + descripcion + "&cantidad=" + cantidad + "&precio=" + precio + "&subtotal=" + subtotal;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
                var nombres = document.getElementById("txtNombresCl").value;
                var nombres = document.getElementById("txtNombresEmp").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                var cantidad = document.getElementById("txtCantidad").value;
                var precio = document.getElementById("txtprecio").value;
                var subtotal = document.getElementById("txtSubTotal").value; 
                if(nombres === "" || nombres === "" || descripcion === "" || cantidad=== "" || precio === "" || subtotal === ""){
                    alert("Todos los campos son obligatorios.");
                }else{
                    document.frmMnt.action = "OperacionVentaRepuestoControlador?accion=insertar&nombres=" + nombres + "&nombres2=" + nombres + "&descripcion=" + descripcion + "&cantidad=" + cantidad + "&precio=" + precio + "&subtotal=" + subtotal;
                    document.frmMnt.submit(); 
                }
            }
            
            function cancelar(){
                document.location = "DetalleVentaControlador?accion=buscar";
            }
        </script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Venta Repuesto</strong></h2>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("operacionVentaRepuestoActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Operacion Venta Repuesto</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtNombresCl">NombresCliente:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtNombres" value="<% %>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtNombresEmp">NombresEmpleado:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtNombres" value="<% %>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDescrpcion">Descripcion:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDescrpcion" value="<% %>"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtCantidad">Cantidad:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtCantidad" maxlength="10" value="<% %>"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtPrecio">Precio:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtPrecio" value="<% %>"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtSubTotal">SubTotal:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtSubTotal" value="<% %>"/>
                                    </div>
                                </div>
                                    
                    <div class="mensajes">
                        <% if(session.getAttribute("msgListado") != null){ %>
                            
                            ${msgListado}
                        <% } %>

                        <% if(session.getAttribute("msgPostOperacion") != null){ %>
                        ${msgPostOperacion}
                        <% } %>
                    </div>
                    <div class="table"> <!-- Activar para tabla responsiva -->
                        <table border="1" class="table table-hover tabla-resultados">
                            <thead align="center">
                                <td><b>#</b></td>
                                <td><b>Nombres Cliente</b></td>
                                <td><b>Nombre Empleado</b></td>
                                <td><b>Producto</b></td>
                                <td><b>Precio</b></td>
                                <td><b>Sub Total</b></td>
                                <td><b>Acciones</b></td>
                            </thead>
                            
                            <tbody>
                                <td><center><%=(((int)session.getAttribute("pagina")*(int)session.getAttribute("registrosPorPagina"))-(int)session.getAttribute("registrosPorPagina"))+1 %></center></td>
                                <td><% %></td>
                                <td><% %></td>
                                <td><% %></td>
                                <td><% %></td>
                                <td><% %></td>
                                <td>
                                    <center>
                                    <table>
                                        <tr>
                                            <td class="td-acciones-editar">
                                                <button class="btn btn-warning" onclick="obtenerPorId(<% %>)">
                                                    <span class="glyphicon glyphicon-pencil"></span>
                                                </button>
                                            </td>
                                            <td class="td-acciones-eliminar">
                                                <a class="text-danger" href="#modalEliminar<% %>" data-toggle="modal">
                                                    <button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                    </center>
                                </td>
                                
                                <!-- Modal - INICIO -->
                                <div class="modal fade text-center" id="modalEliminar<% %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="myModalLabel">Eliminar Venta Repuesto</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Está seguro de eliminar la Venta de Repuesto:</p>
                                                <p><strong><% %></strong>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                                <button onclick="eliminar(<% %>)" type="button" class="btn btn-danger">Eliminar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("empleadoActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<% %>)" id="btnActualizar" />
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
