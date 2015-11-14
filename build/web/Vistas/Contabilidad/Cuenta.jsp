<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnCuenta').addClass('activo');
        
        $("#formNuevoCuenta").validationEngine();
        $("#formEditarCuenta").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarCuenta(){
        $( "#divNuevoCuenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoCuenta").validationEngine('validate')){
                        var url = "GrabarCuenta";
                        var data = $("#formNuevoCuenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarCuenta();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoCuenta" ).dialog("close")
                        })
                    }
                },
                "Cancelar": function() {
                    $( this ).dialog("close");
                }
            },
            close: function( event, ui ) {$(".formError").remove()}
        });
    }
    function BuscarCuenta(){
        var url = "BuscarCuenta";
        var data = $("#formBuscarCuenta").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaCuenta").html(resultado);
            IniciarPagina('pagListaCuenta');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarCuenta(idCuenta){
        $( "#divEliminarCuenta" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarCuenta?Ocuenta.idCuenta="+idCuenta;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarCuenta?Ocuenta.Descripcion=", function(resultado){  
                                $("#divListaCuenta").html(resultado);
                                IniciarPagina('pagListaCuenta');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarCuenta" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarCuenta(idCuenta,Descripcion,Codigo){
        $("#formEditarCuenta input[name='Ocuenta.idCuenta']").val(idCuenta);
        $("#formEditarCuenta input[name='Ocuenta.Descripcion']").val(Descripcion);
        $("#formEditarCuenta input[name='Ocuenta.Codigo']").val(Codigo);
        
        $("#divEditarCuenta").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarCuenta").validationEngine('validate')){
                        var url = "EditarCuenta";
                        var data = $("#formEditarCuenta").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarCuenta();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarCuenta" ).dialog("close")
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
<s:form id="formBuscarCuenta" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Ocuenta.Descripcion" onkeydown="Ejecutar(BuscarCuenta);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarCuenta();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarCuenta(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaCuenta">
    <div id="divListaCuenta">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaCuenta">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarCuenta(<s:property value="idCuenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarCuenta(<s:property value="idCuenta"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarCuenta(<s:property value="idCuenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaCuenta'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaCuenta'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaCuenta'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaCuenta'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoCuenta" style="display: none;" title="Nueva Cuenta">
    <s:form id="formNuevoCuenta" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Ocuenta.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Ocuenta.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<div id="divEliminarCuenta" style="display: none;" title="Eliminar Cuenta">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarCuenta" style="display: none;" title="Editar Cuenta">
    <s:form id="formEditarCuenta" theme="simple">
        <s:hidden name="Ocuenta.idCuenta"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Ocuenta.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Ocuenta.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />