<%-- 
    Document   : EmpleadoMnt
    Created on : 15/10/2016, 01:48:43 PM
    Author     : Los Irresistibles
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Modelo.TipoComprobanteVenta"%>
<%@page import="Helpers.ListasObjetos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/validacion.jspf" %>

<!DOCTYPE html>
<html lang="es">
    <%
    Date ahora = new Date();
    SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
    String fechaActual = formateador.format(ahora);
    
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    int idEmpleado = usuario.getIdEmpleado();
    %>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Empleado</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <main>
            <section class="jumbotron">
                <div class="container">
                    <h2><strong>Venta de Repuestos</strong></h2>
                </div>
            </section> 
            <div class="page-header">
                <div class="container">
                    <h2>Nueva <small>Venta de Repuestos</small></h2>
                </div>
            </div>
            
            <section class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-heading-2"></div>
                    <div class="panel-body">
                        <form name="frmMnt" id="frmMnt" method="post" class="form-horizontal form-principal">
                            <div class="form-group">
                                <label class="control-label col-md-2" for="txtCliente">Cliente:</label>
                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <input type="hidden" id="txtIdEmpleado" name="txtIdEmpleado" value="<%=idEmpleado%>" />
                                        <input type="hidden" value="" id="txtIdCliente" name="txtIdCliente" />
                                        <input type="text" class="form-control" id="txtCliente" name="txtCliente" placeholder="Busca Cliente" disabled>
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary" type="button" href="#modalAgregarCliente" data-toggle="modal" id="buscarCliente"><span class="glyphicon glyphicon-search icono-text"></span></button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2" for="selectIdTipoComprobanteVenta">Tipo de Comprobante:</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="selectIdTipoComprobanteVenta" autofocus>
                                        <% List<TipoComprobanteVenta> lstTipoComprobanteVenta = ListasObjetos.listaTipoComprobanteVenta(); %>
                                        <% for(TipoComprobanteVenta tipoComprobanteVenta : lstTipoComprobanteVenta){ %>
                                                <option value="<%=tipoComprobanteVenta.getIdTipoComprobanteventa()%>"><%=tipoComprobanteVenta.getDescripcion()%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <label class="control-label col-md-2" for="txtNumero">Numero:</label>
                                <div class="col-md-3">
                                    <input class="form-control txtNumero" type="text" id="txtNumeroBoleta" value="<%=ListasObjetos.ultimoNumeroBoleta()%>" disabled />
                                    <input class="form-control" type="hidden" id="txtNumeroFactura" value="<%=ListasObjetos.ultimoNumeroFactura()%>" disabled />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2" for="txtFecha">Fecha</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="date" id="txtFecha" min="2016-01-01" max="2030-12-31" value="<%=fechaActual%>"/>
                                </div>
                                <label class="control-label col-md-2" for="txtDescripcion">Descripción:</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" id="txtDescripcion" />
                                </div>
                            </div>

                            <div class="panel panel-default panel-productos-padre"> 
                                <div class="panel-heading panel-productos" id="conjuntoRepuesto">
                                    <!-- Aquí aparecerán los productos seleccionados -->
                                </div>
                                <div class="panel-body">
                                    <div>
                                        <center>
                                            <a href="#modalAgregarRepuesto" data-toggle="modal" class="btn btn-link" id="agregarRepuesto">
                                                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Agregar un Producto
                                            </a>
                                        </center>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label col-md-5" for="txtSubTotalGeneral">Sub Total:</label>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <span class="input-group-addon">S/</span>
                                        <input type="text" class="form-control" id="txtSubTotalGeneral"  value="0" disabled>
                                    </div>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label class="control-label col-md-5" for="txtIgvGeneral">IGV:</label>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <span class="input-group-addon">S/</span>
                                        <input type="text" class="form-control" id="txtIgvGeneral"  value="0" disabled>
                                    </div>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                    <label class="control-label col-md-5" for="txtTotalGeneral">Total:</label>
                                    <div class="col-md-2">
                                        <div class="input-group">
                                            <span class="input-group-addon">S/</span>
                                            <input type="text" class="form-control" id="txtTotalGeneral"  value="0" disabled>
                                        </div>
                                    </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <center>
                                    <input class="btn btn-primary" value="Registrar Venta" onclick="insertar()" id="btnInsertar" />
                                    <input class="btn btn-primary" type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                                </center>
                            </div>
                        </form>
                                        
                        <!-- Modal modalAgregarCliente - INICIO -->
                        <div class="modal fade bs-example-modal-lg" id="modalAgregarCliente" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="myModalLabel">Agregar un Cliente</h3>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <div class="cuadro-busqueda col-md-3 col-sm-4 col-xs-12">
                                                <input class="form-control" type="text" id="txtDescripcionClienteModal" placeholder="Busqueda por Descripción" autofocus />
                                                <input type="hidden" id="txtNroPaginaModal" />
                                            </div>

                                            <div class="col-md-9 col-sm-8 col-xs-12">
                                                <div class="espacio-buscar"></div>
                                                <div class=" row col-md-10 col-sm-9 col-xs-8">
                                                    <input type="submit" id="btnBuscarModal" class="btn btn-primary" value="Buscar" />
                                                </div>
                                            </div>
                                        </div>
                                        <!-- TABLA - INICIO -->
                                        <div class="table-responsive">
                                            <table id="tablaCliente" class="table table-bordered tabla-resultados">
                                                <thead align="center">
                                                    <td><b>#</b></td>
                                                    <td><b>Nombres</b></td>
                                                    <td><b>Apellidos o Razón Social</b></td>
                                                    <td><b>Tipo</b></td>
                                                    <td><b>Tipo Doc</b></td>
                                                    <td><b># Doc</b></td>
                                                    <td><b>Acciones</b></td>
                                                </thead>
                                            </table>
                                        </div>
                                        <!-- TABLA - FIN -->
                                    </div>
                                    
                                    <nav aria-label="Page navigation" class="paginacionModal">
                                        <ul class="pagination" id="paginacionModal">
                                            
                                        </ul>
                                    </nav>
                                    
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal modalAgregarCliente - FIN -->
                                        
                        <!-- Modal modalAgregarRepuesto - INICIO -->
                        <div class="modal fade bs-example-modal-lg" id="modalAgregarRepuesto" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="myModalLabel">Agregar un Repuesto</h3>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <div class="cuadro-busqueda col-md-3 col-sm-4 col-xs-12">
                                                <input class="form-control" type="text" id="txtDescripcionRepuestoModal" placeholder="Busqueda por Descripción" autofocus />
                                                <input type="hidden" id="txtNroPaginaModal2" />
                                            </div>

                                            <div class="col-md-9 col-sm-8 col-xs-12">
                                                <div class="espacio-buscar"></div>
                                                <div class=" row col-md-10 col-sm-9 col-xs-8">
                                                    <input type="submit" id="btnBuscarModal2" class="btn btn-primary" value="Buscar" />
                                                </div>
                                            </div>
                                        </div>
                                        <!-- TABLA - INICIO -->
                                        <div class="table-responsive">
                                            <table id="tablaRepuesto" class="table table-bordered tabla-resultados">
                                                <thead align="center">
                                                    <td><b>#</b></td>
                                                    <td><b>Descripción</b></td>
                                                    <td><b>Stock</b></td>
                                                    <td><b>Precio</b></td>
                                                    <td><b>Precio x Mayor</b></td>
                                                    <td><b>Acciones</b></td>
                                                </thead>
                                            </table>
                                        </div>
                                        <!-- TABLA - FIN -->
                                    </div>
                                    
                                    <nav aria-label="Page navigation" class="paginacionModal">
                                        <ul class="pagination" id="paginacionModal2">
                                            
                                        </ul>
                                    </nav>
                                    
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal modalAgregarProducto - FIN -->
                        
                    </div>
                    <div class="panel-heading panel-heading-2"></div>
                </div>
            </section>
        </main>
                                        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script src="js/VentaRepuestos.js"></script>
    </body>
</html>