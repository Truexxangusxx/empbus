<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnProducto').addClass('activo');
        IniciarPagina('pagListaProducto');
        $("#formBuscarProducto [name='Oproducto.idFamilia']").prepend("<option value='0' selected='selected'>&lt;Todos&gt;</option>");        
        
        $("#formNuevoProducto").validationEngine();
        $("#formEditarProducto").validationEngine();
    });

    function GrabarProducto(){
        $( "#divNuevoProducto" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoProducto").validationEngine('validate')){
                    var url = "GrabarProducto";
                    var data = $("#formNuevoProducto").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarProducto").serialize();
                            $.get("BuscarProducto", data, function(resultado){
                                $("#divListaProducto").html(resultado);
                                IniciarPagina('pagListaProducto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoProducto" ).dialog("close")
                    })
                    }
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            },
            close: function( event, ui ) {$(".formError").remove()}
        });
    }
    function BuscarProducto(){
        var url = "BuscarProducto";
        var data = $("#formBuscarProducto").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaProducto").html(resultado);
            IniciarPagina('pagListaProducto');
        });  
    }
    function EliminarProducto(idProducto){
        $( "#divEliminarProducto" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarProducto?Oproducto.idProducto="+idProducto;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarProducto").serialize();
                            $.get("BuscarProducto", data, function(resultado){
                                $("#divListaProducto").html(resultado);
                                IniciarPagina('pagListaProducto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarProducto" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarProducto(idProducto,Descripcion,Codigo,idTipoProducto,UmCompra,idUnidadMedidaCompra,UmConsumo,idUnidadMedidaConsumo,Conversion,idFamilia){
        $("#formEditarProducto input[name='Oproducto.idProducto']").val(idProducto);
        $("#formEditarProducto input[name='Oproducto.Descripcion']").val(Descripcion);
        $("#formEditarProducto input[name='Oproducto.Codigo']").val(Codigo);
        $("#formEditarProducto [name='Oproducto.idTipoProducto']").val(idTipoProducto);
        $("#formEditarProducto input[name='Oproducto.UmCompra']").val(UmCompra);
        $("#formEditarProducto [name='Oproducto.idUnidadMedidaCompra']").val(idUnidadMedidaCompra);
        $("#formEditarProducto input[name='Oproducto.UmConsumo']").val(UmConsumo);        
        $("#formEditarProducto [name='Oproducto.idUnidadMedidaConsumo']").val(idUnidadMedidaConsumo);
        $("#formEditarProducto input[name='Oproducto.Conversion']").val(Conversion);        
        $("#formEditarProducto [name='Oproducto.idFamilia']").val(idFamilia);
        
        $("#divEditarProducto").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarProducto").validationEngine('validate')){
                    var url = "EditarProducto";
                    var data = $("#formEditarProducto").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarProducto").serialize();
                            $.get("BuscarProducto", data, function(resultado){  
                                $("#divListaProducto").html(resultado);
                                IniciarPagina('pagListaProducto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarProducto" ).dialog("close")
                    })
                    }
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            },
            close: function( event, ui ) {$(".formError").remove()}
        });
    }      
    
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formBuscarProducto" theme="simple">
    <table>
        <tr>
            <td>Familia:</td>
            <td><s:select name="Oproducto.idFamilia" list="ListaFamilia" listKey="idFamilia" listValue="Descripcion" /></td>
        </tr>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Oproducto.Descripcion" onkeydown="Ejecutar(BuscarProducto);"/></td>
        </tr>
        <tr>
            <td><a href="#" onclick="GrabarProducto(); return false;"><img title="Agregar" width="40" height="40" src="../../images/Agregar.jpeg" /></a>
                <a href="#" onclick="BuscarProducto(); return false;"><img title="Buscar" width="40" height="40" src="../../images/Buscar.jpeg" /></a></td>
        </tr>
    </table>
</s:form>

<div id="pagListaProducto">
<div id="divListaProducto">
    <table class="tabla">
        <thead>
        <th>Familia</th>
        <th>Descripcion</th>
        <th>Tipo de Producto</th>
        <th>Codigo</th>
        <th>UM Compra</th>
        <th>UM Consumo</th>
        <th>Conversion</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaProducto">
                <tr>
                    <td><s:property value="DFamilia"/></td>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="DTipoProducto"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td><s:property value="UmCompra"/><s:property value="DUnidadMedidaCompra"/></td>
                    <td><s:property value="UmConsumo"/><s:property value="DUnidadMedidaConsumo"/></td>
                    <td><s:property value="Conversion"/></td>                    
                    <td align="center">
                        <a href="#" onclick="EditarProducto(<s:property value="idProducto"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>',<s:property value="idTipoProducto"/>,<s:property value="UmCompra"/>,<s:property value="idUnidadMedidaCompra"/>,<s:property value="UmConsumo"/>,<s:property value="idUnidadMedidaConsumo"/>,<s:property value="Conversion"/>,<s:property value="idFamilia"/>); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarProducto(<s:property value="idProducto"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoProducto" style="display: none;" title="Nuevo Producto">
    <s:form id="formNuevoProducto" theme="simple">
        <s:label value="Familia:"/>
        <s:select name="Oproducto.idFamilia" list="ListaFamilia" listKey="idFamilia" listValue="Descripcion" />
        <s:label value="Descripcion:"/>
        <s:textfield name="Oproducto.Descripcion" cssClass="validate[required]"/>        
        <s:label value="TipoProducto:"/>
        <s:select name="Oproducto.idTipoProducto" list="ListaTipoProducto" listKey="idTipoProducto" listValue="Descripcion" />
        <s:label value="UM Compra:"/>
        <s:textfield name="Oproducto.UmCompra"/><s:select name="Oproducto.idUnidadMedidaCompra" list="ListaUnidadMedida" listKey="idUnidadMedida" listValue="Descripcion" />
        <s:label value="UM Consumo:"/>
        <s:textfield name="Oproducto.UmConsumo"/><s:select name="Oproducto.idUnidadMedidaConsumo" list="ListaUnidadMedida" listKey="idUnidadMedida" listValue="Descripcion" />
        <s:label value="Conversion:"/>
        <s:textfield name="Oproducto.Conversion"/>
    </s:form>
</div>

<div id="divEliminarProducto" style="display: none;" title="Eliminar Producto">
    ¿Esta seguro de querer eliminar el Producto?
</div>

<div id="divEditarProducto" style="display: none;" title="Editar Producto">
    <s:form id="formEditarProducto" theme="simple">
        <s:hidden name="Oproducto.idProducto"/>
        <s:label value="Familia:"/>
        <s:select name="Oproducto.idFamilia" list="ListaFamilia" listKey="idFamilia" listValue="Descripcion" />
        <s:label value="Descripcion:"/>
        <s:textfield name="Oproducto.Descripcion" cssClass="validate[required]"/>        
        <s:label value="TipoProducto:"/>
        <s:select name="Oproducto.idTipoProducto" list="ListaTipoProducto" listKey="idTipoProducto" listValue="Descripcion" />
        <s:label value="UM Compra"/>
        <s:textfield name="Oproducto.UmCompra"/><s:select name="Oproducto.idUnidadMedidaCompra" list="ListaUnidadMedida" listKey="idUnidadMedida" listValue="Descripcion" />
        <s:label value="UM Consumo"/>
        <s:textfield name="Oproducto.UmConsumo"/><s:select name="Oproducto.idUnidadMedidaConsumo" list="ListaUnidadMedida" listKey="idUnidadMedida" listValue="Descripcion" />
        <s:label value="Conversion"/>
        <s:textfield name="Oproducto.Conversion"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />