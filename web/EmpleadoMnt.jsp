<%-- 
    Document   : EmpleadoMnt
    Created on : 15/10/2016, 01:48:43 PM
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.TipoEmpleado"%>
<%@page import="Helpers.ListasObjetos"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.TipoDocumento"%>
<%@page import="Modelo.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    Empleado empleado = (Empleado) session.getAttribute("empleadoActualizar");
    empleado = empleado == null ? new Empleado() : empleado;
    
    int idEmpleado = (String.valueOf(empleado.getIdEmpleado()) == null) ? 0 : empleado.getIdEmpleado();
    String nroDocumento = empleado.getNumeroDocumento() == null ? "" : empleado.getNumeroDocumento();
    String nombres = empleado.getNombres() == null ? "" : empleado.getNombres();
    String apellidos = empleado.getApellidos() == null ? "" : empleado.getApellidos();
    String direccion = empleado.getDireccion() == null ? "" : empleado.getDireccion();
    String telefono = empleado.getTelefono() == null ? "" : empleado.getTelefono();
    String email = empleado.getEmail() == null ? "" : empleado.getEmail();
    int idTipoDocumento = (String.valueOf(empleado.getTipoDocumento().getIdTipoDocumento()) == null) ? 0 : empleado.getTipoDocumento().getIdTipoDocumento();
    String idTipoEmpleado = empleado.getTipoEmpleado().getIdTipoEmpleado() == null ? "" : empleado.getTipoEmpleado().getIdTipoEmpleado();
    
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Empleado</title>
        <script type="text/javascript">
            function insertar(){
                var nombres = document.getElementById("txtNombres").value;
                var apellidos = document.getElementById("txtApellidos").value;
                var direccion = document.getElementById("txtDireccion").value;
                var telefono = document.getElementById("txtTelefono").value;
                var email = document.getElementById("txtEmail").value;
                var idTipoDocumento = document.getElementById("idTipoDocumento").value;
                var nroDocumento = document.getElementById("txtNroDocumento").value;
                var idTipoEmpleado = document.getElementById("idTipoEmpleado").value;
                
                if(nombres === "" || apellidos === "" || direccion === "" || telefono === "" || email=== "" || nroDocumento === ""){
                    alert("Todos los campos son obligatorios.");
                }else{
                    document.frmMnt.action = "EmpleadoControlador?accion=insertar&nombres=" + nombres + "&apellidos=" + apellidos + "&direccion=" + direccion + "&telefono=" + telefono + "&email=" + email + "&idTipoDocumento=" + idTipoDocumento + "&nroDocumento=" + nroDocumento + "&idTipoEmpleado=" + idTipoEmpleado;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
                var nombres = document.getElementById("txtNombres").value;
                var apellidos = document.getElementById("txtApellidos").value;
                var direccion = document.getElementById("txtDireccion").value;
                var telefono = document.getElementById("txtTelefono").value;
                var email = document.getElementById("txtEmail").value;
                var idTipoDocumento = document.getElementById("idTipoDocumento").value;
                var nroDocumento = document.getElementById("txtNroDocumento").value;
                var idTipoEmpleado = document.getElementById("idTipoEmpleado").value;
                
                if(nombres === "" || direccion === "" || telefono === "" || email=== "" || nroDocumento === ""){
                    alert("Todos los campos son obligatorios.");
                }else{
                    document.frmMnt.action = "EmpleadoControlador?accion=actualizar&id=" + id + "&nombres=" + nombres + "&apellidos=" + apellidos + "&direccion=" + direccion + "&telefono=" + telefono + "&email=" + email + "&idTipoDocumento=" + idTipoDocumento + "&nroDocumento=" + nroDocumento + "&idTipoEmpleado=" + idTipoEmpleado;
                    document.frmMnt.submit();
                }
            }
            
            function cancelar(){
                document.location = "EmpleadoControlador?accion=buscar";
            }
        </script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Empleado</strong></h2>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("empleadoActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Empleado</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtNombres">Nombres:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtNombres" value="<%=nombres%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtNombres">Apellidos</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtApellidos" value="<%=apellidos%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDireccion">Dirección:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDireccion" value="<%=direccion%>"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtTelefono">Telefono:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtTelefono" maxlength="10" value="<%=telefono%>"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtEmail">Email:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="email" id="txtEmail" value="<%=email%>"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="idTipoDocumento">Tipo de Documento:</label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="idTipoDocumento">
                                            <% List<TipoDocumento> lstTipoDocumento = ListasObjetos.listaTipoDocumento(); %>
                                            <% for(TipoDocumento tipoDocumento : lstTipoDocumento){ %>
                                                <% if (idTipoDocumento == tipoDocumento.getIdTipoDocumento()){%>
                                                    <option value="<%=tipoDocumento.getIdTipoDocumento()%>" selected><%=tipoDocumento.getDescripcion()%></option>
                                                <% }else{ %>
                                                    <option value="<%=tipoDocumento.getIdTipoDocumento()%>"><%=tipoDocumento.getDescripcion()%></option>
                                                <% } %>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtNroDocumento">Nro. de Documento:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtNroDocumento" maxlength="13" value="<%=nroDocumento%>"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="idTipoEmpleado">Tipo de Empleado:</label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="idTipoEmpleado">
                                            <% List<TipoEmpleado> lstTipoEmpleado = ListasObjetos.listaTipoEmpleado(); %>
                                            <% for(TipoEmpleado tipoEmpleado : lstTipoEmpleado){ %>
                                            <% if(idTipoEmpleado.equals(tipoEmpleado.getIdTipoEmpleado())){ %>
                                                    <option value="<%=tipoEmpleado.getIdTipoEmpleado() %>" selected><%=tipoEmpleado.getDescripcion()%></option>
                                                <% }else{ %>
                                                    <option value="<%=tipoEmpleado.getIdTipoEmpleado() %>"><%=tipoEmpleado.getDescripcion()%></option>
                                                <% } %>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("empleadoActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=idEmpleado%>)" id="btnActualizar" />
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