<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoAuxiliar').addClass('activo');
        IniciarPagina('pagListaTipoAuxiliar');
        
        $("#formNuevoTipoAuxiliar").validationEngine();
        $("#formEditarTipoAuxiliar").validationEngine();
    });    

    function GrabarTipoAuxiliar(){
        $( "#divNuevoTipoAuxiliar" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoAuxiliar").validationEngine('validate')){
                    var url = "GrabarTipoAuxiliar";
                    var data = $("#formNuevoTipoAuxiliar").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoAuxiliar?Otipoauxiliar.Descripcion=", function(resultado){  
                                $("#divListaTipoAuxiliar").html(resultado);
                                IniciarPagina('pagListaTipoAuxiliar');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoTipoAuxiliar" ).dialog("close")
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
    function BuscarTipoAuxiliar(){
        var url = "BuscarTipoAuxiliar";
        var data = $("#formBuscarTipoAuxiliar").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoAuxiliar").html(resultado);
            IniciarPagina('pagListaTipoAuxiliar');
        });  
    }
    function EliminarTipoAuxiliar(idTipoAuxiliar){
        $( "#divEliminarTipoAuxiliar" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoAuxiliar?Otipoauxiliar.idTipoAuxiliar="+idTipoAuxiliar;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoAuxiliar?Otipoauxiliar.Descripcion=", function(resultado){  
                                $("#divListaTipoAuxiliar").html(resultado);
                                IniciarPagina('pagListaTipoAuxiliar');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoAuxiliar" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoAuxiliar(idTipoAuxiliar,Descripcion,Codigo){
        $("#formEditarTipoAuxiliar input[name='Otipoauxiliar.idTipoAuxiliar']").val(idTipoAuxiliar);
        $("#formEditarTipoAuxiliar input[name='Otipoauxiliar.Descripcion']").val(Descripcion);
        $("#formEditarTipoAuxiliar input[name='Otipoauxiliar.Codigo']").val(Codigo);
        
        $("#divEditarTipoAuxiliar").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoAuxiliar").validationEngine('validate')){
                    var url = "EditarTipoAuxiliar";
                    var data = $("#formEditarTipoAuxiliar").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoAuxiliar?Otipoauxiliar.Descripcion=", function(resultado){  
                                $("#divListaTipoAuxiliar").html(resultado);
                                IniciarPagina('pagListaTipoAuxiliar');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarTipoAuxiliar" ).dialog("close")
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
<s:form id="formBuscarTipoAuxiliar" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Otipoauxiliar.Descripcion" onkeydown="Ejecutar(BuscarTipoAuxiliar);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarTipoAuxiliar();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoAuxiliar(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaTipoAuxiliar">
<div id="divListaTipoAuxiliar">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaTipoAuxiliar">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarTipoAuxiliar(<s:property value="idTipoAuxiliar"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarTipoAuxiliar(<s:property value="idTipoAuxiliar"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoAuxiliar'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoAuxiliar'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoAuxiliar'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoAuxiliar'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoAuxiliar" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoTipoAuxiliar" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otipoauxiliar.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipoauxiliar.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarTipoAuxiliar" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarTipoAuxiliar" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarTipoAuxiliar" theme="simple">
        <s:hidden name="Otipoauxiliar.idTipoAuxiliar"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otipoauxiliar.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipoauxiliar.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />