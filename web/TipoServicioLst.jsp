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
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilos.css"/>
        
        <title>Listadode Tipos de Servicio</title>
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
        
        
    <nav class="navbar navbar-default bg-info">
     <div class="container">
       <!-- Brand and toggle get grouped for better mobile display -->
       <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
           <span class="sr-only">Toggle navigation</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>
           <a class="navbar-brand" href="#"><b>IRRESISTIBLES | Venta de Repuestos</b></a>
       </div>

       <!-- Collect the nav links, forms, and other content for toggling -->
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

         <ul class="nav navbar-nav navbar-right">
           <li><a href="#">Inicio</a></li>
           <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Mantenimiento <span class="caret"></span></a>
             <ul class="dropdown-menu">
               <li><a href="#">Tipo de Servicio</a></li>
               <li><a href="#">Cliente</a></li>
               <li><a href="#">Empleado</a></li>
             </ul>
           </li>
         </ul>
       </div><!-- /.navbar-collapse -->
     </div><!-- /.container-fluid -->
   </nav>

    <div class="container">
        <form name="frmLst" method="post" class="form-inline">
            <div class="form-group">
                <label for="txtDescripcion">Tipo de Servicio:</label>
                <input class="form-control"  type="text" id="txtDescripcion" size="50" />              
                &nbsp;&nbsp;
                <input type="button" value="Buscar" onclick="buscar()" id="btnBuscar" class="btn btn-primary" />
                <input type="button" value="Nuevo" onclick="nuevo()" id="btnNuevo" class="btn btn-primary" />
            </div>
            
            <br /><br />
            <div class="mensajes">
                <% if(session.getAttribute("msgListado") != null){ %>
                    <div class="alert alert alert-danger" role="alert">${msgListado}</div>    
                <% } %>
                
                <% if(session.getAttribute("msgPostOperacion") != null){ %>
                <p class="text-muted">${msgPostOperacion}</p>
                <% } %>
            </div>

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
                                    <a onclick="obtenerPorId(<%=tipoServicio.getIdTipoServicio()%>)" href="#"><span class="glyphicon glyphicon-refresh"></span></a>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                    <a onclick="eliminar(<%=tipoServicio.getIdTipoServicio()%>)" href="#"><span class="glyphicon glyphicon-remove"></span></a>
                                    </center>
                                </td>
                            </tbody>
                            <%  
                              }
                               }
                            %>
                        </table>
    
        </form>
    </div>
                        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>                  
    
    </body>
</html>
