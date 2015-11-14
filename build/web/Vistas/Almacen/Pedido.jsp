<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnPedido').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoPedido").validationEngine();

        $("#txtDOrdenProduccion").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "BuscarOrdenProduccionJson",
                    dataType: "json",
                    data: {"Oordenproduccion.Numero": request.term},
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
                $('#txtDEmpleado').focus();

                var url = "BuscarEstandarOP";
                var data = {"Oordenproduccion.idOrdenProduccion": ui.item.id};
                $.getJSON(url, data, function(resultado) {
                    if (resultado.error) {
                        Error(resultado.msg);
                    }
                    else {

                    }
                });


            }
        });


        $("#txtDEmpleado").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "BuscarEmpleadoJson",
                    dataType: "json",
                    data: {"Oempleado.Nombre": request.term},
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
                $('#formNuevoPedido [name="Opedido.Observaciones"]').focus();
            }
        });

        $("#txtDProducto").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "BuscarProductoJson",
                    dataType: "json",
                    data: {"Oproducto.idFamilia": 0, "Oproducto.Descripcion": request.term},
                    success: function(data) {
                        var datos = data.listaProducto;
                        response($.map(datos, function(item) {
                            return {
                                label: item.descripcion,
                                id: item.idProducto,
                                codigo: item.codigo
                            };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $('#hdidProducto').val(ui.item.id);
                $("#hdCodigoProducto").val(ui.item.codigo);
                $("#txtCantidad").focus();
            }
        });



    });


    function AgregarPedidoProducto() {
        $("#divAgregarPedidoProducto").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "AgregarPedidoProducto";
                    var data = $("#formAgregarPedidoProducto").serialize();
                    $.get(url, data, function(resultado) {
                        $('#divListaPedidoProducto').html(resultado);
                        limpiaForm($('#formAgregarPedidoProducto'));
                        $('#txtDProducto').focus();
                    });
                },
                "Cancelar": function() {
                    $(this).dialog("close");
                }
            }
        });
    }
    function QuitarPedidoProducto(index) {
        var url = "QuitarPedidoProducto";
        var data = {"index": index};
        $.get(url, data, function(resultado) {
            $('#divListaPedidoProducto').html(resultado);
        });
    }
    function GrabarPedido() {
        if ($("#formNuevoPedido").validationEngine('validate')) {
            AbrirLoading();
            var url = "GrabarPedido";
            var data = $("#formNuevoPedido").serialize();
            var joperacion = $.getJSON(url, data, function(resultado) {
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else {
                    var Pedido = resultado.opedido;
                    $('#formNuevoPedido [name="Opedido.Numero"]').val(Pedido.numero);
                    $('#formNuevoPedido [name="Opedido.idPedido"]').val(Pedido.idPedido);
                    $('#formNuevoPedido [name="Opedido.Estado"]').val(Pedido.estado);
                    Mensaje(resultado.msg);
                }
            });

            joperacion.complete(function() {
                CerrarLoading();
            });
        }
    }
    function NuevoPedido() {
        var url = "LoadPedido";
        var data = {"Operacion": "Nuevo"};
        $('body').load(url, data);
    }
    function AbrirPedido() {
        $("#divBuscarPedido").dialog({height: 'auto', modal: true, width: 'auto'});
    }
    function BuscarPedido() {
        var url = "BuscarPedido";
        var data = $("#formBuscarPedido").serialize();
        $.get(url, data, function(resultado) {
            $('#divListaPedido').html(resultado);
        });
    }
    function EnviarPedido(id) {
        var url = "LoadPedido";
        var data = {"Operacion": "Edicion", "Opedido.idPedido": id};
        $('body').load(url, data);
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formNuevoPedido" theme="simple">

    <s:hidden name="Opedido.idPedido"/>

    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
               <a href="#" onclick="AgregarPedidoProducto();
                   return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                   <a href="#" onclick="GrabarPedido();
                       return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                   <a href="#" onclick="AbrirPedido();
                       return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="NuevoPedido();"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#"><img title="Aprobar" src="../../images/Aprobado.jpeg" width="40px" height="40px"/></a>
                <a href="#"><img title="Imprimir" src="../../images/Imprimir.jpeg" width="40px" height="40px"/></a>
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
                            <s:textfield name="Opedido.Numero" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Opedido.Estado" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
        <tr>   

            <td style="width: 50%" class="cuadro" colspan="2">
                <h3>Datos Generales</h3>
                <div>

                    <s:label value="Fecha:"/>
                    <s:textfield name="Opedido.Fecha" cssClass="datepicker"/>
                    <s:label value="Centro de Costo:"/>
                    <s:select name="Opedido.idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion" />
                    <s:label value="Orden de Produccion:"/>
                    <s:textfield id="txtDOrdenProduccion" name="Opedido.DOrdenProduccion" onchange="if(this.value == ''){$('#hdidOrdenProduccion').val(0);}" cssClass="validate[required]"/>
                    <s:hidden id="hdidOrdenProduccion" name="Opedido.idOrdenProduccion"/>
                    <s:label value="Encargado:"/>
                    <s:textfield id="txtDEmpleado" name="Opedido.DEmpleado" cssClass="validate[required]"/>
                    <s:hidden id="hdidEmpleado" name="Opedido.idEmpleado"/>

                </div>
            </td>


        <tr>
        <tr>
            <td colspan="2">
                <s:label value="Observaciones:"/>
                <s:textarea name="Opedido.Observaciones" cols="130" cssClass="validate[required]"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">


                <div id="divListaPedidoProducto">
                    <table class="tabla">    
                        <thead>
                        <th>Item</th>
                        <th>Codigo</th>
                        <th>Descripcion</th>
                        <th>Cantidad</th>
                        <th>Estandar</th>
                        <th>Glosa</th>
                        <th>Quitar</th>
                        </thead>
                        <tbody>
                            <s:iterator value="ListaPedidoProducto" status="row">
                                <tr>
                                    <td><s:property value="%{#row.index}"/></td>
                                    <td><s:property value="CodigoProducto"/></td>
                                    <td><s:property value="DProducto"/></td>
                                    <td><s:property value="Cantidad"/></td>
                                    <td><s:property value="Estandar"/></td>
                                    <td><s:property value="Glosa"/></td>
                                           <td><a href="#" onclick="QuitarPedidoProducto(<s:property value="%{#row.index}"/>);
                                               return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                </div>                


            </td>
        </tr>

    </table>


</s:form>


<div id="divAgregarPedidoProducto" style="display: none;" title="Agregar Articulo">
    <s:form id="formAgregarPedidoProducto" theme="simple">
        <s:label value="Producto:"/>
        <s:textfield id="txtDProducto" name="Opedidoproducto.DProducto"/>
        <s:hidden id="hdidProducto" name="Opedidoproducto.idProducto"/>
        <s:hidden id="hdCodigoProducto" name="Opedidoproducto.CodigoProducto"/>
        <s:label value="Cantidad:"/>
        <s:textfield id="txtCantidad" name="Opedidoproducto.Cantidad"/>
        <s:label value="Glosa:"/>
        <s:textfield name="Opedidoproducto.Glosa"/>
    </s:form>
</div>


<div id="divBuscarPedido" style="display: none;" title="Buscar Pedido">
    <s:form id="formBuscarPedido" theme="simple">

        <table>
            <tr>
                <td>Numero:</td>
                <td><s:textfield name="Opedido.Numero" onkeypress="if(event.keyCode == 13){ BuscarPedido(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                   <a href="#" onclick="BuscarPedido();
                       return false;"><img title="Buscar" width="40" height="40" src="../../images/Buscar.jpeg"/></a>
                </td>
            </tr>
        </table>
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
                       <td><a href="#" onclick="toleft('pagListaPedido');
                           return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                           <td><a href="#" onclick="left('pagListaPedido');
                               return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                           <td><a href="#" onclick="rigth('pagListaPedido');
                               return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                           <td><a href="#" onclick="torigth('pagListaPedido');
                               return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>

    </s:form>
</div>



<jsp:include page="../MasterPage/Inferior.jsp" />


