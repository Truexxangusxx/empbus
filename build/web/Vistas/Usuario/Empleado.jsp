<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnEmpleado').addClass('activo');
        
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarEmpleado(){
        $( "#divNuevoEmpleado" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarEmpleado";
                    var data = $("#formNuevoEmpleado").serialize();                    
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarEmpleado").serialize();
                            $.get("BuscarEmpleado", data, function(resultado){  
                                $("#divListaEmpleado").html(resultado);
                                IniciarPagina('pagListaEmpleado');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoEmpleado" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function BuscarEmpleado(){
        var url = "BuscarEmpleado";
        var data = $("#formBuscarEmpleado").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaEmpleado").html(resultado);
            IniciarPagina('pagListaEmpleado');
        });  
    }
    function EliminarEmpleado(idEmpleado){
        $( "#divEliminarEmpleado" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarEmpleado?Oempleado.idEmpleado="+idEmpleado;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarEmpleado").serialize();
                            $.get("BuscarEmpleado", data, function(resultado){  
                                $("#divListaEmpleado").html(resultado);
                                IniciarPagina('pagListaEmpleado');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarEmpleado" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarEmpleado(idEmpleado,Nombre,DNI,Direccion,Codigo,Telefono1,Telefono2,Puesto){
        $("#formEditarEmpleado [name='Oempleado.idEmpleado']").val(idEmpleado);
        $("#formEditarEmpleado [name='Oempleado.Nombre']").val(Nombre);
        $("#formEditarEmpleado [name='Oempleado.DNI']").val(DNI);
        $("#formEditarEmpleado [name='Oempleado.Direccion']").val(Direccion);
        $("#formEditarEmpleado [name='Oempleado.Codigo']").val(Codigo);
        $("#formEditarEmpleado [name='Oempleado.Telefono1']").val(Telefono1);
        $("#formEditarEmpleado [name='Oempleado.Telefono2']").val(Telefono2);
        $("#formEditarEmpleado [name='Oempleado.Puesto']").val(Puesto);
        
        $("#divEditarEmpleado").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarEmpleado";
                    var data = $("#formEditarEmpleado").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var data = $("#formBuscarEmpleado").serialize();
                            $.get("BuscarEmpleado", data, function(resultado){  
                                $("#divListaEmpleado").html(resultado);
                                IniciarPagina('pagListaEmpleado');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarEmpleado" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    
    function Ejecutar(){
        if (event.which || event.keyCode) {
            if ((event.which == 13) || (event.keyCode == 13))
            {
                event.preventDefault();
                BuscarEmpleado();
            }
        }
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formBuscarEmpleado" theme="simple">
    <table>
        <tr>
            <td>Nombre:</td>
        </tr>
        <tr>
            <td><s:textfield name="Oempleado.Nombre" onkeypress="Ejecutar();"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarEmpleado();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarEmpleado(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaEmpleado">
    <div id="divListaEmpleado">
        <table class="tabla">
            <thead>
            <th>Nombre</th>
            <th>DNI</th>
            <th>Direccion</th>
            <th>Codigo</th>
            <th>Telefono1</th>
            <th>Telefono2</th>
            <th>Puesto</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaEmpleado">
                    <tr>
                        <td><s:property value="Nombre"/></td>
                        <td><s:property value="DNI"/></td>
                        <td><s:property value="Direccion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td><s:property value="Telefono1"/></td>
                        <td><s:property value="Telefono2"/></td>
                        <td><s:property value="Puesto"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarEmpleado(<s:property value="idEmpleado"/>,'<s:property value="Nombre"/>','<s:property value="DNI"/>','<s:property value="Direccion"/>','<s:property value="Codigo"/>','<s:property value="Telefono1"/>','<s:property value="Telefono2"/>','<s:property value="Puesto"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarEmpleado(<s:property value="idEmpleado"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarEmpleado(<s:property value="idEmpleado"/>,'<s:property value="Nombre"/>','<s:property value="DNI"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaEmpleado'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaEmpleado'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaEmpleado'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaEmpleado'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoEmpleado" style="display: none;" title="Nuevo Empleado">
    <s:form id="formNuevoEmpleado" theme="simple">
        <s:label value="Nombre:"/>
        <s:textfield name="Oempleado.Nombre"/>
        <s:label value="DNI:"/>
        <s:textfield name="Oempleado.DNI"/>
        <s:label value="Direccion:"/>
        <s:textfield name="Oempleado.Direccion"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Oempleado.Codigo"/>
        <s:label value="Telefono1:"/>
        <s:textfield name="Oempleado.Telefono1"/>
        <s:label value="Telefono2:"/>
        <s:textfield name="Oempleado.Telefono2"/>
        <s:label value="Puesto:"/>
        <s:textfield name="Oempleado.Puesto"/>        
    </s:form>
</div>

<div id="divEliminarEmpleado" style="display: none;" title="Eliminar Empleado">
    ¿Esta seguro de querer eliminar este Empleado?
</div>

<div id="divEditarEmpleado" style="display: none;" title="Editar Empleado">
    <s:form id="formEditarEmpleado" theme="simple">
        <s:hidden name="Oempleado.idEmpleado"/>
        <s:label value="Nombre:"/>
        <s:textfield name="Oempleado.Nombre"/>
        <s:label value="DNI:"/>
        <s:textfield name="Oempleado.DNI"/>
        <s:label value="Direccion:"/>
        <s:textfield name="Oempleado.Direccion"/>
        <s:label value="Codigo:"/>
        <s:textfield name="Oempleado.Codigo"/>
        <s:label value="Telefono1:"/>
        <s:textfield name="Oempleado.Telefono1"/>
        <s:label value="Telefono2:"/>
        <s:textfield name="Oempleado.Telefono2"/>
        <s:label value="Puesto:"/>
        <s:textfield name="Oempleado.Puesto"/>        
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />