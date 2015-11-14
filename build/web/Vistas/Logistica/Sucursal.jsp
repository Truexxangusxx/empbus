<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnSucursal').addClass('activo');        
        IniciarPagina('pagListaSucursal');
    });    

    function GrabarSucursal(){
        $( "#divNuevoSucursal" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarSucursal";
                    var data = $("#formNuevoSucursal").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarSucursal").serialize();
                            $.get("BuscarSucursal", data, function(resultado){
                                $("#divListaSucursal").html(resultado);
                                IniciarPagina('pagListaSucursal');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoSucursal" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function BuscarSucursal(){
        var url = "BuscarSucursal";
        var data = $("#formBuscarSucursal").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaSucursal").html(resultado);
            IniciarPagina();
        });  
    }
    function EliminarSucursal(idSucursal){
        $( "#divEliminarSucursal" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarSucursal?Osucursal.idSucursal="+idSucursal;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarSucursal").serialize();
                            $.get("BuscarSucursal", data, function(resultado){  
                                $("#divListaSucursal").html(resultado);
                                IniciarPagina('pagListaSucursal');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarSucursal" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarSucursal(idSucursal,Descripcion,Direccion){
        
        $("#formEditarSucursal [name='Osucursal.idSucursal']").val(idSucursal);
        $("#formEditarSucursal [name='Osucursal.Descripcion']").val(Descripcion);
        $("#formEditarSucursal [name='Osucursal.Direccion']").val(Direccion);

        $("#divEditarSucursal").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarSucursal";
                    var data = $("#formEditarSucursal").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarSucursal").serialize();
                            $.get("BuscarSucursal", data, function(resultado){  
                                $("#divListaSucursal").html(resultado);
                                IniciarPagina('pagListaSucursal');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarSucursal" ).dialog("close")
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
<s:form id="formBuscarSucursal" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Osucursal.Descripcion"/></td>
        </tr>        
        <tr>
            <td>
                <a href="#" onclick="GrabarSucursal(); return false;"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarSucursal(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
            <td></td>
        </tr>
    </table>
</s:form>

<div id="pagListaSucursal">
    <div id="divListaSucursal">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Direccion</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaSucursal">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Direccion"/></td>
                        <td>
                            <a href="#" onclick="EditarSucursal(<s:property value="idSucursal"/>,'<s:property value="Descripcion"/>','<s:property value="Direccion"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a href="#" onclick="EliminarSucursal(<s:property value="idSucursal"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaSucursal'); return false;"><img width="40" height="40" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaSucursal'); return false;"><img width="40" height="40" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 30px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaSucursal'); return false;"><img width="40" height="40" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaSucursal'); return false;"><img width="40" height="40" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoSucursal" style="display: none;" title="Nueva Sucursal">
    <s:form id="formNuevoSucursal" theme="simple">
        <s:label value="Descripcion:"/>
        <s:textfield name="Osucursal.Descripcion"/>
        <s:label value="Direccion:"/>
        <s:textfield name="Osucursal.Direccion"/>        
    </s:form>
</div>

<div id="divEliminarSucursal" style="display: none;" title="Eliminar Sucursal">
    ¿Esta seguro de querer eliminar esta Sucursal?
</div>

<div id="divEditarSucursal" style="display: none;" title="Editar Sucursal">
    <s:form id="formEditarSucursal" theme="simple">
        <s:hidden name="Osucursal.idSucursal"/>
        <s:label value="Descripcion:"/>
        <s:textfield name="Osucursal.Descripcion"/>
        <s:label value="Direccion:"/>
        <s:textfield name="Osucursal.Direccion"/>        
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />