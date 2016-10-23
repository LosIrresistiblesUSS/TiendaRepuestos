<%-- 
    Document   : TipoDocumentoMnt
    Created on : 10-oct-2016, 10:34:44
    Author     : milagros
--%>

<%@page import="Modelo.TipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>
<!DOCTYPE html>
<html lang="es">
    <%
    TipoDocumento tipoDocumento = (TipoDocumento) session.getAttribute("tipoDocumentoActualizar");
    tipoDocumento = tipoDocumento == null ? new TipoDocumento() : tipoDocumento;
    String descripcion = tipoDocumento.getDescripcion() == null ? "" : tipoDocumento.getDescripcion();
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Mantenimiento de Tipos de Documentos</title>
        <script type="text/javascript">
            function insertar(){
                var descripcion = document.getElementById("txtDescripcion").value;
                
                if(descripcion == ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoDocumentoControlador?accion=insertar&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
                var descripcion = document.getElementById("txtDescripcion").value;
                if(descripcion == ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoDocumentoControlador?accion=actualizar&descripcion=" + descripcion + "&id=" + id;
                    document.frmMnt.submit();
                }
            }
            
            function cancelar(){
                document.location = "TipoDocumentoControlador?accion=buscar";
            }
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Tipos de Documentos</strong></h2><h4>Mantenimiento</h4>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("tipoDocumentoActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Tipo de Documento</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDescripcion">Tipo de Documento:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDescripcion" value="<%=descripcion%>" maxlength="15" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("tipoDocumentoActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=tipoDocumento.getIdTipoDocumento()%>)" id="btnActualizar" />
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
