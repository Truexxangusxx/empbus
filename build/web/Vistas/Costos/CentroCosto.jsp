<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnCentroCosto').addClass('activo');
        IniciarPagina('pagListaCentroCosto');
    });    

    function GrabarCentroCosto(){
        $( "#divNuevoCentroCosto" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarCentroCosto";
                    var data = $("#formNuevoCentroCosto").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarCentroCosto").serialize();
                            $.get("BuscarCentroCosto", data,function(resultado){  
                                $("#divListaCentroCosto").html(resultado);
                                IniciarPagina('pagListaCentroCosto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoCentroCosto" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function BuscarCentroCosto(){
        var url = "BuscarCentroCosto";
        var data = $("#formBuscarCentroCosto").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaCentroCosto").html(resultado);
            IniciarPagina('pagListaCentroCosto');
        });  
    }
    function EliminarCentroCosto(idCentroCosto){
        $( "#divEliminarCentroCosto" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarCentroCosto?Ocentrocosto.idCentroCosto="+idCentroCosto;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarCentroCosto").serialize();
                            $.get("BuscarCentroCosto", data, function(resultado){  
                                $("#divListaCentroCosto").html(resultado);
                                IniciarPagina('pagListaCentroCosto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarCentroCosto" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarCentroCosto(idCentroCosto,Descripcion,Codigo){
        $("#formEditarCentroCosto input[name='Ocentrocosto.idCentroCosto']").val(idCentroCosto);
        $("#formEditarCentroCosto input[name='Ocentrocosto.Descripcion']").val(Descripcion);
        $("#formEditarCentroCosto input[name='Ocentrocosto.Codigo']").val(Codigo);
        
        $("#divEditarCentroCosto").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarCentroCosto";
                    var data = $("#formEditarCentroCosto").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarCentroCosto").serialize();
                            $.get("BuscarCentroCosto", data, function(resultado){  
                                $("#divListaCentroCosto").html(resultado);
                                IniciarPagina('pagListaCentroCosto');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarCentroCosto" ).dialog("close")
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


<s:form id="formBuscarCentroCosto" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Ocentrocosto.Descripcion"/></td>
        </tr>
        <tr>
            <td>Codigo:</td>
            <td><s:textfield name="Ocentrocosto.Codigo"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarCentroCosto();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
            <a href="#" onclick="BuscarCentroCosto(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaCentroCosto">
<div id="divListaCentroCosto">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaCentroCosto">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarCentroCosto(<s:property value="idCentroCosto"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarCentroCosto(<s:property value="idCentroCosto"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaCentroCosto'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaCentroCosto'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaCentroCosto'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaCentroCosto'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoCentroCosto" style="display: none;" title="Nuevo Centro de Costo">
    <s:form id="formNuevoCentroCosto" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Ocentrocosto.Descripcion"/>
        <s:label value="Codigo"/>
        <s:textfield name="Ocentrocosto.Codigo"/>
    </s:form>
</div>

<div id="divEliminarCentroCosto" style="display: none;" title="Eliminar Centro de Costo">
    ¿Esta seguro de querer eliminar este Centro de Costo?
</div>

<div id="divEditarCentroCosto" style="display: none;" title="Editar Centro Costo">
    <s:form id="formEditarCentroCosto" theme="simple">
        <s:hidden name="Ocentrocosto.idCentroCosto"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Ocentrocosto.Descripcion"/>
        <s:label value="Codigo"/>
        <s:textfield name="Ocentrocosto.Codigo"/>
    </s:form>
</div>


<jsp:include page="../MasterPage/Inferior.jsp" />