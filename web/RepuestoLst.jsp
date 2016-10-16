<%-- 
    Document   : TipoServicioLst
    Created on : 15-sep-2016, 16:36:46
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.Repuesto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Repuesto</title>
        <script type="text/javascript">
            function nuevo(){
                document.location = "RepuestoMnt.jsp";
            }
            
            function buscar(pagina){
                var desc = document.getElementById("txtDescripcion").value;
                document.frmLst.action = "RepuestoControlador?accion=buscar&desc=" + desc + "&pag=" + pagina;
                
                document.frmLst.submit();
            }
            
            function buscarPag(pagina){
                var desc = document.getElementById("descripcion").value;
                document.frmLst.action = "RepuestoControlador?accion=buscar&desc=" + desc + "&pag=" + pagina;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                document.frmLst.action = "RepuestoControlador?accion=obtenerPorId&id=" + id;
                document.frmLst.submit();
            }
            
            function eliminar(id){
                document.frmLst.action = "RepuestoControlador?accion=eliminar&id=" + id;
                document.frmLst.submit();
            }
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Repuestos</strong></h2>
                </div>
            </section>
            <section class="container">
                <form name="frmLst" method="post" class="form-inline formulario-resultados">
                    <div class="form-group">
                        <label for="txtDescripcion">Repuestos:</label>
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
                    <!-- <div class="table-responsive"> --> <!-- Activar para tabla responsiva -->
                        <table border="1" class="table table-hover tabla-resultados">
                            <thead align="center">
                                <td><b>#</b></td>
                                <td><b>Descripción</b></td>
                                <td><b>Stock</b></td>
                                <td><b>Precio</b></td>
                                <td><b>Precio x Mayor</b></td>
                                <td><b>Acciones</b></td>
                            </thead>
                            <%if(session.getAttribute("listaRepuesto") != null){
                                List<Repuesto> lstRepuesto = (List<Repuesto>)session.getAttribute("listaRepuesto");
                                for(int i=0; i < lstRepuesto.size(); i++){
                                    Repuesto repuesto = lstRepuesto.get(i);
                            %>
                            <tbody>
                                <td><center><%=(((int)session.getAttribute("pagina")*(int)session.getAttribute("registrosPorPagina"))-(int)session.getAttribute("registrosPorPagina"))+i+1 %></center></td>
                                    
                                <td><%=repuesto.getDescripcion()%></td>
                                <td><%=repuesto.getStock()%></td>
                                <td><%=repuesto.getPrecio()%></td>
                                <td><%=repuesto.getpreciopormayor()%></td>
                                <td>
                                    <center>
                                    <table>
                                        <tr>
                                            <td class="td-acciones-editar">
                                                <button class="btn btn-warning" onclick="obtenerPorId(<%=repuesto.getIdrepuesto()%>)">
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
                                                <h3 class="modal-title" id="myModalLabel">Eliminar Repuesto</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Está seguro de eliminar el Repuesto:</p>
                                                <p><strong><%=repuesto.getDescripcion()%></strong>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                                <button onclick="eliminar(<%=repuesto.getIdrepuesto()%>)" type="button" class="btn btn-danger">Eliminar</button>
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