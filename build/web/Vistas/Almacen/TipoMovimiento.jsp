<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTipoMovimiento').addClass('activo');
        IniciarPagina('pagListaTipoMovimiento');
    });    

    function GrabarTipoMovimiento(){
        $( "#divNuevoTipoMovimiento" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarTipoMovimiento";
                    var data = $("#formNuevoTipoMovimiento").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarTipoMovimiento").serialize();
                            $.get("BuscarTipoMovimiento", data,function(resultado){  
                                $("#divListaTipoMovimiento").html(resultado);
                                IniciarPagina('pagListaTipoMovimiento');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoTipoMovimiento" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function BuscarTipoMovimiento(){
        var url = "BuscarTipoMovimiento";
        var data = $("#formBuscarTipoMovimiento").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaTipoMovimiento").html(resultado);
            IniciarPagina('pagListaTipoMovimiento');
        });  
    }
    function EliminarTipoMovimiento(idTipoMovimiento){
        $( "#divEliminarTipoMovimiento" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarTipoMovimiento?Otipomovimiento.idTipoMovimiento="+idTipoMovimiento;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarTipoMovimiento").serialize();
                            $.get("BuscarTipoMovimiento", data, function(resultado){  
                                $("#divListaTipoMovimiento").html(resultado);
                                IniciarPagina('pagListaTipoMovimiento');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarTipoMovimiento" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarTipoMovimiento(idTipoMovimiento,Descripcion,Codigo){
        $("#formEditarTipoMovimiento input[name='Otipomovimiento.idTipoMovimiento']").val(idTipoMovimiento);
        $("#formEditarTipoMovimiento input[name='Otipomovimiento.Descripcion']").val(Descripcion);
        $("#formEditarTipoMovimiento input[name='Otipomovimiento.Codigo']").val(Codigo);
        
        $("#divEditarTipoMovimiento").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarTipoMovimiento";
                    var data = $("#formEditarTipoMovimiento").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarTipoMovimiento").serialize();
                            $.get("BuscarTipoMovimiento", data, function(resultado){  
                                $("#divListaTipoMovimiento").html(resultado);
                                IniciarPagina('pagListaTipoMovimiento');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarTipoMovimiento" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }    
</script>

<jsp:include page="Menu.jsp" />
<br/>


<s:form id="formBuscarTipoMovimiento" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Otipomovimiento.Descripcion"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarTipoMovimiento();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
            <a href="#" onclick="BuscarTipoMovimiento(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaTipoMovimiento">
<div id="divListaTipoMovimiento">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaTipoMovimiento">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarTipoMovimiento(<s:property value="idTipoMovimiento"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarTipoMovimiento(<s:property value="idTipoMovimiento"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaTipoMovimiento'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaTipoMovimiento'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaTipoMovimiento'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaTipoMovimiento'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoTipoMovimiento" style="display: none;" title="Nuevo Tipo de Movimiento">
    <s:form id="formNuevoTipoMovimiento" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Otipomovimiento.Descripcion"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipomovimiento.Codigo"/>
    </s:form>
</div>

<div id="divEliminarTipoMovimiento" style="display: none;" title="Eliminar Tipo de Movimiento">
    ¿Esta seguro de querer eliminar este Tipo de Movimiento?
</div>

<div id="divEditarTipoMovimiento" style="display: none;" title="Editar Tipo de Movimiento">
    <s:form id="formEditarTipoMovimiento" theme="simple">
        <s:hidden name="Otipomovimiento.idTipoMovimiento"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Otipomovimiento.Descripcion"/>
        <s:label value="Codigo"/>
        <s:textfield name="Otipomovimiento.Codigo"/>
    </s:form>
</div>


<jsp:include page="../MasterPage/Inferior.jsp" />