<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnActividad').addClass('activo');
        IniciarPagina('pagListaActividad');
        
        $("#formNuevoActividad").validationEngine();
        $("#formEditarActividad").validationEngine();
    });    

    function GrabarActividad(){
        $( "#divNuevoActividad" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formNuevoActividad").validationEngine('validate')){
                    var url = "GrabarActividad";
                    var data = $("#formNuevoActividad").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarActividad?Oactividad.Descripcion=", function(resultado){  
                                $("#divListaActividad").html(resultado);
                                IniciarPagina('pagListaActividad');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoActividad" ).dialog("close")
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
    function BuscarActividad(){
        var url = "BuscarActividad";
        var data = $("#formBuscarActividad").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaActividad").html(resultado);
            IniciarPagina('pagListaActividad');
        });  
    }
    function EliminarActividad(idActividad){
        $( "#divEliminarActividad" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarActividad?Oactividad.idActividad="+idActividad;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarActividad?Oactividad.Descripcion=", function(resultado){  
                                $("#divListaActividad").html(resultado);
                                IniciarPagina('pagListaActividad');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarActividad" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarActividad(idActividad,Descripcion,Codigo){
        $("#formEditarActividad input[name='Oactividad.idActividad']").val(idActividad);
        $("#formEditarActividad input[name='Oactividad.Descripcion']").val(Descripcion);
        $("#formEditarActividad input[name='Oactividad.Codigo']").val(Codigo);
        
        $("#divEditarActividad").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    if($("#formEditarActividad").validationEngine('validate')){
                    var url = "EditarActividad";
                    var data = $("#formEditarActividad").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            $.get("BuscarActividad?Oactividad.Descripcion=", function(resultado){  
                                $("#divListaActividad").html(resultado);
                                IniciarPagina('pagListaActividad');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarActividad" ).dialog("close")
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
<s:form id="formBuscarActividad" theme="simple">
    <table>
        <tr>
            <td>Descripcion:</td>
            <td><s:textfield name="Oactividad.Descripcion" onkeydown="Ejecutar(BuscarActividad);"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="#" onclick="GrabarActividad();"><img title="Nuevo Tipo de Producto" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarActividad(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>
        </tr>
    </table>
</s:form>

<div id="pagListaActividad">
<div id="divListaActividad">
    <table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Codigo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaActividad">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarActividad(<s:property value="idActividad"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarActividad(<s:property value="idActividad"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>

    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaActividad'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaActividad'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaActividad'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaActividad'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoActividad" style="display: none;" title="Nuevo Tipo de Producto">
    <s:form id="formNuevoActividad" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Oactividad.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oactividad.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarActividad" style="display: none;" title="Eliminar Tipo de Producto">
    ¿Esta seguro de querer eliminar el Tipo de Producto?
</div>

<div id="divEditarActividad" style="display: none;" title="Editar Tipo de Producto">
    <s:form id="formEditarActividad" theme="simple">
        <s:hidden name="Oactividad.idActividad"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Oactividad.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Oactividad.Codigo" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />