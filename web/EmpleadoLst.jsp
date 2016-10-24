<%-- 
    Document   : Empleado
    Created on : 10-oct-2016, 16:40:50
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.Empleado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Empleado</title>
        <script type="text/javascript">
            function nuevo(){
                document.location = "EmpleadoMnt.jsp";
            }
            
            function buscar(pagina){
                var nom = document.getElementById("txtNombres").value;
                var nro = document.getElementById("numeroXpagina").value;
                document.frmLst.action = "EmpleadoControlador?accion=buscar&nom=" + nom + "&pag=" + pagina + "&nro=" + nro;
                document.frmLst.submit();
            }
            
            function buscarPag(pagina){
                var nom = document.getElementById("nombres").value;
                var nro = document.getElementById("numeroXpagina").value;
                document.frmLst.action = "EmpleadoControlador?accion=buscar&nom=" + nom + "&pag=" + pagina + "&nro=" + nro;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                document.frmLst.action = "EmpleadoControlador?accion=obtenerPorId&id=" + id;
                document.frmLst.submit();
            }
            
            function eliminar(id){
                document.frmLst.action = "EmpleadoControlador?accion=eliminar&id=" + id;
                document.frmLst.submit();
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
            <section class="container">
                <form name="frmLst" method="post" class="form formulario-resultados">
                    <div class="form-group row">
                        <div class="cuadro-busqueda col-md-3 col-sm-4 col-xs-12">
                            <input class="form-control" type="text" id="txtNombres" placeholder="Busqueda por Nombres" autofocus />
                        </div>
                        
                        <div class="col-md-9 col-sm-8 col-xs-12">
                            <div class="espacio-buscar"></div>
                            <div class="row col-md-10 col-sm-9 col-xs-8">
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
                                <td><b>Nombres</b></td>
                                <td><b>Apellidos</b></td>
                                <td><b>Tipo</b></td>
                                <td><b>Doc</b></td>
                                <td><b># Doc</b></td>
                                <td><b>Email</b></td>
                                <td><b>Telefono</b></td>
                                <td><b>Acciones</b></td>
                            </thead>
                            <%if(session.getAttribute("listaEmpleado") != null){
                                List<Empleado> lstEmpleado = (List<Empleado>)session.getAttribute("listaEmpleado");
                                for(int i=0; i < lstEmpleado.size(); i++){
                                    Empleado empleado = lstEmpleado.get(i);
                            %>
                            <tbody>
                                <td><center><%=(((int)session.getAttribute("pagina")*(int)session.getAttribute("registrosPorPagina"))-(int)session.getAttribute("registrosPorPagina"))+i+1 %></center></td>
                                <td><%=empleado.getNombres()%></td>
                                <td><%=empleado.getApellidos()%></td>
                                <td><%=empleado.getTipoEmpleado().getDescripcion() %></td>
                                <td><%=empleado.getTipoDocumento().getDescripcion()%></td>
                                <td><%=empleado.getNumeroDocumento()%></td>
                                <td><%=empleado.getEmail()%></td>
                                <td><%=empleado.getTelefono() %></td>
                                <td>
                                    <center>
                                    <table>
                                        <tr>
                                            <td class="td-acciones-editar">
                                                <button class="btn btn-warning" onclick="obtenerPorId(<%=empleado.getIdEmpleado()%>)">
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
                                                <h3 class="modal-title" id="myModalLabel">Eliminar Empleado</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Está seguro de eliminar el Empleado:</p>
                                                <p><strong><%=empleado.getNombres()%></strong>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                                <button onclick="eliminar(<%=empleado.getIdEmpleado()%>)" type="button" class="btn btn-danger">Eliminar</button>
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
                        
                        <input type="hidden" value="<%=session.getAttribute("nombres")%>" id="nombres" />
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