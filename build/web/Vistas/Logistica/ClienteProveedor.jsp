<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnClienteProveedor').addClass('activo');        
    });    

    function GrabarClienteProveedor(){
        $( "#divNuevoClienteProveedor" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarClienteProveedor";
                    var data = $("#formNuevoClienteProveedor").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarClienteProveedor?Oclienteproveedor.Ruc=&Oclienteproveedor.RazonSocial=", function(resultado){
                                $("#divListaClienteProveedor").html(resultado);
                                IniciarPagina();
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoClienteProveedor" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function BuscarClienteProveedor(){
        var url = "BuscarClienteProveedor";
        var data = $("#formBuscarCliente").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaClienteProveedor").html(resultado);
            IniciarPagina();
        });  
    }
    function EliminarClienteProveedor(idClienteProveedor){
        $( "#divEliminarClienteProveedor" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarClienteProveedor?Oclienteproveedor.idClienteProveedor="+idClienteProveedor;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarClienteProveedor?Oclienteproveedor.Ruc=&Oclienteproveedor.RazonSocial=", function(resultado){  
                                $("#divListaClienteProveedor").html(resultado);
                                IniciarPagina();
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarClienteProveedor" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarClienteProveedor(idClienteProveedor,RazonSocial,Ruc,Dni,Telefono1,Telefono2,Direccion,Correo,Contacto){
        
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.idClienteProveedor']").val(idClienteProveedor);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.RazonSocial']").val(RazonSocial);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.Ruc']").val(Ruc);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.Dni']").val(Dni);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.Telefono1']").val(Telefono1);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.Telefono2']").val(Telefono2);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.Direccion']").val(Direccion);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.Correo']").val(Correo);
        $("#formEditarClienteProveedor input[name='Oclienteproveedor.Contacto']").val(Contacto);

        $("#divEditarClienteProveedor").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarClienteProveedor";
                    var data = $("#formEditarClienteProveedor").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarClienteProveedor?Oclienteproveedor.Ruc=&Oclienteproveedor.RazonSocial=", function(resultado){  
                                $("#divListaClienteProveedor").html(resultado);
                                IniciarPagina();
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarClienteProveedor" ).dialog("close")
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
<s:form id="formBuscarClienteProveedor" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Oclienteproveedor.RazonSocial"/></td>
        </tr>
        <tr>
            <td>RUC:</td>
            <td><s:textfield name="Oclienteproveedor.Ruc"/></td>
        </tr>
        <tr>
            <td><a href="#" onclick="GrabarClienteProveedor();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarClienteProveedor(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a></td>
            <td></td>
        </tr>
    </table>
</s:form>

<div id="divListaClienteProveedor">
    <table class="tabla">
        <thead>
        <th>Razon Social</th>
        <th>Ruc</th>
        <th>Dni</th>
        <th>Telefono1</th>
        <th>Telefono2</th>
        <th>Direccion</th>
        <th>Correo</th>
        <th>Contacto</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaClienteProveedor">
                <tr>
                    <td><s:property value="RazonSocial"/></td>
                    <td><s:property value="Ruc"/></td>
                    <td><s:property value="Dni"/></td>
                    <td><s:property value="Telefono1"/></td>
                    <td><s:property value="Telefono2"/></td>
                    <td><s:property value="Direccion"/></td>
                    <td><s:property value="Correo"/></td>
                    <td><s:property value="Contacto"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarClienteProveedor(<s:property value="idClienteProveedor"/>,'<s:property value="RazonSocial"/>','<s:property value="Ruc"/>','<s:property value="Dni"/>','<s:property value="Telefono1"/>','<s:property value="Telefono2"/>','<s:property value="Direccion"/>','<s:property value="Correo"/>','<s:property value="Contacto"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarClienteProveedor(<s:property value="idClienteProveedor"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>
<div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft(); return false;"><img width="40" height="40" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left(); return false;"><img width="40" height="40" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 30px;" id="indice" /></td>
            <td><a href="#" onclick="rigth(); return false;"><img width="40" height="40" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth(); return false;"><img width="40" height="40" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" id="count" />
    <input type="hidden" id="number" value="10" />
</div>

<div id="divNuevoClienteProveedor" style="display: none;" title="Nuevo Cliente o Proveedor">
    <s:form id="formNuevoClienteProveedor" theme="simple">
        <s:label value="Razon Social:"/>
        <s:textfield name="Oclienteproveedor.RazonSocial"/>
        <s:label value="Ruc:"/>
        <s:textfield name="Oclienteproveedor.Ruc"/>
        <s:label value="Dni:"/>
        <s:textfield name="Oclienteproveedor.Dni"/>
        <s:label value="Telefono1:"/>
        <s:textfield name="Oclienteproveedor.Telefono1"/>
        <s:label value="Telefono2:"/>
        <s:textfield name="Oclienteproveedor.Telefono2"/>
        <s:label value="Direccion:"/>
        <s:textfield name="Oclienteproveedor.Direccion"/>
        <s:label value="Correo:"/>
        <s:textfield name="Oclienteproveedor.Correo"/>
        <s:label value="Contacto:"/>
        <s:textfield name="Oclienteproveedor.Contacto"/>
    </s:form>
</div>

<div id="divEliminarClienteProveedor" style="display: none;" title="Eliminar Cliente o Proveedor">
    ¿Esta seguro de querer eliminar el Cliente o Proveedor?
</div>

<div id="divEditarClienteProveedor" style="display: none;" title="Editar Cliente o Proveedor">
    <s:form id="formEditarClienteProveedor" theme="simple">
        <s:hidden name="Oclienteproveedor.idClienteProveedor"/>
        <s:label value="Razon Social:"/>
        <s:textfield name="Oclienteproveedor.RazonSocial"/>
        <s:label value="Ruc:"/>
        <s:textfield name="Oclienteproveedor.Ruc"/>
        <s:label value="Dni:"/>
        <s:textfield name="Oclienteproveedor.Dni"/>
        <s:label value="Telefono1:"/>
        <s:textfield name="Oclienteproveedor.Telefono1"/>
        <s:label value="Telefono2:"/>
        <s:textfield name="Oclienteproveedor.Telefono2"/>
        <s:label value="Direccion:"/>
        <s:textfield name="Oclienteproveedor.Direccion"/>
        <s:label value="Correo:"/>
        <s:textfield name="Oclienteproveedor.Correo"/>
        <s:label value="Contacto:"/>
        <s:textfield name="Oclienteproveedor.Contacto"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />