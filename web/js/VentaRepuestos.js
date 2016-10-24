$(document).ready(function(){
    $('#buscarCliente').click(buscarClientes);
    $('#btnBuscarModal').click(buscarClientes);
    
    $('#agregarRepuesto').click(buscarRepuesto);
    $('#btnBuscarModal2').click(buscarRepuesto);
    
    function buscarClientes(){
        var descripcion = $('#txtDescripcionModal').val();
        $('#txtDescripcionModal').focus();
        $.ajax({
            type: 'POST',
            url: 'DetalleVentaControlador',
            data: 'accion=buscarCliente&desc='+descripcion,
            success: function(datos){
                $('#tablaCliente tbody').remove();
                $('#paginacionModal li').remove();
                var pegados1 = datos.split("*");
                var pegados = pegados1[2].split(":");
                for(var i = 0; i < pegados.length-1; i++){
                    var indice = i+1;
                    var idCliente = pegados[i].split("-")[0];
                    var nombres = pegados[i].split("-")[1];
                    var apellidosRazonSocial = pegados[i].split("-")[2];
                    var tipoCliente = pegados[i].split("-")[3];
                    var tipoDocumento = pegados[i].split("-")[4];
                    var nroDocumento = pegados[i].split("-")[5];
                    $('#tablaCliente').append(
                    '<tbody>'+
                    '<td><center>' + indice + '</center></td>'+
                    '<td>' + nombres + '</td>'+
                    '<td>' + '<input type="hidden" id="txtApellidoRazonSocialModal'+idCliente+'" value="'+ apellidosRazonSocial +'" />' + apellidosRazonSocial + '</td>'+
                    '<td>' + tipoCliente + '</td>'+
                    '<td>' + tipoDocumento + '</td>'+
                    '<td>' + nroDocumento + '</td>'+
                    '<td>'+
                        '<center>'+
                        '<table>'+
                            '<tr>'+
                                '<td class="td-acciones-editar">'+
                                    '<button class="btn btn-success" onclick="incluirCliente('+ idCliente +')">'+
                                        '<span class="glyphicon glyphicon-ok"></span>'+
                                    '</button>'+
                                '</td>'+
                            '</tr>'+
                        '</table>'+
                        '</center>'+
                    '</td>'+
                    '<tbody>'
                    );
                }
                
                var html = "";
                var pagina = parseInt(pegados1[0]);
                var nroPaginas = parseInt(pegados1[1]);
                if( pagina=== 1){
                    html+='<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
                }else{
                    var paginaAtras = pagina-1;
                    html+='<li><a href="#" onclick="buscarPag('+paginaAtras+')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
                }
                for(var i=1; i <= nroPaginas; i++){
                    if(pagina === i){       
                        html+='<li class="active"><a href="#">'+i+'</a></li>';
                    }else{
                        html+='<li><a href="#" onclick="buscarPag('+i+')">' +i+ '</a></li>';
                    }
                }
                if(pagina === nroPaginas){ 
                    html+='<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
                }else{ 
                    var paginaAdelante = pagina+1;
                    html+='<li><a href="#" onclick="buscarPag('+paginaAdelante+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
                }
                $('#paginacionModal').append(html);
            }
        });
    }
    
    function buscarRepuesto(){
        var descripcion = $('#txtDescripcionRepuestoModal').val();
        $('#txtDescripcionRepuestoModal').focus();
        $.ajax({
            type: 'POST',
            url: 'DetalleVentaControlador',
            data: 'accion=buscarRepuesto&desc='+descripcion,
            success: function(datos){
                $('#tablaRepuesto tbody').remove();
                $('#paginacionModal2 li').remove();
                var pegados1 = datos.split("*");
                var pegados = pegados1[2].split(":");
                for(var i = 0; i < pegados.length-1; i++){
                    var indice = i+1;
                    var idRepuesto = pegados[i].split("-")[0];
                    var descripcion = pegados[i].split("-")[1];
                    var stock = pegados[i].split("-")[2];
                    var precio = pegados[i].split("-")[3];
                    var PrecioXmayor = pegados[i].split("-")[4];
                    $('#tablaRepuesto').append(
                    '<tbody>'+
                    '<td><center>' + indice + '</center></td>'+
                    '<td>' + '<input type="hidden" id="txtDescripcion'+idRepuesto+'" value="'+ descripcion +'" />' + descripcion + '</td>'+
                    '<td>' + '<input type="hidden" id="txtStockModal'+idRepuesto+'" value="'+ stock +'" />' + stock + '</td>'+
                    '<td>' + '<input type="hidden" id="txtPrecio'+idRepuesto+'" value="'+ precio +'" />' + precio + '</td>'+
                    '<td>' + '<input type="hidden" id="txtPrecioXmayor'+idRepuesto+'" value="'+ PrecioXmayor +'" />' + PrecioXmayor + '</td>'+
                    '<td>'+
                        '<center>'+
                        '<table>'+
                            '<tr>'+
                                '<td class="td-acciones-editar">'+
                                    '<button class="btn btn-success" onclick="incluirRepuesto('+ idRepuesto +')">'+
                                        '<span class="glyphicon glyphicon-ok"></span>'+
                                    '</button>'+
                                '</td>'+
                            '</tr>'+
                        '</table>'+
                        '</center>'+
                    '</td>'+
                    '<tbody>'
                    );
                }
                
                var html = "";
                var pagina = parseInt(pegados1[0]);
                var nroPaginas = parseInt(pegados1[1]);
                if( pagina=== 1){
                    html+='<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
                }else{
                    var paginaAtras = pagina-1;
                    html+='<li><a href="#" onclick="buscarPag('+paginaAtras+')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
                }
                for(var i=1; i <= nroPaginas; i++){
                    if(pagina === i){       
                        html+='<li class="active"><a href="#">'+i+'</a></li>';
                    }else{
                        html+='<li><a href="#" onclick="buscarPag('+i+')">' +i+ '</a></li>';
                    }
                }
                if(pagina === nroPaginas){ 
                    html+='<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
                }else{ 
                    var paginaAdelante = pagina+1;
                    html+='<li><a href="#" onclick="buscarPag('+paginaAdelante+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
                }
                $('#paginacionModal2').append(html);
             
                
            }
        });
    }
    
});










