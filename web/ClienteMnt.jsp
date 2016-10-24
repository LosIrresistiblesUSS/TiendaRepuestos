<%-- 
    Document   : TipoServicioLst
    Created on : 15-sep-2016, 16:36:46
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.TipoCliente"%>
<%@page import="Helpers.ListasObjetos"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.TipoDocumento"%>
<%@page import="Modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    Cliente cliente = (Cliente) session.getAttribute("ClienteActualizar");
    cliente = cliente == null ? new Cliente() : cliente;
    
    int idCliente = String.valueOf(cliente.getIdCliente()) == null ? 0 : cliente.getIdCliente();
    String razonsocial = cliente.getRazonSocial() == null ? "" : cliente.getRazonSocial();
    String apellidos = cliente.getApellidos() == null ? "" : cliente.getApellidos();
    String nombre = cliente.getNombres() == null ? "" : cliente.getNombres();
    String ndocumento=cliente.getNumeroDocumento()== null ? "": cliente.getNumeroDocumento();
    String direccion=cliente.getDireccion() == null ? "": cliente.getDireccion();
    String telefono=cliente.getTelefono()== null ? "": cliente.getTelefono();
    String email=cliente.getEmail()== null ? "": cliente.getEmail();
    int idtipo = (String.valueOf(cliente.getTipoDocumento().getIdTipoDocumento()) == null) ? 0 : cliente.getTipoDocumento().getIdTipoDocumento();
    int idtipoc = (String.valueOf(cliente.getTipoCliente().getIdTipoCliente()) == null) ? 0 : cliente.getTipoCliente().getIdTipoCliente();
   
       //String  descripcion=cliente.getTipoDocumento().getDescripcion()
   
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Mantenimiento de Cliente</title>
        <script type="text/javascript">
            function insertar(){
                
                var razonsocial = document.getElementById("txtrazonSocial").value;
                var nombre= document.getElementById("txtNombre").value; 
                var apellidos= document.getElementById("txtApellidos").value; 
                var ndocumento = document.getElementById("txtnDocumento").value;
                var direccion = document.getElementById("txtDireccion").value;
                var telefono= document.getElementById("txtTelefono").value;
                var email = document.getElementById("txtEmail").value;
               
                var idtipo=document.getElementById("idtipo");
                if(razonsocial === ""|| nombre === "" ||  apellidos ==="" || ndocumento === "" || direccion === "" || telefono === "" || email === ""  || idtipo === ""){
                    alert(" Todos los campos son  obligatorio.");
                }else{
                  
                    document.frmMnt.action = "ClienteControlador?accion=insertar&razonsocial=" + razonsocial + "&nombre" + nombre + "&apellidos" + apellidos + "&ndocumento" + ndocumento  +  "&direccion" + direccion + "&telefono" + telefono + "&email" + email + "&idtipo" + idtipo;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
                var razonsocial = document.getElementById("txtrazonSocial").value;
                var nombre= document.getElementById("txtNombre").value;  
                var apellidos= document.getElementById("txtApellidos").value;  
                var ndocumento = document.getElementById("txtnDocumento").value;
                var direccion = document.getElementById("txtDireccion").value;
                var telefono= document.getElementById("txtTelefono").value;
                var email = document.getElementById("txtEmail").value;
                var idtipo=document.getElementById("idtipo");
                var idtipoc=document.getElementById("idtipoc");
                if( razonsocial === "" || nombre === "" || apellidos === "" || ndocumento === "" || direccion === "" || telefono === "" || email === ""  || idtipo === "" || idtipoc=""){
                    alert("Campo Descripcion es obligatorio."); 
                }else{
                  
                    document.frmMnt.action = "ClienteControlador?accion=insertar&razonsocial=" + razonsocial + "&nombre" + nombre + "&ndocumento" +"&apellidos" +apellidos + ndocumento + "&direccion" + direccion + "&telefono" + telefono + "&email" + email + "&idtipo" + idtipo;
                    document.frmMnt.submit();
                }
            }
            
            function cancelar(){
                document.location = "ClienteControlador?accion=buscar";
            }
            
          
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Clientes</strong></h2><h4>Mantenimiento</h4>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("ClienteActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Cliente</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        
                        
                        
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                               
                             <div class="form-group">
                                    <label class="control-label col-md-3" for="idtipo">Tipo De Cliente:</label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="idtipoc">
                                            <% List<TipoCliente> lstTipoCliente = ListasObjetos.listaTipoCliente(); %>
                                            <% for(TipoCliente tipoCliente : lstTipoCliente){ %>
                                                <% if (idtipo == tipoCliente.getIdTipoCliente()){%>
                                                    <option value="<%=tipoCliente.getIdTipoCliente()%>" selected><%=tipoCliente.getNomDescripcion()%></option>
                                                <% }else{ %>
                                                    <option value="<%=tipoCliente.getIdTipoCliente()%>"><%=tipoCliente.getNomDescripcion()%></option>
                                                <% } %>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                            
                            <div class="form-group">
                                
                                
                                    <label class="control-label col-md-3" for="txtRazonSocial">Razon Social :</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtRazonSocial" value="<%=razonsocial%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="control-label col-md-3" for="txtNombre">Nombres :</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtNombre" value="<%=nombre%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtApellidos">Apellidos :</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtApellidos" value="<%=apellidos%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="idtipo">Tipo Documento:</label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="idtipo">
                                            <% List<TipoDocumento> lstTipoDocumento = ListasObjetos.listaTipoDocumento(); %>
                                            <% for(TipoDocumento tipoDocumento : lstTipoDocumento){ %>
                                                <% if (idtipo == tipoDocumento.getIdTipoDocumento()){%>
                                                    <option value="<%=tipoDocumento.getIdTipoDocumento()%>" selected><%=tipoDocumento.getDescripcion()%></option>
                                                <% }else{ %>
                                                    <option value="<%=tipoDocumento.getIdTipoDocumento()%>"><%=tipoDocumento.getDescripcion()%></option>
                                                <% } %>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtnDocumento">N°Documento :</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtnDocumento" value="<%=ndocumento%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtDireccion">Direccion :</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDireccion" value="<%=direccion%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtTelefono">Telefono :</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtTelefono" value="<%=telefono%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtEmail">Email:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtEmail" value="<%=email%>" autofocus="autofocus" />
                                    </div>
                                </div>
                                
                                    
                                    
                                     
                                
                                <div class="form-group">
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("ClienteActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=cliente.getIdCliente()%>)" id="btnActualizar" />
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