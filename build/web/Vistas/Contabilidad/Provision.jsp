<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">

    $(document).ready(function () {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnProvision').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoProvision").validationEngine();
        $("#tabs").tabs();


    


    });

    function AbrirOrdenCompra() {

        $("#divEleccion").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Orden de Compra": function () {
                    $("#divBuscarOrdenCompra").dialog({
                        width: 'auto'
                    });
                    $(this).dialog("close");
                    $("#formBuscarOrdenCompra [name='Oordencompra.Numero']").focus();
                },
                "Orden de Servicio": function () {
                    $("#divBuscarOrdenServicio").dialog({height: 'auto', modal: true, width: 'auto'});
                    $(this).dialog("close");
                    $("#formBuscarOrdenServicio [name='Oordenservicio.Numero']").focus();
                },
                "Ingreso Manual": function () {
                    $("#divIngresoManual").dialog({
                        height: 'auto',
                        modal: true,
                        width: 'auto',
                        buttons: {
                            "Continuar": function () {
                                $('#hdidOrdenServicio').val("");
                                $('.hdidOrdenCompra').val("");
                                $('#txtServicioCompra').val($("#txtNumeroDocumentoManual").val());
                                $("#ModoIngreso").val(0);
                                $(this).dialog("close");
                            },
                            "Cancelar": function () {
                                $(this).dialog("close");
                            }
                        }
                    });
                    $(this).dialog("close");

                }
            }
        });
    }

    function BuscarOrdenServicio() {
        var url = "BuscarOrdenServicio";
        var data = $("#formBuscarOrdenServicio").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaOrdenServicio").html(resultado);
            IniciarPagina('pagListaOrdenServicio');
        });
    }
    function EnviarOrdenServicio(id, Numero) {
        $('#hdidOrdenServicio').val(id);
        $('.hdidOrdenCompra').val("");
        $('#txtServicioCompra').val(Numero);
        $("#ModoIngreso").val(2);

        var url = "ObtenerOrdenServicio?Oordenservicio.idOrdenServicio=" + id;
        $.getJSON(url, function (resultado) {
            if (resultado.error == false) {
                var os = resultado.oordenservicio;
                $("#formNuevoProvision [name='Oprovision.Codigo']").val(os.rucProveedor);
                $("#formNuevoProvision [name='Oprovision.RazonSocial']").val(os.DClienteProveedor);
                $("#formNuevoProvision [name='Oprovision.Ruc']").val(os.rucProveedor);

                var afecto = os.afecto;
                if (afecto) {
                    $("#formNuevoProvision [name='Oprovision.BaseAfecta']").val(os.subtotal);
                }
                else {
                    $("#formNuevoProvision [name='Oprovision.Inafecto']").val(os.subtotal);
                }
                $("#formNuevoProvision [name='Oprovision.IgvDocumento']").val(os.monto * os.IGV / 100);
                $("#formNuevoProvision [name='Oprovision.Total']").val(os.monto);

                Retencion();
                $("#divBuscarOrdenServicio").dialog('close');
            }
            else {
                Error(resultado.msg);
            }
        });

    }

    function BuscarOrdenCompra() {
        var url = "BuscarOrdenCompra";
        var data = $("#formBuscarOrdenCompra").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaOrdenCompra").html(resultado);
            IniciarPagina('pagListaOrdenCompra');
        });
    }

    function EnviarOrdenCompra(idOrdenCompra, Numero) {
        $('#hdidOrdenServicio').val("");
        $('.hdidOrdenCompra').val(idOrdenCompra);
        $('#txtServicioCompra').val(Numero);
        $("#ModoIngreso").val(1);
        GenerarDetalleProvisionOC(idOrdenCompra);

        var url = "ObtenerOrdenCompra?Oordencompra.idOrdenCompra=" + idOrdenCompra;
        $.getJSON(url, function (resultado) {
            if (resultado.error == false) {
                var oc = resultado.oordencompra;
                $("#formNuevoProvision [name='Oprovision.Codigo']").val(oc.rucCliente);
                $("#formNuevoProvision [name='Oprovision.RazonSocial']").val(oc.DClienteProveedor);
                $("#formNuevoProvision [name='Oprovision.Ruc']").val(oc.rucCliente);

                var afecto = oc.afecto;
                if (afecto) {
                    $("#formNuevoProvision [name='Oprovision.BaseAfecta']").val(oc.subtotal);
                }
                else {
                    $("#formNuevoProvision [name='Oprovision.Inafecto']").val(oc.subtotal);
                }
                $("#formNuevoProvision [name='Oprovision.IgvDocumento']").val(oc.total * oc.IGV / 100);
                $("#formNuevoProvision [name='Oprovision.Total']").val(oc.total);

                //Retencion();
                var renta = parseFloat($("#formNuevoProvision [name='Oprovision.Renta']").val());
                var Percepcion = parseFloat($("#formNuevoProvision [name='Oprovision.Percepcion']").val());
                var Aporte = parseFloat($("#formNuevoProvision [name='Oprovision.Aporte']").val());
                var total = $("#formNuevoProvision [name='Oprovision.Total']").val();

                $("#formNuevoProvision [name='Oprovision.RentaAfecta']").val(total * renta / 100);
                $("#formNuevoProvision [name='Oprovision.PercepcionAfecta']").val(total * Percepcion / 100);
                $("#formNuevoProvision [name='Oprovision.AportePension']").val(total * Aporte / 100);






                $("#divBuscarOrdenCompra").dialog('close');



            }
            else {
                Error(resultado.msg);
            }
        });
    }

    function ObtenerTipoCambio() {
        var url = "ObtenerTipoCambio?Otipocambio.idMonedaCobra=" + $("#formNuevoProvision [name='Oprovision.idMoneda']").val() + "&Otipocambio.idMonedaPago=0";
        $.getJSON(url, function (resultado) {
            if (resultado.error == false) {
                $("#formNuevoProvision [name='Oprovision.TipoCambio']").val(resultado.valor);
            }
            else {
                Error(resultado.msg);
            }
        });
    }

    function Retencion() {
        var renta = parseFloat($("#formNuevoProvision [name='Oprovision.Renta']").val());
        var Percepcion = parseFloat($("#formNuevoProvision [name='Oprovision.Percepcion']").val());
        var Aporte = parseFloat($("#formNuevoProvision [name='Oprovision.Aporte']").val());
        var total = $("#formNuevoProvision [name='Oprovision.Total']").val();

        $("#formNuevoProvision [name='Oprovision.RentaAfecta']").val(total * renta / 100);
        $("#formNuevoProvision [name='Oprovision.PercepcionAfecta']").val(total * Percepcion / 100);
        $("#formNuevoProvision [name='Oprovision.AportePension']").val(total * Aporte / 100);
    }

    function GrabarProvision() {
        var urld = "EnviarDetalleOC?" + EnviarDetalleProvisionOC().substring(1);
        $.getJSON(urld, function () {
            var url = "GrabarProvision";
            var datos = $("#formNuevoProvision").serialize();
            $.getJSON(url, datos, function (resultado) {
                if (resultado.error == false) {
                    Mensaje(resultado.msg);
                }
                else {
                    Error(resultado.msg);
                }
            });
        });
    }

    function CambiarANuevo() {
        $("#formNuevoProvision [name='Operacion']").val('Nuevo');
    }

    function AbrirProvision() {
        $("#divBuscarProvision").dialog({
            width: 'auto'
        });
    }
    function BuscarProvision() {
        var url = "BuscarProvision";
        var data = $("#formBuscarProvision").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaProvision").html(resultado);
            IniciarPagina('pagListaProvision');
        });
    }
    function EnviarProvision(idProvision) {
        var url = "LoadProvision";
        var data = {"Oprovision.idProvision": idProvision};
        $('body').load(url, data);
    }

    function AgregarDetalleProvision() {
        if ($("#ModoIngreso").val()!= 1)
        {
            $("#divDetalleProvision").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function () {
                    var url = "AgregarDetalleProvision";
                    var data = $("#formAgregarDetalleProvision").serialize();
                    $.get(url, data, function (resultado) {
                        $("#divListaDetalleProvision").html(resultado);
                        $("#divDetalleProvision").dialog("close");
                    });
                },
                "Cancelar": function () {
                    $(this).dialog("close");
                }
            }
        });
        }
        else{
            Error("Opcion no disponible para OC");
        }
        
    }

    function QuitarDetalleProvision(i) {
        var url = "QuitarDetalleProvision?index=" + i;
        $.get(url, function (resultado) {
            $("#divListaDetalleProvision").html(resultado);
        });
    }

    function AbrirIngreso() {
        $("#divBuscarIngreso").dialog({
            width: 'auto'
        });
    }
    function BuscarIngreso() {
        var url = "BuscarIngresoPorOC";
        var data = $("#formBuscarIngreso").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaIngreso").html(resultado);
            IniciarPagina('pagListaIngreso');
        });
    }
    function EnviarIngreso(idIngreso) {

        var url = "ObtenerIngreso";
        var data = {"Oingreso.idIngreso": idIngreso};
        $.getJSON(url, data, function (resultado) {
            var ingreso = resultado.oingreso;
            $("#formAgregarDetalleProvision [name='OdetalleProvision.idIngreso']").val(ingreso.idIngreso);
            $("#formAgregarDetalleProvision [name='OdetalleProvision.DIngreso']").val(ingreso.numero);
            $("#divBuscarIngreso").dialog('close');
        });
    }

    function GenerarDetalleProvisionOC(idordencompra) {
        var idProvision = $("#formNuevoProvision [name='Oprovision.idProvision']").val();
        var url = "GenerarDetalleOC";
        var data = {'OordenCompra.IdOrdenCompra': idordencompra, 'Oprovision.IdProvision': idProvision};
        $.get(url, data, function (resultado) {
            $("#divListaDetalleProvision").html(resultado);

        });
    }

    function EnviarDetalleProvisionOC() {
        var data = "";
        $("#divListaDetalleProvision table tbody tr").each(function (index) {
            var datos = "";
            $(this).children("td").each(function (index2) {
                switch (index2) {
                    case 0:
                        datos = datos + "&ListaDetalleProvision[" + index + "].Referencia=" + $(this).text();
                        datos = datos + "&ListaDetalleProvision[" + index + "].idIngreso=" + $(this).children("[name='idIngreso']").val();
                        break;
                    case 1:
                        datos = datos + "&ListaDetalleProvision[" + index + "].Cuenta.idCuenta=" + $(this).children("[name='Cuenta.idCuenta']").val();
                        break;
                    case 2:
                        datos = datos + "&ListaDetalleProvision[" + index + "].Descripcion=" + $(this).children("[name='Descripcion']").val();
                        break;
                    case 3:
                        datos = datos + "&ListaDetalleProvision[" + index + "].OrdenProduccion.idOrdenProduccion=" + $(this).children("[name='OrdenProduccion.idOrdenProduccion']").val();
                        break;
                    case 4:
                        datos = datos + "&ListaDetalleProvision[" + index + "].CentroCosto.idCentroCosto=" + $(this).children("[name='CentroCosto.idCentroCosto']").val();
                        break;
                    case 5:
                        break;
                    case 6:
                        datos = datos + "&ListaDetalleProvision[" + index + "].Importe=" + $(this).children("[name='Importe']").val();
                        break;
                }
            });
            data = data + datos;
        });
        return data;
    }
    
