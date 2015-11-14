<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnIngreso').addClass('activo');
        
        jQuery("#formNuevoIngreso").validationEngine();
        $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy'});
        IniciarPagina('pagListaClienteProveedor');        
        $("#txtTotal").val($("#hdTotal").val());
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
    function AbrirOrdenCompra(){
        $( "#divBuscarOrdenCompra" ).dialog({
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
    function BuscarOrdenCompra(){
        var url = "BuscarOrdenCompra";
        var data = $("#formBuscarOrdenCompra").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaOrdenCompra").html(resultado);
            IniciarPagina('pagListaOrdenCompra');
        });  
    }
    function EnviarClienteProveedor(idClienteProveedor, RazonSocial, Ruc){
        $("#formNuevoIngreso [name='Oingreso.idClienteProveedor']").val(idClienteProveedor);
        $("#formNuevoIngreso [name='Oingreso.DClienteProveedor']").val(RazonSocial);        
        $( "#divBuscarClienteProveedor" ).dialog('close');
    }        
    
    
    function jsonConcat(o1, o2) {
        for (var key in o2) {
            o1[key] = o2[key];
        }
        return o1;
    }
    function EnviarOrdenCompra(idOrdenCompra, Numero){
        $("#formNuevoIngreso [name='Oingreso.idOrdenCompra']").val(idOrdenCompra);
        $("#formNuevoIngreso [name='Oingreso.DOrdenCompra']").val(Numero);
        $.getJSON("ObtenerOrdenCompra",{"Oordencompra.idOrdenCompra": idOrdenCompra}, function(resultado){
            var oc = resultado.oordencompra;
            $("#formNuevoIngreso [name='Oingreso.idClienteProveedor']").val(oc.idClienteProveedor);
            $("#formNuevoIngreso [name='Oingreso.DClienteProveedor']").val(oc.DClienteProveedor);
        });
        $( "#divBuscarOrdenCompra" ).dialog('close');
        
        $.get('ObtenerOrdenCompraProductoIngreso',{'Oingreso.idOrdenCompra':idOrdenCompra}, function(resultado){
            $("#divListaOrdenCompraProducto").html(resultado);            
        });
        $( "#divOrdenCompraProducto" ).dialog({width:'auto',modal: true,
            buttons: {
                "Continuar": function() {
                    
                    var ListaIngresoProducto={IngresoProducto:[]};
                    $("#divListaOrdenCompraProducto .tabla tbody tr").each(function (index) {
                        var DProducto, Codigo, DUnidadMedida, Precio, Cantidad, idCentroCosto, idProducto, DCentroCosto, Seleccionado;
                        $(this).children("td").each(function (index2) {
                            switch (index2) {
                                case 0:
                                    DProducto = $(this).text();
                                    idProducto = $(this).children('input').val();
                                    break;
                                case 1:
                                    Codigo = $(this).text();
                                    break;
                                case 2:
                                    DUnidadMedida = $(this).text();
                                    break;
                                case 3:
                                    Precio = $(this).text();
                                    break;
                                case 4:
                                    Cantidad = $(this).children("input").val();
                                    break;
                                case 5:
                                    idCentroCosto = $(this).children("[name='idCentroCosto']").val();
                                    DCentroCosto = $(this).children("select").find('option:selected').text();
                                    break;
                                case 6:
                                    Seleccionado = $(this).children("[name='Seleccionar']").prop('checked');
                                    break;
                            }
                        })                        
                        var IngresoProducto = {
                            DProducto: DProducto,
                            Codigo: Codigo,
                            DUnidadMedida: DUnidadMedida,
                            Precio: Precio,
                            Cantidad: Cantidad,
                            idCentroCosto: idCentroCosto,
                            idProducto: idProducto,
                            Importe: Cantidad*Precio,
                            DCentroCosto: DCentroCosto,
                            Seleccionado: Seleccionado
                        };
                        ListaIngresoProducto.IngresoProducto.push(IngresoProducto);
                    })
                    //alert($("#formNuevoIngreso [name='Oingreso.idAlmacen'] option:selected").text());
                    //alert('Lista: '+JSON.stringify(ListaIngresoProducto, null, 2));
                    //var data = {"ListaIngresoProducto":JSON.parse(JSON.stringify(ListaIngresoProducto.IngresoProducto, null, 5))};
                    
                    //var data = {};
                    var datos = "";
                    var contador = 0;
                    jQuery.each(ListaIngresoProducto.IngresoProducto, function(i, val) {                        /*var datos = eval(valor+"_arreglo[4]");
                        data = jsonConcat(data, {concat('ListaIngresoProducto[',i,'].DProducto') : val.DProducto});*/
                        if (val.Seleccionado){                        
                            if (contador == 0){
                                datos = datos + "?ListaIngresoProducto["+contador+"].idProducto="+val.idProducto
                                    +"&ListaIngresoProducto["+contador+"].DProducto="+val.DProducto
                                    +"&ListaIngresoProducto["+contador+"].Codigo="+val.Codigo
                                    +"&ListaIngresoProducto["+contador+"].DUnidadMedida="+val.DUnidadMedida
                                    +"&ListaIngresoProducto["+contador+"].Precio="+val.Precio
                                    +"&ListaIngresoProducto["+contador+"].idCentroCosto="+val.idCentroCosto
                                    +"&ListaIngresoProducto["+contador+"].Cantidad="+val.Cantidad
                                    +"&ListaIngresoProducto["+contador+"].Importe="+val.Importe
                                    +"&ListaIngresoProducto["+contador+"].DCentroCosto="+val.DCentroCosto
                            }
                            else{
                                datos = datos + "&ListaIngresoProducto["+contador+"].idProducto="+val.idProducto
                                    +"&ListaIngresoProducto["+contador+"].DProducto="+val.DProducto
                                    +"&ListaIngresoProducto["+contador+"].Codigo="+val.Codigo
                                    +"&ListaIngresoProducto["+contador+"].DUnidadMedida="+val.DUnidadMedida
                                    +"&ListaIngresoProducto["+contador+"].Precio="+val.Precio
                                    +"&ListaIngresoProducto["+contador+"].idCentroCosto="+val.idCentroCosto
                                    +"&ListaIngresoProducto["+contador+"].Cantidad="+val.Cantidad
                                    +"&ListaIngresoProducto["+contador+"].Importe="+val.Importe
                                    +"&ListaIngresoProducto["+contador+"].DCentroCosto="+val.DCentroCosto;
                            }
                            contador = contador + 1;
                        }
                    });
                    
                    /*
                    var data1 = {"ListaIngresoProducto[0].idIngresoProducto":1};
                    var data2 = {"ListaIngresoProducto[1].idIngresoProducto":2};
                    var output = {};
                    output = jsonConcat(output, data1);
                    output = jsonConcat(output, data2);*/
                    /*
                    $.getJSON("RecibirIngresoProducto"+datos, function(resultado){
                        alert(resultado.msg);
                    });
                     */              
                    $.get("RecibirIngresoProducto"+datos, function(resultado){  
                        $("#divListaIngresoProducto").html(resultado);                        
                    });
                    $(this).dialog( "close" );
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
                $("#formAgregarDetalle [name='Oingresoproducto.Codigo']").val(prod.codigo);
                $("#formAgregarDetalle [name='Oingresoproducto.DUnidadMedida']").val(prod.DUnidadMedidaCompra);
                $("#formAgregarDetalle [name='Oingresoproducto.Precio']").val(prod.precio);
                $("#formAgregarDetalle [name='Oingresoproducto.DProducto']").val(prod.descripcion);
                $("#formAgregarDetalle [name='Oingresoproducto.Cantidad']").focus();
            }
            else{Error(resultado.msg);}            
        });  
    }    
    function GrabarIngreso(){
        if($("#formNuevoIngreso").validationEngine('validate')){
            var url = "GrabarIngreso";
            var data = $("#formNuevoIngreso").serialize();
            $.getJSON(url, data, function(resultado){
                if (resultado.error == false){
                
                    var ingreso = resultado.oingreso;
                
                    var url = "LoadIngreso";
                    var data = {"Oingreso.idIngreso":ingreso.idIngreso, "Operacion":'Edicion', "msg":resultado.msg};
                    $('body').load(url,data);
                
                }
                else{Error(resultado.msg);}
            });
        }
    }
    function NuevoOrdenCompra(){
        var url = "LoadOrdenCompra";
        var data = {"Operacion":'Nuevo'};
        $('body').load(url, data)
    }    
    function AgregarIngresoProducto(){
        $( "#divAgregarDetalle" ).dialog({
            height: 'auto',
            width: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "AgregarIngresoProducto";
                    var data = $("#formAgregarDetalle").serialize();
                    $.get(url,data, function(resultado){  
                        $("#divListaIngresoProducto").html(resultado);
                        limpiaForm($("#formAgregarDetalle"));
                        $("#formAgregarDetalle [name='Oingresoproducto.idProducto']").siblings('.ui-combobox').find('.ui-autocomplete-input').focus();
                        $("#txtTotal").val($("#hdTotal").val());
                    });  
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function QuitarIngresoProducto(index){
        var url = "QuitarIngresoProducto?index="+index;
        $.get(url, function(resultado){  
            $("#divListaIngresoProducto").html(resultado);
            $("#txtTotal").val($("#hdTotal").val());
        });  
    }
    function AbrirIngreso(){
        $( "#divBuscarIngreso" ).dialog({
            width:'auto'
        });
    }
    function BuscarIngreso(){
        var url = "BuscarIngreso";
        var data = $("#formBuscarIngreso").serialize();
        $.get(url,data, function(resultado){
            $("#divListaIngreso").html(resultado);
            IniciarPagina('pagListaIngreso');
        });  
    }
    function EnviarIngreso(idIngreso){
        var url = "LoadIngreso";
        var data = {"Oingreso.idIngreso":idIngreso, "Operacion":'Edicion'};
        $('body').load(url,data);
    }    
    
    function Nuevo(){
        $("#formNuevoIngreso [name='Operacion']").val('Nuevo');
    }
    function EliminarIngreso(idIngreso){
        $.getJSON('EliminarIngreso', {"Oingreso.idIngreso":idIngreso}, function(resultado){
                if (resultado.error == false){                            
                    var datos = {"Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadIngreso";
                    $("body").load(url, datos);
                }
                else{Error(resultado.msg);}
        });
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formNuevoIngreso" theme="simple">

    <s:hidden name="Oingreso.idIngreso"/>

    <table style="width: 80%;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarIngresoProducto(); return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarIngreso(); return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirIngreso(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="LoadIngreso?Operacion=Nuevo"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="Nuevo(); return false;"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="EliminarIngreso(<s:property value="Oingreso.idIngreso"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="40px" height="40px"/></a>
            </td>
            <td style="width: 50%;">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Operacion:"/>
                            <s:textfield name="Operacion" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>
                            <s:label value="Numero:"/>
                            <s:textfield name="Oingreso.Numero" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>

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
                                <s:textfield name="Oingreso.Fecha" cssClass="datepicker"/>
                                <s:label value="Almacen:"/>
                                <s:select name="Oingreso.idAlmacen" list="ListaAlmacen" listKey="idAlmacen" listValue="Descripcion" />
                                <s:label value="Tipo de Movimiento:"/>
                                <s:select name="Oingreso.idTipoMovimiento" list="ListaTipoMovimiento" listKey="idTipoMovimiento" listValue="Descripcion" />
                                <s:label value="Proveedor:"/>
                                <s:textfield name="Oingreso.DClienteProveedor" onclick="AbrirClienteProveedor(); return false;"/>
                                <s:hidden name="Oingreso.idClienteProveedor"/>
                            </td>
                            <td style="width: 50%">
                                <s:label value="Subdiario:"/>
                                <s:select name="Oingreso.idSubdiario" list="ListaSubdiario" listKey="idSubdiario" listValue="Descripcion" />
                                <s:label value="Moneda:"/>
                                <s:select name="Oingreso.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" />
                                <s:label value="Orden de Compra:"/>
                                <s:textfield name="Oingreso.DOrdenCompra" onclick="AbrirOrdenCompra(); return false;"/>
                                <s:hidden name="Oingreso.idOrdenCompra"/>
                                <s:label value="Tipo de Cambio:"/>
                                <s:textfield name="Oingreso.TipoCambio" cssClass="validate[required]"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>


            <td style="width: 50%" class="cuadro">
                <h3>Datos Documento</h3>
                <div>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%">
                                <s:label value="Guia de Remision:"/>
                                <s:textfield name="Oingreso.GuiaRemision"/>
                                <s:label value="Factura:"/>
                                <s:textfield name="Oingreso.FacturaProveedor"/>
                                
                                
                            </td>
                            <td style="width: 50%">
                                <s:label value="Fecha del Documento:"/>
                                <s:textfield name="Oingreso.FechaDocumento" cssClass="datepicker validate[required]"/>
                                <%--<s:label value="Provision de la Compra:"/>
                                <s:textfield name="Oingreso.ProvisionCompra"/>
                                <s:label value="Tipo de Cambio:"/>
                                <s:textfield name="Oingreso.TipoCambioMoneda"/>--%>
                                <s:label value="Total:"/>
                                <s:textfield id="txtTotal" name="Oingreso.Monto2"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

        <tr>
        <tr>
            <td colspan="2">
                <s:label value="Observaciones:"/>
                <s:textarea name="Oingreso.Observaciones" cols="130" cssClass="validate[required]"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">


                <div id="divListaIngresoProducto">
                    <table class="tabla">    
                        <thead>
                        <th>Item</th>
                        <th>Codigo</th>
                        <th>Descripcion</th>
                        <th>U.M.</th>
                        <th>Cantidad</th>
                        <th>P. Unit</th>        
                        <th>Importe</th>
                        <th>Centro de Costo</th>
                        <th>Quitar</th>
                        </thead>
                        <tbody>
                            <s:iterator value="ListaIngresoProducto" status="row">
                                <tr>
                                    <td><s:property value="%{#row.index}"/></td>
                                    <td><s:property value="Codigo"/></td>
                                    <td><s:property value="DProducto"/></td>
                                    <td><s:property value="DUnidadMedida"/></td>
                                    <td><s:property value="Cantidad"/></td>
                                    <td><s:property value="Precio"/></td>
                                    <td><s:property value="Importe"/></td>
                                    <td><s:property value="DCentroCosto"/></td>
                                    <td><a href="#" onclick="QuitarIngresoProducto(<s:property value="%{#row.index}"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                    <s:hidden id="hdTotal" name="Oingreso.Monto"/>
                </div>                


            </td>
        </tr>

    </table>


</s:form>




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
        <s:hidden name="Oingresoproducto.DProducto"/>
        <s:label value="Producto:"/>
        <s:select cssClass="combobox" name="Oingresoproducto.idProducto" list="ListaProducto" listKey="idProducto" listValue="Descripcion" onchange="ObtenerProducto(this.value); return false;"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Oingresoproducto.Codigo"/>        
        <s:label value="Unidad de Medida:"/>
        <s:textfield name="Oingresoproducto.DUnidadMedida"/>
        <s:label value="Precio Unitario:"/>
        <s:textfield name="Oingresoproducto.Precio"/>
        <s:label value="Cantidad:"/>
        <s:textfield name="Oingresoproducto.Cantidad"/>
        <s:label value="Centro de Costo:"/>
        <s:select cssClass="combobox" name="Oingresoproducto.idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion" />
    </s:form>
</div>


<div id="divBuscarOrdenCompra" style="display: none;" title="Buscar Orden de Compra">
    <s:form id="formBuscarOrdenCompra" >
        <table>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Oordencompra.Numero" onkeypress="if(event.keyCode == 13){ BuscarOrdenCompra(); return false; }"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarOrdenCompra(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaOrdenCompra">    
        <div id="divListaOrdenCompra">
            <table class="tabla">
                <thead>
                <th>Numero</th>
                <th>Cliente</th>
                <th>Sucursal</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th>Operacion</th>
                </thead>
                <tbody>
                    <s:iterator value="ListaOrdenCompra">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td><s:property value="DSucursal"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="Estado"/></td>
                            <td><a href="#" onclick="EnviarOrdenCompra(<s:property value="idOrdenCompra"/>,'<s:property value="Numero"/>'); return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaOrdenCompra'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaOrdenCompra'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaOrdenCompra'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaOrdenCompra'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>



<div id="divBuscarIngreso" style="display: none;" title="Buscar Ingresos">
    <s:form id="formBuscarIngreso">
        <table>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Oingreso.Numero" onkeypress="if(event.keyCode == 13){ BuscarIngreso(); return false; }"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarIngreso(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaIngreso">    
        <div id="divListaIngreso">
            <table class="tabla">
                <thead>
                <th>Numero</th>
                <th>Fecha</th>
                <th>Almacen</th>
                <th>Movimiento</th>
                <th>Orden de Compra</th>
                <th>Proveedor</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaIngreso">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="DAlmacen"/></td>
                            <td><s:property value="DTipoMovimiento"/></td>
                            <td><s:property value="DOrdenCompra"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td>
                                <a href="#" onclick="EnviarIngreso(<s:property value="idIngreso"/>);"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a>
                            </td>                    
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaIngreso'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaIngreso'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaIngreso'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaIngreso'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>


<div id="divOrdenCompraProducto" style="display: none;" title="Lista de Articulos">
    <div id="divListaOrdenCompraProducto">
        <table class="tabla">
            <thead>
            <th>Producto</th>
            <th>Codigo</th>
            <th>UM</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Centro de Costo</th>
            <th>Seleccionar</th>
            </thead>
            <tbody>                
                <s:iterator value="ListaOrdenCompraProducto" status="row">
                    <tr>
                        <td><s:property value="DProducto"/><s:hidden name="idProducto"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td><s:property value="DUnidadMedida"/></td>
                        <td><s:property value="PrecioUnitario" /></td>
                        <td><s:select name="idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion" theme="simple"/></td>
                        <td><s:checkbox name="Seleccionar" theme="simple"/></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>        
    </div>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />