<%-- 
    Document   : TipoEmpleadoList
    Created on : 09-oct-2016, 13:16:56
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.TipoEmpleado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Tipo de Empleado</title>
        <script type="text/javascript">
            function nuevo(){
                document.location = "TipoEmpleadoMnt.jsp";
            }
            
            function buscar(pagina){
                var desc = document.getElementById("txtDescripcion").value;
                document.frmLst.action = "TipoEmpleadoControlador?accion=buscar&desc=" + desc + "&pag=" + pagina;
                document.frmLst.submit();
            }
            
            function buscarPag(pagina){
                var desc = document.getElementById("descripcion").value;
                document.frmLst.action = "TipoEmpleadoControlador?accion=buscar&desc=" + desc + "&pag=" + pagina;
                document.frmLst.submit();
            }
            
            function obtenerPorId(num){
                var id = document.getElementById("txtActualizar"+num).value;
                document.frmLst.action = "TipoEmpleadoControlador?accion=obtenerPorId&idTe=" + id;
                document.frmLst.submit();
            }
            
            function eliminar(num){
                var id = document.getElementById("txtEliminar"+num).value;
                document.frmLst.action = "TipoEmpleadoControlador?accion=eliminar&idTe=" + id;
                document.frmLst.submit();
            }
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Tipo de Empleado</strong></h2>
                </div>
            </section>
            <section class="container">
                <form name="frmLst" method="post" class="form-inline formulario-resultados">
                    <div class="form-group">
                        <label for="txtDescripcion">Tipo de Empleado:</label>
                        <input class="form-control" type="text" id="txtDescripcion" placeholder="Texto a buscar" autofocus />
                        <div class="espacio-buscar"></div>
                        <!--<button type="button" onclick="buscar()" id="btnBuscar" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> Buscar</button>-->
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
                    <div class="table-responsive"> <!-- Activar para tabla responsiva -->
                        <table border="1" class="table table-hover tabla-resultados">
                            <thead align="center">
                                <td><b>#</b></td>
                                <td><b>Id</b></td>
                                <td><b>Descripción</b></td>
                                <td><b>Acciones</b></td>
                            </thead>
                            <%if(session.getAttribute("listaTipoEmpleado") != null){
                                List<TipoEmpleado> lstTipoEmpleado = (List<TipoEmpleado>)session.getAttribute("listaTipoEmpleado");
                                for(int i=0; i < lstTipoEmpleado.size(); i++){
                                    TipoEmpleado tipoEmpleado = lstTipoEmpleado.get(i);
                            %>
                            <tbody>
                                <td><center><%=(((int)session.getAttribute("pagina")*(int)session.getAttribute("registrosPorPagina"))-(int)session.getAttribute("registrosPorPagina"))+i+1 %></center></td>
                                <td><%=tipoEmpleado.getIdTipoEmpleado()%></td>
                                <td><%=tipoEmpleado.getDescripcion()%></td>
                                <td>
                                    <center>
                                    <table>
                                        <tr>
                                            <td class="td-acciones-editar">
                                                <input type="hidden" value="<%=tipoEmpleado.getIdTipoEmpleado()%>" id="txtActualizar<%=i+1%>" />
                                                <button class="btn btn-warning" onclick="obtenerPorId(<%=i+1%>)">
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
                                                <h3 class="modal-title" id="myModalLabel">Eliminar Tipo de Empleado</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Está seguro de eliminar el Tipo de Empleado:</p>
                                                <p><strong><%=tipoEmpleado.getDescripcion()%></strong>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                                <input type="hidden" value="<%=tipoEmpleado.getIdTipoEmpleado()%>" id="txtEliminar<%=i+1%>" />
                                                <button onclick="eliminar(<%=i+1%>)" type="button" class="btn btn-danger">Eliminar</button>
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
                        
                        <input type="hidden" value="<%=session.getAttribute("descripcion")%>" id="descripcion" />
                    </div>
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