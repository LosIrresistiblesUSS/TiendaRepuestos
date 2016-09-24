<%-- 
    Document   : TipoServicioMnt
    Created on : 24-sep-2016, 14:45:55
    Author     : Los Irresistibles
--%>

<%@page import="Modelo.TipoServicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    TipoServicio tipoServicio = (TipoServicio) session.getAttribute("tipoServicioActualizar");
    tipoServicio = tipoServicio == null ? new TipoServicio() : tipoServicio;
    String descripcion = tipoServicio.getDecripcion() == null ? "" : tipoServicio.getDecripcion();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Tipo de Servicio</title>
        <script type="text/javascript">
            function insertar(){
                var descripcion = document.getElementById("txtDescripcion").value;
                
                if(descripcion == ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoServicioControlador?accion=insertar&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
            }
            
            function actualizar(id){
                var descripcion = document.getElementById("txtDescripcion").value;
                if(descripcion == ""){
                    alert("Campo Descripcion es obligatorio.");
                }else{
                    document.frmMnt.action = "TipoServicioControlador?accion=actualizar&descripcion=" + descripcion;
                    document.frmMnt.submit();
                }
            }
            
            function cancelar(){
                document.location = "TipoServicioLst.jsp";
            }
        </script>
    </head>
    <body>
        <form name="frmMnt" method="post">
            <table>
                <tr>
                    <td>Tipo de Servicio:</td>
                    <td><input type="text" id="txtDescripcion" value="<%=descripcion%>" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%
                          if(session.getAttribute("tipoServicioActualizar") == null){
                        %>
                        ${tipoServicioActualizar}
                    <td>
                        <input type="button" value="Insertar" onclick="insertar()" id="btnInsertar" />
                    </td>
                        <%
                        }else{
                        %>
                    <td>
                        <input type="button" value="Actualizar" onclick="actualizar(<%=tipoServicio.getIdTipoServicio()%>)" 
                               id="btnActualizar" />
                    </td>
                        <%
                        }
                        %>
                </tr>
            </table>
        </form>
    </body>
</html>
