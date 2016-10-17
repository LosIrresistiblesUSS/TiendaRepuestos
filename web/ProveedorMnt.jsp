<%--
    Document   : Proveedor
    Created on : 10-oct-2016, 16:43:31
    Author     : milagros
--%>


<%@page import="Modelo.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    Proveedor proveedor=(Proveedor) session.getAttribute("proveedorActualizar");
    proveedor = proveedor == null ? new Proveedor():proveedor;
    
    int idProveedor;
    String razonSocial;
    //int idPersona;
    
    if(proveedor != null){
       idProveedor=proveedor.getIdProveedor();
       razonSocial= proveedor.getRazonsocial();
       //idPersona= proveedor.getIdPersona();
    }else{
        idProveedor=0;
        razonSocial=" ";
        //idPersona=0;
      }
    %>
        
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Mantenimiento de Proveedores</title>
        <script type="text/javascript">
        function insertar(){
        var razonSocial=document.getElementById("txtrazonSocial").value;
        
        if(razonSocial == " "){
            alert("El Campo razonSocial es obligatorio.");
        }else{
            documento.frmMnt.action="ProveedorControlador?accion=insertar&razonSocial="+razonSocial;
            document.frmMnt.submit();
            }   
        }
        
        function actualizar(id){
            var razonSocial=document.getElementById("txtrazonSocial").value;
        
            if(razonSocial==""){
                alert("El Campo razonSocial es obligatorio.");
            }else{
                documento.frmMnt.action="ProveedorControlador?accion=actualizar&razonSocial="+razonSocial+"&id=" + id;
                document.frmMnt.submit();
                } 
            }
        function cancelar(){
            document.location="ProveedorControlador?accion=buscar";
        }
      
        </script>
       
    </head>
    <body>

        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Proveedor</strong></h2><h4>Mantenimiento</h4>
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
                                    <label class="control-label col-md-3" for="txtDescripcion">Proveedor:</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="txtDescripcion" value="<%=razonSocial %>" autofocus="autofocus" />
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
