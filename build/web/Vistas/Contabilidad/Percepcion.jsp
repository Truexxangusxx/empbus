<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnPercepcion').addClass('activo');
        
        $("#formNuevoPercepcion").validationEngine();
        $("#formEditarPercepcion").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarPercepcion(){
        $( "#divNuevoPercepcion" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoPercepcion").validationEngine('validate')){
                        var url = "GrabarPercepcion";
                        var data = $("#formNuevoPercepcion").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarPercepcion();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoPercepcion" ).dialog("close")
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
    function BuscarPercepcion(){
        var url = "BuscarPercepcion";
        var data = $("#formBuscarPercepcion").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaPercepcion").html(resultado);
            IniciarPagina('pagListaPercepcion');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarPercepcion(idPercepcion){
        $( "#divEliminarPercepcion" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarPercepcion?Opercepcion.idPercepcion="+idPercepcion;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarPercepcion?Opercepcion.Descripcion=", function(resultado){  
                                $("#divListaPercepcion").html(resultado);
                                IniciarPagina('pagListaPercepcion');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarPercepcion" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarPercepcion(idPercepcion,Descripcion,Valor){
        $("#formEditarPercepcion input[name='Opercepcion.idPercepcion']").val(idPercepcion);
        $("#formEditarPercepcion input[name='Opercepcion.Descripcion']").val(Descripcion);
        $("#formEditarPercepcion input[name='Opercepcion.Valor']").val(Valor);
        
        $("#divEditarPercepcion").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarPercepcion").validationEngine('validate')){
                        var url = "EditarPercepcion";
                        var data = $("#formEditarPercepcion").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarPercepcion();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarPercepcion" ).dialog("close")
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
<s:form id="formBuscarPercepcion" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Opercepcion.Descripcion" onkeydown="Ejecutar(BuscarPercepcion);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarPercepcion();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarPercepcion(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaPercepcion">
    <div id="divListaPercepcion">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Valor</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaPercepcion">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Valor"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarPercepcion(<s:property value="idPercepcion"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarPercepcion(<s:property value="idPercepcion"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarPercepcion(<s:property value="idPercepcion"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaPercepcion'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaPercepcion'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaPercepcion'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaPercepcion'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoPercepcion" style="display: none;" title="Nueva Percepcion">
    <s:form id="formNuevoPercepcion" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Opercepcion.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Opercepcion.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarPercepcion" style="display: none;" title="Eliminar Percepcion">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarPercepcion" style="display: none;" title="Editar Percepcion">
    <s:form id="formEditarPercepcion" theme="simple">
        <s:hidden name="Opercepcion.idPercepcion"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Opercepcion.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Opercepcion.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />