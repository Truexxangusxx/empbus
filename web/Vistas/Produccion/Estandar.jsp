<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnEstandar').addClass('activo');
        
        
        $("#txtDProductoPrincipal").autocomplete({
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
                $('#hdidProductoPrincipal').val(ui.item.id);
                $("#hdCodigoProductoPrincipal").val(ui.item.codigo);                
                
                var url = "BuscarEstandar";
                var data = {"Oestandar.idProductoPrincipal":ui.item.id};
                $.get(url,data, function(resultado){
                    $("#divListaEstandar").html(resultado);
                });  
                
            }
        });
        
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
                $("#hdCodigoProducto").val(ui.item.codigo);
                $("#txtCantidad").focus();
            }
        });
        
        
        
    });    
    
    function AgregarProducto(){
        $( "#divAgregarProducto" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "AgregarEstandar";
                    var data = $(".formNuevoEstandar").serialize();
                    $.get(url,data, function(resultado){
                        $("#divListaEstandar").html(resultado);
                        limpiaForm($("#formAgregarEstandar"));
                        $("#txtDProducto").focus();
                    });  
                },
                "Cancelar": function() {
                    $(this).dialog( "close" );
                }
            }
        });
    }
    function QuitarEstandar(index){
        var url = "QuitarEstandar";
        var data = {"index":index};
        $.get(url,data, function(resultado){
            $("#divListaEstandar").html(resultado);
        });  
    }
    function GrabarEstandar(){
        var url = "GrabarEstandar";
        $.getJSON(url, function(resultado){
            if (resultado.error == false){
                Mensaje(resultado.msg);
            }
            else{Error(resultado.msg);}
        });  
    }
</script>

<jsp:include page="Menu.jsp" />
<br/>

<s:form cssClass="formNuevoEstandar" theme="simple">
    <table>
        <tr>
            <td>
                <s:label value="Producto Principal:"/>
                <s:textfield id="txtDProductoPrincipal" name="Oestandar.DProductoPrincipal" />
                <s:hidden id="hdidProductoPrincipal" name="Oestandar.idProductoPrincipal"/>
                <s:hidden id="hdCodigoProductoPrincipal" name="Oestandar.CodigoProductoPrincipal"/>
            </td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="AgregarProducto(); return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarEstandar(); return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>

</s:form>

<div id="divAgregarProducto" style="display: none;" title="Agregar Producto">
    <s:form id="formAgregarEstandar" cssClass="formNuevoEstandar" theme="simple" method="post">
        <s:label value="Producto:" />
        <s:textfield id="txtDProducto" name="Oestandar.DProducto" />
        <s:hidden id="hdidProducto" name="Oestandar.idProducto" />
        <s:hidden id="hdCodigoProducto" name="Oestandar.CodigoProducto" />
        <s:label value="Cantidad:" />
        <s:textfield id="txtCantidad" name="Oestandar.Cantidad" />
    </s:form>
</div>

<div id="divListaEstandar">
    <table class="tabla">
        <thead>
        <th>Codigo</th>
        <th>Producto Principal</th>
        <th>Cantidad</th>
        <th>Codigo</th>
        <th>Producto</th>
        <th>Operacion</th>
        </thead>
        <tbody>
            <s:iterator value="ListaEstandar" status="row">
                <tr>
                    <td><s:property value="CodigoProductoPrincipal"/></td>
                    <td><s:property value="DProductoPrincipal"/></td>
                    <td><s:property value="Cantidad"/></td>
                    <td><s:property value="CodigoProducto"/></td>
                    <td><s:property value="DProducto"/></td>
                    <td>
                        <a href="#" onclick="QuitarEstandar(<s:property value="%{#row.index}"/>); return false;"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />