<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnClase').addClass('activo');
        IniciarPagina('pagListaClase');
        
        $("#formNuevoClase").validationEngine();
        $("#formEditarClase").validationEngine();
    });    

    function GrabarClase(){
        $( "#divNuevoClase" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoClase").validationEngine('validate')){
                    var url = "GrabarClase";
                    var data = $("#formNuevoClase").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarClase?Oclase.Descripcion=", function(resultado){  
                                $("#divListaClase").html(resultado);
                                IniciarPagina('pagListaClase');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoClase" ).dialog("close")
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
    function BuscarClase(){
        var url = "BuscarClase";
        var data = $("#formBuscarClase").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaClase").html(resultado);
            IniciarPagina('pagListaClase');
        });  
    }
    function EliminarClase(idClase){
        $( "#divEliminarClase" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarClase?Oclase.idClase="+idClase;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarClase?Oclase.Descripcion=", function(resultado){  
                                $("#divListaClase").html(resultado);
                                IniciarPagina('pagListaClase');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarClase" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarClase(idClase,Descripcion,Codigo){
        $("#formEditarClase input[name='Oclase.idClase']").val(idClase);
        $("#formEditarClase input[name='Oclase.Descripcion']").val(Descripcion);
        $("#formEditarClase input[name='Oclase.Codigo']").val(Codigo);
        
        $("#divEditarClase").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarClase").validationEngine('validate')){
                    var url = "EditarClase";
                    var data = $("#formEditarClase").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarClase?Oclase.Descripcion=", function(resultado){  
                                $("#divListaClase").html(resultado);
                                IniciarPagina('pagListaClase');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarClase" ).dialog("close")
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
<s:form id="formBuscarClase" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Oclase.Descripcion" onkeydown="Ejecutar(BuscarClase);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarClase();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarClase(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaClase">
<div id="divListaClase">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaClase">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarClase(<s:property value="idClase"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarClase(<s:property value="idClase"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaClase'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaClase'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaClase'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaClase'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoClase" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoClase" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Oclase.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oclase.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarClase" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarClase" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarClase" theme="simple">
        <s:hidden name="Oclase.idClase"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Oclase.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oclase.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />