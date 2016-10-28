$(document).ready(function(){
    $('#buscarCliente').click(buscarClientes);
    $('#btnBuscarModal').click(buscarClientes);
    $('#txtDescripcionClienteModal').keyup(buscarClientes);
    
    $('#agregarRepuesto').click(buscarRepuesto);
    $('#btnBuscarModal2').click(buscarRepuesto);
    $('#txtDescripcionRepuestoModal').keyup(buscarRepuesto);
    
    $('#selectIdTipoComprobanteVenta').change(selectComprobantesVenta);
    
    /*Enfocar cuadro de texto del modal*/
    $('#modalAgregarCliente').on('shown.bs.modal', function () {
        $('#txtDescripcionClienteModal').focus();
    });
    $('#modalAgregarRepuesto').on('shown.bs.modal', function () {
        $('#txtDescripcionRepuestoModal').focus();
    });
});

/* BUSCA A LOS CLIENTE PARA MOSTRARLOS EN UNA VENTANA MODAL */
function buscarClientes(){
    var pag = $('#txtNroPaginaModal').val();
    var descripcion = $('#txtDescripcionClienteModal').val();
    
    if (pag==="" || descripcion !== ""){
        pag = 1;
        $('#txtNroPaginaModal').val(1);
    } else {
        Number(pag);
    }
    
    $('#txtDescripcionClienteModal').focus();
    $.ajax({
        type: 'POST',
        url: 'DetalleVentaControlador',
        data: 'accion=buscarCliente&desc='+descripcion+'&pag='+pag,
        success: function(datos){
            $('#tablaCliente tbody').remove();
            $('#paginacionModal li').remove();
            var pegados1 = datos.split("*");
            var pegados = pegados1[3].split(":");
            
            var pagina = parseInt(pegados1[0]);
            var nroPaginas = parseInt(pegados1[1]);
            var registrosPorPagina = parseInt(pegados1[2]);
            
            for(var i = 0; i < pegados.length-1; i++){
                var indice = ((pagina*registrosPorPagina)-registrosPorPagina)+i+1;
                var idCliente = pegados[i].split("_")[0];
                var nombres = pegados[i].split("_")[1];
                var apellidosRazonSocial = pegados[i].split("_")[2];
                var tipoCliente = pegados[i].split("_")[3];
                var tipoDocumento = pegados[i].split("_")[4];
                var nroDocumento = pegados[i].split("_")[5];
                $('#tablaCliente').append(
                '<tbody>'+
                '<td><center>' +indice + '</center></td>'+
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
            if( pagina=== 1){
                html+='<li class="disabled"><a href="" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
            }else{
                var paginaAtras = pagina-1;
                html+='<li><a href="#" onclick="buscarClientesPag('+paginaAtras+')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
            }
            for(var i=1; i <= nroPaginas; i++){
                if(pagina === i){       
                    html+='<li class="active"><a href="#">'+i+'</a></li>';
                }else{
                    html+='<li><a href="#" onclick="buscarClientesPag('+i+')">' +i+ '</a></li>';
                }
            }
            if(pagina === nroPaginas){ 
                html+='<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
            }else{ 
                var paginaAdelante = pagina+1;
                html+='<li><a href="#" onclick="buscarClientesPag('+paginaAdelante+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
            }
            $('#paginacionModal').append(html);
        }
    });
}

/* BUSCA LOS REPUESTOS PARA MOSTRARLOS EN UNA VENTANA MODAL */
function buscarRepuesto(){
    var pag = $('#txtNroPaginaModal2').val();
    var descripcion = $('#txtDescripcionRepuestoModal').val();
    
    if (pag==="" || descripcion !== ""){
        pag = 1;
        $('#txtNroPaginaModal2').val(1);
    } else {
        Number(pag);
    }
    
    var descripcion = $('#txtDescripcionRepuestoModal').val();
    $('#txtDescripcionRepuestoModal').focus();
    $.ajax({
        type: 'POST',
        url: 'DetalleVentaControlador',
        data: 'accion=buscarRepuesto&desc='+descripcion+'&pag='+pag,
        success: function(datos){
            $('#tablaRepuesto tbody').remove();
            $('#paginacionModal2 li').remove();
            var pegados1 = datos.split("*");
            var pegados = pegados1[3].split(":");
            
            var pagina = parseInt(pegados1[0]);
            var nroPaginas = parseInt(pegados1[1]);
            var registrosPorPagina = parseInt(pegados1[2]);
            
            for(var i = 0; i < pegados.length-1; i++){
                var indice = ((pagina*registrosPorPagina)-registrosPorPagina)+i+1;
                var idRepuesto = pegados[i].split("_")[0];
                var descripcion = pegados[i].split("_")[1];
                var stock = pegados[i].split("_")[2];
                var precio = pegados[i].split("_")[3];
                var PrecioXmayor = pegados[i].split("_")[4];
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
            if( pagina=== 1){
                html+='<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
            }else{
                var paginaAtras = pagina-1;
                html+='<li><a href="#" onclick="buscarRepuestoPag('+paginaAtras+')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
            }
            for(var i=1; i <= nroPaginas; i++){
                if(pagina === i){       
                    html+='<li class="active"><a href="#">'+i+'</a></li>';
                }else{
                    html+='<li><a href="#" onclick="buscarRepuestoPag('+i+')">' +i+ '</a></li>';
                }
            }
            if(pagina === nroPaginas){ 
                html+='<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
            }else{ 
                var paginaAdelante = pagina+1;
                html+='<li><a href="#" onclick="buscarRepuestoPag('+paginaAdelante+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
            }
            $('#paginacionModal2').append(html);
        }
    });
}

/* FUNCION QUE ASIGNA UN NRO DE PAGINA A UN CUADRO OCULTO Y LUGO LLAMA A LA FUNCIÓN buscarCliente (Ella detecta el nro de pagina para que se ubique la paginación) */
function buscarClientesPag(nro){
    $('#txtNroPaginaModal').val(nro);
    buscarClientes();
}

/* FUNCION QUE ASIGNA UN NRO DE PAGINA A UN CUADRO OCULTO Y LUGO LLAMA A LA FUNCIÓN buscarRepuesto (Ella detecta el nro de pagina para que se ubique la paginación) */
function buscarRepuestoPag(nro){
    $('#txtNroPaginaModal2').val(nro);
    buscarRepuesto();
}

/*INCLUYE UN CLIENTE EN LA VENTA*/
function incluirCliente(id){
    var apellido = $('#txtApellidoRazonSocialModal'+id).val();
    $('#txtIdCliente').val(id);
    $('#txtCliente').val(apellido);
    $('#modalAgregarCliente').modal('hide');
}

var arreglo;
arreglo = new Array();

/*INCLUYE REPUESTOS EN LA VENTA - Los incluye uno a uno, segun se vayan seleccionando*/
function incluirRepuesto(id){
    var descRepuesto = $('#txtDescripcion'+id).val();
    var stock = $('#txtStockModal'+id).val();
    var precio = parseFloat($('#txtPrecio'+id).val());
    var precioXmayor = parseFloat($('#txtPrecioXmayor'+id).val());
    var cantidad = $('#txtCantidad'+id).val();

    arreglo[id] = id;
    /*console.log(arreglo);*/

    $('#conjuntoRepuesto').append(
    '<!-- REPUESTO AGREGADO - INICIO -->'+
    '<div class="form-group" id="grupo'+id+'">'+
        '<div class="col-md-1 col-md-offset-1">'+
            '<br />'+
            '<label class="control-label" for="">Repuesto:</label>'+
        '</div>'+
        '<div class="col-md-5">'+
            '<br />'+
            '<input type="hidden" id="txtIdRepuesto'+id+'" value="'+id+'">'+
            '<input type="text" class="form-control" id="txtRepuesto'+id+'" placeholder="Repuesto" value="'+descRepuesto+'" disabled>'+
        '</div>'+
        '<div class="col-md-1">'+
            '<center>Cantidad:</center>'+
            '<input class="form-control" type="text" name="cantidad" id="txtCantidad'+id+'" value="1" />'+
        '</div>'+
        '<div class="col-md-2">'+
            '<center>Total:</center>'+
            '<div class="input-group">'+
                '<span class="input-group-addon" id="span'+id+'">S/</span>'+
                '<input type="hidden" id="txtPrecio'+id+'" value="'+precio+'" >'+
                '<input type="hidden" id="txtPrecioXmayor'+id+'" value="'+precioXmayor+'" >'+
                '<input type="text" class="form-control" id="txtTotal'+id+'" value="'+precio+'" disabled>'+
            '</div>'+
        '</div>'+
        '<div class="col-md-2">'+
            '<br />'+
            '<div class="input-group">'+
                '<a class="btn btn-link eliminar-producto" id="eliminar-Repuesto'+id+'" onclick="eliminarRepuesto('+id+')">'+
                    '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Eliminar'+
                '</a>'+
            '</div>'+
        '</div>'+
    '</div>'+
    '<!-- REPUESTO AGREGADO - FIN -->'
    );

    totales();

    $('#modalAgregarRepuesto').modal('hide');

    $('#frmMnt :input').keyup('change',function(){
        var id = $(this).attr("id").substr(11);
        var cantidad = parseInt($('#txtCantidad'+id).val());
        
        var precio = parseFloat($('#txtPrecio'+id).val());
        var precioXmayor = parseFloat($('#txtPrecioXmayor'+id).val());

        var resul = 0;
        if(cantidad >= 3){
            resul = parseFloat(cantidad*precioXmayor);
            $('#span'+id).addClass('porMayor');
        } else {
            resul = parseFloat(cantidad*precio);
            $('#span'+id).removeClass('porMayor');
        }
        $('#txtTotal'+id).val(resul);
        totales();
    });


}

var total;
/* CALCULA EL TOTAL DE LAS VENTAS A PARTIR DE UN ARREGLO */
function totales(){
    total = 0;
    arreglo.forEach(function(item){
       total += Number($('#txtTotal'+item).val());
    });
    $('#txtSubTotalGeneral').val((total-(total*0.18)).toFixed(2));
    $('#txtIgvGeneral').val((total*0.18).toFixed(2));
    $('#txtTotalGeneral').val(total.toFixed(2));
    console.log(arreglo);
    console.log(total);
}


/* ELIMINA UN REPUESTO DE LA VENTA */
function eliminarRepuesto(id){
    $('#grupo'+id).remove();
    delete arreglo[id];
    totales();
}

function selectComprobantesVenta(){
    var valor = $('#selectIdTipoComprobanteVenta').val();
    console.log(valor);
    
    if(valor == 1){
        $('#txtNumeroBoleta').addClass('txtNumero');
        $('#txtNumeroFactura').removeClass('txtNumero');
        $('#txtNumeroBoleta').attr('type','text');
        $('#txtNumeroFactura').attr('type','hidden');
    }else{
        $('#txtNumeroBoleta').removeClass('txtNumero');
        $('#txtNumeroFactura').addClass('txtNumero');
        $('#txtNumeroBoleta').attr('type','hidden');
        $('#txtNumeroFactura').attr('type','text');        
    }
}

function insertar(){
    var i = 0;
    var detalle = "";
    arreglo.forEach(function(item){
        i = i + 1;
        var cantidad = $('#txtCantidad'+item).val();
        var total = $('#txtTotal'+item).val();
        var precio;
        if(cantidad >= 3){
            precio = $('#txtPrecioXmayor'+item).val();
        }else{
            precio = $('#txtPrecio'+item).val();
        }
        detalle += "&id"+i+"="+ item + "&cantidad"+i+"=" + cantidad + "&precio"+i+"=" + precio + "&total"+i+"=" + total;
    });

    var idCliente = document.getElementById("txtIdCliente").value;
    var idEmpleado = document.getElementById("txtIdEmpleado").value;
    var tipoComprobante = document.getElementById("selectIdTipoComprobanteVenta").value;
    var nroDocumento = $('.txtNumero').val();
    var fecha = document.getElementById("txtFecha").value;
    var descripcion = document.getElementById("txtDescripcion").value;
    var importe = document.getElementById("txtTotalGeneral").value;

    if(idCliente === ""){
        alert("Todos los campos son obligatorios.");
    }else{
        document.frmMnt.action = "DetalleVentaControlador?accion=insertar&tamano=" + i + detalle + "&idCliente="
                + idCliente + "&idEmpleado=" + idEmpleado + "&tipoComprobante=" + tipoComprobante + "&nroDocumento="
                + nroDocumento + "&fecha=" + fecha + "&descripcion=" + descripcion + "&importe=" + importe;
        document.frmMnt.submit();
    }
}

function cancelar(){
    document.location = "DetalleVentaControlador?accion=buscar";
}