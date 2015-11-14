<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnAlmacen').addClass('activo');        
        IniciarPagina('pagListaAlmacen');
    });    

    function GrabarAlmacen(){
        $( "#divNuevoAlmacen" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarAlmacen";
                    var data = $("#formNuevoAlmacen").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarAlmacen").serialize();
                            $.get("BuscarAlmacen", data, function(resultado){
                                $("#divListaAlmacen").html(resultado);
                                IniciarPagina('pagListaAlmacen');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoAlmacen" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function BuscarAlmacen(){
        var url = "BuscarAlmacen";
        var data = $("#formBuscarAlmacen").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaAlmacen").html(resultado);
            IniciarPagina();
        });  
    }
    function EliminarAlmacen(idAlmacen){
        $( "#divEliminarAlmacen" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarAlmacen?Oalmacen.idAlmacen="+idAlmacen;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarAlmacen").serialize();
                            $.get("BuscarAlmacen", data, function(resultado){  
                                $("#divListaAlmacen").html(resultado);
                                IniciarPagina('pagListaAlmacen');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarAlmacen" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarAlmacen(idAlmacen,idSucursal,Descripcion,Codigo){
        
        $("#formEditarAlmacen [name='Oalmacen.idAlmacen']").val(idAlmacen);
        $("#formEditarAlmacen [name='Oalmacen.idSucursal']").val(idSucursal);
        $("#formEditarAlmacen [name='Oalmacen.Descripcion']").val(Descripcion);
        $("#formEditarAlmacen [name='Oalmacen.Codigo']").val(Codigo);

        $("#divEditarAlmacen").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarAlmacen";
                    var data = $("#formEditarAlmacen").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarAlmacen").serialize();
                            $.get("BuscarAlmacen", data, function(resultado){  
                                $("#divListaAlmacen").html(resultado);
                                IniciarPagina('pagListaAlmacen');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarAlmacen" ).dialog("close")
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
<s:form id="formBuscarAlmacen" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Oalmacen.Descripcion"/></td>
        </tr>        
        <tr>
            <td>
                <a href="#" onclick="GrabarAlmacen(); return false;"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarAlmacen(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
            <td></td>
        </tr>
    </table>
</s:form>

<div id="pagListaAlmacen">
    <div id="divListaAlmacen">
        <table class="tabla">
            <thead>
            <th>Sucursal</th>
            <th>Almacen</th>
            <th>Codigo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaAlmacen">
                    <tr>
                        <td><s:property value="DSucursal"/></td>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td>
                            <a href="#" onclick="EditarAlmacen(<s:property value="idAlmacen"/>, <s:property value="idSucursal"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a href="#" onclick="EliminarAlmacen(<s:property value="idAlmacen"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaAlmacen'); return false;"><img width="40" height="40" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaAlmacen'); return false;"><img width="40" height="40" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 30px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaAlmacen'); return false;"><img width="40" height="40" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaAlmacen'); return false;"><img width="40" height="40" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoAlmacen" style="display: none;" title="Nuevo Almacen">
    <s:form id="formNuevoAlmacen" theme="simple">
        <s:label value="Sucursal:"/>
        <s:select name="Oalmacen.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
        <s:label value="Descripcion:"/>
        <s:textfield name="Oalmacen.Descripcion"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Oalmacen.Codigo"/>        
    </s:form>
</div>

<div id="divEliminarAlmacen" style="display: none;" title="Eliminar Almacen">
    ¿Esta seguro de querer eliminar este Almacen?
</div>

<div id="divEditarAlmacen" style="display: none;" title="Editar Almacen">
    <s:form id="formEditarAlmacen" theme="simple">
        <s:hidden name="Oalmacen.idAlmacen"/>
        <s:label value="Sucursal:"/>
        <s:select name="Oalmacen.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
        <s:label value="Descripcion:"/>
        <s:textfield name="Oalmacen.Descripcion"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Oalmacen.Codigo"/>        
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />