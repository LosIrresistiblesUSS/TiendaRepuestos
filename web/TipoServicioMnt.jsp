<%-- 
    Document   : TipoServicioMnt
    Created on : 24-sep-2016, 14:45:55
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.TipoServicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    TipoServicio tipoServicio = (TipoServicio) session.getAttribute("tipoServicioActualizar");
    tipoServicio = tipoServicio == null ? new TipoServicio() : tipoServicio;
    String descripcion = tipoServicio.getDescripcion() == null ? "" : tipoServicio.getDescripcion();
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Tipo de Servicio</title>
        <script type="text/javascript">
            function insertar(){
                var descripcion = document.getElementById("txtDescripcion").value;
                
                if(descripcion === ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoServicioControlador?accion=insertar&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
                var descripcion = document.getElementById("txtDescripcion").value;
                if(descripcion === ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoServicioControlador?accion=actualizar&descripcion=" + descripcion + "&id=" + id;
                    document.frmMnt.submit();
                }
            }
            
            function cancelar(){
                document.location = "TipoServicioControlador?accion=buscar";
            }
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Tipo de Servicio</strong></h2>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("tipoServicioActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Tipo de Servicio</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDescripcion">Tipo de Servicio:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDescripcion" value="<%=descripcion%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("tipoServicioActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=tipoServicio.getIdTipoServicio()%>)" id="btnActualizar" />
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