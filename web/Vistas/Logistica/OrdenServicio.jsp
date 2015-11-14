<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />


<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnOrdenServicio').addClass('activo');
        IniciarPagina('pagListaAlmacen');
        
        $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy'});
        $( "#tabs" ).tabs();
        IniciarPagina('pagListaClienteProveedor');
        ObtenerTipoCambio();     
        

        $("#divAyuda a").click(function(){
            $("#divAyuda").fadeOut(400);
        });
        

        $("#productos").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarProductoJson",
                    dataType: "json",
                    data: {"Oproducto.idFamilia":0,"Oproducto.Descripcion":request.term},
                    success: function(data) {
                        var datos = data.listaProducto;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.descripcion,
                                id: item.idProducto,
                                codigo: item.codigo,
                                unidadmedida : item.DUnidadMedidaCompra,
                                precio : item.precio
                            };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $('#hdidProducto').val(ui.item.id);
                $("#formAgregarDetalle  [name='Oordenservicioproducto.Codigo']").val(ui.item.codigo);
                $("#formAgregarDetalle  [name='Oordenservicioproducto.DUnidadMedida']").val(ui.item.unidadmedida);
                $("#formAgregarDetalle  [name='Oordenservicioproducto.PrecioUnitario']").val(ui.item.precio);
                $("#formAgregarDetalle  [name='Oordenservicioproducto.Cantidad']").focus();
            }
        });
        
        $("#acOrdenProduccion").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarOrdenProduccionJson",
                    dataType: "json",
                    data: {"Oordenproduccion.Numero":request.term},
                    success: function(data) {
                        var datos = data.listaOrdenProduccion;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.numero,
                                id: item.idOrdenProduccion
                            };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $('#hdidOrdenProduccion').val(ui.item.id);
                $('#productos').focus();
            }
        });

        
        
    });    

    function handleEnter (field, event) {
        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        if (keyCode == 13) {
            var i;
            for (i = 0; i <field.form.elements.length; i++)
                if (field == field.form.elements[i])
                    break;
            i = (i + 1) % field.form.elements.length;
            field.form.elements[i].focus();
            return false;
        }
        else
            return true;
    }     
    function AbrirClienteProveedor(){
        $( "#divBuscarClienteProveedor" ).dialog({
            width:'auto'
        });
    }
    function BuscarClienteProveedor(){
        var url = "BuscarClienteProveedorCotizacion";
        var data = $("#formBuscarClienteProveedor").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaClienteProveedor").html(resultado);
            IniciarPagina('pagListaClienteProveedor');
        });  
    }    
    function EnviarClienteProveedor(idClienteProveedor, RazonSocial, Ruc){
        $("#formNuevoOrdenServicio [name='Oordenservicio.idClienteProveedor']").val(idClienteProveedor);
        $("#formNuevoOrdenServicio [name='Oordenservicio.DClienteProveedor']").val(RazonSocial);
        $( "#lblRuc" ).text("  Ruc: "+Ruc);
        $( "#divBuscarClienteProveedor" ).dialog('close');
    }    
    function ObtenerTipoCambio(){
        if ($("#formNuevoOrdenServicio [name='Oordenservicio.idMoneda']").val() != $("#formNuevoOrdenServicio [name='Oordenservicio.idMonedaCobra']").val()){
            var url = "ObtenerTipoCambio?Otipocambio.idMonedaPago="+$("#formNuevoOrdenServicio [name='Oordenservicio.idMoneda']").val()+"&Otipocambio.idMonedaCobra="+$("#formNuevoOrdenServicio [name='Oordenservicio.idMonedaCobra']").val();
            $.getJSON(url, function(resultado){
                if (resultado.error == false){
                    $("#formNuevoOrdenServicio [name='Oordenservicio.TipoCambio']").val(resultado.valor);
                }
                else{Error(resultado.msg);}
            });  
        }
        else {$("#formNuevoOrdenServicio [name='Oordenservicio.TipoCambio']").val(1);}
    }    
    function AgregarOrdenServicioProducto(){
        $( "#divAgregarDetalle" ).dialog({
            height: 'auto',
            width: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "AgregarOrdenServicioProducto";
                    var data = $("#formAgregarDetalle").serialize();                    
                    $.get(url,data, function(resultado){  
                        $("#divListaOrdenServicioProducto").html(resultado);
                        limpiaForm($("#formAgregarDetalle"));
                        $("#txtTotal").val($("#hdTotal").val());
                        ObtenerSubtotal();
                        $("#acOrdenProduccion").focus();
                    });  
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function ObtenerProducto(idProducto){
        var url = "ObtenerProducto?Oproducto.idProducto="+idProducto;
        $.getJSON(url, function(resultado){
            if (resultado.error == false){
                var prod = resultado.oproducto;
                $("#formNuevoOrdenServicio  [name='Oordenservicioproducto.Codigo']").val(prod.codigo);
                $("#formNuevoOrdenServicio  [name='Oordenservicioproducto.DUnidadMedida']").val(prod.DUnidadMedidaCompra);
                $("#formNuevoOrdenServicio  [name='Oordenservicioproducto.PrecioUnitario']").val(prod.precio);
                $("#formNuevoOrdenServicio  [name='Oordenservicioproducto.DProducto']").val(prod.descripcion);
                $("#formNuevoOrdenServicio  [name='Oordenservicioproducto.Cantidad']").focus();
            }
            else{Error(resultado.msg);}            
        });  
    }
    function QuitarOrdenServicioProducto(index){
        var url = "QuitarOrdenServicioProducto?index="+index;
        $.get(url, function(resultado){  
            $("#divListaOrdenServicioProducto").html(resultado);
            $("#txtTotal").val($("#hdTotal").val());
            ObtenerSubtotal();
        });  
    }
    function GrabarOrdenServicio(){
        var url = "GrabarOrdenServicio";
        var data = $("#formNuevoOrdenServicio").serialize();
        $.getJSON(url, data, function(resultado){
            if (resultado.error == false){                            
                //Mensaje(resultado.msg);
                var OrdenServicio = resultado.oordenservicio;
                var url = "LoadOrdenServicio";
                var data = {"Operacion":'Edicion',"msg":resultado.msg,"OordenServicio.idOrdenServicio":OrdenServicio.idOrdenServicio};
                $('body').load(url, data)
            }
            else{Error(resultado.msg);}
        })
    }
    function NuevoOrdenServicio(){
        var url = "LoadOrdenServicio";
        var data = {"Operacion":'Nuevo'};
        $('body').load(url, data)
    }
    function AprobarOrdenServicio(){
        var url = "AprobarOrdenServicio";
        var data = $("#formNuevoOrdenServicio").serialize();
        $.getJSON(url, data, function(resultado){
            if (resultado.error == false){                            
                //Mensaje(resultado.msg);
                var OrdenServicio = $("#formNuevoOrdenServicio [name='Oordenservicio.idOrdenServicio']").val();
                var url = "LoadOrdenServicio";
                var data = {"Operacion":'Edicion',"msg":resultado.msg,"Oordenservicio.idOrdenServicio":OrdenServicio};
                $('body').load(url, data)
            }
            else{Error(resultado.msg);}
        })
    }
    function AbrirOrdenServicio(){
        $( "#divBuscarOrdenServicio" ).dialog({height: 'auto',modal: true,width: 'auto'});
    }
    function BuscarOrdenServicio(){
        var url = "BuscarOrdenServicio";
        var data = $("#formBuscarOrdenServicio").serialize();
        $.get(url, data, function(resultado){
            $("#divListaOrdenServicio").html(resultado);
            IniciarPagina('pagListaOrdenServicio');
        });  
    }
    function EnviarOrdenServicio(id,Numero){
        var url = "LoadOrdenServicio";
        var data = {"Operacion":'Edicion',"Oordenservicio.idOrdenServicio":id};
        $('body').load(url, data)
    }
    function ObtenerSubtotal(){
        var afecto = $("#formNuevoOrdenServicio [name='Oordenservicio.Afecto']").prop('checked');
        var total = parseFloat($("#formNuevoOrdenServicio [name='Oordenservicio.Monto']").val());
        var igv = parseFloat($("#formNuevoOrdenServicio [name='Oordenservicio.IGV']").val());
         if (afecto){
            $("#formNuevoOrdenServicio [name='Oordenservicio.Subtotal']").val(total*(100-igv)/100);
         }
         else{
             $("#formNuevoOrdenServicio [name='Oordenservicio.Subtotal']").val(total);
         }
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formNuevoOrdenServicio" theme="simple">

    <s:hidden name="Oordenservicio.idOrdenServicio"/>

    <table style="width: 85%;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarOrdenServicioProducto(); return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarOrdenServicio(); return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirOrdenServicio(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="NuevoOrdenServicio(); return false;"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AprobarOrdenServicio(); return false;"><img title="Aprobar" src="../../images/Aprobado.jpeg" width="40px" height="40px"/></a>
            </td>
            <td style="width: 50%;">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Operacion:"/>
                            <s:textfield name="Operacion" readonly="true"/>
                        </td>
                        <td>
                            <s:label value="Numero:"/>
                            <s:textfield name="Oordenservicio.Numero" readonly="true"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Oordenservicio.Estado" readonly="true"/>
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
        <tr>   

            <td style="width: 50%" class="cuadro">
                <h3>Datos Generales</h3>
                <div>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%">
                                <s:label value="Fecha:"/>
                                <s:textfield name="Oordenservicio.Fecha" cssClass="datepicker"/>
                                <s:label value="Sucursal:"/>
                                <s:select name="Oordenservicio.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
                                <s:label value="Forma de Pago:"/>
                                <s:select name="Oordenservicio.idFormaPago" list="ListaFormaPago" listKey="idFormaPago" listValue="Descripcion" />

                            </td>
                            <td style="width: 50%">
                                <s:label value="Fecha de Entrega:"/>
                                <s:textfield name="Oordenservicio.FechaEntrega" cssClass="datepicker"/>                    
                                <s:label value="CentroCosto:"/>
                                <s:select name="Oordenservicio.idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion" />
                                <s:label value="Proveedor:"/><s:hidden name="Oordenservicio.idClienteProveedor"/>
                                <s:textfield name="Oordenservicio.DClienteProveedor" readonly="true" onclick="AbrirClienteProveedor(); return false;"/>
                                <s:hidden cssClass="float: right;" id="lblRuc"/>
                                <s:label value="Afecto:"/>
                                <s:checkbox name="Oordenservicio.Afecto" label="Afecto:" onchange="ObtenerSubtotal(); return false;"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>


            <td style="width: 50%" class="cuadro">
                <h3>Datos Financieros</h3>
                <div>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%">
                                <s:label value="Moneda Pago:"/>
                                <s:select name="Oordenservicio.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                                <s:label value="Tipo de Cambio:"/>
                                <s:textfield name="Oordenservicio.TipoCambio"/>
                                <s:label value="Moneda Cobro:"/>
                                <s:select name="Oordenservicio.idMonedaCobra" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                            </td>
                            <td style="width: 50%">

                                <s:label value="IGV:"/>
                                <s:textfield name="Oordenservicio.IGV"/>
                                <s:label value="Subtotal:"/>
                                <s:textfield name="Oordenservicio.Subtotal" cssClass="validate[required]" onclick="ObtenerSubtotal(); return false;"/>
                                <s:label value="Total:"/>
                                <s:textfield id="txtTotal" name="Oordenservicio.Monto"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

        <tr>
        <tr>
            <td colspan="2">
                <s:label value="Observaciones:"/>
                <s:textarea name="Oordenservicio.Observaciones" cols="130"/>
            </td>
        </tr>

    </table>


</s:form>

<div id="tabs" style="width: 85%;">
    <ul>
        <li><a href="#tabs-1">Detalle del Documento</a></li>
        <li><a href="#tabs-2">Provisiones</a></li>
    </ul>
    <div id="tabs-1">

        <div id="divListaOrdenServicioProducto">
            <table class="tabla">    
                <thead>
                <th>Item</th>
                <th>OP</th>
                <th>Codigo</th>
                <th>Descripcion</th>
                <th>U.M.</th>
                <th>Cantidad</th>
                <th>P. Unit</th>
                <th>% Descuento</th>
                <th>Importe</th>
                <th>Glosa</th>
                <th>Quitar</th>
                </thead>
                <tbody>
                    <s:iterator value="ListaOrdenServicioProducto" status="row">
                        <tr>
                            <td><s:property value="%{#row.index}"/></td>
                            <td><s:property value="DOrdenProduccion"/></td>
                            <td><s:property value="Codigo"/></td>
                            <td><s:property value="DProducto"/></td>
                            <td><s:property value="DUnidadMedida"/></td>
                            <td><s:property value="Cantidad"/></td>
                            <td><s:property value="PrecioUnitario"/></td>
                            <td><s:property value="Descuento"/></td>
                            <td><s:property value="Importe"/></td>
                            <td><s:property value="Glosa"/></td>
                            <td><a href="#" onclick="QuitarOrdenServicioProducto(<s:property value="%{#row.index}"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
            <s:hidden id="hdTotal" name="Oordenservicio.Monto"/>
        </div>

    </div>
    <div id="tabs-2">
        Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.
    </div>    
</div>


<div id="divBuscarClienteProveedor" style="display: none;" title="Buscar Cliente">
    <s:form id="formBuscarClienteProveedor" theme="simple">
        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Oclienteproveedor.RazonSocial" onkeypress="if(event.keyCode == 13){ BuscarClienteProveedor(); return false; }"/></td>
            </tr>
            <tr>
                <td>RUC:</td>
                <td><s:textfield name="Oclienteproveedor.Ruc" onkeypress="if(event.keyCode == 13){ BuscarClienteProveedor(); return false; }"/></td>
            </tr>
            <tr>
                <td>
                    <a href="#" onclick="BuscarClienteProveedor(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
                <td></td>
            </tr>
        </table>
        <div id="pagListaClienteProveedor">
            <div id="divListaClienteProveedor">
                <table class="tabla">
                    <thead>
                    <th>Razon Social</th>
                    <th>Ruc</th>
                    <th>Dni</th>
                    <th>Telefono1</th>
                    <th>Telefono2</th>
                    <th>Direccion</th>
                    <th>Correo</th>
                    <th>Contacto</th>
                    <th>Operacion</th>
                    </thead>
                    <tbody class="ParaPaginar">
                        <s:iterator value="ListaClienteProveedor">
                            <tr>
                                <td><s:property value="RazonSocial"/></td>
                                <td><s:property value="Ruc"/></td>
                                <td><s:property value="Dni"/></td>
                                <td><s:property value="Telefono1"/></td>
                                <td><s:property value="Telefono2"/></td>
                                <td><s:property value="Direccion"/></td>
                                <td><s:property value="Correo"/></td>
                                <td><s:property value="Contacto"/></td>
                                <td align="center">
                                    <a href="#" onclick="EnviarClienteProveedor(<s:property value="idClienteProveedor"/>,'<s:property value="RazonSocial"/>','<s:property value="Ruc"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>

            <table>
                <tr>
                    <td><a href="#" onclick="toleft('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 30px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>
    </s:form>
</div>


<div id="divAgregarDetalle" style="display: none;" title="Agregar Item">
    <s:form id="formAgregarDetalle">
        <s:label value="Orden Produccion:"/>
        <s:textfield id="acOrdenProduccion" name="Oordenservicioproducto.DOrdenProduccion"/>
        <s:hidden id="hdidOrdenProduccion" name="Oordenservicioproducto.idOrdenProduccion"/>
        <s:label value="Producto:"/>
        <s:textfield id="productos" name="Oordenservicioproducto.DProducto"/>
        <s:hidden id="hdidProducto" name="Oordenservicioproducto.idProducto"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Oordenservicioproducto.Codigo"/>        
        <s:label value="Unidad de Medida:"/>
        <s:textfield name="Oordenservicioproducto.DUnidadMedida"/>
        <s:label value="Precio Unitario:"/>
        <s:textfield name="Oordenservicioproducto.PrecioUnitario"/>
        <s:label value="Cantidad:"/>
        <s:textfield name="Oordenservicioproducto.Cantidad" onkeypress="return handleEnter(this, event)"/>
        <s:label value="Descuento:"/>
        <s:textfield name="Oordenservicioproducto.Descuento" onkeypress="return handleEnter(this, event)"/>
        <s:label value="Glosa:"/>
        <s:textarea name="Oordenservicioproducto.Glosa" rows="3" cols="50"/>
    </s:form>
</div>

<div id="divAyuda" style="display: none;" title="Agregar Item">
    <div class="ui-widget-shadow ui-corner-all" style="width: 215px; height: 385px; position: absolute; bottom: 75px; right: 5px;"></div>
    <div style="position: absolute; width: 200px; height: 370px;bottom: 80px; right: 10px; padding: 10px;" class="ui-widget ui-widget-content ui-corner-all">
        <a href="#" style="float: right;">cerrar</a>
        <div class="ui-dialog-content ui-widget-content" style="background: none; border: 0;">
            <p>aca va la ayuda.</p>
        </div>
    </div>
</div>



<div id="divBuscarOrdenServicio" style="display: none;" title="Buscar Orden de Servicio">
    <s:form id="formBuscarOrdenServicio">

        <table>
            <tr>
                <td>Numero:</td>
                <td><s:textfield name="Oordenservicio.Numero" onkeypress="if(event.keyCode == 13){ BuscarOrdenServicio(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarOrdenServicio(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaOrdenServicio">
        <div id="divListaOrdenServicio">
            <table class="tabla">
                <thead>
                <th>Orden Servicio</th>
                <th>Fecha</th>
                <th>Fecha de Entrega</th>
                <th>Monto</th>
                <th>Proveedor</th>
                <th>Sucursal</th>
                <th>Centro de Costo</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaOrdenServicio">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="FechaEntrega"/></td>
                            <td><s:property value="Monto"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td><s:property value="DSucursal"/></td>
                            <td><s:property value="DCentroCosto"/></td>
                            <td>
                                <a href="#" onclick="EnviarOrdenServicio(<s:property value="idOrdenServicio"/>); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaOrdenServicio'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaOrdenServicio'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaOrdenServicio'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaOrdenServicio'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>        



<jsp:include page="../MasterPage/Inferior.jsp" />