</script>

<jsp:include page="Menu.jsp" />
<br/>

<%--
0:Numero de documento manual
1:Orden de compra
2:Orden de servicio
--%>
<s:hidden id="ModoIngreso" value="0"/>

<s:form id="formNuevoProvision" theme="simple">

    <s:hidden name="Oprovision.idProvision"/>

    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarDetalleProvision();
                        return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarProvision();
                        return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirProvision();
                        return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="LoadProvision?Operacion=Nuevo"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="CambiarANuevo();
                        return false;"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="EnviarDetalleProvisionOC();
                        return false;"><img title="Aprobar" src="../../images/Aprobado.jpeg" width="40px" height="40px"/></a>
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
                            <s:textfield name="Oprovision.Numero" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Oprovision.Estado" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
        <tr>   

            <td colspan="2">
                <table border="1" style="width: 100%">
                    <tr>
                        <td class="cuadro" style="width: 25%">
                            <h3>Registro</h3>
                            <div>

                                <s:label value="Periodo:"/>
                                <s:textfield name="Oprovision.Periodo"/>
                                <s:label value="Fecha:"/>
                                <s:textfield name="Oprovision.Fecha" cssClass="datepicker"/>
                                <s:label value="Orden de Compra:"/>
                                <s:hidden name="Oprovision.IdOrdenCompra" id="hdidOrdenCompra" cssClass="hdidOrdenCompra"/>
                                <s:hidden name="Oprovision.idOrdenServicio" id="hdidOrdenServicio"/>
                                <s:textfield readonly="true" name="Oprovision.ServicioCompra" onclick="AbrirOrdenCompra(); return false;" id="txtServicioCompra"/>
                                <s:label value="Sucursal:"/>
                                <s:select name="Oprovision.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
                                <s:label value="Tipo de Compra:"/>
                                <s:select name="Oprovision.idTipoCompra" list="ListaTipoCompra" listKey="idTipoCompra" listValue="Descripcion" />

                            </div>
                        </td>
                        <td class="cuadro" style="width: 75%">
                            <h3>Documento</h3>
                            <div>
                                <table style="width: 100%">
                                    <tr>
                                        <td>

                                            <s:label value="Codigo:"/>
                                            <s:textfield name="Oprovision.Codigo"/>
                                            <s:label value="Razon Social:"/>
                                            <s:textfield name="Oprovision.RazonSocial"/>
                                            <s:label value="RUC:"/>
                                            <s:textfield name="Oprovision.Ruc"/>
                                            <s:label value="Glosa:"/>
                                            <s:textfield name="Oprovision.Glosa"/>

                                        </td>
                                        <td>

                                            <s:label value="Tipo Documento:"/>
                                            <s:select name="Oprovision.TipoDocumento" list="ListaTipoDocumento" />
                                            <s:label value="Serie:"/>
                                            <s:textfield name="Oprovision.Serie"/>
                                            <s:label value="Numero:"/>
                                            <s:textfield name="Oprovision.NumeroDocumento"/>
                                            <s:label value="Fecha:"/>
                                            <s:textfield name="Oprovision.FechaDocumento" cssClass="datepicker"/>

                                        </td>
                                        <td>

                                            <s:label value="Condicion de pago:"/>
                                            <s:select name="Oprovision.idFormaPago" list="ListaFormaPago" listKey="idFormaPago" listValue="Descripcion" />
                                            <s:label value="Vencimiento:"/>
                                            <s:textfield name="Oprovision.FechaVencimiento" cssClass="datepicker"/>
                                            <s:label value="Moneda:"/>
                                            <s:select name="Oprovision.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                                            <s:label value="Tipo de cambio:"/>
                                            <s:textfield name="Oprovision.TipoCambio" readonly="true"/>

                                        </td>
                                    </tr>
                                </table>




                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="cuadro" style="width: 75%; border: 1px solid black;">
                                        <h3>Tributos</h3>
                                        <div>

                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <s:label value="Tipo adquisicion:"/>
                                                        <s:select name="Oprovision.TipoAdquisicion" list="ListaTipoAdquisicion" listKey="Valor" listValue="Descripcion" />
                                                        <s:label value="I.G.V:"/>
                                                        <s:textfield name="Oprovision.Igv"/>
                                                    </td>
                                                    <td>
                                                        <s:label value="Percepcion:"/>
                                                        <s:select name="Oprovision.Percepcion" list="ListaPercepcion" listKey="Valor" listValue="Descripcion" onchange="Retencion();"/>
                                                    </td>
                                                    <td>
                                                        <s:label value="Renta:"/>
                                                        <s:select name="Oprovision.Renta" list="ListaRenta" listKey="Valor" listValue="Descripcion" onchange="Retencion();" />
                                                        <s:label value="Aporte:"/>
                                                        <s:select name="Oprovision.Aporte" list="ListaAporte" listKey="Valor" listValue="Descripcion" onchange="Retencion();" />
                                                    </td>
                                                </tr>

                                            </table>
                                        </div>
                                    </td>
                                    <td class="cuadro" style="width: 25%; border: 1px solid black;">
                                        <h3>Retencion</h3>
                                        <div>

                                            <s:label value="Tasa:"/>
                                            <s:select name="Oprovision.Tasa" list="ListaTasa" listKey="Valor" listValue="Descripcion" />
                                            <s:label value="Importe:"/>
                                            <s:textfield name="Oprovision.Importe"/>

                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

            </td>


        </tr>
        <tr>
            <td colspan="2" class="cuadro">

                <h3>Importes</h3>
                <div>

                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <s:label value="Base Afecta:"/>
                                <s:textfield name="Oprovision.BaseAfecta" cssStyle="font-weight: bold;"/>
                                <s:label value="Inafecto:"/>
                                <s:textfield name="Oprovision.Inafecto" cssStyle="font-weight: bold;"/>
                            </td>
                            <td>
                                <s:label value="I.G.V:"/>
                                <s:textfield name="Oprovision.IgvDocumento" cssStyle="font-weight: bold;"/>
                                <s:label value="Percepcion:"/>
                                <s:textfield name="Oprovision.PercepcionAfecta" cssStyle="font-weight: bold;"/>
                            </td>
                            <td>
                                <s:label value="Renta:"/>
                                <s:textfield name="Oprovision.RentaAfecta" cssStyle="font-weight: bold;"/>
                                <s:label value="Aporte pension:"/>
                                <s:textfield name="Oprovision.AportePension" cssStyle="font-weight: bold;"/>
                            </td>
                            <td>
                                <s:label value="Total:"/>
                                <s:textfield name="Oprovision.Total" cssStyle="font-weight: bold;"/>
                            </td>
                        </tr>

                    </table>
                </div>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <s:label value="Observaciones:"/>
                <s:textarea name="Opedido.Observaciones" cols="130" cssClass="validate[required]"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">





            </td>
        </tr>

    </table>


</s:form>

<div id="tabs" style="width: 90%;">
    <ul>
        <li><a href="#tabs-1">Detalle del Documento</a></li>
        <li><a href="#tabs-2">Historial</a></li>
    </ul>
    <div id="tabs-1">


        <div id="divListaDetalleProvision">
            <jsp:include page="Auxiliar/ListaDetalleProvisionOC.jsp" />
        </div>
    </div>

    <div id="tabs-2">



    </div>

</div>







<div id="divEleccion" style="display: none;" title="Elija el documento">
    ¿Que documento desea cargar?
</div>


<div id="divBuscarOrdenCompra" style="display: none;" title="Buscar Orden de Compra">
    <s:form id="formBuscarOrdenCompra" >
        <table>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Oordencompra.Numero" onkeypress="if(event.keyCode == 13){ BuscarOrdenCompra(); return false; }"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarOrdenCompra();
                            return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaOrdenCompra">    
        <div id="divListaOrdenCompra">
            <table>
                <thead>
                <th>Numero</th>
                <th>Cliente</th>
                <th>Sucursal</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th>Operacion</th>
                </thead>
                <tbody>
                    <s:iterator value="ListaOrdenCompra">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td><s:property value="DSucursal"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="Estado"/></td>
                            <td><a href="#" onclick="EnviarOrdenCompra(<s:property value="idOrdenCompra"/>, '<s:property value="Numero"/>');
                                    return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaOrdenCompra');
                        return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaOrdenCompra');
                        return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaOrdenCompra');
                        return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaOrdenCompra');
                        return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>   


