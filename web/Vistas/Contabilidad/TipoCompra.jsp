<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoCompra').addClass('activo');
        
        $("#formNuevoTipoCompra").validationEngine();
        $("#formEditarTipoCompra").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarTipoCompra(){
        $( "#divNuevoTipoCompra" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoCompra").validationEngine('validate')){
                        var url = "GrabarTipoCompra";
                        var data = $("#formNuevoTipoCompra").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                /*$.get("BuscarTipoCompra?Otipocompra.Descripcion=", function(resultado){  
                                    $("#divListaTipoCompra").html(resultado);
                                    IniciarPagina('pagListaTipoCompra');
                                });  */BuscarTipoCompra();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoTipoCompra" ).dialog("close")
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
    function BuscarTipoCompra(){
        var url = "BuscarTipoCompra";
        var data = $("#formBuscarTipoCompra").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoCompra").html(resultado);
            IniciarPagina('pagListaTipoCompra');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarTipoCompra(idTipoCompra){
        $( "#divEliminarTipoCompra" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoCompra?Otipocompra.idTipoCompra="+idTipoCompra;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoCompra?Otipocompra.Descripcion=", function(resultado){  
                                $("#divListaTipoCompra").html(resultado);
                                IniciarPagina('pagListaTipoCompra');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoCompra" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoCompra(idTipoCompra,Descripcion,Codigo){
        $("#formEditarTipoCompra input[name='Otipocompra.idTipoCompra']").val(idTipoCompra);
        $("#formEditarTipoCompra input[name='Otipocompra.Descripcion']").val(Descripcion);
        $("#formEditarTipoCompra input[name='Otipocompra.Codigo']").val(Codigo);
        
        $("#divEditarTipoCompra").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoCompra").validationEngine('validate')){
                        var url = "EditarTipoCompra";
                        var data = $("#formEditarTipoCompra").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                /*$.get("BuscarTipoCompra?Otipocompra.Descripcion=", function(resultado){  
                                    $("#divListaTipoCompra").html(resultado);
                                    IniciarPagina('pagListaTipoCompra');
                                });*/ BuscarTipoCompra();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarTipoCompra" ).dialog("close")
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
<s:form id="formBuscarTipoCompra" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Otipocompra.Descripcion" onkeydown="Ejecutar(BuscarTipoCompra);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarTipoCompra();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoCompra(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaTipoCompra">
    <div id="divListaTipoCompra">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaTipoCompra">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarTipoCompra(<s:property value="idTipoCompra"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarTipoCompra(<s:property value="idTipoCompra"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarTipoCompra(<s:property value="idTipoCompra"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoCompra'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoCompra'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoCompra'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoCompra'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoCompra" style="display: none;" title="Nuevo Tipo Compra">
    <s:form id="formNuevoTipoCompra" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otipocompra.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipocompra.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarTipoCompra" style="display: none;" title="Eliminar Tipo Compra">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarTipoCompra" style="display: none;" title="Editar Tipo Compra">
    <s:form id="formEditarTipoCompra" theme="simple">
        <s:hidden name="Otipocompra.idTipoCompra"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otipocompra.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipocompra.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />