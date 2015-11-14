<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoVenta').addClass('activo');
        
        $("#formNuevoTipoVenta").validationEngine();
        $("#formEditarTipoVenta").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarTipoVenta(){
        $( "#divNuevoTipoVenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoVenta").validationEngine('validate')){
                        var url = "GrabarTipoVenta";
                        var data = $("#formNuevoTipoVenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTipoVenta();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoTipoVenta" ).dialog("close")
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
    function BuscarTipoVenta(){
        var url = "BuscarTipoVenta";
        var data = $("#formBuscarTipoVenta").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoVenta").html(resultado);
            IniciarPagina('pagListaTipoVenta');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarTipoVenta(idTipoVenta){
        $( "#divEliminarTipoVenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoVenta?Otipoventa.idTipoVenta="+idTipoVenta;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoVenta?Otipoventa.Descripcion=", function(resultado){  
                                $("#divListaTipoVenta").html(resultado);
                                IniciarPagina('pagListaTipoVenta');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoVenta" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoVenta(idTipoVenta,Descripcion,Codigo){
        $("#formEditarTipoVenta input[name='Otipoventa.idTipoVenta']").val(idTipoVenta);
        $("#formEditarTipoVenta input[name='Otipoventa.Descripcion']").val(Descripcion);
        $("#formEditarTipoVenta input[name='Otipoventa.Codigo']").val(Codigo);
        
        $("#divEditarTipoVenta").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoVenta").validationEngine('validate')){
                        var url = "EditarTipoVenta";
                        var data = $("#formEditarTipoVenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTipoVenta();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarTipoVenta" ).dialog("close")
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
<s:form id="formBuscarTipoVenta" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Otipoventa.Descripcion" onkeydown="Ejecutar(BuscarTipoVenta);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarTipoVenta();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoVenta(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaTipoVenta">
    <div id="divListaTipoVenta">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaTipoVenta">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarTipoVenta(<s:property value="idTipoVenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarTipoVenta(<s:property value="idTipoVenta"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarTipoVenta(<s:property value="idTipoVenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoVenta'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoVenta'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoVenta'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoVenta'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoVenta" style="display: none;" title="Nueva TipoVenta">
    <s:form id="formNuevoTipoVenta" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otipoventa.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipoventa.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<div id="divEliminarTipoVenta" style="display: none;" title="Eliminar TipoVenta">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarTipoVenta" style="display: none;" title="Editar TipoVenta">
    <s:form id="formEditarTipoVenta" theme="simple">
        <s:hidden name="Otipoventa.idTipoVenta"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otipoventa.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipoventa.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />