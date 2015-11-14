<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnPuntoVenta').addClass('activo');
        
        $("#formNuevoPuntoVenta").validationEngine();
        $("#formEditarPuntoVenta").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarPuntoVenta(){
        $( "#divNuevoPuntoVenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoPuntoVenta").validationEngine('validate')){
                        var url = "GrabarPuntoVenta";
                        var data = $("#formNuevoPuntoVenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarPuntoVenta();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoPuntoVenta" ).dialog("close")
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
    function BuscarPuntoVenta(){
        var url = "BuscarPuntoVenta";
        var data = $("#formBuscarPuntoVenta").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaPuntoVenta").html(resultado);
            IniciarPagina('pagListaPuntoVenta');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarPuntoVenta(idPuntoVenta){
        $( "#divEliminarPuntoVenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarPuntoVenta?OpuntoVenta.idPuntoVenta="+idPuntoVenta;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarPuntoVenta?OpuntoVenta.Descripcion=", function(resultado){  
                                $("#divListaPuntoVenta").html(resultado);
                                IniciarPagina('pagListaPuntoVenta');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarPuntoVenta" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarPuntoVenta(idPuntoVenta,Descripcion,Codigo){
        $("#formEditarPuntoVenta input[name='OpuntoVenta.idPuntoVenta']").val(idPuntoVenta);
        $("#formEditarPuntoVenta input[name='OpuntoVenta.Descripcion']").val(Descripcion);
        $("#formEditarPuntoVenta input[name='OpuntoVenta.Codigo']").val(Codigo);
        
        $("#divEditarPuntoVenta").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarPuntoVenta").validationEngine('validate')){
                        var url = "EditarPuntoVenta";
                        var data = $("#formEditarPuntoVenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarPuntoVenta();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarPuntoVenta" ).dialog("close")
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
<s:form id="formBuscarPuntoVenta" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="OpuntoVenta.Descripcion" onkeydown="Ejecutar(BuscarPuntoVenta);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarPuntoVenta();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarPuntoVenta(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaPuntoVenta">
    <div id="divListaPuntoVenta">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaPuntoVenta">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarPuntoVenta(<s:property value="idPuntoVenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarPuntoVenta(<s:property value="idPuntoVenta"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarPuntoVenta(<s:property value="idPuntoVenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaPuntoVenta'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaPuntoVenta'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaPuntoVenta'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaPuntoVenta'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoPuntoVenta" style="display: none;" title="Nueva PuntoVenta">
    <s:form id="formNuevoPuntoVenta" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="OpuntoVenta.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="OpuntoVenta.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<div id="divEliminarPuntoVenta" style="display: none;" title="Eliminar PuntoVenta">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarPuntoVenta" style="display: none;" title="Editar PuntoVenta">
    <s:form id="formEditarPuntoVenta" theme="simple">
        <s:hidden name="OpuntoVenta.idPuntoVenta"/>
        <s:label value="Descripcion"/>
        <s:textfield name="OpuntoVenta.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="OpuntoVenta.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />