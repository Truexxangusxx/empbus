<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoProducto').addClass('activo');
        IniciarPagina('pagListaTipoProducto');
        
        $("#formNuevoTipoProducto").validationEngine();
        $("#formEditarTipoProducto").validationEngine();
    });    

    function GrabarTipoProducto(){
        $( "#divNuevoTipoProducto" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoProducto").validationEngine('validate')){
                    var url = "GrabarTipoProducto";
                    var data = $("#formNuevoTipoProducto").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoProducto?OtipoProducto.Descripcion=", function(resultado){  
                                $("#divListaTipoProducto").html(resultado);
                                IniciarPagina('pagListaTipoProducto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoTipoProducto" ).dialog("close")
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
    function BuscarTipoProducto(){
        var url = "BuscarTipoProducto";
        var data = $("#formBuscarTipoProducto").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoProducto").html(resultado);
            IniciarPagina('pagListaTipoProducto');
        });  
    }
    function EliminarTipoProducto(idTipoProducto){
        $( "#divEliminarTipoProducto" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoProducto?OtipoProducto.idTipoProducto="+idTipoProducto;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoProducto?OtipoProducto.Descripcion=", function(resultado){  
                                $("#divListaTipoProducto").html(resultado);
                                IniciarPagina('pagListaTipoProducto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoProducto" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoProducto(idTipoProducto,Descripcion,Codigo){
        $("#formEditarTipoProducto input[name='OtipoProducto.idTipoProducto']").val(idTipoProducto);
        $("#formEditarTipoProducto input[name='OtipoProducto.Descripcion']").val(Descripcion);
        $("#formEditarTipoProducto input[name='OtipoProducto.Codigo']").val(Codigo);
        
        $("#divEditarTipoProducto").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoProducto").validationEngine('validate')){
                    var url = "EditarTipoProducto";
                    var data = $("#formEditarTipoProducto").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoProducto?OtipoProducto.Descripcion=", function(resultado){  
                                $("#divListaTipoProducto").html(resultado);
                                IniciarPagina('pagListaTipoProducto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarTipoProducto" ).dialog("close")
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
<s:form id="formBuscarTipoProducto" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="OtipoProducto.Descripcion" onkeydown="Ejecutar(BuscarTipoProducto);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarTipoProducto();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoProducto(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaTipoProducto">
<div id="divListaTipoProducto">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaTipoProducto">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarTipoProducto(<s:property value="idTipoProducto"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarTipoProducto(<s:property value="idTipoProducto"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoProducto'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoProducto'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoProducto'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoProducto'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoProducto" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoTipoProducto" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="OtipoProducto.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="OtipoProducto.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarTipoProducto" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarTipoProducto" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarTipoProducto" theme="simple">
        <s:hidden name="OtipoProducto.idTipoProducto"/>
        <s:label value="Descripcion"/>
        <s:textfield name="OtipoProducto.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="OtipoProducto.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />