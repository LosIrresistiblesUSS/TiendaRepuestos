<%-- 
    Document   : TipoServicioLst
    Created on : 15-sep-2016, 16:36:46
    Author     : Irresistibles
--%>

<%@page import="Modelo.TipoServicio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Listadode Tipos de Servicio</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <script type="text/javascript">
            function nuevo(){
                document.location = "TpoServicioMnt.jsp";
            }
            
            function buscar(){
                var desc = document.getElementById("txtDescripcion").value;
                document.frmLst.action = "TipoServicioControlador?accion=buscar&descipcion=" + desc;
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
        <form name="frmLst" method="post">
            <table>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td>Tipo de Servicio:</td>
                    <td colspan="2"><input type="text" id="txtDescripcion" size="50" /></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="button" value="Buscar" onclick="buscar()" id="btnBuscar" />
                        <input type="button" value="Nuevo" onclick="nuevo()" id="btnNuevo" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        ${msgListado}
                        ${msgPostOperacion}
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <table border="1">
                            <tr align="center">
                                <td width="500px"><b>Descipción</b></td>
                            </tr>
                            <%if(session.getAttribute("listaTipoServicio") != null){
                                List<TipoServicio> lstTipoServicio = (List<TipoServicio>)session.getAttribute("listaTipoServicio");
                                for(int i=0; i < lstTipoServicio.size(); i++){
                                    TipoServicio tipoServicio = lstTipoServicio.get(i);
                            %>
                            <tr>
                                <td><%=tipoServicio.getDecripcion()%></td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a onclick="obtenerPorId(<%=tipoServicio.getIdTipoServicio()%>)" href="#">A</a>
                                    &nbsp;&nbsp;
                                    <a onclick="eliminar(<%=tipoServicio.getIdTipoServicio()%>)" href="#">E</a>
                                </td>
                            </tr>
                            <%  
                              }
                               }
                            %>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
                        
                        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
