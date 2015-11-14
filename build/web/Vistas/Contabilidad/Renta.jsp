<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnRenta').addClass('activo');
        
        $("#formNuevoRenta").validationEngine();
        $("#formEditarRenta").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarRenta(){
        $( "#divNuevoRenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoRenta").validationEngine('validate')){
                        var url = "GrabarRenta";
                        var data = $("#formNuevoRenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarRenta();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoRenta" ).dialog("close")
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
    function BuscarRenta(){
        var url = "BuscarRenta";
        var data = $("#formBuscarRenta").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaRenta").html(resultado);
            IniciarPagina('pagListaRenta');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarRenta(idRenta){
        $( "#divEliminarRenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarRenta?Orenta.idRenta="+idRenta;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarRenta?Orenta.Descripcion=", function(resultado){  
                                $("#divListaRenta").html(resultado);
                                IniciarPagina('pagListaRenta');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarRenta" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarRenta(idRenta,Descripcion,Valor){
        $("#formEditarRenta input[name='Orenta.idRenta']").val(idRenta);
        $("#formEditarRenta input[name='Orenta.Descripcion']").val(Descripcion);
        $("#formEditarRenta input[name='Orenta.Valor']").val(Valor);
        
        $("#divEditarRenta").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarRenta").validationEngine('validate')){
                        var url = "EditarRenta";
                        var data = $("#formEditarRenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarRenta();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarRenta" ).dialog("close")
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
<s:form id="formBuscarRenta" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Orenta.Descripcion" onkeydown="Ejecutar(BuscarRenta);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarRenta();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarRenta(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaRenta">
    <div id="divListaRenta">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Valor</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaRenta">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Valor"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarRenta(<s:property value="idRenta"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarRenta(<s:property value="idRenta"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarRenta(<s:property value="idRenta"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaRenta'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaRenta'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaRenta'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaRenta'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoRenta" style="display: none;" title="Nueva Renta">
    <s:form id="formNuevoRenta" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Orenta.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Valor"/>
        <s:textfield name="Orenta.Valor" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<div id="divEliminarRenta" style="display: none;" title="Eliminar Renta">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarRenta" style="display: none;" title="Editar Renta">
    <s:form id="formEditarRenta" theme="simple">
        <s:hidden name="Orenta.idRenta"/>
        <s:label value="Valor"/>
        <s:textfield name="Orenta.Valor" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Orenta.Descripcion" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />