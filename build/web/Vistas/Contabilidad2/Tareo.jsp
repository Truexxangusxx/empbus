<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnTareo').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoTareo").validationEngine();
        $( "#tabs" ).tabs();
        
    });

    function deshabilitar(){
        $(".lstEditar").css('opacity','.5');
        $(".lstEditar").attr('onclick','return false;')
        $(".lstEliminar").css('opacity','.5');
        $(".lstEliminar").attr('onclick','return false;')
        $(".lstImprimir").css('opacity','.5');
        $(".lstImprimir").attr('onclick','return false;')
    }
    
    function ObtenerTipoCambio() {
        var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoTareo [name='Otareo.Fecha']").val(), "Otipocambio.idMonedaCobra": $("#formNuevoTareo [name='Otareo.Moneda.idMoneda']").val(), "Otipocambio.idMonedaPago": 0};
        $.getJSON(url, data, function(resultado) {
            $("#formNuevoTareo [name='Otareo.TipoCambio']").val(resultado.valor);
        });
    }
    
    
    function Nuevo(){
        $("#formNuevoTareo [name='Operacion']").val('Nuevo');
    }
    function NuevoBlanco(){
        var url = "LoadTareo";
        var data = {"Otareo.idTareo": 0, "Operacion":"Nuevo"};
        $('body').load(url, data);
    }
    function GrabarTareo(){
        if($("#formNuevoTareo").validationEngine('validate')){
            var url = "GrabarTareo";
            var data = $("#formNuevoTareo").serialize();
            $.getJSON(url,data, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    var Tareo = resultado.otareo;
                    var datos = {"Otareo.idTareo":Tareo.idTareo , "Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadTareo";
                    $("body").load(url, datos);
                }
            });
        }
    }
    
    function AbrirTareo(){
        $("#divBuscarTareo").dialog({
            width: 'auto'
        });
    }
    function BuscarTareo(){
        var url = "BuscarTareo";
        var data = $("#formBuscarTareo").serialize();
        $.get(url, data, function(resultado){
            $("#divListaTareo").html(resultado);
            IniciarPagina('pagListaTareo');
        });
    }
    function EnviarTareo(idTareo){
        var url = "LoadTareo";
        var data = {"Otareo.idTareo":idTareo};
        $('body').load(url,data);
    }
    
    function CambiarANuevo(){
        $("#formNuevoTareo [name='Operacion']").val('Nuevo');
    }
    
    function NuevoTareo(){
        var url = "LoadTareo";
        var data = {"Otareo.idTareo":0, "Operacion":"Nuevo"};
        $('body').load(url,data);
    }
    
    function AbrirOrdenProduccion(){
        $( "#divBuscarOrdenProduccion" ).dialog({
            width:'auto'
        });
    }
    
    function BuscarOrdenProduccion(){
        var url = "BuscarOrdenProduccion";
        var data = $("#formBuscarOrdenProduccion").serialize();
        $.get(url,data, function(resultado){
            $("#divListaOrdenProduccion").html(resultado);
            IniciarPagina('pagListaOrdenProduccion');
            deshabilitar();
        });  
    }
    
    function EnviarOrdenProduccion(idOrdenProduccion, Numero){
        $("#formAgregarDetalleTareo [name='Odetalletareo.OrdenProduccion.idOrdenProduccion']").val(idOrdenProduccion);
        $("#formAgregarDetalleTareo [name='Odetalletareo.OrdenProduccion.Numero']").val(Numero);
        $( "#divBuscarOrdenProduccion" ).dialog('close');
    }
    
    function AbrirActividad(){
        $( "#divBuscarActividad" ).dialog({
            width:'auto'
        });
    }
    
    function BuscarActividad(){
        var url = "BuscarActividad";
        var data = $("#formBuscarActividad").serialize();
        $.get(url,data, function(resultado){
            $("#divListaActividad").html(resultado);
            IniciarPagina('pagListaActividad');
            deshabilitar();
        });  
    }
    
    function EnviarActividad(idActividad, descripcion, codigo){
        $("#formAgregarDetalleTareo [name='Odetalletareo.Actividad.idActividad']").val(idActividad);
        $("#formAgregarDetalleTareo [name='Odetalletareo.Actividad.Descripcion']").val(descripcion);
        $("#formAgregarDetalleTareo [name='Odetalletareo.Actividad.Codigo']").val(codigo);
        $( "#divBuscarActividad" ).dialog('close');
    }
    
    function AbrirEmpleado(numero){
        $("#tipoempleado").val(numero);
        $( "#divBuscarEmpleado" ).dialog({
            width:'auto'
        });
    }
    
    function BuscarEmpleado(){
        var url = "BuscarEmpleado";
        var data = $("#formBuscarEmpleado").serialize();
        $.get(url,data, function(resultado){
            $("#divListaEmpleado").html(resultado);
            IniciarPagina('pagListaEmpleado');
            deshabilitar();
        });  
    }
    
    function EnviarEmpleado(idEmpleado, Nombre, DNI){
        if ($("#tipoempleado").val()==1){
            $("#formNuevoTareo [name='Otareo.Empleado.idEmpleado']").val(idEmpleado);
            $("#formNuevoTareo [name='Otareo.Empleado.Nombre']").val(Nombre);
            $("#formNuevoTareo [name='Otareo.Empleado.Codigo']").val(DNI);
        }
        if ($("#tipoempleado").val()==2){
            $("#formAgregarDetalleTareo [name='Odetalletareo.Empleado.idEmpleado']").val(idEmpleado);
            $("#formAgregarDetalleTareo [name='Odetalletareo.Empleado.Nombre']").val(Nombre);
            $("#formAgregarDetalleTareo [name='Odetalletareo.Empleado.Codigo']").val(DNI);
        }
        $( "#divBuscarEmpleado" ).dialog('close');
    }    
    
    function AgregarDetalleTareo() {
        $("#divAgregarDetalleTareo").dialog({
            width: 'auto',
            modal: true,
            buttons: {
                "Agregar": function() {
                    var url = "AgregarDetalleTareo";
                    var data = $("#formAgregarDetalleTareo").serialize();
                    $.get(url, data, function(resultado){
                        $("#divListaDetalleTareo").html(resultado);
                        IniciarPagina('pagListaDetalleTareo');
                    });
                    limpiaForm($("#formAgregarDetalleTareo"));
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function QuitarDetalleTareo(index) {

        var url = "QuitarDetalleTareo";
        var data ={ "index":index};
        $.get(url, data, function(resultado){
            $("#divListaDetalleTareo").html(resultado);
            IniciarPagina('pagListaDetalleTareo');
        });
         
    }
    
    function AbrirCentroCosto(){
        $("#divBuscarCentroCosto").dialog({
            width: 'auto'
        });
    }
    function BuscarCentroCosto(){
        var url = "BuscarCentroCosto";
        var data = $("#formBuscarCentroCosto").serialize();
        $.get(url, data, function(resultado){
            $("#divListaCentroCosto").html(resultado);
            IniciarPagina('pagListaCentroCosto');
        });
    }
    function EnviarCentroCosto(idCentroCosto,descripcion,codigo){
        $("[name='Odetalletareo.CentroCosto.idCentroCosto']").val(idCentroCosto);
        $("[name='Odetalletareo.CentroCosto.Descripcion']").val(descripcion);
        $("[name='Odetalletareo.CentroCosto.Codigo']").val(codigo);
        $("#divBuscarCentroCosto").dialog("close");
    }
    
    function ObtenerTipoCambio(){
        
        var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoTareo [name='Otareo.Fecha']").val(), "Otipocambio.idMonedaCobra": 0, "Otipocambio.idMonedaPago": 0};
        $.getJSON(url, data, function(resultado) {
            $("#formNuevoTareo [name='Otareo.TipoCambio']").val(resultado.valor);
        });
        
    }
    
    function ValidarHora(elemento){
        var error = false;
        var cadena = elemento.val();
        var puntos=0;
        for (var i = 0; i< cadena.length; i++) {
            var caracter = cadena.charAt(i);
            if( caracter == "." || caracter == ":" ) {
                puntos = i;
            }
        }
        var hora = cadena.substr(0, puntos);
        var minutos = cadena.substr(puntos+1);
        
        if (puntos == 0){error = true;}
        else{
            if (cadena.length < 3 || cadena.length > 5){error = true;}
            else{if (!/^([0-9])*$/.test(hora)){error = true;}
                else{
                    if (!/^([0-9])*$/.test(minutos)){error = true;}
                    else{
                        if (hora<0 || hora > 23 || minutos<0 || minutos > 59){error = true;}
                    }
                }                
            }
        }
        
        if (error){Error('no es una hora valida'); elemento.focus();}
        else{elemento.val(cadena.replace(":","."));}
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>

<s:hidden id="tipoempleado"/>


<s:form id="formNuevoTareo" theme="simple">
    <s:hidden name="Otareo.idTareo"/>




    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarDetalleTareo();
                    return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarTareo();
                    return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirTareo();
                    return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="NuevoBlanco();
                    return false;"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="Nuevo();
                    return false;"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#"><img title="Aprobar" src="../../images/Aprobado.jpeg" width="40px" height="40px"/></a>
                <a href="#"><img title="Imprimir" src="../../images/Imprimir.jpeg" width="40px" height="40px"/></a>
            </td>
            <td style="width: 50%;">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Operacion:"/>
                            <s:textfield name="Operacion" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>
                            <s:label value="Numero:"/>
                            <s:textfield name="Otareo.Numero" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>   
            <td colspan="2" class="cuadro" >
                <h3>Registro</h3>


                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Periodo:"/>
                            <s:textfield name="Otareo.Periodo" />
                        </td>
                        <td>
                            <s:label value="Fecha:"/>
                            <s:textfield name="Otareo.Fecha" cssClass="datepicker"/>
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Sucursal:"/>
                            <s:select name="Otareo.Sucursal.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Tipo cambio:"/>
                            <s:textfield name="Otareo.TipoCambio" onclick="ObtenerTipoCambio(); return false;"/>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>


            </td>


        </tr>

        <tr>
            <td colspan="2" class="cuadro">
                <h3>Responsable</h3>


                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Empleado:"/>
                            <s:hidden name="Otareo.Empleado.idEmpleado" />
                            <s:textfield name="Otareo.Empleado.Codigo" onclick="AbrirEmpleado(1); return false;"/>
                            <s:textfield name="Otareo.Empleado.Nombre" onclick="AbrirEmpleado(1); return false;"/>
                        </td>
                        <td>
                            <s:label value="Total Horas:"/>
                            <s:textfield name="Otareo.TotalHoras" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <s:label value="Observaciones:"/>
                            <s:textarea name="Otareo.Observaciones" cols="125"/>
                        </td>
                    </tr>
                </table>


            </td>


        </tr>


    </table>




</s:form>



<div id="tabs" style="width: 80%;">
    <ul>
        <li><a href="#tabs-1">Detalle del Documento</a></li>
        <li><a href="#tabs-2">Historial</a></li>
    </ul>
    <div id="tabs-1">

        <div id="divListaDetalleTareo">
            <jsp:include page="Auxiliar/ListaDetalleTareo.jsp" />
        </div>

    </div>

    <div id="tabs-2">



    </div>

</div>



<!------------------------------------------------------------------------------------------------------------------>


<div id="divBuscarTareo" style="display: none;" title="Buscar Tareo">
    <s:form id="formBuscarTareo">

        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Otareo.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarTareo(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarTareo(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaTareo">
        <div id="divListaTareo">
            <jsp:include page="Auxiliar/ListaTareo.jsp" />
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaTareo'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaTareo'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaTareo'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaTareo'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>


<div id="divAgregarDetalleTareo" title="Agregar Detalle de Factura" style="display: none;">

    <form id="formAgregarDetalleTareo" theme="simple">
        <s:hidden name="Odetalletareo.idDetalleTareo"/>
        <s:label value="Empleado:"/>
        <s:hidden name="Odetalletareo.Empleado.Codigo"/>
        <s:hidden name="Odetalletareo.Empleado.idEmpleado"/>
        <s:textfield name="Odetalletareo.Empleado.Nombre" onclick="AbrirEmpleado(2);" cssClass="validate[required]"/>
        <s:label value="OT:"/>
        <s:hidden name="Odetalletareo.OrdenProduccion.idOrdenProduccion"/>
        <s:textfield name="Odetalletareo.OrdenProduccion.Numero" onclick="AbrirOrdenProduccion(); return false;"/>
        <s:label value="Actividad:"/>
        <s:hidden name="Odetalletareo.Actividad.Codigo"/>
        <s:hidden name="Odetalletareo.Actividad.idActividad"/>
        <s:textfield name="Odetalletareo.Actividad.Descripcion" onclick="AbrirActividad();" cssClass="validate[required]"/>
        <s:label value="Hora inicio:"/>
        <s:textfield name="Odetalletareo.HoraInicio" onblur="ValidarHora($(this)); return false;" cssClass="validate[required]"/>
        <s:label value="Hora Fin:"/>
        <s:textfield name="Odetalletareo.HoraFin" onblur="ValidarHora($(this)); return false;" cssClass="validate[required]"/>
        <s:label value="Centro de costo:"/>
        <s:hidden name="Odetalletareo.CentroCosto.Codigo"/>
        <s:hidden name="Odetalletareo.CentroCosto.idCentroCosto"/>
        <s:textfield name="Odetalletareo.CentroCosto.Descripcion" onclick="AbrirCentroCosto();" cssClass="validate[required]"/>
    </form>

</div>





<div id="divBuscarOrdenProduccion" style="display: none;" title="Buscar Orden de Produccion">
    <s:form id="formBuscarOrdenProduccion" >
        <table>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Oordenproduccion.Numero" onkeypress="if(event.keyCode == 13){ BuscarOrdenProduccion(); return false; }"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarOrdenProduccion(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaOrdenProduccion">    
        <div id="divListaOrdenProduccion">
            <table class="tabla">
                <thead>
                <th>Numero</th>
                <th>Cliente</th>
                <th>Sucursal</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th>Operacion</th>
                </thead>
                <tbody>
                    <s:iterator value="ListaOrdenProduccion">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td><s:property value="DSucursal"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="Estado"/></td>
                            <td><a href="#" onclick="EnviarOrdenProduccion(<s:property value="idOrdenProduccion"/>,'<s:property value="Numero"/>'); return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaOrdenProduccion'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaOrdenProduccion'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaOrdenProduccion'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaOrdenProduccion'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>



<div id="divBuscarEmpleado" style="display: none;" title="Buscar Orden de Produccion">
    <s:form id="formBuscarEmpleado" >
        <table>

            <tr><td>
                    <s:label value="Nombre:"/>
                    <s:textfield name="Oempleado.Nombre" onkeypress="if(event.keyCode == 13){ BuscarEmpleado(); return false; }"/>
                </td>
            </tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarEmpleado(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaEmpleado">    
        <div id="divListaEmpleado">

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
</div>


<div id="divBuscarActividad" style="display: none;" title="Buscar Actividad">
    <s:form id="formBuscarActividad">

        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Oactividad.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarActividad(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarActividad(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaActividad">
        <div id="divListaActividad">
            <jsp:include page="Auxiliar/ListaActividad.jsp" />
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
</div>        


<div id="divBuscarCentroCosto" style="display: none;" title="Buscar CentroCosto">
    <s:form id="formBuscarCentroCosto">

        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Ocentrocosto.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarCentroCosto(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarCentroCosto(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaCentroCosto">
        <div id="divListaCentroCosto">
            <jsp:include page="../Costos/Auxiliar/ListaCentroCosto.jsp" />
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
</div>        


<jsp:include page="../MasterPage/Inferior.jsp" />


