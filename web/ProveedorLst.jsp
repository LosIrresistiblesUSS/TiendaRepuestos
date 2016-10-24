<%-- 
    Document   : ProveedorLst
    Created on : 13-oct-2016, 13:27:57
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.Proveedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>PROVEEDOR</title>
        <script type="text/javascript">
             function nuevo(){
                document.location = "ProveedorMnt.jsp";
            }
            
            function buscar(pagina){
                var razonComercial = document.getElementById("txtrazonComercial").value;
                var nro = document.getElementById("numeroXpagina").value;
                document.frmLst.action = "ProveedorControlador?accion=buscar&razonComercial=" + razonComercial + "&pag=" + pagina + "&nro=" + nro;
                document.frmLst.submit();
            }
            
            function buscarPag(pagina){
                var razonComercial = document.getElementById("razonComercial").value;
                var nro = document.getElementById("numeroXpagina").value;
                document.frmLst.action = "ProveedorControlador?accion=buscar&razonComercial=" + razonComercial + "&pag=" + pagina + "&nro=" + nro;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                document.frmLst.action = "ProveedorControlador?accion=obtenerPorId&id=" + id;
                document.frmLst.submit();
            }
            
            function eliminar(id){
                document.frmLst.action = "ProveedorControlador?accion=eliminar&id=" + id;
                document.frmLst.submit();
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
            <section class="container">
                <form name="frmLst" method="post" class="form formulario-resultados">
                    <div class="form-group row">
                        <div class="cuadro-busqueda col-md-3 col-sm-4 col-xs-12">
                            <input class="form-control" type="text" id="txtrazonComercial" placeholder="Busqueda por Razon Comercial" autofocus />
                        </div>
                        
                        <div class="col-md-9 col-sm-8 col-xs-12">
                            <div class="espacio-buscar"></div>
                            <div class=" row col-md-10 col-sm-9 col-xs-8">
                                <input type="submit" onclick="buscar(1)" id="btnBuscar" class="btn btn-primary" value="Buscar" />
                                <button type="button" onclick="nuevo()" id="btnNuevo" class="btn btn-primary">Nuevo</button>
                            </div>
                            <div class="row col-md-2 col-sm-3 col-xs-4">
                            <!-- SELECT NRO POR PAGINA - INICIO -->
                            <% if(session.getAttribute("usuario") != null){ %>
                                <%@include file="WEB-INF/jspf/SelectNumeroXpagina.jspf" %>
                            <% } %>
                            <!-- SELECT NRO POR PAGINA - FIN -->
                            </div>
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
                    <div class="table-responsive"> <!-- Activar para tabla responsiva -->
                        <table border="1" class="table table-hover tabla-resultados">
                            <thead align="center" class="thead-listado">
                                <td><b>#</b></td>
                                <td><b>Razon Comercial</b></td>
                                <td><b>Doc</b></td>
                                <td><b># Doc</b></td>
                                <td><b>Direccion</b></td>
                                <td><b>Telefono</b></td>
                                <td><b>Email</b></td>
                                <td><b>Acciones</b></td>

                            </thead>
                            <%if(session.getAttribute("listaProveedor") != null){
                                List<Proveedor> lstProveedor = (List<Proveedor>)session.getAttribute("listaProveedor");
                                for(int i=0; i < lstProveedor.size(); i++){
                                    Proveedor proveedor = lstProveedor.get(i);
                            %>
                            <tbody>
                                <td><center><%=(((int)session.getAttribute("pagina")*(int)session.getAttribute("registrosPorPagina"))-(int)session.getAttribute("registrosPorPagina"))+i+1 %></center></td>      
                                <td><%=proveedor.getRazonComercial()%></td>
                                <td><%=proveedor.getTipoDocumento().getDescripcion()%></td>
                                <td><%=proveedor.getNumeroDocumento()%></td>
                                <td><%=proveedor.getDireccion()%></td>        
                                <td><%=proveedor.getTelefono()%></td>
                                <td><%=proveedor.getEmail()%></td>  
                                <td>
                                    <center>
                                    <table>
                                        <tr>
                                            <td class="td-acciones-editar">
                                                <button class="btn btn-warning" onclick="obtenerPorId(<%=proveedor.getIdProveedor()%>)">
                                                    <span class="glyphicon glyphicon-pencil"></span>
                                                </button>
                                            </td>
                                            <td class="td-acciones-eliminar">
                                                <a class="text-danger" href="#modalEliminar<%=i+1%>" data-toggle="modal">
                                                    <button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                    </center>
                                </td>
                                
                                <!-- Modal - INICIO -->
                                <div class="modal fade text-center" id="modalEliminar<%=i+1%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="myModalLabel">Eliminar Proveedor</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Está seguro de eliminar el Proveedor:</p>
                                                <p><strong><%=proveedor.getRazonComercial()%></strong>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                                <button onclick="eliminar(<%=proveedor.getIdProveedor()%>)" type="button" class="btn btn-danger">Eliminar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal - FIN -->
                            </tbody>
                            <%  
                                }
                            }
                            %>
                        </table>
                        
                        <input type="hidden" value="<%=session.getAttribute("razonComercial")%>" id="razonComercial" />
                    </div>
                    <!-- PAGINACIÓN - INICIO -->
                    <% if(session.getAttribute("usuario") != null){ %>
                        <%@include file="WEB-INF/jspf/paginacion.jspf" %>
                    <% } %>
                    <!-- PAGINACIÓN - FIN -->
                </form>
            </section>
        </main>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>