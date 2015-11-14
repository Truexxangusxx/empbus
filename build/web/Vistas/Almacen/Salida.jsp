<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">
    
    $(document).ready(function () {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnSalida').addClass('activo');
        jQuery("#formNuevoSalida").validationEngine();
        
        $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy'});
        IniciarPagina('pagListaClienteProveedor');        
        $("#txtTotal").val($("#hdTotal").val());
        $("#hdidAlmacen").val($("#formNuevoSalida [name='Osalida.idAlmacen']").val());
        
                
        $("#txtDEmpleado").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarEmpleadoJson",
                    dataType: "json",
                    data: {"Oempleado.Nombre":request.term},
                    success: function(data) {
                        var datos = data.listaEmpleado;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.nombre,
                                id: item.idEmpleado
                            };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $('#hdidEmpleado').val(ui.item.id);
                $("#txtDEmpleado").val(ui.item.label);
            }
        });
        
        $("#txtDPedido").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarPedidoJson",
                    dataType: "json",
                    data: {"Opedido.Numero":request.term},
                    success: function(data) {
                        var datos = data.listaPedido;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.numero,
                                id: item.idPedido
                            };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $('#hdidPedido').val(ui.item.id);
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
    function AbrirPedido(){
        $( "#divBuscarPedido" ).dialog({
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
    function BuscarPedido(){
        var url = "BuscarPedido";
        var data = $("#formBuscarPedido").serialize();
        $.get(url,data, function(resultado){
            $("#divListaPedido").html(resultado);
            IniciarPagina('pagListaPedido');
        });  
    }
    function EnviarClienteProveedor(idClienteProveedor, RazonSocial, Ruc){
        $("#formNuevoSalida [name='Osalida.idClienteProveedor']").val(idClienteProveedor);
        $("#formNuevoSalida [name='Osalida.DClienteProveedor']").val(RazonSocial);        
        $( "#divBuscarClienteProveedor" ).dialog('close');
    }        
    function EnviarPedido(idPedido, Numero){
        $("#formNuevoSalida [name='Osalida.idPedido']").val(idPedido);
        $("#formNuevoSalida [name='Osalida.DPedido']").val(Numero);        
        $( "#divBuscarPedido" ).dialog('close');
        /*
        var url = "BuscarEstandarOP";
        var data = {"Oordenproduccion.idOrdenProduccion":idOrdenProduccion};
        $.getJSON(url,data, function(resultado){
            if (resultado.error) {
                Error(resultado.msg);
            }
            else{
                
            }
        });        
         */
    }        
    
    function ObtenerProducto(idProducto){
        var url = "ObtenerProducto?Oproducto.idProducto="+idProducto;
        $.getJSON(url, function(resultado){
            if (resultado.error == false){
                var prod = resultado.oproducto;
                $("#formAgregarDetalle [name='Osalidaproducto.Codigo']").val(prod.codigo);
                $("#formAgregarDetalle [name='Osalidaproducto.DUnidadMedida']").val(prod.DUnidadMedidaCompra);
                $("#formAgregarDetalle [name='Osalidaproducto.Precio']").val(prod.precio);
                $("#formAgregarDetalle [name='Osalidaproducto.DProducto']").val(prod.descripcion);
                $("#formAgregarDetalle [name='Osalidaproducto.Cantidad']").focus();
            }
            else{Error(resultado.msg);}            
        });  
    }    
    function GrabarSalida(){
        if($("#formNuevoSalida").validationEngine('validate')){
            var url = "GrabarSalida";
            var data = $("#formNuevoSalida").serialize();
            $.getJSON(url, data, function(resultado){
                if (resultado.error == false){                            
                    //Mensaje(resultado.msg);               
                    var datos = {"Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadSalida";
                    $("body").load(url, datos);
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
    function AgregarSalidaProducto(){
        $( "#divAgregarDetalle" ).dialog({
            height: 'auto',
            width: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "AgregarSalidaProducto";
                    var data = $("#formAgregarDetalle").serialize();
                    $.get(url,data, function(resultado){  
                        $("#divListaSalidaProducto").html(resultado);
                        limpiaForm($("#formAgregarDetalle"));
                        $("#formAgregarDetalle [name='Osalidaproducto.idProducto']").siblings('.ui-combobox').find('.ui-autocomplete-input').focus();
                        $("#txtTotal").val($("#hdTotal").val());
                    });  
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function QuitarSalidaProducto(index){
        var url = "QuitarSalidaProducto?index="+index;
        $.get(url, function(resultado){  
            $("#divListaSalidaProducto").html(resultado);
            $("#txtTotal").val($("#hdTotal").val());
        });  
    }
    function AsignarAlmacen(idAlmacen){
        $("#hdidAlmacen").val(idAlmacen);
    }
    function AbrirSalida(){
        limpiaForm("#formBuscarSalida");
        $("#formBuscarSalida [name='Osalida.idPedido']").val(0);
        $( "#divBuscarSalida" ).dialog({
            width:'auto'
        });
    }
    function BuscarSalida(){
        var url = "BuscarSalida";
        var data = $("#formBuscarSalida").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaSalida").html(resultado);
            IniciarPagina('pagListaSalida');
        });  
    }
    function EnviarSalida(idSalida){
        var url = "LoadSalida";
        var data = {"Osalida.idSalida":idSalida,"Operacion":'Edicion'};
        $('body').load(url, data);
    }
    function CambiarANuevo(){
        $("#formNuevoSalida [name='Operacion']").val('Nuevo');
        $("#formNuevoSalida [name='Osalida.Numero']").val('');
                  
    }
    function EliminarSalida(idSalida){
        $.getJSON('EliminarSalida', {"Osalida.idSalida":idSalida}, function(resultado){
                if (resultado.error == false){                            
                    var datos = {"Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadSalida";
                    $("body").load(url, datos);
                }
                else{Error(resultado.msg);}
        });
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formNuevoSalida" theme="simple">

    <s:hidden name="Osalida.idSalida"/>

    <table style="width: 80%;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarSalidaProducto(); return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarSalida(); return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirSalida(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="LoadSalida?Operacion=Nuevo"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="CambiarANuevo(); return false;"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="EliminarSalida(<s:property value="Osalida.idSalida"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="40px" height="40px"/></a>
                
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
                            <s:textfield name="Osalida.Numero" readonly="true" cssStyle="font-weight: bold;"/>
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
                                <s:textfield name="Osalida.Fecha" cssClass="datepicker"/>
                                <s:label value="Almacen:"/>
                                <s:select name="Osalida.idAlmacen" list="ListaAlmacen" listKey="idAlmacen" listValue="Descripcion" onchange="AsignarAlmacen(this.value);"/>

                            </td>
                            <td style="width: 50%">
                                <s:label value="Tipo de Movimiento:"/>
                                <s:select name="Osalida.idTipoMovimiento" list="ListaTipoMovimiento" listKey="idTipoMovimiento" listValue="Descripcion" />

                                <s:label value="Pedido:"/>
                                <s:textfield name="Osalida.DPedido" onclick="AbrirPedido(); return false;"/>
                                <s:hidden name="Osalida.idPedido"/>
                                <%--
                                <s:label value="Tipo de Cambio:"/>
                                <s:textfield name="Osalida.TipoCambio"/>
                                --%>
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
                                <%--
                                <s:label value="Responsable o Cliente:"/>
                                <s:textfield name="Osalida.DClienteProveedor" onclick="AbrirClienteProveedor(); return false;"/>
                                <s:hidden name="Osalida.idClienteProveedor"/>
                                
                                <s:label value="Moneda:"/>
                                <s:select name="Osalida.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" />
                                
                                <s:label value="Tipo de Cambio:"/>
                                <s:textfield name="Osalida.TipoCambioMoneda"/>
                                --%>
                                <s:label value="Responsable:"/>
                                <s:textfield id="txtDEmpleado" name="Osalida.empleado.Nombre" cssClass="validate[required]"/>
                                <s:hidden id="hdidEmpleado" name="Osalida.empleado.idEmpleado"/>
                                
                                <s:label value="Subdiario:"/>
                                <s:select name="Osalida.idSubdiario" list="ListaSubdiario" listKey="idSubdiario" listValue="Descripcion" />
                            </td>
                            <td style="width: 50%">



                            </td>
                        </tr>
                    </table>
                </div>
            </td>

        <tr>
        <tr>
            <td colspan="2">
                <s:label value="Observaciones:"/>
                <s:textarea name="Osalida.Observaciones" cols="130" cssClass="validate[required]"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">


                <div id="divListaSalidaProducto">
                    <table class="tabla">    
                        <thead>
                        <th>Item</th>
                        <th>Codigo</th>
                        <th>Descripcion</th>
                        <th>U.M.</th>
                        <th>Stock</th>
                        <th>Cantidad</th>
                        <th>Estandar</th>
                        <th>P. Unit</th>        
                        <th>Importe</th>
                        <th>Centro de Costo</th>
                        <th>Quitar</th>
                        </thead>
                        <tbody>
                            <s:iterator value="ListaSalidaProducto" status="row">
                                <tr>
                                    <td><s:property value="%{#row.index}"/></td>
                                    <td><s:property value="Codigo"/></td>
                                    <td><s:property value="DProducto"/></td>
                                    <td><s:property value="DUnidadMedida"/></td>
                                    <td><s:property value="Stock"/></td>
                                    <td><s:property value="Cantidad"/></td>
                                    <td><s:property value="Estandar"/></td>
                                    <td><s:property value="Precio"/></td>
                                    <td><s:property value="Importe"/></td>
                                    <td><s:property value="DCentroCosto"/></td>
                                    <td><a href="#" onclick="QuitarSalidaProducto(<s:property value="%{#row.index}"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>                    
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
        <s:hidden id="hdidAlmacen" name="Osalida.idAlmacen"/>
        <s:hidden name="Osalidaproducto.DProducto"/>
        <s:label value="Producto:"/>
        <s:select cssClass="combobox" name="Osalidaproducto.idProducto" list="ListaProducto" listKey="idProducto" listValue="Descripcion" onchange="ObtenerProducto(this.value); return false;"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Osalidaproducto.Codigo"/>        
        <s:label value="Unidad de Medida:"/>
        <s:textfield name="Osalidaproducto.DUnidadMedida"/>
        <s:label value="Precio Unitario:"/>
        <s:textfield name="Osalidaproducto.Precio"/>
        <s:label value="Cantidad:"/>
        <s:textfield name="Osalidaproducto.Cantidad"/>
        <s:label value="Centro de Costo:"/>
        <s:select cssClass="combobox" name="Osalidaproducto.idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion" />
    </s:form>
</div>


<div id="divBuscarPedido" style="display: none;" title="Buscar Pedido">
    <s:form id="formBuscarPedido" >
        <table>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Opedido.Numero" onkeypress="if(event.keyCode == 13){ BuscarPedido(); return false; }"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarPedido(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaPedido">    
        <div id="divListaPedido">
            <table class="tabla">
                <thead>
                <th>Pedido</th>
                <th>Fecha</th>
                <th>OP</th>
                <th>Centro de Costo</th>
                <th>Encargado</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaPedido">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="DOrdenProduccion"/></td>
                            <td><s:property value="DCentroCosto"/></td>
                            <td><s:property value="DEmpleado"/></td>
                            <td>
                                <a href="#" onclick="EnviarPedido(<s:property value="idPedido"/>);"><img title="Enviar" width="20" height="20" src="../../images/Derecha.jpeg"/></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaPedido'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaPedido'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaPedido'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaPedido'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>



<div id="divBuscarSalida" style="display: none;" title="Buscar Salidas de Almacen">
    <s:form id="formBuscarSalida" >
        <table>
            <tr><td>
                    <s:label value="Pedido:"/>
                </td>
                <td>
                    <s:textfield id="txtDPedido" name="Osalida.DPedido" />
                    <s:hidden id="hdidPedido" name="Osalida.idPedido" />
                </td></tr>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Osalida.Numero" onkeypress="if(event.keyCode == 13){ BuscarSalida(); return false; }"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarSalida(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaSalida">    
        <div id="divListaSalida">
            <table class="tabla">
                <thead>
                <th>Numero</th>
                <th>Fecha</th>
                <th>Pedido</th>
                <th>Tipo Movimiento</th>
                <th>Cliente</th>
                <th>Observaciones</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaSalida">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="DPedido"/></td>
                            <td><s:property value="DTipoMovimiento"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td><s:property value="Observaciones"/></td>
                            <td><a href="#" onclick="EnviarSalida(<s:property value="idSalida"/>); return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaSalida'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaSalida'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaSalida'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaSalida'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>


<jsp:include page="../MasterPage/Inferior.jsp" />