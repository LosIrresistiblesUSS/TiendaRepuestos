<%--
    Document   : Proveedor
    Created on : 10-oct-2016, 16:43:31
    Author     : Los Irresistibles
--%>


<%@page import="Helpers.ListasObjetos"%>
<%@page import="Modelo.TipoDocumento"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    Proveedor proveedor=(Proveedor) session.getAttribute("ProveedorActualizar");
    proveedor = proveedor == null ? new Proveedor():proveedor;
    
    int idProveedor= (String.valueOf(proveedor.getIdProveedor()) == null) ? 0 : proveedor.getIdProveedor();
    String razoncomercial= proveedor.getRazonComercial() == null ? "" : proveedor.getRazonComercial();
    String ndocumento=proveedor.getNumeroDocumento()== null ? "": proveedor.getNumeroDocumento();
    String direccion = proveedor.getDireccion() == null ? "" : proveedor.getDireccion();
    String telefono = proveedor.getTelefono() == null ? "" : proveedor.getTelefono();
    String email = proveedor.getEmail() == null ? "" : proveedor.getEmail();
    int idTipoDocumento = (String.valueOf(proveedor.getTipoDocumento().getIdTipoDocumento()) == null) ? 0 : proveedor.getTipoDocumento().getIdTipoDocumento();
    
    %>
        
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Proveedores</title>
        <script type="text/javascript">
            function insertar(){
                var razoncomercial= document.getElementById("txtrazonComercial").value;
                var ndocumento = document.getElementById("txtnDocumento").value;
                var direccion = document.getElementById("txtDireccion").value;
                var telefono = document.getElementById("txtTelefono").value;
                var email = document.getElementById("txtEmail").value;
                var idtipo=document.getElementById("idtipo");

                if(razoncomercial == "" || ndocumento === "" || direccion === "" || telefono === "" || email=== "" || idtipo === ""){
                    alert("El Campo razonComercial es obligatorio.");
                }else{
                    documento.frmMnt.action="ProveedorControlador?accion=insertar&razoncomercial=" + razoncomercial + "&ndocumento" + ndocumento + "&direccion=" + direccion + "&telefono=" + telefono + "&email=" + email + "&idtipo" + idtipo;
                    document.frmMnt.submit();
                    }   
            }

            function actualizar(id){
                var razoncomercial= document.getElementById("txtrazonComercial").value;
                var ndocumento = document.getElementById("txtnDocumento").value;
                var direccion = document.getElementById("txtDireccion").value;
                var telefono = document.getElementById("txtTelefono").value;
                var email = document.getElementById("txtEmail").value;
                var idtipo=document.getElementById("idtipo");

                if(razoncomercial == "" || ndocumento === "" || direccion === "" || telefono === "" || email=== "" || idtipo === ""){
                    alert("El Campo razonComercial es obligatorio.");
                }else{
                    documento.frmMnt.action="ProveedorControlador?accion=insertar&razoncomercial=" + razoncomercial + "&ndocumento" + ndocumento + "&direccion=" + direccion + "&telefono=" + telefono + "&email=" + email + "&idtipo" + idtipo;
                    document.frmMnt.submit();
                }
            }
            
            function cancelar(){
                document.location = "ProveedorControlador?accion=buscar";
            } 
        </script>
    </head>
    <body>

        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Proveedor</strong></h2>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>
                        <% if(session.getAttribute("proveedorActualizar") == null){ %>
                            Insertar 
                        <% }else{ %>
                            Actualizar
                        <% } %>
                        <small>Proveedor</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" method="post" class="form-horizontal col-md-offset-3 form-principal">
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="txtrazonComercial">Proveedor:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtrazonComercial" value="<%=razoncomercial %>" autofocus="autofocus" />
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="control-label col-md-3" for="idtipo">Tipo Documento:</label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="idtipo">
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
                                    <label class="control-label col-md-3" for="txtnDocumento">N°Documento :</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtnDocumento" value="<%=ndocumento%>" autofocus="autofocus" />
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
                                    <div class="col-md-4 col-md-offset-3">
                                        <% if(session.getAttribute("proveedorActualizar") == null){ %>
                                        <input class="btn btn-primary" type="submit" value="Insertar" onclick="insertar()" id="btnInsertar" />
                                        <% }else{ %>
                                        <input class="btn btn-primary" type="submit" value="Actualizar" onclick="actualizar(<%=proveedor.getIdProveedor()%>)" id="btnActualizar" />
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
        <%@include file="WEB-INF/jspf/footer.jspf"%>    
    </body>
</html>