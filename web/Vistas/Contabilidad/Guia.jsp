<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">

    $(document).ready(function () {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnGuia').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoGuia").validationEngine();
        $("#tabs").tabs();

    });

    function deshabilitar() {
        $(".lstEditar").css('opacity', '.5');
        $(".lstEditar").attr('onclick', 'return false;')
        $(".lstEliminar").css('opacity', '.5');
        $(".lstEliminar").attr('onclick', 'return false;')
        $(".lstImprimir").css('opacity', '.5');
        $(".lstImprimir").attr('onclick', 'return false;')
    }

    function CambiarANuevo() {
        $("#formNuevoGuia [name='Operacion']").val('Nuevo');
    }

    function NuevoGuia() {
        var url = "LoadGuia";
        var data = {"Oguia.idGuia": 0, "Operacion": "Nuevo"};
        $('body').load(url, data);
    }

    function AbrirOrdenProduccion() {
        $("#divBuscarOrdenProduccion").dialog({
            width: 'auto'
        });
    }

    function BuscarOrdenProduccion() {
        var url = "BuscarOrdenProduccion";
        var data = $("#formBuscarOrdenProduccion").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaOrdenProduccion").html(resultado);
            IniciarPagina('pagListaOrdenProduccion');
            deshabilitar();
        });
    }

    function EnviarOrdenProduccion(idOrdenProduccion, Numero) {
        $("#formNuevoGuia [name='Oguia.IdOrdenProduccion']").val(idOrdenProduccion);
        $("#formNuevoGuia [name='Oguia.DOrdenProduccion']").val(Numero);
        $("#divBuscarOrdenProduccion").dialog('close');

        var url = "ObtenerOrdenProduccion?Oordenproduccion.idOrdenProduccion=" + idOrdenProduccion;
        $.getJSON(url, function (resultado) {
            var op = resultado.oordenproduccion;

            var url = "ObtenerClienteProveedor?Oclienteproveedor.idClienteProveedor=" + op.idClienteProveedor;
            $.getJSON(url, function (resultado) {
                var cliente = resultado.oclienteproveedor;
                $("#formNuevoGuia [name='Oguia.IdClienteProveedor']").val(cliente.idClienteProveedor);
                $("#formNuevoGuia [name='Oguia.DClienteProveedor']").val(cliente.razonSocial);
            });

        });

    }

    function ObtenerTipoCambio() {
        var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoGuia [name='Oguia.Fecha']").val(), "Otipocambio.idMonedaCobra": $("#formNuevoGuia [name='Oguia.IdMoneda']").val()};
        $.getJSON(url, data, function (resultado) {
            $("#formNuevoGuia [name='Oguia.TipoCambio']").val(resultado.valor);
        });
    }

    function GrabarGuia() {
        var url = "GrabarGuia";
        var datos = $("#formNuevoGuia").serialize();
        $.getJSON(url, datos, function (resultado) {
            if (resultado.error == false) {
                Mensaje(resultado.msg);
            }
            else {
                Error(resultado.msg);
            }
        });
    }

    function AgregarDetalleGuia() {
        limpiaForm($("#formAgregarDetalleGuia"));
        $("#divAgregarDetalleGuia").dialog({
            width: 'auto',
            modal: true,
            buttons: {
                "Agregar": function () {
                    var url = "AgregarDetalleGuia";
                    var data = $("#formAgregarDetalleGuia").serialize();
                    $.get(url, data, function (resultado) {
                        $("#divListaDetalleGuia").html(resultado);
                        IniciarPagina('pagListaDetalleGuia');
                    });
                    limpiaForm($("#formAgregarDetalleGuia"));
                },
                "Cancelar": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    function AbrirProducto() {
        $("#divBuscarProducto").dialog({
            width: 'auto'
        });
    }

    function BuscarProducto() {
        var url = "BuscarProducto";
        var data = $("#formBuscarProducto").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaProducto").html(resultado);
            IniciarPagina('pagListaProducto');
            deshabilitar();
        });
    }

    function EnviarProducto(idProducto, DProducto) {
        $("#formAgregarDetalleGuia [name='Odetalleguia.idProducto']").val(idProducto);
        $("#formAgregarDetalleGuia [name='Odetalleguia.DProducto']").val(DProducto);
        $("#divBuscarProducto").dialog('close');
        $("#formAgregarDetalleGuia [name='Odetalleguia.Precio']").focus();
    }

    function AgregarDetalleGuia() {
        limpiaForm($("#formAgregarDetalleGuia"));
        $("#divAgregarDetalleGuia").dialog({
            width: 'auto',
            modal: true,
            buttons: {
                "Agregar": function () {
                    var url = "AgregarDetalleGuia";
                    var data = $("#formAgregarDetalleGuia").serialize();
                    $.get(url, data, function (resultado) {
                        $("#divListaDetalleGuia").html(resultado);
                        IniciarPagina('pagListaDetalleGuia');
                    });
                    limpiaForm($("#formAgregarDetalleGuia"));
                },
                "Cancelar": function () {
                    $(this).dialog("close");
                }
            }
        });
    }
    
    function QuitarDetalleGuia(index) {

        var url = "QuitarDetalleGuia";
        var data ={ "index":index};
        $.get(url, data, function(resultado){
            $("#divListaDetalleGuia").html(resultado);
            IniciarPagina('pagListaDetalleGuia');
        });
         
    }

</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formNuevoGuia" theme="simple">

    <s:hidden name="Oguia.idGuia"/>

    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarDetalleGuia();
                        return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarGuia();
                        return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirGuia();
                        return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="NuevoGuia();
                        return false;"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="CambiarANuevo();
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
                            <s:textfield name="Oguia.Numero" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Oguia.Estado" readonly="true" cssStyle="font-weight: bold;"/>
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
                            <s:textfield name="Oguia.Periodo" />
                        </td>
                        <td>
                            <s:label value="Fecha:"/>
                            <s:textfield name="Oguia.Fecha" cssClass="datepicker"/>
                        </td>
                        <td>
                            <s:label value="Refrencia:"/>
                            <s:textfield name="Oguia.Referencia" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Serie"/>
                            <s:textfield name="Oguia.Serie" />
                        </td>
                        <td>
                            <s:label value="NumeroDocumento:"/>
                            <s:textfield name="Oguia.NumeroDocumento" />
                        </td>
                        <td>
                            <s:label value="Tipo Movimiento:"/>
                            <s:select name="Oguia.IdTipoMovimiento" list="ListaTipoMovimiento" listKey="idTipoMovimiento" listValue="Descripcion" />
                        </td>

                    </tr>
                </table>

            </td>


        </tr>
        <tr>


            <td colspan="2" class="cuadro">
                <h3>Documento</h3>

                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Nº Orden:"/>
                            <s:hidden name="Oguia.IdOrdenProduccion"/>
                            <s:textfield name="Oguia.DOrdenProduccion" onclick="AbrirOrdenProduccion(); return false;"/>
                        </td>
                        <td>
                            <s:label value="Responsable o Cliente:"/>
                            <s:hidden name="Oguia.IdClienteProveedor" />
                            <s:textfield name="Oguia.DClienteProveedor" />
                        </td>
                        <td>
                            <s:label value="Moneda:"/>
                            <s:select name="Oguia.IdMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                        </td>
                        <td>
                            <s:label value="Tipo de Cambio:"/>
                            <s:textfield name="Oguia.TipoCambio" />

                        </td>
                    </tr>
                </table>

            </td>


        </tr>
        <tr>


            <td colspan="2" class="cuadro">
                <h3>Otros Datos</h3>

                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Almacen:"/>
                            <s:select name="Oguia.idAlmacen" list="ListaAlmacen" listKey="idAlmacen" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                        </td>
                        <td>
                            <s:label value="Observaciones:"/>
                            <s:textarea name="Oguia.Observaciones" cols="90" cssClass="validate[required]"/>
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


        <div id="pagListaDetalleGuia">
            <div id="divListaDetalleGuia">

                <table class="tabla">    
                    <thead>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Subtotal</th>
                    <th>Quitar</th>
                    </thead>
                    <tbody>
                        <s:iterator value="ListaDetalleGuia" status="row">
                            <tr>
                                <td><s:property value="DProducto"/></td>
                                <td><s:property value="Cantidad"/></td>
                                <td><s:property value="Precio"/></td>
                                <td><s:property value="SubTotal"/></td>
                                <td><a href="#" onclick="QuitarDetalleGuia(<s:property value="%{#row.index}"/>);
                                        return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>

            </div>
            <table>
                <tr>
                    <td><a href="#" onclick="toleft('pagListaDetalleGuia');
                            return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaDetalleGuia');
                            return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaDetalleGuia');
                            return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaDetalleGuia');
                            return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>



    </div>
    <div id="tabs-2">



    </div>

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
                    <a href="#" onclick="BuscarOrdenProduccion();
                            return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
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
                            <td><a href="#" onclick="EnviarOrdenProduccion(<s:property value="idOrdenProduccion"/>, '<s:property value="Numero"/>');
                                    return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaOrdenProduccion');
                        return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaOrdenProduccion');
                        return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaOrdenProduccion');
                        return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaOrdenProduccion');
                        return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>


<div id="divAgregarDetalleGuia" title="Agregar Detalle de Guia" style="display: none;">

    <form id="formAgregarDetalleGuia" theme="simple">
        <s:hidden name="Odetalleguia.idProducto"/>
        <s:label value="Producto"/>
        <s:textfield name="Odetalleguia.DProducto" paso="1" onclick="AbrirProducto();" cssClass="validate[required]"/>
        <s:label value="Precio"/>
        <s:textfield name="Odetalleguia.Precio" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Cantidad"/>
        <s:textfield name="Odetalleguia.Cantidad" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </form>

</div>


<div id="divBuscarProducto" style="display: none;" title="Buscar Producto">
    <s:form id="formBuscarProducto">

        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Oproducto.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarProducto(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarProducto();
                            return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaProducto">
        <div id="divListaProducto">

        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaProducto');
                        return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaProducto');
                        return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaProducto');
                        return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaProducto');
                        return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>



<jsp:include page="../MasterPage/Inferior.jsp" />