<div id="divBuscarOrdenServicio" style="display: none;" title="Buscar Orden de Servicio">
    <s:form id="formBuscarOrdenServicio">

        <table>
            <tr>
                <td>Numero:</td>
                <td><s:textfield name="Oordenservicio.Numero" onkeypress="if(event.keyCode == 13){ BuscarOrdenServicio(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarOrdenServicio();
                            return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaOrdenServicio">
        <div id="divListaOrdenServicio">
            <table class="tabla">
                <thead>
                <th>Orden Servicio</th>
                <th>Fecha</th>
                <th>Fecha de Entrega</th>
                <th>Monto</th>
                <th>Proveedor</th>
                <th>Sucursal</th>
                <th>Centro de Costo</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaOrdenServicio">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="FechaEntrega"/></td>
                            <td><s:property value="Monto"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td><s:property value="DSucursal"/></td>
                            <td><s:property value="DCentroCosto"/></td>
                            <td>
                                <a href="#" onclick="EnviarOrdenServicio(<s:property value="idOrdenServicio"/>);
                                        return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaOrdenServicio');
                        return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaOrdenServicio');
                        return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaOrdenServicio');
                        return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaOrdenServicio');
                        return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>        


<div id="divBuscarProvision" style="display: none;" title="Buscar Provision">
    <s:form id="formBuscarProvision">

        <table>
            <tr>
                <td>Numero:</td>
                <td><s:textfield name="Oprovision.Numero" onkeypress="if(event.keyCode == 13){ BuscarProvision(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarProvision();
                            return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaProvision">
        <div id="divListaProvision">
            <table class="tabla">
                <thead>
                <th>Numero</th>
                <th>Periodo</th>
                <th>Fecha</th>
                <th>ServicioCompra</th>
                <th>Codigo</th>
                <th>RazonSocial</th>
                <th>Ruc</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaProvision">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="Periodo"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="ServicioCompra"/></td>
                            <td><s:property value="Codigo"/></td>
                            <td><s:property value="RazonSocial"/></td>
                            <td><s:property value="Valor"/></td>
                            <td><s:property value="Ruc"/></td>
                            <td align="center">
                                <a class="lstEnviar" href="#" onclick="EnviarProvision(<s:property value="idProvision"/>);
                                        return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaProvision');
                        return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaProvision');
                        return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaProvision');
                        return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaProvision');
                        return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>       

