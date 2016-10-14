<%-- 
    Document   : EmpleadoMnt
    Created on : 13-oct-2016, 15:46:42
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    Empleado empleado = (Empleado) session.getAttribute("empleadoActualizar");
    empleado = empleado == null ? new Empleado() : empleado;
    int idTipoDocumento;
    String descripcion;
    int idPersona;
    String idTipoEmpleado;
    String numeroDocumento;
    String nombres;
    String direccion;
    String telefono;
    String email;
    
    if(empleado != null){
        idTipoDocumento = empleado.getTipoDocumento().getIdTipoDocumento();
        descripcion = empleado.getTipoDocumento().getDescripcion();
        idPersona = empleado.getIdPersona();
        idTipoEmpleado = empleado.getTipoEmpleado().getIdTipoEmpleado();
        numeroDocumento = empleado.getNumeroDocumento();
        nombres = empleado.getNombres();
        direccion = empleado.getDireccion();
        telefono = empleado.getTelefono();
        email = empleado.getEmail();
    }else{
        idTipoDocumento=0;
        descripcion="";
        idPersona=0;
        idTipoEmpleado="";
        numeroDocumento="";
        nombres="";
        direccion="";
        telefono="";
        email="";
      }
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Mantenimiento de Empleado</title>
        <script type="text/javascript">
            function insertar(){
                var idTipoDocumento = document.getElementById("txtidTipoDocumento").value;
                var descripcion = documento.getElementById("txtdescripcion").value;
                var idPersona = documento.getElementById("txtidPersona").value;
                var idTipoEmpleado = documento.getElementById("txtidTipoEmpleado").value;
                var numeroDocumento = documento.getElementById("txtnumeroDocumento").value;
                var nombres = document.getElementById("txtNombres").value;
                var direccion = documento.getElementById("txtdireccion").value;
                var telefono = documento.getElementById("txttelefono").value;
                var email = documento.getElementById("txtemail").value;
                
                if(idTipoDocumento == "" || descripcion == "" || idPersona == "" || idTipoEmpleado == "" || numeroDocumento == "" || nombres == "" || direccion == "" || telefono == "" || email == ""){
                    alert("Todos los Campos son obligatorio.");
               }else{
                    document.frmMnt.action = "EmpleadoControlador?accion=insertar&idTipoDocumento=" + idTipoDocumento + "&descripcion=" + descripcion + "&idPersona" + idPersona + "&idTipoEmpleado" + idTipoEmpleado + "&numeroDocumento"+ numeroDocumento +"&nombres" + nombres + "&direccion" + direccion + "&telefono" + telefono + "&email" + email;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(){
                var idTipoDocumento = document.getElementById("txtidTipoDocumento").value;
                var descripcion = documento.getElementById("txtdescripcion").value;
                var idPersona = documento.getElementById("txtidPersona").value;
                var idTipoEmpleado = documento.getElementById("txtidTipoEmpleado").value;
                var numeroDocumento = documento.getElementById("txtnumeroDocumento").value;
                var nombres = document.getElementById("txtNombres").value;
                var direccion = documento.getElementById("txtdireccion").value;
                var telefono = documento.getElementById("txttelefono").value;
                var email = documento.getElementById("txtemail").value;
                
                if(idTipoDocumento == "" || descripcion == "" || idPersona == "" || idTipoEmpleado == "" || numeroDocumento == "" || nombres == "" || direccion == "" || telefono == "" || email == ""){
                    alert("Todos los Campos son obligatorio.");
               }else{
                    document.frmMnt.action = "EmpleadoControlador?accion=insertar&idTipoDocumento=" + idTipoDocumento + "&descripcion=" + descripcion + "&idPersona" + idPersona + "&idTipoEmpleado" + idTipoEmpleado + "&numeroDocumento"+ numeroDocumento +"&nombres" + nombres + "&direccion" + direccion + "&telefono" + telefono + "&email" + email;
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
                    <h2><strong>Empleado</strong></h2><h4>Mantenimiento</h4>
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
                                    <label class="control-label col-md-3" for="txtidTipoDocumento">Id Tipo de Documento:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtidTipoDocumento" value="<%=idTipoDocumento%>" autofocus="autofocus" />
                                        
                                    </div>
                                </div>       
                               <div class="form-group">
                                    <label class="control-label col-md-3" for="txtdescripcion">Descripcion:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtdescripcion" value="<%=descripcion%>" autofocus="autofocus" />
                                        
                                    </div>
                                </div>        
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtidPersona">Id Persona:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtidPersona" value="<%=idPersona%>" autofocus="autofocus" />
                                        
                                    </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtidTipoEmpleado">Id Tipo de Empleado:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtidTipoEmpleado" value="<%=idTipoEmpleado%>" autofocus="autofocus" />
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtnumeroDocumento">Numero de Documento:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtnumeroDocumento" value="<%=numeroDocumento%>" autofocus="autofocus" />
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtnombres">Nombres:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtnombres" value="<%=nombres%>" autofocus="autofocus" />
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtdireccion">Direccion:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtdireccion" value="<%=direccion%>" autofocus="autofocus" />
                                        
                                    </div>
                                </div>      
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txttelefono">Telefono:</label>
                                    <div class="col-md-4">
                                        
                                        <input class="form-control" type="text" id="txttelefono" value="<%=telefono%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtemail">Email:</label>
                                    <div class="col-md-4">
                                        
                                        <input class="form-control" type="text" id="txtemail" value="<%=email%>" autofocus="autofocus" />
                                    </div>
                                </div>  
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("empleadoActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=empleado.getIdEmpleado()%>)" id="btnActualizar" />
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