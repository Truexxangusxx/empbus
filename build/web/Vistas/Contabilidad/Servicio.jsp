<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnServicio').addClass('activo');
        
        $("#formNuevoServicio").validationEngine();
        $("#formEditarServicio").validationEngine();
        $(".lstEnviar").css('opacity','.5');
        $(".lstEnviar").attr('disabled','true');
    });    

    function GrabarServicio(){
        $( "#divNuevoServicio" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoServicio").validationEngine('validate')){
                        var url = "GrabarServicio";
                        var data = $("#formNuevoServicio").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarServicio();
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divNuevoServicio" ).dialog("close")
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
    function BuscarServicio(){
        var url = "BuscarServicio";
        var data = $("#formBuscarServicio").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaServicio").html(resultado);
            IniciarPagina('pagListaServicio');
            $(".lstEnviar").css('opacity','.5');
            $(".lstEnviar").attr('onclick','return false;')
        });  
    }
    function EliminarServicio(idServicio){
        $( "#divEliminarServicio" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarServicio?Oservicio.idServicio="+idServicio;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarServicio?Oservicio.Descripcion=", function(resultado){  
                                $("#divListaServicio").html(resultado);
                                IniciarPagina('pagListaServicio');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarServicio" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarServicio(idServicio,Descripcion,Codigo){
        $("#formEditarServicio input[name='Oservicio.idServicio']").val(idServicio);
        $("#formEditarServicio input[name='Oservicio.Descripcion']").val(Descripcion);
        $("#formEditarServicio input[name='Oservicio.Codigo']").val(Codigo);
        
        $("#divEditarServicio").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarServicio").validationEngine('validate')){
                        var url = "EditarServicio";
                        var data = $("#formEditarServicio").serialize();
                        $.getJSON(url, data, function(resultado){
                            if (resultado.error == false){
                                BuscarServicio();  
                                Mensaje(resultado.msg);
                            }
                            else{Error(resultado.msg);}
                            $( "#divEditarServicio" ).dialog("close")
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
<s:form id="formBuscarServicio" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Oservicio.Descripcion" onkeydown="Ejecutar(BuscarServicio);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarServicio();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarServicio(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaServicio">
    <div id="divListaServicio">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaServicio">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td align="center">
                            <a class="lstEditar" href="#" onclick="EditarServicio(<s:property value="idServicio"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEliminar" href="#" onclick="EliminarServicio(<s:property value="idServicio"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarServicio(<s:property value="idServicio"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaServicio'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaServicio'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaServicio'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaServicio'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoServicio" style="display: none;" title="Nueva Servicio">
    <s:form id="formNuevoServicio" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Oservicio.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oservicio.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<div id="divEliminarServicio" style="display: none;" title="Eliminar Servicio">
    ¿Esta seguro de querer eliminar este Tipo Compra?
</div>

<div id="divEditarServicio" style="display: none;" title="Editar Servicio">
    <s:form id="formEditarServicio" theme="simple">
        <s:hidden name="Oservicio.idServicio"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Oservicio.Descripcion" onkeydown="salto($(this));" cssClass="validate[required]" paso="1"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oservicio.Codigo" onkeydown="BotonDialog($(this));" cssClass="validate[required]" paso="2"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />