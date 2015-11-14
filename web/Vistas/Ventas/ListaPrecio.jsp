<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />
<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnListaPrecio').addClass('activo');
        IniciarPagina('pagListaListaPrecio');
        
        $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
        $("#bloqueado *").attr("disabled", "disabled").off('click');
        
        
        $("#txtDProducto").autocomplete({
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
                                id: item.idProducto
                            };
                        }));
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                $('#hdidProducto').val(ui.item.id);
            }
        });
        
        $("#txtDProductoNuevo").autocomplete({
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
                                id: item.idProducto
                            };
                        }));
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                $('#hdidProductoNuevo').val(ui.item.id);
                salto($("#txtDProductoNuevo"));
            }
        });
        
        
    });    

    function GrabarListaPrecio(){        
        $( "#divNuevoListaPrecio" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarListaPrecio";
                    var data = $("#formNuevoListaPrecio").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarListaPrecio").serialize();
                            $.get("BuscarListaPrecio", data, function(resultado){  
                                $("#divListaListaPrecio").html(resultado);
                                IniciarPagina('pagListaListaPrecio');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoListaPrecio" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function BuscarListaPrecio(){
        var url = "BuscarListaPrecio";
        var data = $("#formBuscarListaPrecio").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaListaPrecio").html(resultado);
            IniciarPagina('pagListaListaPrecio');
        });  
    }
    function EliminarListaPrecio(idListaPrecio){
        $( "#divEliminarListaPrecio" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarListaPrecio?Olistaprecio.idListaPrecio="+idListaPrecio;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarListaPrecio").serialize();
                            $.get("BuscarListaPrecio", data, function(resultado){  
                                $("#divListaListaPrecio").html(resultado);
                                IniciarPagina('pagListaListaPrecio');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarListaPrecio" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarListaPrecio(idListaPrecio,idProducto,Precio,TipoCambio,Fecha,Estado){        
        $("#formEditarListaPrecio [name='Olistaprecio.idListaPrecio']").val(idListaPrecio);
        
        $("#formEditarListaPrecio [name='Olistaprecio.idProducto']").val(idProducto);
        $("#formEditarListaPrecio [name='Olistaprecio.idProducto']").siblings('.ui-combobox').find('.ui-autocomplete-input').val($("#formEditarListaPrecio [name='Olistaprecio.idProducto'] option:selected").text());
       
        $("#formEditarListaPrecio [name='Olistaprecio.Precio']").val(Precio);
        $("#formEditarListaPrecio [name='Olistaprecio.TipoCambio']").val(TipoCambio);
        $("#formEditarListaPrecio [name='Olistaprecio.Fecha']").val(Fecha);
        $("#formEditarListaPrecio [name='Olistaprecio.Estado']").prop('checked', Estado);
                
        $("#divEditarListaPrecio").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarListaPrecio";
                    var data = $("#formEditarListaPrecio").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarListaPrecio").serialize();
                            $.get("BuscarListaPrecio", data, function(resultado){  
                                $("#divListaListaPrecio").html(resultado);
                                IniciarPagina();
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarListaPrecio" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formBuscarListaPrecio" theme="simple">
    <table>
        <tr>
            <td>Producto:</td>
            <%--<td><s:select id="cboProducto" cssClass="combobox" name="Olistaprecio.IdProducto" list="ListaProducto" listKey="idProducto" listValue="Descripcion"/></td>--%>
        </tr>
        <tr>
            <td>
                <s:textfield id="txtDProducto" name="Olistaprecio.DProducto" onkeydown="Ejecutar(BuscarListaPrecio);"/>
                <s:hidden id="hdidProducto" name="Olistaprecio.IdProducto"/>
            </td>
        </tr>
        <tr>
            <td>Inactivo:
                <s:checkbox name="Olistaprecio.Estado" label="Inactivo"/></td>
        </tr>
    </table>
    <a href="#" onclick="GrabarListaPrecio(); return false;"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
    <a href="#" onclick="BuscarListaPrecio(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
    </s:form>

<div id="pagListaListaPrecio">
    <div id="divListaListaPrecio">
        <table class="tabla">
            <thead>
            <th>Producto</th>
            <th>Precio</th>
            <th>Tipo de Cambio</th>
            <th>Fecha</th>
            <th>Estado</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaListaPrecio">
                    <tr>
                        <td><s:property value="DProducto"/></td>
                        <td><s:property value="Precio"/></td>
                        <td><s:property value="TipoCambio"/></td>
                        <td><s:property value="Fecha"/></td>
                        <td><s:property value="Estado"/></td>
                        <td align="center">
                            <a href="#" onclick="EditarListaPrecio(<s:property value="idListaPrecio"/>,<s:property value="idProducto"/>,<s:property value="Precio"/>,<s:property value="TipoCambio"/>,'<s:property value="Fecha"/>',<s:property value="Estado"/>); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a href="#" onclick="EliminarListaPrecio(<s:property value="idFamilia"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaListaPrecio'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaListaPrecio'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaListaPrecio'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaListaPrecio'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoListaPrecio" style="display: none;" title="Nuevo Precio">
    <s:form id="formNuevoListaPrecio" theme="simple">
        <s:label value="Producto:"/>
        <%--<s:select cssClass="combobox" name="Olistaprecio.idProducto" list="ListaProducto" listKey="idProducto" listValue="Descripcion" paso="1" onchange="salto($(this));"/>--%>
        <s:textfield id="txtDProductoNuevo" name="Olistaprecio.DProducto"  paso="1"/>
        <s:hidden id="hdidProductoNuevo" name="Olistaprecio.IdProducto"/>
        <s:label value="Precio:"/>
        <s:textfield name="Olistaprecio.Precio" paso="2" onkeydown="salto($(this));"/>
        <s:label value="Tipo de Cambio:"/>
        <s:textfield name="Olistaprecio.TipoCambio" paso="3" onkeydown="salto($(this));"/>        
        <s:label value="Fecha:"/>
        <s:textfield name="Olistaprecio.Fecha" cssClass="datepicker" paso="4" onkeydown="BotonDialog($(this));"/>
    </s:form>
</div>

<div id="divEliminarListaPrecio" style="display: none;" title="Eliminar Precio">
    ¿Esta seguro de querer eliminar este Precio?
</div>

<div id="divEditarListaPrecio" style="display: none;" title="Editar Precio">
    <s:form id="formEditarListaPrecio" theme="simple">
        <s:hidden name="Olistaprecio.idListaPrecio"/>
        <s:label value="Producto:"/>
        <div id="bloqueado"><s:select cssClass="combobox" name="Olistaprecio.idProducto" list="ListaProducto" listKey="idProducto" listValue="Descripcion"/></div>
        <s:hidden name="Olistaprecio.idProducto"/>
        <s:label value="Precio:"/>
        <s:textfield name="Olistaprecio.Precio"  paso="1" onkeydown="salto($(this));"/>
        <s:label value="Tipo de Cambio:"/>
        <s:textfield name="Olistaprecio.TipoCambio"  paso="2" onkeydown="salto($(this));"/>        
        <s:label value="Fecha:"/>
        <s:textfield name="Olistaprecio.Fecha" cssClass="datepicker" paso="3" onkeydown="BotonDialog($(this));"/>
        <s:checkbox name="Olistaprecio.Estado" label="Inactivo"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />