<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnFactura').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoFactura").validationEngine();
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
    
    function AbrirCotizacionOP() {
        
        $( "#divEleccion" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Orden de Produccion": function() {
                    $( "#divBuscarOrdenProduccion" ).dialog({
                        width:'auto'
                    });
                    $( this ).dialog( "close" );
                    $("#formBuscarOrdenProduccion [name='Oordenproduccion.Numero']").focus();
                },
                "Cotizacion": function() {
                    $( "#divBuscarCotizacion" ).dialog({height: 'auto',modal: true,width: 'auto'});
                    $( this ).dialog( "close" );
                    $("#formBuscarCotizacion [name='Ocotizacion.Numero']").focus();
                }
            }
        });
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
        $("#formNuevoFactura [name='Ofactura.IdCotizacion']").val('');
        $("#formNuevoFactura [name='Ofactura.IdOrdenProduccion']").val(idOrdenProduccion);
        $("#formNuevoFactura [name='Ofactura.CotizacionOP']").val(Numero);
        $( "#divBuscarOrdenProduccion" ).dialog('close');
        
        var url = "ObtenerOrdenProduccion?Oordenproduccion.idOrdenProduccion="+idOrdenProduccion;
        $.getJSON(url, function(resultado) {
            var op = resultado.oordenproduccion;
            
            var url = "ObtenerClienteProveedor?Oclienteproveedor.idClienteProveedor="+op.idClienteProveedor;
            $.getJSON(url, function(resultado) {
                var cliente = resultado.oclienteproveedor;
                $("#formNuevoFactura [name='Ofactura.IdClienteProveedor']").val(cliente.idClienteProveedor);
                $("#formNuevoFactura [name='Ofactura.DCliente']").val(cliente.razonSocial);
                $("#formNuevoFactura [name='Ofactura.DocumentoIdentidad']").val(cliente.ruc);
            });
            
        });
        
    }
    
    function BuscarCotizacion(){
        var url = "BuscarCotizacion";
        var data = $("#formBuscarCotizacion").serialize();
        $.get(url, data, function(resultado){  
            $("#divListaCotizacion").html(resultado);
            IniciarPagina('pagListaCotizacion');
            $( "#divBuscarCotizacion" ).dialog({width:'auto'}); 
            deshabilitar();
        });  
    }
    
    function EnviarCotizacion(idCotizacion, idModeloChasis,NumeroChasis,NumeroAsientos,NumeroParabrisas,Ventanas,TipoCarroceria,ColorFondo,ColorArtes,ColorOtros,Observaciones){
        
        var url = "ObtenerCotizacion";
        var data = {"Ocotizacion.idCotizacion":idCotizacion};
        $.getJSON(url, data, function(resultado){
            var cotizacion = resultado.ocotizacion;
            $("#formNuevoFactura [name='Ofactura.IdCotizacion']").val(idCotizacion);
            $("#formNuevoFactura [name='Ofactura.IdOrdenProduccion']").val('');
            $("#formNuevoFactura [name='Ofactura.CotizacionOP']").val(cotizacion.serie);
            
            
            var url = "ObtenerClienteProveedor?Oclienteproveedor.idClienteProveedor="+cotizacion.idClienteProveedor;
            $.getJSON(url, function(resultado) {
                var cliente = resultado.oclienteproveedor;
                $("#formNuevoFactura [name='Ofactura.IdClienteProveedor']").val(cliente.idClienteProveedor);
                $("#formNuevoFactura [name='Ofactura.DClienteProveedor']").val(cliente.razonSocial);
                $("#formNuevoFactura [name='Ofactura.DocumentoIdentidad']").val(cliente.ruc);
            });
            
            $( "#divBuscarCotizacion" ).dialog('close');
            
        });
    }    
    
    function AbrirClienteProveedor() {
        $("#divBuscarClienteProveedor").dialog({
            width: 'auto'
        });
    }
    function BuscarClienteProveedor() {
        var url = "BuscarClienteProveedorCotizacion";
        var data = $("#formBuscarClienteProveedor").serialize();
        $.get(url, data, function(resultado) {
            $("#divListaClienteProveedor").html(resultado);
            IniciarPagina('pagListaClienteProveedor');
        });
    }
    function EnviarClienteProveedor(idClienteProveedor, RazonSocial, Ruc) {
        $("#formNuevoFactura [name='Ofactura.IdClienteProveedor']").val(idClienteProveedor);
        $("#formNuevoFactura [name='Ofactura.DCliente']").val(RazonSocial);
        $("#formNuevoFactura [name='Ofactura.DocumentoIdentidad']").val(Ruc);
        $("#divBuscarClienteProveedor").dialog('close');
    }
    
    function ObtenerTipoCambio(){
        
        var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoFactura [name='Ofactura.Fecha']").val(), "Otipocambio.idMonedaCobra": $("#formNuevoFactura [name='Ofactura.idMoneda']").val(), "Otipocambio.idMonedaPago": 0};
        $.getJSON(url, data, function(resultado) {
            $("#formNuevoFactura [name='Ofactura.TipoCambio']").val(resultado.valor);
        });
        
    }
    
    function GrabarFactura(){
        var url = "GrabarFactura";
        var datos = $("#formNuevoFactura").serialize();
        $.getJSON(url, datos, function(resultado) {
            if (resultado.error == false) {
                Mensaje(resultado.msg);
            }
            else {
                Error(resultado.msg);
            }
        });
    }
    
    function AbrirFactura(){
        $("#divBuscarFactura").dialog({
            width: 'auto'
        });
    }
    function BuscarFactura(){
        var url = "BuscarFactura";
        var data = $("#formBuscarFactura").serialize();
        $.get(url, data, function(resultado){
            $("#divListaFactura").html(resultado);
            IniciarPagina('pagListaFactura');
        });
    }
    function EnviarFactura(idFactura){
        var url = "LoadFactura";
        var data = {"Ofactura.idFactura":idFactura};
        $('body').load(url,data);
    }
           
    function AgregarDetalleFactura() {
        limpiaForm($("#formAgregarDetalleFactura"));
        $("#divAgregarDetalleFactura").dialog({
            width: 'auto',
            modal: true,
            buttons: {
                "Agregar": function() {
                    var url = "AgregarDetalleFactura";
                    var data = $("#formAgregarDetalleFactura").serialize();
                    $.get(url, data, function(resultado){
                        $("#divListaDetalleFactura").html(resultado);
                        IniciarPagina('pagListaDetalleFactura');
                    });
                    limpiaForm($("#formAgregarDetalleFactura"));
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    
    function QuitarDetalleFactura(index) {

        var url = "QuitarDetalleFactura";
        var data ={ "index":index};
        $.get(url, data, function(resultado){
            $("#divListaDetalleFactura").html(resultado);
            IniciarPagina('pagListaDetalleFactura');
        });
         
    }
    
    function AbrirProducto(){
        $("#divBuscarProducto").dialog({
            width: 'auto'
        });
    }
    
    function BuscarProducto(){
        var url = "BuscarProducto";
        var data = $("#formBuscarProducto").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaProducto").html(resultado);
            IniciarPagina('pagListaProducto');
            deshabilitar();
        });  
    }
    
    function EnviarProducto(idProducto, DProducto){
        $("#formAgregarDetalleFactura [name='Odetallefactura.idProducto']").val(idProducto);
        $("#formAgregarDetalleFactura [name='Odetallefactura.DProducto']").val(DProducto);
        $("#divBuscarProducto").dialog('close');
        $("#formAgregarDetalleFactura [name='Odetallefactura.Precio']").focus();
    }
    
    function CambiarANuevo(){
        $("#formNuevoFactura [name='Operacion']").val('Nuevo');
    }
    
    function NuevoFactura(){
        var url = "LoadFactura";
        var data = {"Ofactura.idFactura":0, "Operacion":"Nuevo"};
        $('body').load(url,data);
    }
    
</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formNuevoFactura" theme="simple">

    <s:hidden name="Ofactura.idFactura"/>

    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarDetalleFactura();
                    return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarFactura();
                    return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirFactura();
                    return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="NuevoFactura(); return false;"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="CambiarANuevo(); return false;"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
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
                            <s:textfield name="Ofactura.Numero" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Ofactura.Estado" readonly="true" cssStyle="font-weight: bold;"/>
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
                            <s:textfield name="Ofactura.Periodo" />
                        </td>
                        <td>
                            <s:label value="Punto de Venta:"/>
                            <s:select name="Ofactura.IdPuntoVenta" list="ListaPuntoVenta" listKey="idPuntoVenta" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Tipo de Venta:"/>
                            <s:select name="Ofactura.IdTipoVenta" list="ListaTipoVenta" listKey="idTipoVenta" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Cotizacion/OP:"/>
                            <s:hidden name="Ofactura.IdCotizacion"/>
                            <s:hidden name="Ofactura.IdOrdenProduccion"/>
                            <s:textfield name="Ofactura.CotizacionOP" onclick="AbrirCotizacionOP(); return false;" />
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
                            <s:label value="Cliente:"/>
                            <s:hidden name="Ofactura.IdClienteProveedor" />
                            <s:textfield name="Ofactura.DCliente" onclick="AbrirClienteProveedor(); return false;"/>
                            <s:label value="Documento de identidad:"/>
                            <s:textfield name="Ofactura.DocumentoIdentidad" />
                            <s:label value="TipoDocumento:"/>
                            <s:select name="Ofactura.IdTipoDocumento" list="ListaTipoDocumento" listKey="idTipoDocumento" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Serie:"/>
                            <s:textfield name="Ofactura.Serie" />
                            <s:label value="Numero:"/>
                            <s:textfield name="Ofactura.NumeroDocumento" />
                            <s:label value="Fecha:"/>
                            <s:textfield name="Ofactura.Fecha" cssClass="datepicker"/>
                        </td>
                        <td>
                            <s:label value="Tipo de cambio:"/>
                            <s:textfield name="Ofactura.TipoCambio" onclick="ObtenerTipoCambio(); return false;"/>
                            <s:label value="Condicion de pago:"/>
                            <s:select name="Ofactura.idFormaPago" list="ListaFormaPago" listKey="idFormaPago" listValue="Descripcion" />
                            <s:label value="Vencimiento:"/>
                            <s:textfield name="Ofactura.FechaVencimiento" cssClass="datepicker"/>
                        </td>
                        <td>
                            <s:label value="Moneda:"/>
                            <s:select name="Ofactura.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                            <s:label value="Glosa:"/>
                            <s:textfield name="Ofactura.Glosa" />

                        </td>
                    </tr>
                </table>

            </td>


        </tr>
        <tr>
            <td colspan="2">

                <table style="width: 100%;" border="1">
                    <tr>
                        <td class="cuadro">
                            <h3>Tributos</h3>
                            <s:label value="IGV:"/>
                            <s:textfield name="Ofactura.Igv" />
                            <s:label value="Percepcion:"/>
                            <s:select name="Ofactura.DPercepcion" list="ListaPercepcion" listKey="Valor" listValue="Descripcion" />
                            <s:label value="Servicio:"/>
                            <s:select name="Ofactura.idServicio" list="ListaServicio" listKey="idServicio" listValue="Descripcion" />
                        </td>
                        <td class="cuadro">
                            <h3>Crear Kardex/Guia de Remision</h3>
                            <s:label value="Referencia:"/>
                            <s:textfield name="Ofactura.Referencia" />
                            <s:label value="Serie:"/>
                            <s:textfield name="Ofactura.SerieGuia" />
                            <s:label value="Numero:"/>
                            <s:textfield name="Ofactura.NumeroGuia" />
                        </td>
                        <td class="cuadro">
                            <h3>Referencia Nota Credito</h3>
                            <s:label value="Documento:"/>
                            <s:textfield name="Ofactura.Documento" />
                            <s:label value="Aplicar:"/>
                            <s:checkbox name="Ofactura.Aplicar" />
                            <s:label value="Importe:"/>
                            <s:textfield name="Ofactura.Importe" />
                        </td>

                    </tr>
                </table>



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


        <div id="pagListaDetalleFactura">
            <div id="divListaDetalleFactura">

                <table class="tabla">    
                    <thead>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Subtotal</th>
                    <th>Quitar</th>
                    </thead>
                    <tbody>
                        <s:iterator value="ListaDetalleFactura" status="row">
                            <tr>
                                <td><s:property value="DProducto"/></td>
                                <td><s:property value="Cantidad"/></td>
                                <td><s:property value="Precio"/></td>
                                <td><s:property value="SubTotal"/></td>
                                <td><a href="#" onclick="QuitarDetalleFactura(<s:property value="%{#row.index}"/>); return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>

            </div>
            <table>
                <tr>
                    <td><a href="#" onclick="toleft('pagListaDetalleFactura'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaDetalleFactura'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaDetalleFactura'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaDetalleFactura'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>






    </div>
    <div id="tabs-2">



    </div>

</div>



<div id="divEleccion" style="display: none;" title="Elija el documento">
    ¿Que documento desea cargar?
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


<div id="divBuscarCotizacion" style="display: none;" title="Buscar Cotizacion">

    <s:form id="formBuscarCotizacion" >
        <table>
            <tr><td>
                    <s:label value="Numero:"/>
                </td>
                <td>
                    <s:textfield name="Ocotizacion.Serie" onkeypress="if(event.keyCode == 13){ BuscarCotizacion(); return false; }"/>
                </td></tr>
            <tr><td colspan="2">
                    <a href="#" onclick="BuscarCotizacion(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a>
                </td></tr>
        </table>
    </s:form>

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
                                <a href="#" onclick="EnviarCotizacion(<s:property value="idCotizacion"/>,<s:property value="idModeloChasis"/>,<s:property value="NumeroChasis"/>,<s:property value="NumeroAsientos"/>,<s:property value="NumeroParabrisas"/>,'<s:property value="Ventanas"/>','<s:property value="TipoCarroceria"/>','<s:property value="ColorFondo"/>','<s:property value="ColorArtes"/>','<s:property value="ColorOtros"/>','<s:property value="Observaciones"/>');"><img title="Enviar" width="20" height="20" src="../../images/Derecha.jpeg" /></a>
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
</div>

<div id="divBuscarClienteProveedor" style="display: none;" title="Buscar Cliente">
    <s:form id="formBuscarClienteProveedor" theme="simple">
        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Oclienteproveedor.RazonSocial" onkeypress="if(event.keyCode == 13){ BuscarClienteProveedor(); return false; }"/></td>
            </tr>
            <tr>
                <td>RUC:</td>
                <td><s:textfield name="Oclienteproveedor.Ruc" onkeypress="if(event.keyCode == 13){ BuscarClienteProveedor(); return false; }"/></td>
            </tr>
            <tr>
                <td>
                    <a href="#" onclick="BuscarClienteProveedor();
                        return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
                <td></td>
            </tr>
        </table>
        <div id="pagListaClienteProveedor">
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
                                    <a href="#" onclick="EnviarClienteProveedor(<s:property value="idClienteProveedor"/>, '<s:property value="RazonSocial"/>', '<s:property value="Ruc"/>');
                                        return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>

            <table>
                <tr>
                    <td><a href="#" onclick="toleft('pagListaClienteProveedor');
                        return false;"><img width="40" height="40" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaClienteProveedor');
                        return false;"><img width="40" height="40" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 30px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaClienteProveedor');
                        return false;"><img width="40" height="40" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaClienteProveedor');
                        return false;"><img width="40" height="40" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>
    </s:form>
</div>



<div id="divBuscarFactura" style="display: none;" title="Buscar Factura">
    <s:form id="formBuscarFactura">

        <table>
            <tr>
                <td>Numero:</td>
                <td><s:textfield name="Ofactura.Numero" onkeypress="if(event.keyCode == 13){ BuscarFactura(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarFactura(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaFactura">
        <div id="divListaFactura">
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
                    <s:iterator value="ListaFactura">
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
                                <a class="lstEnviar" href="#" onclick="EnviarFactura(<s:property value="idFactura"/>); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaFactura'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaFactura'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaFactura'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaFactura'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>

<div id="divAgregarDetalleFactura" title="Agregar Detalle de Factura" style="display: none;">

    <form id="formAgregarDetalleFactura" theme="simple">
        <s:hidden name="Odetallefactura.idProducto"/>
        <s:label value="Producto"/>
        <s:textfield name="Odetallefactura.DProducto" paso="1" onclick="AbrirProducto();" cssClass="validate[required]"/>
        <s:label value="Precio"/>
        <s:textfield name="Odetallefactura.Precio" paso="1" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Cantidad"/>
        <s:textfield name="Odetallefactura.Cantidad" paso="2" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
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
                    <a href="#" onclick="BuscarProducto(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaProducto">
        <div id="divListaProducto">

        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>




<jsp:include page="../MasterPage/Inferior.jsp" />


