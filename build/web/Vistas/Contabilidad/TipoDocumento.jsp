<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoDocumento').addClass('activo');
        
        $("#formNuevoTipoDocumento").validationEngine();
        $("#formEditarTipoDocumento").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarTipoDocumento(){
        $( "#divNuevoTipoDocumento" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoDocumento").validationEngine('validate')){
                        var url = "GrabarTipoDocumento";
                        var data = $("#formNuevoTipoDocumento").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTipoDocumento();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoTipoDocumento" ).dialog("close")
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
    function BuscarTipoDocumento(){
        var url = "BuscarTipoDocumento";
        var data = $("#formBuscarTipoDocumento").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoDocumento").html(resultado);
            IniciarPagina('pagListaTipoDocumento');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarTipoDocumento(idTipoDocumento){
        $( "#divEliminarTipoDocumento" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoDocumento?Otipodocumento.idTipoDocumento="+idTipoDocumento;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoDocumento?Otipodocumento.Descripcion=", function(resultado){  
                                $("#divListaTipoDocumento").html(resultado);
                                IniciarPagina('pagListaTipoDocumento');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoDocumento" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoDocumento(idTipoDocumento,Descripcion,Codigo){
        $("#formEditarTipoDocumento input[name='Otipodocumento.idTipoDocumento']").val(idTipoDocumento);
        $("#formEditarTipoDocumento input[name='Otipodocumento.Descripcion']").val(Descripcion);
        $("#formEditarTipoDocumento input[name='Otipodocumento.Codigo']").val(Codigo);
        
        $("#divEditarTipoDocumento").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoDocumento").validationEngine('validate')){
                        var url = "EditarTipoDocumento";
                        var data = $("#formEditarTipoDocumento").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTipoDocumento();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarTipoDocumento" ).dialog("close")
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
<s:form id="formBuscarTipoDocumento" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Otipodocumento.Descripcion" onkeydown="Ejecutar(BuscarTipoDocumento);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarTipoDocumento();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoDocumento(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaTipoDocumento">
    <div id="divListaTipoDocumento">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaTipoDocumento">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarTipoDocumento(<s:property value="idTipoDocumento"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarTipoDocumento(<s:property value="idTipoDocumento"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarTipoDocumento(<s:property value="idTipoDocumento"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoDocumento'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoDocumento'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoDocumento'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoDocumento'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoDocumento" style="display: none;" title="Nueva TipoDocumento">
    <s:form id="formNuevoTipoDocumento" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otipodocumento.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipodocumento.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<div id="divEliminarTipoDocumento" style="display: none;" title="Eliminar TipoDocumento">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarTipoDocumento" style="display: none;" title="Editar TipoDocumento">
    <s:form id="formEditarTipoDocumento" theme="simple">
        <s:hidden name="Otipodocumento.idTipoDocumento"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otipodocumento.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipodocumento.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />