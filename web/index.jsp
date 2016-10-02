<%-- 
    Document   : index
    Created on : 15-sep-2016, 15:14:10
    Author     : Los resistibles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Tipo de Servicio</title>
        
        <script type="text/javascript">
            function iniciarSesion(){
                var usuario = document.getElementById("txtUsuario").value;
                var password = document.getElementById("txtContra").value;
                document.frmLst.action = "LoginControlador?accion=iniciarSesion&usuario=" + usuario + "&password=" + password;
                document.frmLst.submit();
            }
        </script>
        
    </head>
    <body>
        <form name="frmLst" method="post">
            <table width="100%">
                <tr>
                    <td align="center">
                        <h3>Bienvenido a nuestra primera aplicación <br />web con Java.</h3>
                        <h1>IRRESISTIBLES</h1>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Usuario: <input type="text" name="txtUsuario"/></br></br>
                        Contraseña: <input type="text" name="txtContra"/></br></br>
                        <input type="submit" onClick="iniciarSesion()" name="btnIngresar" value="Ingresar">
                    </td>
                    
                    ${msgSesion}
                </tr>
            </table>
        </form>
            
    </body>
</html>