<%-- 
    Document   : TipoServicioLst
    Created on : 15-sep-2016, 16:36:46
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.TipoServicio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Tipos de Servicio</title>
        <script type="text/javascript">
            function nuevo(){
                document.location = "TipoServicioMnt.jsp";
            }
            
            function buscar(){
                var desc = document.getElementById("txtDescripcion").value;
                document.frmLst.action = "TipoServicioControlador?accion=buscar&desc=" + desc;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                document.frmLst.action = "TipoServicioControlador?accion=obtenerPorId&id=" + id;
                document.frmLst.submit();
            }
            
            function eliminar(id){
                document.frmLst.action = "TipoServicioControlador?accion=eliminar&id=" + id;
                document.frmLst.submit();
            }
        </script>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Tipos de Servicios</strong></h2><h4>Mantenimiento</h4>
                </div>
            </section>
            <section class="container">
                <form name="frmLst" method="post" class="form-inline">
                    <div class="form-group">
                        <label for="txtDescripcion">Tipo de Servicio:</label>
                        <input class="form-control" type="text" id="txtDescripcion" placeholder="Texto a buscar" autofocus />
                        <div class="espacio-buscar"></div>
                        <!--<button type="button" onclick="buscar()" id="btnBuscar" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> Buscar</button>-->
                        <input type="submit" onclick="buscar()" id="btnBuscar" class="btn btn-primary" value="Buscar" />
                        <button type="button" onclick="nuevo()" id="btnNuevo" class="btn btn-primary">Nuevo</button>
                    </div>

                    <div class="mensajes">
                        <% if(session.getAttribute("msgListado") != null){ %>
                            <div class="alert alert-danger" role="alert">
                                <strong>Fatality <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>${msgListado}
                            </div>    
                        <% } %>

                        <% if(session.getAttribute("msgPostOperacion") != null){ %>
                        ${msgPostOperacion}
                        <% } %>
                    </div>
                    <!-- <div class="table-responsive"> --> <!-- Activar para tabla responsiva -->
                        <table border="1" class="table table-hover">
                            <thead align="center">
                                <td><b>#</b></td>
                                <td><b>Descipción</b></td>
                                <td><b>Editar</b></td>
                                <td><b>Eliminar</b></td>
                            </thead>
                            <%if(session.getAttribute("listaTipoServicio") != null){
                                List<TipoServicio> lstTipoServicio = (List<TipoServicio>)session.getAttribute("listaTipoServicio");
                                for(int i=0; i < lstTipoServicio.size(); i++){
                                    TipoServicio tipoServicio = lstTipoServicio.get(i);
                            %>
                            <tbody>
                                <td><center><%=i+1 %></center></td>
                                <td><%=tipoServicio.getDecripcion()%></td>
                                <td>
                                    <center>
                                        <a class="text-primary" onclick="obtenerPorId(<%=tipoServicio.getIdTipoServicio()%>)" href="#">
                                        <span class="glyphicon glyphicon-pencil"></span></a>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <a class="text-danger" href="#modalEliminar<%=i+1%>" data-toggle="modal"><span class="glyphicon glyphicon-trash"></span></a>
                                    </center>
                                </td>

                                <!-- Modal - INICIO -->
                                <div class="modal fade text-center" id="modalEliminar<%=i+1%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="myModalLabel">Eliminar Tipo de Servicio</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Está seguro de eliminar el Tipo de Servicio:</p>
                                                <p><strong><%=tipoServicio.getDecripcion()%></strong>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                                <button onclick="eliminar(<%=tipoServicio.getIdTipoServicio()%>)" type="button" class="btn btn-danger">Eliminar</button>
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
                    <!-- </div> -->
                </form>
            </section>
        </main>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>