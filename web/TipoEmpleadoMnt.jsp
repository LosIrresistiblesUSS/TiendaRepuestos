<%-- 
    Document   : TipoEmpleadoMnt
    Created on : 09-oct-2016, 15:57:14
    Author     : AUGUSTO
--%>

<%@page import="Helpers.ListasObjetos"%>
<%@page import="Modelo.TipoEmpleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>
<!DOCTYPE html>
<html lang="es">
    <%
    TipoEmpleado tipoEmpleado = (TipoEmpleado) session.getAttribute("tipoEmpleadoActualizar");
    tipoEmpleado = tipoEmpleado == null ? new TipoEmpleado() : tipoEmpleado;
    String idTe = tipoEmpleado.getIdTipoEmpleado() == null ? "" : tipoEmpleado.getIdTipoEmpleado();
    String descripcion = tipoEmpleado.getDescripcion() == null ? "" : tipoEmpleado.getDescripcion();
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Tipo de Empleado</title>
        <script type="text/javascript">
            function insertar(){
                var idTe = document.getElementById("txtId").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                
                if(idTe === "" || descripcion === ""){
                    alert("Campo Id y Descripcion son obligatorios.");
                }else{
                    document.frmMnt.action = "TipoEmpleadoControlador?accion=insertar&id=" + idTe + "&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(){
                var idTe = document.getElementById("txtId").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                if(idTe === "" || descripcion === ""){
                    alert("Campo Id y Descripcion son obligatorios.");
                }else{
                    document.frmMnt.action = "TipoEmpleadoControlador?accion=actualizar&idTe=" + idTe + "&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
            }
            function cancelar(){
                document.location = "TipoEmpleadoControlador?accion=buscar";
            }
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Tipo de Empleado</strong></h2>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("tipoEmpleadoActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Tipo de Empleado</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" id="frmMnt" action="TipoEmpleadoControlador" method="post" class="form-horizontal col-md-offset-3 form-principal">
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDescripcion">Id Tipo de Empleado:</label>
                                    <div class="col-md-4">
                                        <% if(session.getAttribute("tipoEmpleadoActualizar") == null){ %>
                                        <input class="form-control" type="text" id="txtId" name="id" value="<%=ListasObjetos.ultimoCodigoEmpleado()%>" maxlength='6' autofocus="autofocus" placeholder="" />
                                        <% }else{ %>
                                        <input class="form-control" type="text" id="txtId" name="id" value="<%=idTe%>" maxlength='6' placeholder="" disabled />
                                        <% } %>
                                    </div>
                                </div>
                                    
                                    
                                <input type="hidden" value="insertar" name="accion" />
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDescripcion">Tipo de Empleado:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDescripcion" name="descripcion" value="<%=descripcion%>" maxlength='25' autofocus />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("tipoEmpleadoActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar()" id="btnActualizar" />
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