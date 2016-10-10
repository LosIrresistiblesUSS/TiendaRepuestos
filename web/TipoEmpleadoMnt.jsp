<%-- 
    Document   : TipoEmpleadoMnt
    Created on : 09-oct-2016, 15:57:14
    Author     : AUGUSTO
--%>

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
        <title>Mantenimiento de Tipos de Empleado</title>
        <script type="text/javascript">
            function insertar(){
                var idTe = document.getElementById("txtid").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                
                if(descripcion == ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoEmpleadoControlador?accion=insertar&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
                 if(idTe == ""){
                    alert("Campo Id es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoEmpleadoControlador?accion=insertar&idTe=" + idTe;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(){
                var idTe = document.getElementById("txtid").value;
                var descripcion = document.getElementById("txtDescripcion").value;
                if(descripcion == ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoEmpleadoControlador?accion=actualizar&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
                if(idTe == ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoEmpleadoControlador?accion=actualizar&idTe=" + idTe;
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
                    <h2><strong>Tipos de Empleado</strong></h2><h4>Mantenimiento</h4>
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
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDescripcion">Tipo de Empleado:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDescripcion" value="<%=idTe%>" autofocus="autofocus" />
                                        <input class="form-control" type="text" id="txtDescripcion" value="<%=descripcion%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("tipoServicioActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=tipoEmpleado.getIdTipoEmpleado()%>)" id="btnActualizar" />
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