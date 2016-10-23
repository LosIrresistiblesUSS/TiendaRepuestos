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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mantenimiento de Tipo de Servicio</title>
        <link rel="stylesheet" href="css/login.css" />
        <script type="text/javascript">
            function iniciarSesion(){
                var usuario = document.getElementById("txtUsuario").value;
                var password = hex_md5(document.getElementById("txtContra").value);
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
            document.location = "EmpleadoControlador?accion=buscar";
        </script>
        <% } %>
        <form class="login" name="frmLst" method="post">
            <h1 class="login-title"><img src="img/login.png" /><br />Login Irresistible</h1>
            ${msgSesion}
            <input type="text" class="login-input" placeholder="Usuario" name="txtUsuario" id="txtUsuario" autofocus>
            <input type="password" class="login-input" placeholder="Contraseña" name="txtContra" id="txtContra">
            <input type="submit" onClick="iniciarSesion()" name="btnIngresar" value="Ingresar" class="login-button">
        </form>
        <script src="js/md5-min.js" type="text/javascript"></script>
    </body>
</html>