<div id="divDetalleProvision" style="display: none;" title="Agregar detalle">
    <s:form id="formAgregarDetalleProvision" theme="simple">
        <s:label value="Numero de filas:"/>
        <s:textfield name="index" onkeydown="BotonDialog($(this));" cssClass="validate[required]" />
    </s:form>
</div>


<div id="divBuscarIngreso" style="display: none;" title="Buscar Ingresos">
    <s:form id="formBuscarIngreso">
        <table>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Oingreso.Numero" onkeypress="if(event.keyCode == 13){ BuscarIngreso(); return false; }"/>
                    <s:hidden name="Oingreso.idOrdenCompra" cssClass="hdidOrdenCompra"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarIngreso();
                            return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>
    <div id="pagListaIngreso">    
        <div id="divListaIngreso">
            <table class="tabla">
                <thead>
                <th>Numero</th>
                <th>Fecha</th>
                <th>Almacen</th>
                <th>Movimiento</th>
                <th>Orden de Compra</th>
                <th>Proveedor</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaIngreso">
                        <tr>
                            <td><s:property value="Numero"/></td>
                            <td><s:property value="Fecha"/></td>
                            <td><s:property value="DAlmacen"/></td>
                            <td><s:property value="DTipoMovimiento"/></td>
                            <td><s:property value="DOrdenCompra"/></td>
                            <td><s:property value="DClienteProveedor"/></td>
                            <td>
                                <a href="#" onclick="EnviarIngreso(<s:property value="idIngreso"/>);"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a>
                            </td>                    
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaIngreso');
                        return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaIngreso');
                        return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaIngreso');
                        return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaIngreso');
                        return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>


<div id="divIngresoManual" style="display: none;" title="Ingrese numero de documento">
    <s:label value="Numero de documento"/>
    <s:textfield id="txtNumeroDocumentoManual" onkeydown="BotonDialog($(this));" />
</div>


<jsp:include page="../MasterPage/Inferior.jsp" />
