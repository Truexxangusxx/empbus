<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoCambioCuenta').addClass('activo');
        IniciarPagina('pagListaTipoCambioCuenta');
        
        $("#formNuevoTipoCambioCuenta").validationEngine();
        $("#formEditarTipoCambioCuenta").validationEngine();
    });    

    function GrabarTipoCambioCuenta(){
        $( "#divNuevoTipoCambioCuenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoCambioCuenta").validationEngine('validate')){
                    var url = "GrabarTipoCambioCuenta";
                    var data = $("#formNuevoTipoCambioCuenta").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoCambioCuenta?Otipocambiocuenta.Descripcion=", function(resultado){  
                                $("#divListaTipoCambioCuenta").html(resultado);
                                IniciarPagina('pagListaTipoCambioCuenta');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoTipoCambioCuenta" ).dialog("close")
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
    function BuscarTipoCambioCuenta(){
        var url = "BuscarTipoCambioCuenta";
        var data = $("#formBuscarTipoCambioCuenta").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoCambioCuenta").html(resultado);
            IniciarPagina('pagListaTipoCambioCuenta');
        });  
    }
    function EliminarTipoCambioCuenta(idTipoCambioCuenta){
        $( "#divEliminarTipoCambioCuenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoCambioCuenta?Otipocambiocuenta.idTipoCambioCuenta="+idTipoCambioCuenta;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoCambioCuenta?Otipocambiocuenta.Descripcion=", function(resultado){  
                                $("#divListaTipoCambioCuenta").html(resultado);
                                IniciarPagina('pagListaTipoCambioCuenta');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoCambioCuenta" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoCambioCuenta(idTipoCambioCuenta,Descripcion,Codigo){
        $("#formEditarTipoCambioCuenta input[name='Otipocambiocuenta.idTipoCambioCuenta']").val(idTipoCambioCuenta);
        $("#formEditarTipoCambioCuenta input[name='Otipocambiocuenta.Descripcion']").val(Descripcion);
        $("#formEditarTipoCambioCuenta input[name='Otipocambiocuenta.Codigo']").val(Codigo);
        
        $("#divEditarTipoCambioCuenta").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoCambioCuenta").validationEngine('validate')){
                    var url = "EditarTipoCambioCuenta";
                    var data = $("#formEditarTipoCambioCuenta").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoCambioCuenta?Otipocambiocuenta.Descripcion=", function(resultado){  
                                $("#divListaTipoCambioCuenta").html(resultado);
                                IniciarPagina('pagListaTipoCambioCuenta');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarTipoCambioCuenta" ).dialog("close")
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
<s:form id="formBuscarTipoCambioCuenta" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Otipocambiocuenta.Descripcion" onkeydown="Ejecutar(BuscarTipoCambioCuenta);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarTipoCambioCuenta();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoCambioCuenta(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaTipoCambioCuenta">
<div id="divListaTipoCambioCuenta">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaTipoCambioCuenta">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarTipoCambioCuenta(<s:property value="idTipoCambioCuenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarTipoCambioCuenta(<s:property value="idTipoCambioCuenta"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoCambioCuenta'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoCambioCuenta'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoCambioCuenta'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoCambioCuenta'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoCambioCuenta" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoTipoCambioCuenta" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otipocambiocuenta.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipocambiocuenta.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarTipoCambioCuenta" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarTipoCambioCuenta" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarTipoCambioCuenta" theme="simple">
        <s:hidden name="Otipocambiocuenta.idTipoCambioCuenta"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otipocambiocuenta.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipocambiocuenta.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />