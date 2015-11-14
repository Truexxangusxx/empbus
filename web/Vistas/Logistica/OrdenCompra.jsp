<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnOrdenCompra').addClass('activo');
        IniciarPagina('pagListaAlmacen');
        jQuery("#formNuevoOrdenCompra").validationEngine();
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        IniciarPagina('pagListaClienteProveedor');
        ObtenerTipoCambio();
        $("#tabs").tabs();

    });

    function handleEnter(field, event) {
        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        if (keyCode == 13) {
            var i;
            for (i = 0; i < field.form.elements.length; i++)
                if (field == field.form.elements[i])
                    break;
            i = (i + 1) % field.form.elements.length;
            field.form.elements[i].focus();
            return false;
        }
        else
            return true;
    }

    function AbrirClienteProveedor() {
        $("#divBuscarClienteProveedor").dialog({
            width: 'auto'
        });
    }
    function BuscarClienteProveedor() {
        var url = "BuscarClienteProveedorCotizacion";
        var data = $("#formBuscarClienteProveedor").serialize();
        $.get(url, data, function(resultado) {
            $("#divListaClienteProveedor").html(resultado);
            IniciarPagina('pagListaClienteProveedor');
        });
    }
    function EnviarClienteProveedor(idClienteProveedor, RazonSocial, Ruc) {
        $("#formNuevoOrdenCompra [name='Oordencompra.idClienteProveedor']").val(idClienteProveedor);
        $("#formNuevoOrdenCompra [name='Oordencompra.DClienteProveedor']").val(RazonSocial);
        $("#lblRuc").text("  Ruc: " + Ruc);
        $("#divBuscarClienteProveedor").dialog('close');
    }
    function ObtenerTipoCambio() {
        if ($("#formNuevoOrdenCompra [name='Oordencompra.idMoneda']").val() != $("#formNuevoOrdenCompra [name='Oordencompra.idMonedaCobra']").val()) {
            var url = "ObtenerTipoCambio?Otipocambio.idMonedaPago=" + $("#formNuevoOrdenCompra [name='Oordencompra.idMoneda']").val() + "&Otipocambio.idMonedaCobra=" + $("#formNuevoOrdenCompra [name='Oordencompra.idMonedaCobra']").val();
            $.getJSON(url, function(resultado) {
                if (resultado.error == false) {
                    $("#formNuevoOrdenCompra [name='Oordencompra.TipoCambio']").val(resultado.valor);
                }
                else {
                    Error(resultado.msg);
                }
            });
        }
        else {
            $("#formNuevoOrdenCompra [name='Oordencompra.TipoCambio']").val(1);
        }
    }
    function AgregarOrdenCompraProducto() {
        $("#divAgregarDetalle").dialog({
            height: 'auto',
            width: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "AgregarOrdenCompraProducto";
                    var data = $("#formAgregarDetalle").serialize();
                    $.get(url, data, function(resultado) {
                        $("#divListaOrdenCompraProducto").html(resultado);
                        limpiaForm($("#formAgregarDetalle"));
                        $("#formAgregarDetalle [name='Oordencompraproducto.idProducto']").siblings('.ui-combobox').find('.ui-autocomplete-input').focus();
                        $("#txtTotal").val($("#hdTotal").val());
                        ObtenerSubtotal();
                    });
                },
                "Cancelar": function() {
                    $(this).dialog("close");
                }
            }
        });
    }
    function ObtenerProducto(idProducto) {
        var url = "ObtenerProducto?Oproducto.idProducto=" + idProducto;
        $.getJSON(url, function(resultado) {
            if (resultado.error == false) {
                var prod = resultado.oproducto;
                $("#formAgregarDetalle [name='Oordencompraproducto.Codigo']").val(prod.codigo);
                $("#formAgregarDetalle [name='Oordencompraproducto.DUnidadMedida']").val(prod.DUnidadMedidaCompra);
                $("#formAgregarDetalle [name='Oordencompraproducto.PrecioUnitario']").val(prod.precio);
                $("#formAgregarDetalle [name='Oordencompraproducto.DProducto']").val(prod.descripcion);
                $("#formAgregarDetalle [name='Oordencompraproducto.Cantidad']").focus();
            }
            else {
                Error(resultado.msg);
            }
        });
    }
    function QuitarOrdenCompraProducto(index) {
        var url = "QuitarOrdenCompraProducto?index=" + index;
        $.get(url, function(resultado) {
            $("#divListaOrdenCompraProducto").html(resultado);
            $("#txtTotal").val($("#hdTotal").val());
            ObtenerSubtotal();
        });
    }
    function GrabarOrdenCompra() {
        if ($("#formNuevoOrdenCompra").validationEngine('validate')) {
            var url = "GrabarOrdenCompra";
            var data = $("#formNuevoOrdenCompra").serialize();
            $.getJSON(url, data, function(resultado) {
                if (resultado.error == false) {
                    //Mensaje(resultado.msg);
                    var OrdenCompra = resultado.oordencompra;
                    var url = "LoadOrdenCompra";
                    var data = {"Operacion": 'Edicion', "msg": resultado.msg, "OordenCompra.idOrdenCompra": OrdenCompra.idOrdenCompra};
                    $('body').load(url, data)
                }
                else {
                    Error(resultado.msg);
                }
            })
        }
    }
    function NuevoOrdenCompra() {
        var url = "LoadOrdenCompra";
        var data = {"Operacion": 'Nuevo'};
        $('body').load(url, data)
    }
    function AprobarOrdenCompra() {
        var url = "AprobarOrdenCompra";
        var data = $("#formNuevoOrdenCompra").serialize();
        $.getJSON(url, data, function(resultado) {
            if (resultado.error == false) {
                //Mensaje(resultado.msg);
                var OrdenCompra = $("#formNuevoOrdenCompra [name='Oordencompra.idOrdenCompra']").val();
                var url = "LoadOrdenCompra";
                var data = {"Operacion": 'Edicion', "msg": resultado.msg, "OordenCompra.idOrdenCompra": OrdenCompra};
                $('body').load(url, data)
            }
            else {
                Error(resultado.msg);
            }
        })
    }
    function AbrirOrdenCompra() {
        $("#divBuscarOrdenCompra").dialog({
            width: 'auto'
        });
    }
    function BuscarOrdenCompra() {
        var url = "BuscarOrdenCompra";
        var data = $("#formBuscarOrdenCompra").serialize();
        $.get(url, data, function(resultado) {
            $("#divListaOrdenCompra").html(resultado);
            IniciarPagina('pagListaOrdenCompra');
        });
    }
    function EnviarOrdenCompra(idOrdenCompra, Numero) {
        var url = "LoadOrdenCompra";
        var data = {"Operacion": 'Edicion', "Oordencompra.idOrdenCompra": idOrdenCompra};
        $('body').load(url, data)
    }
    function ObtenerSubtotal(){
        var afecto = $("#formNuevoOrdenCompra [name='Oordencompra.Afecto']").prop('checked');
        var total = parseFloat($("#formNuevoOrdenCompra [name='Oordencompra.Total']").val());
        var igv = parseFloat($("#formNuevoOrdenCompra [name='Oordencompra.IGV']").val());
        if (afecto){
            $("#formNuevoOrdenCompra [name='Oordencompra.Subtotal']").val(total*(100-igv)/100);
        }
        else{
            $("#formNuevoOrdenCompra [name='Oordencompra.Subtotal']").val(total);
        }
        
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formNuevoOrdenCompra" theme="simple">

    <s:hidden name="Oordencompra.idOrdenCompra"/>

    <table style="width: 80%;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarOrdenCompraProducto();
        return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarOrdenCompra();
        return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirOrdenCompra();
        return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="NuevoOrdenCompra();
        return false;"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AprobarOrdenCompra();
        return false;"><img title="Aprobar" src="../../images/Aprobado.jpeg" width="40px" height="40px"/></a>
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
                            <s:textfield name="Oordencompra.Numero" readonly="true"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Oordencompra.Estado" readonly="true"/>
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
                                <s:textfield name="Oordencompra.Fecha" cssClass="datepicker validate[required]"/>
                                <s:label value="Sucursal:"/>
                                <s:select name="Oordencompra.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
                                <s:label value="Forma de Pago:"/>
                                <s:select name="Oordencompra.idFormaPago" list="ListaFormaPago" listKey="idFormaPago" listValue="Descripcion" />
                            </td>
                            <td style="width: 50%">
                                <s:label value="Fecha de Entrega:"/>
                                <s:textfield name="Oordencompra.FechaEntrega" cssClass="datepicker validate[required]"/>                    
                                <s:label value="Proveedor:"/><s:label cssClass="float: right;" id="lblRuc"/><s:hidden name="Oordencompra.idClienteProveedor"/>
                                <s:textfield name="Oordencompra.DClienteProveedor" readonly="true" onclick="AbrirClienteProveedor(); return false;" cssClass="validate[required]"/>
                                <s:label value="Afecto:"/>
                                <s:checkbox name="Oordencompra.Afecto" label="Afecto:" onchange="ObtenerSubtotal(); return false;"/>
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
                                <s:select name="Oordencompra.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                                <s:label value="Tipo de Cambio:"/>
                                <s:textfield name="Oordencompra.TipoCambio" cssClass="validate[required]"/>
                                <s:label value="Moneda Cobro:"/>
                                <s:select name="Oordencompra.idMonedaCobra" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                            </td>
                            <td style="width: 50%">

                                <s:label value="IGV:"/>
                                <s:textfield name="Oordencompra.IGV" cssClass="validate[required]"/>
                                <s:label value="Subtotal:"/>
                                <s:textfield name="Oordencompra.Subtotal" onclick="ObtenerSubtotal(); return false;" cssClass="validate[required]"/>
                                <s:label value="Total:"/>
                                <s:textfield id="txtTotal" name="Oordencompra.Total"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

        <tr>
        <tr>
            <td colspan="2">
                <s:label value="Observaciones:"/>
                <s:textarea name="Oordencompra.Observaciones" cols="130" cssClass="validate[required]"/>
            </td>
        </tr>


    </table>


</s:form>

<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Detalle del Documento</a></li>
        <li><a href="#tabs-2">Referencias</a></li>
    </ul>
    <div id="tabs-1">

        <div id="divListaOrdenCompraProducto">
            <table class="tabla">    
                <thead>
                <th>Item</th>
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
                    <s:iterator value="ListaOrdenCompraProducto" status="row">
                        <tr>
                            <td><s:property value="%{#row.index}"/></td>
                            <td><s:property value="Codigo"/></td>
                            <td><s:property value="DProducto"/></td>
                            <td><s:property value="DUnidadMedida"/></td>
                            <td><s:property value="Cantidad"/></td>
                            <td><s:property value="PrecioUnitario"/></td>
                            <td><s:property value="Descuento"/></td>
                            <td><s:property value="Importe"/></td>
                            <td><s:property value="Glosa"/></td>
                            <td><a href="#" onclick="QuitarOrdenCompraProducto(<s:property value="%{#row.index}"/>);
        return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
            <s:hidden id="hdTotal" name="Oordencompra.Total"/>
        </div>

    </div>
    <div id="tabs-2">
        <table class="tabla">    
            <thead>
            <th>Numero Ingreso</th>
            <th>Articulo</th>
            <th>Codigo</th>
            <th>Cantidad</th>
            <th>Fecha</th>
            <th>Sucursal</th>
            <th>Almacen</th>
            </thead>
            <tbody>
                <s:iterator value="ListaReferenciaCompra">
                    <tr>
                        <td><s:property value="Numero"/></td>
                        <td><s:property value="DProducto"/></td>
                        <td><s:property value="CodigoProducto"/></td>
                        <td><s:property value="Cantidad"/></td>
                        <td><s:property value="Fecha"/></td>
                        <td><s:property value="DSucursal"/></td>
                        <td><s:property value="DAlmacen"/></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
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
                    <a href="#" onclick="BuscarClienteProveedor();
        return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
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
                                    <a href="#" onclick="EnviarClienteProveedor(<s:property value="idClienteProveedor"/>, '<s:property value="RazonSocial"/>', '<s:property value="Ruc"/>');
        return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>

            <table>
                <tr>
                    <td><a href="#" onclick="toleft('pagListaClienteProveedor');
        return false;"><img width="40" height="40" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaClienteProveedor');
        return false;"><img width="40" height="40" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 30px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaClienteProveedor');
        return false;"><img width="40" height="40" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaClienteProveedor');
        return false;"><img width="40" height="40" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>
    </s:form>
</div>


<div id="divAgregarDetalle" style="display: none;" title="Agregar Item">
    <s:form id="formAgregarDetalle">
        <s:hidden name="Oordencompraproducto.DProducto"/>
        <s:label value="Producto:"/>
        <s:select cssClass="combobox" name="Oordencompraproducto.idProducto" list="ListaProducto" listKey="idProducto" listValue="Descripcion" onchange="ObtenerProducto(this.value); return false;"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Oordencompraproducto.Codigo"/>        
        <s:label value="Unidad de Medida:"/>
        <s:textfield name="Oordencompraproducto.DUnidadMedida"/>
        <s:label value="Precio Unitario:"/>
        <s:textfield name="Oordencompraproducto.PrecioUnitario"/>
        <s:label value="Cantidad:"/>
        <s:textfield name="Oordencompraproducto.Cantidad" onkeypress="return handleEnter(this, event)"/>        
        <s:label value="Descuento:"/>
        <s:textfield name="Oordencompraproducto.Descuento" onkeypress="return handleEnter(this, event)"/>
        <s:label value="Glosa:"/>
        <s:textarea name="Oordencompraproducto.Glosa" rows="3" cols="50"/>
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
                    <a href="#" onclick="BuscarOrdenCompra();
        return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaOrdenCompra">    
        <div id="divListaOrdenCompra">
            <table>
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
                            <td><a href="#" onclick="EnviarOrdenCompra(<s:property value="idOrdenCompra"/>, '<s:property value="Numero"/>');
        return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaOrdenCompra');
        return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaOrdenCompra');
        return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaOrdenCompra');
        return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaOrdenCompra');
        return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>            


<jsp:include page="../MasterPage/Inferior.jsp" />