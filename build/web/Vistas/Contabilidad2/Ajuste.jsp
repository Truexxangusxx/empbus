<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnAjuste').addClass('activo');
        IniciarPagina('pagListaAjuste');
        
        $("#formNuevoAjuste").validationEngine();
        $("#formEditarAjuste").validationEngine();
    });    

    function GrabarAjuste(){
        $( "#divNuevoAjuste" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoAjuste").validationEngine('validate')){
                    var url = "GrabarAjuste";
                    var data = $("#formNuevoAjuste").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarAjuste?Oajuste.Descripcion=", function(resultado){  
                                $("#divListaAjuste").html(resultado);
                                IniciarPagina('pagListaAjuste');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoAjuste" ).dialog("close")
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
    function BuscarAjuste(){
        var url = "BuscarAjuste";
        var data = $("#formBuscarAjuste").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaAjuste").html(resultado);
            IniciarPagina('pagListaAjuste');
        });  
    }
    function EliminarAjuste(idAjuste){
        $( "#divEliminarAjuste" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarAjuste?Oajuste.idAjuste="+idAjuste;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarAjuste?Oajuste.Descripcion=", function(resultado){  
                                $("#divListaAjuste").html(resultado);
                                IniciarPagina('pagListaAjuste');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarAjuste" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarAjuste(idAjuste,Descripcion,Codigo){
        $("#formEditarAjuste input[name='Oajuste.idAjuste']").val(idAjuste);
        $("#formEditarAjuste input[name='Oajuste.Descripcion']").val(Descripcion);
        $("#formEditarAjuste input[name='Oajuste.Codigo']").val(Codigo);
        
        $("#divEditarAjuste").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarAjuste").validationEngine('validate')){
                    var url = "EditarAjuste";
                    var data = $("#formEditarAjuste").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarAjuste?Oajuste.Descripcion=", function(resultado){  
                                $("#divListaAjuste").html(resultado);
                                IniciarPagina('pagListaAjuste');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarAjuste" ).dialog("close")
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
<s:form id="formBuscarAjuste" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Oajuste.Descripcion" onkeydown="Ejecutar(BuscarAjuste);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarAjuste();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarAjuste(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaAjuste">
<div id="divListaAjuste">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaAjuste">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarAjuste(<s:property value="idAjuste"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarAjuste(<s:property value="idAjuste"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaAjuste'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaAjuste'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaAjuste'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaAjuste'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoAjuste" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoAjuste" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Oajuste.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oajuste.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarAjuste" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarAjuste" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarAjuste" theme="simple">
        <s:hidden name="Oajuste.idAjuste"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Oajuste.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oajuste.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />