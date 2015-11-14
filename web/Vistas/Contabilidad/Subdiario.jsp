<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnSubdiario').addClass('activo');
        IniciarPagina('pagListaSubdiario');
        
        $("#formNuevoSubdiario").validationEngine();
        $("#formEditarSubdiario").validationEngine();
    });    

    function GrabarSubdiario(){
        $( "#divNuevoSubdiario" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoSubdiario").validationEngine('validate')){
                    var url = "GrabarSubdiario";
                    var data = $("#formNuevoSubdiario").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarSubdiario?Osubdiario.Descripcion=", function(resultado){  
                                $("#divListaSubdiario").html(resultado);
                                IniciarPagina('pagListaSubdiario');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoSubdiario" ).dialog("close")
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
    function BuscarSubdiario(){
        var url = "BuscarSubdiario";
        var data = $("#formBuscarSubdiario").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaSubdiario").html(resultado);
            IniciarPagina('pagListaSubdiario');
        });  
    }
    function EliminarSubdiario(idSubdiario){
        $( "#divEliminarSubdiario" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarSubdiario?Osubdiario.idSubdiario="+idSubdiario;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarSubdiario?Osubdiario.Descripcion=", function(resultado){  
                                $("#divListaSubdiario").html(resultado);
                                IniciarPagina('pagListaSubdiario');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarSubdiario" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarSubdiario(idSubdiario,Descripcion,Codigo){
        $("#formEditarSubdiario input[name='Osubdiario.idSubdiario']").val(idSubdiario);
        $("#formEditarSubdiario input[name='Osubdiario.Descripcion']").val(Descripcion);
        $("#formEditarSubdiario input[name='Osubdiario.Codigo']").val(Codigo);
        
        $("#divEditarSubdiario").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarSubdiario").validationEngine('validate')){
                    var url = "EditarSubdiario";
                    var data = $("#formEditarSubdiario").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarSubdiario?Osubdiario.Descripcion=", function(resultado){  
                                $("#divListaSubdiario").html(resultado);
                                IniciarPagina('pagListaSubdiario');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarSubdiario" ).dialog("close")
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
<s:form id="formBuscarSubdiario" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Osubdiario.Descripcion" onkeydown="Ejecutar(BuscarSubdiario);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarSubdiario();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarSubdiario(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaSubdiario">
<div id="divListaSubdiario">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaSubdiario">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarSubdiario(<s:property value="idSubdiario"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarSubdiario(<s:property value="idSubdiario"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoSubdiario" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoSubdiario" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Osubdiario.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Osubdiario.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarSubdiario" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarSubdiario" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarSubdiario" theme="simple">
        <s:hidden name="Osubdiario.idSubdiario"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Osubdiario.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Osubdiario.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />