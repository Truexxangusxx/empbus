<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTasa').addClass('activo');
        
        $("#formNuevoTasa").validationEngine();
        $("#formEditarTasa").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarTasa(){
        $( "#divNuevoTasa" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTasa").validationEngine('validate')){
                        var url = "GrabarTasa";
                        var data = $("#formNuevoTasa").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTasa();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoTasa" ).dialog("close")
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
    function BuscarTasa(){
        var url = "BuscarTasa";
        var data = $("#formBuscarTasa").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTasa").html(resultado);
            IniciarPagina('pagListaTasa');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarTasa(idTasa){
        $( "#divEliminarTasa" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTasa?Otasa.idTasa="+idTasa;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTasa?Otasa.Descripcion=", function(resultado){  
                                $("#divListaTasa").html(resultado);
                                IniciarPagina('pagListaTasa');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTasa" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTasa(idTasa,Descripcion,Valor){
        $("#formEditarTasa input[name='Otasa.idTasa']").val(idTasa);
        $("#formEditarTasa input[name='Otasa.Descripcion']").val(Descripcion);
        $("#formEditarTasa input[name='Otasa.Valor']").val(Valor);
        
        $("#divEditarTasa").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTasa").validationEngine('validate')){
                        var url = "EditarTasa";
                        var data = $("#formEditarTasa").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTasa();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarTasa" ).dialog("close")
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
<s:form id="formBuscarTasa" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Otasa.Descripcion" onkeydown="Ejecutar(BuscarTasa);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarTasa();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTasa(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaTasa">
    <div id="divListaTasa">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Valor</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaTasa">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Valor"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarTasa(<s:property value="idTasa"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarTasa(<s:property value="idTasa"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarTasa(<s:property value="idTasa"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTasa'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTasa'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTasa'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTasa'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTasa" style="display: none;" title="Nueva Tasa">
    <s:form id="formNuevoTasa" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otasa.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Otasa.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarTasa" style="display: none;" title="Eliminar Tasa">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarTasa" style="display: none;" title="Editar Tasa">
    <s:form id="formEditarTasa" theme="simple">
        <s:hidden name="Otasa.idTasa"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otasa.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Otasa.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />