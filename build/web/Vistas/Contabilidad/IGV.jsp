<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnIGV').addClass('activo');
        
        $("#formNuevoIGV").validationEngine();
        $("#formEditarIGV").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarIGV(){
        $( "#divNuevoIGV" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoIGV").validationEngine('validate')){
                        var url = "GrabarIGV";
                        var data = $("#formNuevoIGV").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarIGV();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoIGV" ).dialog("close")
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
    function BuscarIGV(){
        var url = "BuscarIGV";
        var data = $("#formBuscarIGV").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaIGV").html(resultado);
            IniciarPagina('pagListaIGV');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    
    function EditarIGV(idIGV,Valor,Codigo){
        $("#formEditarIGV input[name='Oigv.idIGV']").val(idIGV);
        $("#formEditarIGV input[name='Oigv.Valor']").val(Valor);
        
        $("#divEditarIGV").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarIGV").validationEngine('validate')){
                        var url = "EditarIGV";
                        var data = $("#formEditarIGV").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarIGV();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarIGV" ).dialog("close")
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
<s:form id="formBuscarIGV" theme="simple">
    <table>
        <tr><td>Valor:</td></tr>
        <tr>
            <td><s:checkbox name="Oigv.Activo" onkeydown="Ejecutar(BuscarIGV);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarIGV();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarIGV(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaIGV">
    <div id="divListaIGV">
        <table class="tabla">
            <thead>
            <th>Valor</th>
            <th>Activo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaIGV">
                    <tr>
                        <td><s:property value="Valor"/></td>
                        <td><s:checkbox value="Activo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarIGV(<s:property value="idIGV"/>,'<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarIGV(<s:property value="idIGV"/>,'<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaIGV'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaIGV'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaIGV'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaIGV'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoIGV" style="display: none;" title="Nuevo Tipo Compra">
    <s:form id="formNuevoIGV" theme="simple">
        <s:label value="Valor"/>
        <s:textfield name="Oigv.Valor" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarIGV" style="display: none;" title="Eliminar IGV">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarIGV" style="display: none;" title="Editar IGV">
    <s:form id="formEditarIGV" theme="simple">
        <s:hidden name="Oigv.idIGV"/>
        <s:label value="Valor"/>
        <s:textfield name="Oigv.Valor" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />