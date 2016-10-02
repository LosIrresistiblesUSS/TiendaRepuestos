<%-- 
    Document   : index
    Created on : 15-sep-2016, 15:14:10
    Author     : Los resistibles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Tipo de Servicio</title>
        
        <script type="text/javascript">
            function iniciarSesion(){
                var usuario = document.getElementById("txtUsuario").value;
                var password = document.getElementById("txtContra").value;
                
                if (usuario == "" && password == "") {
                    alert("Campos Usuario y Contraseña son Obligatorios.");
                } else {
                    
                    if (usuario == ""){
                        alert("Campo Usuario es Obligatorio.");
                    } else {
                        document.frmLst.action = "LoginControlador?accion=iniciarSesion&usuario=" + usuario + "&password=" + password;
                        document.frmLst.submit();
                    }
                    
                    
                }
            }
        </script>
        
    </head>
    <body>
        
        <% if(session.getAttribute("usuario") != null){ %>
        <script>
            document.location = "TipoServicioControlador?accion=buscar";
        </script>
        <% } %>
        
        
        <form name="frmLst" method="post">
            <table width="100%">
                <tr>
                    <td align="center">
                        <h3>Bienvenido a nuestra primera aplicaciÃ³n <br />web con Java.</h3>
                        <h1>IRRESISTIBLES</h1>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Usuario: <input type="text" name="txtUsuario" id="txtUsuario" /></br></br>
                        Contraseña: <input type="password" name="txtContra" id="txtContra" /></br></br>
                        <input type="submit" onClick="iniciarSesion()" name="btnIngresar" value="Ingresar">
                    </td>
                    ${msgSesion}
                </tr>
            </table>
        </form>
            
    </body>
</html>