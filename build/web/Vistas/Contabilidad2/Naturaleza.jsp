<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnNaturaleza').addClass('activo');
        IniciarPagina('pagListaNaturaleza');
        
        $("#formNuevoNaturaleza").validationEngine();
        $("#formEditarNaturaleza").validationEngine();
    });    

    function GrabarNaturaleza(){
        $( "#divNuevoNaturaleza" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoNaturaleza").validationEngine('validate')){
                    var url = "GrabarNaturaleza";
                    var data = $("#formNuevoNaturaleza").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarNaturaleza?Onaturaleza.Descripcion=", function(resultado){  
                                $("#divListaNaturaleza").html(resultado);
                                IniciarPagina('pagListaNaturaleza');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoNaturaleza" ).dialog("close")
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
    function BuscarNaturaleza(){
        var url = "BuscarNaturaleza";
        var data = $("#formBuscarNaturaleza").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaNaturaleza").html(resultado);
            IniciarPagina('pagListaNaturaleza');
        });  
    }
    function EliminarNaturaleza(idNaturaleza){
        $( "#divEliminarNaturaleza" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarNaturaleza?Onaturaleza.idNaturaleza="+idNaturaleza;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarNaturaleza?Onaturaleza.Descripcion=", function(resultado){  
                                $("#divListaNaturaleza").html(resultado);
                                IniciarPagina('pagListaNaturaleza');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarNaturaleza" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarNaturaleza(idNaturaleza,Descripcion,Codigo){
        $("#formEditarNaturaleza input[name='Onaturaleza.idNaturaleza']").val(idNaturaleza);
        $("#formEditarNaturaleza input[name='Onaturaleza.Descripcion']").val(Descripcion);
        $("#formEditarNaturaleza input[name='Onaturaleza.Codigo']").val(Codigo);
        
        $("#divEditarNaturaleza").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarNaturaleza").validationEngine('validate')){
                    var url = "EditarNaturaleza";
                    var data = $("#formEditarNaturaleza").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarNaturaleza?Onaturaleza.Descripcion=", function(resultado){  
                                $("#divListaNaturaleza").html(resultado);
                                IniciarPagina('pagListaNaturaleza');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarNaturaleza" ).dialog("close")
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
<s:form id="formBuscarNaturaleza" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Onaturaleza.Descripcion" onkeydown="Ejecutar(BuscarNaturaleza);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarNaturaleza();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarNaturaleza(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaNaturaleza">
<div id="divListaNaturaleza">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaNaturaleza">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarNaturaleza(<s:property value="idNaturaleza"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarNaturaleza(<s:property value="idNaturaleza"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaNaturaleza'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaNaturaleza'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaNaturaleza'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaNaturaleza'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoNaturaleza" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoNaturaleza" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Onaturaleza.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Onaturaleza.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarNaturaleza" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarNaturaleza" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarNaturaleza" theme="simple">
        <s:hidden name="Onaturaleza.idNaturaleza"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Onaturaleza.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Onaturaleza.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />