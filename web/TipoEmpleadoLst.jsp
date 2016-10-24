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
                var nro = document.getElementById("numeroXpagina").value;
                document.frmLst.action = "TipoEmpleadoControlador?accion=buscar&desc=" + desc + "&pag=" + pagina + "&nro=" + nro;
                document.frmLst.submit();
            }
            
            function buscarPag(pagina){
                var desc = document.getElementById("descripcion").value;
                var nro = document.getElementById("numeroXpagina").value;
                document.frmLst.action = "TipoEmpleadoControlador?accion=buscar&desc=" + desc + "&pag=" + pagina + "&nro=" + nro;
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
                <form name="frmLst" method="post" class="form formulario-resultados">
                    <div class="form-group row">
                        <div class="cuadro-busqueda col-md-3 col-sm-4 col-xs-12">
                            <input class="form-control" type="text" id="txtDescripcion" placeholder="Busqueda por Descripción" autofocus />
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