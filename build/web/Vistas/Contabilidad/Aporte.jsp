<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnAporte').addClass('activo');
        
        $("#formNuevoAporte").validationEngine();
        $("#formEditarAporte").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarAporte(){
        $( "#divNuevoAporte" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoAporte").validationEngine('validate')){
                        var url = "GrabarAporte";
                        var data = $("#formNuevoAporte").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarAporte();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoAporte" ).dialog("close")
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
    function BuscarAporte(){
        var url = "BuscarAporte";
        var data = $("#formBuscarAporte").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaAporte").html(resultado);
            IniciarPagina('pagListaAporte');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarAporte(idAporte){
        $( "#divEliminarAporte" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarAporte?Oaporte.idAporte="+idAporte;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarAporte?Oaporte.Descripcion=", function(resultado){  
                                $("#divListaAporte").html(resultado);
                                IniciarPagina('pagListaAporte');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarAporte" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarAporte(idAporte,Descripcion,Valor){
        $("#formEditarAporte input[name='Oaporte.idAporte']").val(idAporte);
        $("#formEditarAporte input[name='Oaporte.Descripcion']").val(Descripcion);
        $("#formEditarAporte input[name='Oaporte.Valor']").val(Valor);
        
        $("#divEditarAporte").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarAporte").validationEngine('validate')){
                        var url = "EditarAporte";
                        var data = $("#formEditarAporte").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarAporte();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarAporte" ).dialog("close")
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
<s:form id="formBuscarAporte" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Oaporte.Descripcion" onkeydown="Ejecutar(BuscarAporte);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarAporte();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarAporte(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaAporte">
    <div id="divListaAporte">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Valor</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaAporte">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Valor"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarAporte(<s:property value="idAporte"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarAporte(<s:property value="idAporte"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarAporte(<s:property value="idAporte"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaAporte'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaAporte'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaAporte'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaAporte'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoAporte" style="display: none;" title="Nueva Aporte">
    <s:form id="formNuevoAporte" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Oaporte.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Oaporte.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarAporte" style="display: none;" title="Eliminar Aporte">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarAporte" style="display: none;" title="Editar Aporte">
    <s:form id="formEditarAporte" theme="simple">
        <s:hidden name="Oaporte.idAporte"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Oaporte.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Valor"/>
        <s:textfield name="Oaporte.Valor" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />