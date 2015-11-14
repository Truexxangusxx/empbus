<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnPeriodo').addClass('activo');
        
        $("#formNuevoPeriodo").validationEngine();
        $("#formEditarPeriodo").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('onclick','return false;')
    });    

    function GrabarPeriodo(){
        $( "#divNuevoPeriodo" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoPeriodo").validationEngine('validate')){
                        var url = "GrabarPeriodo";
                        var data = $("#formNuevoPeriodo").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarPeriodo();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoPeriodo" ).dialog("close")
                        })
                    }
                },
                "Cancelar": function() {
                    $( this ).dialog("close");
                }
            },
            close: function( event, ui ) {$(".formError").remove()}
        });
    }
    function BuscarPeriodo(){
        var url = "BuscarPeriodo";
        var data = $("#formBuscarPeriodo").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaPeriodo").html(resultado);
            IniciarPagina('pagListaPeriodo');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    
    function EditarPeriodo(idPeriodo,Valor,Codigo){
        $("#formEditarPeriodo input[name='Operiodo.idPeriodo']").val(idPeriodo);
        $("#formEditarPeriodo input[name='Operiodo.Valor']").val(Valor);
        
        $("#divEditarPeriodo").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarPeriodo").validationEngine('validate')){
                        var url = "EditarPeriodo";
                        var data = $("#formEditarPeriodo").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarPeriodo();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarPeriodo" ).dialog("close")
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
<s:form id="formBuscarPeriodo" theme="simple">
    <table>
        <tr><td>Activo:</td></tr>
        <tr>
            <td><s:checkbox name="Operiodo.Activo" onkeydown="Ejecutar(BuscarPeriodo);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarPeriodo();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarPeriodo(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaPeriodo">
    <div id="divListaPeriodo">
        <table class="tabla">
            <thead>
            <th>Anio</th>
            <th>Mes</th>
            <th>Activo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaPeriodo">
                    <tr>
                        <td><s:property value="Anio"/></td>
                        <td><s:property value="Mes"/></td>
                        <td><s:checkbox value="Activo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarPeriodo(<s:property value="idPeriodo"/>,<s:property value="Anio"/>,'<s:property value="Mes"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarPeriodo(<s:property value="idPeriodo"/>,<s:property value="Anio"/>,'<s:property value="Mes"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaPeriodo'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaPeriodo'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaPeriodo'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaPeriodo'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoPeriodo" style="display: none;" title="Nuevo Tipo Compra">
    <s:form id="formNuevoPeriodo" theme="simple">
        <s:label value="Anio"/>
        <s:textfield name="Operiodo.Anio" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Mes"/>
        <s:textfield name="Operiodo.Mes" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarPeriodo" style="display: none;" title="Eliminar Periodo">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarPeriodo" style="display: none;" title="Editar Periodo">
    <s:form id="formEditarPeriodo" theme="simple">
        <s:hidden name="Operiodo.idPeriodo"/>
        <s:label value="Anio"/>
        <s:textfield name="Operiodo.Anio" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Mes"/>
        <s:textfield name="Operiodo.Mes" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />