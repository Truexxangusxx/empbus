<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoAdquisicion').addClass('activo');
        
        $("#formNuevoTipoAdquisicion").validationEngine();
        $("#formEditarTipoAdquisicion").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarTipoAdquisicion(){
        $( "#divNuevoTipoAdquisicion" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoTipoAdquisicion").validationEngine('validate')){
                        var url = "GrabarTipoAdquisicion";
                        var data = $("#formNuevoTipoAdquisicion").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTipoAdquisicion();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoTipoAdquisicion" ).dialog("close")
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
    function BuscarTipoAdquisicion(){
        var url = "BuscarTipoAdquisicion";
        var data = $("#formBuscarTipoAdquisicion").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoAdquisicion").html(resultado);
            IniciarPagina('pagListaTipoAdquisicion');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarTipoAdquisicion(idTipoAdquisicion){
        $( "#divEliminarTipoAdquisicion" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoAdquisicion?Otipoadquisicion.idTipoAdquisicion="+idTipoAdquisicion;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarTipoAdquisicion?Otipoadquisicion.Descripcion=", function(resultado){  
                                $("#divListaTipoAdquisicion").html(resultado);
                                IniciarPagina('pagListaTipoAdquisicion');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoAdquisicion" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoAdquisicion(idTipoAdquisicion,Descripcion,Valor){
        $("#formEditarTipoAdquisicion input[name='Otipoadquisicion.idTipoAdquisicion']").val(idTipoAdquisicion);
        $("#formEditarTipoAdquisicion input[name='Otipoadquisicion.Descripcion']").val(Descripcion);
        $("#formEditarTipoAdquisicion input[name='Otipoadquisicion.Valor']").val(Valor);
        
        $("#divEditarTipoAdquisicion").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarTipoAdquisicion").validationEngine('validate')){
                        var url = "EditarTipoAdquisicion";
                        var data = $("#formEditarTipoAdquisicion").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarTipoAdquisicion();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarTipoAdquisicion" ).dialog("close")
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
<s:form id="formBuscarTipoAdquisicion" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Otipoadquisicion.Descripcion" onkeydown="Ejecutar(BuscarTipoAdquisicion);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarTipoAdquisicion();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarTipoAdquisicion(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaTipoAdquisicion">
    <div id="divListaTipoAdquisicion">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Valor</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaTipoAdquisicion">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Valor"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarTipoAdquisicion(<s:property value="idTipoAdquisicion"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarTipoAdquisicion(<s:property value="idTipoAdquisicion"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarTipoAdquisicion(<s:property value="idTipoAdquisicion"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoAdquisicion'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoAdquisicion'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoAdquisicion'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoAdquisicion'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoAdquisicion" style="display: none;" title="Nuevo Tipo Compra">
    <s:form id="formNuevoTipoAdquisicion" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otipoadquisicion.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Otipoadquisicion.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarTipoAdquisicion" style="display: none;" title="Eliminar Tipo Compra">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarTipoAdquisicion" style="display: none;" title="Editar Tipo Compra">
    <s:form id="formEditarTipoAdquisicion" theme="simple">
        <s:hidden name="Otipoadquisicion.idTipoAdquisicion"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otipoadquisicion.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Otipoadquisicion.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />