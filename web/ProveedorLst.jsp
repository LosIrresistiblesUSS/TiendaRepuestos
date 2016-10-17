<%-- 
    Document   : ProveedorLst
    Created on : 13-oct-2016, 13:27:57
    Author     : milagros
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
                var razSocial = document.getElementById("txtrazonSocial").value;
                document.frmLst.action = "ProveedorControlador?accion=buscar&razonSocial=" + razSocial + "&pag=" + pagina;
                document.frmLst.submit();
            }
            
            function buscarPag(pagina){
                var razSocial = document.getElementById("razonSocial").value;
                document.frmLst.action = "ProveedorControlador?accion=buscar&razonSocial=" + razSocial + "&pag=" + pagina;
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
                <form name="frmLst" method="post" class="form-inline formulario-resultados">
                    <div class="form-group">
                        <label for="txtrazonSocial">Proveedor:</label>
                        <input class="form-control" type="text" id="txtrazonSocial" placeholder="Texto a buscar" autofocus />
                        <div class="espacio-buscar"></div>
                          <input type="submit" onclick="buscar(1)" id="btnBuscar" class="btn btn-primary" value="Buscar" />
                        <button type="button" onclick="nuevo()" id="btnNuevo" class="btn btn-primary">Nuevo</button>
                    </div>

                    <div class="mensajes">
                        <% if(session.getAttribute("msgListado") != null){ %>
                            
                            ${msgListado}
                        <% } %>

                        <% if(session.getAttribute("msgPostOperacion") != null){ %>
                        ${msgPostOperacion}
                        <% } %>
                    </div>
                    <!-- <div class="table-responsive"> --> <!-- Activar para tabla responsiva -->
                        <table border="1" class="table table-hover tabla-resultados">
                            <thead align="center">
                                <td><b>#</b></td>
                                <td><b>Id Proveedor</b></td>
                                <td><b>Razon Social</b></td>
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
                        <td><%=proveedor.getIdProveedor()%></td>        
                        <td><%=proveedor.getRazonsocial()%></td>
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
                                                <p><strong><%=proveedor.getRazonsocial()%></strong>.</p>
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
                        
                        <input type="hidden" value="<%=session.getAttribute("razonSocial")%>" id="razonSocial" />
                    <!-- </div> -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <% if((int)session.getAttribute("pagina") == 1){ %>
                                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            <% }else{ %>
                                <li><a href="#" onclick="buscarPag(<%=(int)session.getAttribute("pagina")-1%>)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            <% } %>
                            <%
                            for(int i=1; i <= (int)session.getAttribute("nroPaginas"); i++){
                            
                                if((int)session.getAttribute("pagina") == i){       
                            %>
                                <li class="active"><a href="#"><%=i%></a></li>
                            <%      
                                }else{
                            %>
                                <li><a href="#" onclick="buscarPag(<%=i%>)"><%=i%></a></li>
                            <%
                                }
                            }
                            %>
                            <% if((int)session.getAttribute("pagina") == (int)session.getAttribute("nroPaginas")){ %>
                                <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                            <% }else{ %>
                                <li><a href="#" onclick="buscarPag(<%=(int)session.getAttribute("pagina")+1%>)" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                            <% } %>
                        </ul>
                    </nav>
                </form>
            </section>
        </main>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>