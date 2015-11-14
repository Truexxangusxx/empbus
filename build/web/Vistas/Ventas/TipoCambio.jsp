<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoCambio').addClass('activo');
        IniciarPagina('pagListaTipoCambio');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        $("#formNuevoTipoCambio").validationEngine();
        $("#formEditarTipoCambio").validationEngine();
    });    

    function GrabarTipoCambio(){
        $( "#divNuevoTipoCambio" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoCambio").validationEngine('validate')){
                    var url = "GrabarTipoCambio";
                    var data = $("#formNuevoTipoCambio").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoCambio", function(resultado){  
                                $("#divListaTipoCambio").html(resultado);
                                IniciarPagina('pagListaTipoCambio');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoTipoCambio" ).dialog("close")
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
    function BuscarTipoCambio(){
        var url = "BuscarTipoCambio";
        var data = $("#formBuscarTipoCambio").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoCambio").html(resultado);
            IniciarPagina('pagListaTipoCambio');
        });  
    }
    function EliminarTipoCambio(idTipoCambio){
        $( "#divEliminarTipoCambio" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoCambio?Otipocambio.idTipoCambio="+idTipoCambio;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoCambio", function(resultado){  
                                $("#divListaTipoCambio").html(resultado);
                                IniciarPagina('pagListaTipoCambio');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoCambio" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoCambio(idTipoCambio,idMonedaPago,idMonedaCobra,Valor,Fecha){
        $("#formEditarTipoCambio input[name='Otipocambio.idTipoCambio']").val(idTipoCambio);
        $("#formEditarTipoCambio [name='Otipocambio.idMonedaPago']").val(idMonedaPago);
        $("#formEditarTipoCambio [name='Otipocambio.idMonedaCobra']").val(idMonedaCobra);
        $("#formEditarTipoCambio input[name='Otipocambio.Valor']").val(Valor);
        $("#formEditarTipoCambio input[name='Otipocambio.Fecha']").val(Fecha);
        
        $("#divEditarTipoCambio").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoCambio").validationEngine('validate')){
                    var url = "EditarTipoCambio";
                    var data = $("#formEditarTipoCambio").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoCambio", function(resultado){  
                                $("#divListaTipoCambio").html(resultado);
                                IniciarPagina('pagListaTipoCambio');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarTipoCambio" ).dialog("close")
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
<s:form id="formBuscarTipoCambio" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Otipocambio.Fecha" onkeydown="Ejecutar(BuscarTipoCambio);" cssClass="datepicker"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarTipoCambio();"><img title="Nuevo Tipo de Cambio" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoCambio(); return false;"><img title="Buscar Tipo Cambio" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaTipoCambio">
<div id="divListaTipoCambio">
    <jsp:include page="Auxiliar/ListaTipoCambio.jsp" />
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoCambio'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoCambio'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoCambio'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoCambio'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoCambio" style="display: none;" title="Nuevo Tipo de Cambio">
    <s:form id="formNuevoTipoCambio" theme="simple">
        <s:label value="Moneda Pago:"/>
        <s:select name="Otipocambio.idMonedaPago" list="ListaMonedaPago" listKey="idMoneda" listValue="Descripcion"/>
        <s:label value="Moneda Cobra:"/>
        <s:select name="Otipocambio.idMonedaCobra" list="ListaMonedaCobra" listKey="idMoneda" listValue="Descripcion"/>
        <s:label value="Valor:"/>
        <s:textfield name="Otipocambio.Valor" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Fecha:"/>
        <s:textfield name="Otipocambio.Fecha" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required] datepicker"/>
    </s:form>
</div>

<div id="divEliminarTipoCambio" style="display: none;" title="Eliminar Tipo de Cambio">
    ¿Esta seguro de querer eliminar el Tipo de Cambio?
</div>

<div id="divEditarTipoCambio" style="display: none;" title="Editar Tipo de Cambio">
    <s:form id="formEditarTipoCambio" theme="simple">
        <s:hidden name="Otipocambio.idTipoCambio"/>
        <s:label value="Moneda Pago:"/>
        <s:select name="Otipocambio.idMonedaPago" list="ListaMonedaPago" listKey="idMoneda" listValue="Descripcion"/>
        <s:label value="Moneda Cobra:"/>
        <s:select name="Otipocambio.idMonedaCobra" list="ListaMonedaCobra" listKey="idMoneda" listValue="Descripcion"/>
        <s:label value="Valor:"/>
        <s:textfield name="Otipocambio.Valor" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Fecha:"/>
        <s:textfield name="Otipocambio.Fecha" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required] datepicker"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />