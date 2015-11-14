<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnCotizacion').addClass('activo');
        IniciarPagina('pagListaCotizacion');
    });
    
    function BuscarCotizacion(){
        var url = "BuscarCotizacion";
        var data = $("#formBuscarCotizacion").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaCotizacion").html(resultado);
            IniciarPagina('pagListaCotizacion');
        });  
    }
    
    function ImprimirCotizacion(idCotizacion){
        document.forms["formBuscarCotizacion"].action = "ImprimirCotizacion?Ocotizacion.idCotizacion="+idCotizacion;
        document.forms["formBuscarCotizacion"].target = "_blank";
        document.forms["formBuscarCotizacion"].submit();
        document.forms["formBuscarCotizacion"].target = "";
    }
    
    function EliminarCotizacion(idCotizacion){
        $( "#divEliminarCotizacion" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EliminarCotizacion?Ocotizacion.idCotizacion="+idCotizacion;
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){                
                            $.get("BuscarCotizacion?Ocotizacion.idClienteProveedor=0&Ocotizacion.Serie=", function(resultado){ 
                                $("#divListaCotizacion").html(resultado);
                                IniciarPagina('pagListaCotizacion');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEliminarCotizacion" ).dialog("close")
                    });
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

<s:form theme="simple" id="formBuscarCotizacion"> 
    <table>
        <tr>
            <td>Cliente:</td>
            <td><s:select cssClass="combobox" name="Ocotizacion.idClienteProveedor" list="ListaClienteProveedor" listKey="idClienteProveedor" listValue="RazonSocial"/></td>
        </tr>
        <tr>
            <td>Serie:</td>
            <td><s:textfield name="Ocotizacion.Serie"/></td>
        </tr>
    </table>
    <a href="#" onclick="BuscarCotizacion(); return false;"><img title="Buscar" width="40" height="40" src="../../images/Buscar.jpeg" /></a>
    <div id="pagListaCotizacion">
        <div id="divListaCotizacion">
            <table class="tabla">
                <thead>
                <th>Cliente</th>
                <th>Serie</th>
                <th>Modelo Chasis</th>
                <th>Fecha</th>
                <th>Numero Chasis</th>
                <th>Tipo Carroceria</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaCotizacion">
                        <tr>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td><s:property value="Serie"/></td>
                            <td><s:property value="DModeloChasis"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="NumeroChasis"/></td>
                            <td><s:property value="TipoCarroceria"/></td>
                            <td>
                                <a href="#" onclick="EliminarCotizacion(<s:property value="idCotizacion"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a>
                                <a href="#" onclick="ImprimirCotizacion(<s:property value="idCotizacion"/>); return false;"><img title="Imprimir" width="20" height="20" src="../../images/Imprimir.jpeg" /></a>
                                <a href="#" onclick="EnviarCotizacion(<s:property value="idModeloChasis"/>,<s:property value="NumeroChasis"/>,<s:property value="NumeroAsientos"/>,<s:property value="NumeroParabrisas"/>,<s:property value="Ventanas"/>,'<s:property value="TipoCarroceria"/>','<s:property value="ColorFondo"/>','<s:property value="ColorArtes"/>','<s:property value="ColorOtros"/>','<s:property value="Observaciones"/>'); return false;"><img title="Imprimir" width="20" height="20" src="../../images/Derecha.jpeg" /></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>

        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaCotizacion'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaCotizacion'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaCotizacion'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaCotizacion'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>


</s:form>

<div id="divEliminarCotizacion" style="display: none;" title="Eliminar Cotizacion">
    ¿Esta seguro de querer eliminar la Cotizacion?
</div>


<jsp:include page="../MasterPage/Inferior.jsp" />