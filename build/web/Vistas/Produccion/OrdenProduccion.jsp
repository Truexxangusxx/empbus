<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">
    
    $(document).ready(function () {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnOrdenProduccion').addClass('activo');
        
        jQuery("#formNuevaOrdenProduccion").validationEngine();
        
        limpiar();
        IniciarPagina('pagListaCotizacionCaracteristicas');
        $( "#tabs" ).tabs();
        $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy'});        
        IniciarPagina('pagListaClienteProveedor');
    });
  
    $(function() {        
        $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy'});        
    });

    function GrabarOrdenProduccion(){
        if($("#formNuevaOrdenProduccion").validationEngine('validate')){
            var url = "GrabarOrdenProduccion";
            var data = $("#formNuevaOrdenProduccion").serialize();
            $.getJSON(url,data, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    var OrdenProduccion = resultado.oordenproduccion;
                    var datos = {"Oordenproduccion.idOrdenProduccion":OrdenProduccion.idOrdenProduccion , "Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadOrdenProduccion";
                    $("body").load(url, datos);
                }
            });
        }
    }   
    function NuevoOrdenProduccion(){                    
        var datos = {"Operacion":'Nuevo'};
        var url = "LoadOrdenProduccion";
        $("body").load(url, datos);        
        //location.href="LoadOrdenProduccion?Operacion=Nuevo";
    }    
    function ObtenerCotizacion(){
        var idCotizacion = $("#formNuevaOrdenProduccion [name='Oordenproduccion.idCotizacion']").val();
        var url = "ObtenerCotizacion?Ocotizacion.idCotizacion="+idCotizacion;                    
        $.getJSON(url, function(resultado){
            if (resultado.error) {
                Error(resultado.msg);
            }
            else{                    
                var Cotizacion = resultado.ocotizacion;
                $("#cotFecha").text(Cotizacion.fecha);
                $("#cotDClienteProveedor").text(Cotizacion.DClienteProveedor);
                $("#cotDModeloChasis").text(Cotizacion.DModeloChasis);
                $("#cotTipoCarroceria").text(Cotizacion.tipoCarroceria);
                $("#cotNumeroChasis").text(Cotizacion.numeroChasis);
                $("#cotNumeroAsientos").text(Cotizacion.numeroAsientos);
                $("#cotNumeroParabrisas").text(Cotizacion.numeroParabrisas);
                $("#cotVentanas").text(Cotizacion.ventanas);
                $("#cotColorFondo").text(Cotizacion.colorFondo);
                $("#cotColorArtes").text(Cotizacion.colorArtes);
                $("#cotColorOtros").text(Cotizacion.colorOtros);
                $("#cotObservaciones").text(Cotizacion.observaciones);
                $( "#divDetalleCotizacion" ).dialog({height: 'auto',modal: true,width: 'auto'});
            }
        });
    }
    function AbrirArticulos(){
        if ($("#formNuevaOrdenProduccion [name='Operacion']").val() == 'Nuevo'){$( "#divListaArticulosGeneral" ).dialog({height: 'auto',modal: true,width: 'auto'});}
        else{$( "#divListaArticulos" ).dialog({height: 'auto',modal: true,width: 'auto'});}
    }
    function EnviarProducto(idProducto,DProducto){
        $("#formNuevaOrdenProduccion [name='Oordenproduccion.idProducto']").val(idProducto);
        $("#formNuevaOrdenProduccion [name='Oordenproduccion.DProductoPrincipal']").val(DProducto);
        
        if ($("#formNuevaOrdenProduccion [name='Operacion']").val() == 'Nuevo'){$( "#divListaArticulosGeneral" ).dialog('close');}
        else{$( "#divListaArticulos" ).dialog('close');}
    }
    function AbrirCaracteristicas(){
        $( "#divListaCaracteristicas" ).dialog({height: 'auto',modal: true,width: 'auto'});
    }
    function BuscarProducto(){
        var url = "BuscarProducto";
        var data = $("#formBuscarProducto").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaProducto").html(resultado);
            IniciarPagina('pagListaProducto');
        });  
    }
    function AbrirClienteProveedor(){
        $( "#divBuscarClienteProveedor" ).dialog({
            width:'auto'
        });
    }
    function BuscarClienteProveedor(){
        var url = "BuscarClienteProveedorCotizacion";
        var data = $("#formBuscarClienteProveedor").serialize();
        $.get(url,data, function(resultado){  
            $("#divListaClienteProveedor").html(resultado);
            IniciarPagina('pagListaClienteProveedor');
        });  
    }    
    function EnviarClienteProveedor(idClienteProveedor, RazonSocial, Ruc){
        $("#formNuevaOrdenProduccion [name='Oordenproduccion.idClienteProveedor']").val(idClienteProveedor);
        $("#formNuevaOrdenProduccion [name='Oordenproduccion.DClienteProveedor']").val(RazonSocial);        
        $( "#divBuscarClienteProveedor" ).dialog('close');
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
        });  
    }
    function EnviarOrdenProduccion(idOrdenProduccion, Numero){
        var datos = {"Operacion":'Edicion',"Oordenproduccion.idOrdenProduccion":idOrdenProduccion};
        var url = "LoadOrdenProduccion";
        $("body").load(url, datos);        
    }
    function GenerarPedido(){
            var url = "GenerarPedido";
            var data = $("#formNuevaOrdenProduccion").serialize();
            $.getJSON(url,data, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    Mensaje(resultado.msg);
                }
            });
    }
</script>

<jsp:include page="Menu.jsp" />
<br/>



<s:form theme="simple" id="formNuevaOrdenProduccion">

    <s:hidden name="Oordenproduccion.idOrdenProduccion"/>

    <table style="width: 70%;border:1px solid #666666;" border="1">
        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="cargarj();return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarOrdenProduccion(); return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirOrdenProduccion(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="NuevoOrdenProduccion();"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GenerarPedido();"><img title="Aprobar" src="../../images/Aprobado.jpeg" width="40px" height="40px"/></a>
            </td>
            <td style="width: 50%;">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Operacion:"/>
                            <s:textfield name="Operacion" readonly="true"/>
                        </td>
                        <td>
                            <s:label value="Numero:"/>
                            <s:textfield name="Oordenproduccion.Numero" readonly="true"/>
                        </td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Oordenproduccion.Estado" readonly="true"/>
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
        <tr>
            <td style="width: 50%;" class="cuadro">
                <h3>Datos Generales</h3>
                <div>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 50%;">
                                <s:label value="Fecha:"/>
                                <s:textfield name="Oordenproduccion.Fecha" cssClass="datepicker"/>                    
                                <s:label value="Sucursal:"/>
                                <s:select name="Oordenproduccion.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
                                <s:label value="CentroCosto:"/>
                                <s:select name="Oordenproduccion.idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion" />
                                <s:label value="Monto:"/>
                                <s:textfield name="Oordenproduccion.Monto"/>                                
                            </td>         
                            <td style="width: 50%;">
                                <s:label value="Fecha de Inicio:"/>
                                <s:textfield name="Oordenproduccion.FechaInicio" cssClass="datepicker"/>                    
                                <s:label value="Fecha de Termino:"/>
                                <s:textfield name="Oordenproduccion.FechaTermino" cssClass="datepicker"/>
                                <s:label value="Tipo:"/>
                                <s:select name="Oordenproduccion.idTipoOrdenProduccion" list="ListaTipoOrdenProduccion" listKey="idTipoOrdenProduccion" listValue="Descripcion" />
                                <s:label value="Cliente:"/>
                                <s:textfield name="Oordenproduccion.DClienteProveedor" onclick="AbrirClienteProveedor(); return false;"/>
                                <s:hidden name="Oordenproduccion.idClienteProveedor" />
                            </td>      
                        </tr>
                    </table>
                </div>


            </td>
            <td style="width: 50%;" class="cuadro">
                <h3>Datos de Cotizacion</h3>
                <div>
                    <s:label value="Numero Cotizacion:"/>
                    <s:textfield name="Oordenproduccion.DCotizacion"/>
                    <a href="#" onclick="ObtenerCotizacion(); return false;"><img title="Ver" src="../../images/Buscar.jpeg" width="25px" height="25px"/></a>

                    <s:label value="Producto/Servicio:"/>
                    <s:hidden name="Oordenproduccion.idProducto"/>
                    <s:textfield name="Oordenproduccion.DProductoPrincipal"/>
                    <a href="#" onclick="AbrirArticulos(); return false;"><img title="Ver" src="../../images/Buscar.jpeg" width="25px" height="25px"/></a>

                    <s:label value="Lista de Caracteristicas:"/>
                    <s:hidden name="Oordenproduccion.idCotizacion"/>
                    <a href="#" onclick="AbrirCaracteristicas(); return false;"><img title="Ver" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </div>


            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 100%">
                <s:label value="Observaciones:"/>
                <s:textarea name="Oordenproduccion.Observaciones" cols="120"/>
            </td>
        </tr>
    </table>

</s:form>



<h2 class="demoHeaders">Seguimiento</h2>
<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Materiales</a></li>
        <li><a href="#tabs-2">Mano de Obra</a></li>
        <li><a href="#tabs-3">Sericios Terceros</a></li>
    </ul>
    <div id="tabs-1">


        <table class="tabla">    
            <thead>
            <th>Numero Salida</th>
            <th>Articulo</th>
            <th>Codigo</th>
            <th>Cantidad</th>
            <th>Fecha</th>
            <th>Sucursal</th>
            <th>Almacen</th>
            </thead>
            <tbody>
                <s:iterator value="ListaReferenciaMaterialesOP">
                    <tr>
                        <td><s:property value="Numero"/></td>
                        <td><s:property value="DProducto"/></td>
                        <td><s:property value="CodigoProducto"/></td>
                        <td><s:property value="Cantidad"/></td>
                        <td><s:property value="Fecha"/></td>
                        <td><s:property value="DSucursal"/></td>
                        <td><s:property value="DAlmacen"/></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>


    </div>
    <div id="tabs-2">





    </div>
    <div id="tabs-3">


        <table class="tabla">    
            <thead>
            <th>Orden Servicio</th>
            <th>Fecha</th>
            <th>Centro de Costo</th>
            <th>Articulo</th>
            <th>Cantidad</th>
            <th>Importe</th>
            </thead>
            <tbody>
                <s:iterator value="ListaReferenciaServiciosOP">
                    <tr>
                        <td><s:property value="DOrdenServicio"/></td>
                        <td><s:property value="Fecha"/></td>
                        <td><s:property value="DCentroCosto"/></td>
                        <td><s:property value="DProducto"/></td>
                        <td><s:property value="Cantidad"/></td>
                        <td><s:property value="Importe"/></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>


    </div>
</div>



<div id="divDetalleCotizacion" style="display: none;" title="Datos de Cotizacion">
    <s:form theme="simple">
        <table border="1">
            <tr>
                <td>Fecha:</td><td><s:label id="cotFecha" name="Ocotizacion.Fecha"/></td>
            </tr>        
            <tr>
                <td>Cliente:</td><td><s:label id="cotDClienteProveedor" name="Ocotizacion.DClienteProveedor"/></td>
            </tr>        
            <tr>
                <td>Modelo de Chasis:</td><td><s:label id="cotDModeloChasis" name="Ocotizacion.DModeloChasis"/></td>
            </tr>        
            <tr>
                <td>Tipo de Carroceria:</td><td><s:label id="cotTipoCarroceria" name="Ocotizacion.TipoCarroceria"/></td>
            </tr>        
            <tr>
                <td>Numero de Chasis:</td><td><s:label id="cotNumeroChasis" name="Ocotizacion.NumeroChasis"/></td>
            </tr>        
            <tr>
                <td>Numero de Asientos:</td><td><s:label id="cotNumeroAsientos" name="Ocotizacion.NumeroAsientos"/></td>
            </tr>        
            <tr>
                <td>Numero de Parabrisas:</td><td><s:label id="cotNumeroParabrisas" name="Ocotizacion.NumeroParabrisas"/></td>
            </tr>        
            <tr>
                <td>Modelo de Ventanas:</td><td><s:label id="cotVentanas" name="Ocotizacion.Ventanas"/></td>
            </tr>   
            <tr>
                <td>Color de Fondo:</td><td><s:label id="cotColorFondo" name="Ocotizacion.ColorFondo"/></td>
            </tr>        
            <tr>
                <td>Color Artes:</td><td><s:label id="cotColorArtes" name="Ocotizacion.ColorArtes"/></td>
            </tr>        
            <tr>
                <td>Color Otros:</td><td><s:label id="cotColorOtros" name="Ocotizacion.ColorOtros"/></td>
            </tr>        
            <tr>
                <td>Observaciones:</td><td><s:label id="cotObservaciones" name="Ocotizacion.Observaciones"/></td>
            </tr>                
        </table>       
    </s:form>
</div>



<div id="divListaArticulos" style="display: none;" title="Articulos de la Cotizacion">
    <s:form theme="simple">
        <table class="tabla">
            <thead>
            <th>Codigo</th>
            <th>Articulo</th>            
            <th>Cantidad</th>
            <th>Opcion</th>
            </thead>
            <tbody>
                <s:iterator value="ListaCotizacionProducto" status="row">
                    <tr>
                        <td><s:property value="CodigoProducto"/></td>
                        <td><s:property value="DProducto"/></td>
                        <td><s:property value="Cantidad"/></td>
                        <td><a href="#" onclick="EnviarProducto(<s:property value="idProducto"/>,'<s:property value="DProducto"/>');return false;"><img src="../../images/Derecha.jpeg" width="20px" height="20px"/></a></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </s:form>
</div>

<div id="divListaCaracteristicas" style="display: none;" title="Caracteristicas">
    <s:form theme="simple">
        <div id="pagListaCotizacionCaracteristicas">
            <div id="divListaCotizacionCaracteristicas">
                <table class="tabla">
                    <thead>
                    <th>Tipo Caracteritica</th>
                    <th>Caracteristica</th>
                    <th>Check</th>
                    <th>Opcional</th>
                    </thead>
                    <tbody class="ParaPaginar">
                        <s:iterator value="ListaCotizacionCaracteristicas" status="row">
                            <tr>
                                <td><s:property value="DTipoCaracteristica"/></td>
                                <td><s:property value="DCaracteristicas"/></td>
                                <td><s:checkbox name="Estado"/></td>
                                <td><s:textfield name="Valor"/></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
            <table>
                <tr>
                    <td><a href="#" onclick="toleft('pagListaCotizacionCaracteristicas'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaCotizacionCaracteristicas'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; width: 30px; height: 20px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaCotizacionCaracteristicas'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaCotizacionCaracteristicas'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="6" />
        </div>
    </s:form>
</div>

<div id="divListaArticulosGeneral" style="display: none;" title="Articulos Diversos">
    <s:form id="formBuscarProducto" theme="simple">
        <table>
            <tr>
                <td>Familia:</td>
                <td><s:select name="Oproducto.idFamilia" list="ListaFamilia" listKey="idFamilia" listValue="Descripcion" /></td>
            </tr>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Oproducto.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarProducto(); return false; }"/></td>
            </tr>
            <tr>
                <td>
                    <a href="#" onclick="BuscarProducto(); return false;"><img width="40" height="40" src="../../images/Buscar.jpeg" /></a></td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaProducto">
        <div id="divListaProducto">
            <table class="tabla">
                <thead>
                <th>Familia</th>
                <th>Descripcion</th>
                <th>Tipo de Producto</th>
                <th>Codigo</th>
                <th>UM Compra</th>
                <th>UM Consumo</th>
                <th>Conversion</th>
                <th>Operacion</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaProducto">
                        <tr>
                            <td><s:property value="DFamilia"/></td>
                            <td><s:property value="Descripcion"/></td>
                            <td><s:property value="DTipoProducto"/></td>
                            <td><s:property value="Codigo"/></td>
                            <td><s:property value="UmCompra"/><s:property value="DUnidadMedidaCompra"/></td>
                            <td><s:property value="UmConsumo"/><s:property value="DUnidadMedidaConsumo"/></td>
                            <td><s:property value="Conversion"/></td>                    
                            <td align="center">
                                <a href="#" onclick="EditarProducto(<s:property value="idProducto"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>',<s:property value="idTipoProducto"/>,<s:property value="UmCompra"/>,<s:property value="idUnidadMedidaCompra"/>,<s:property value="UmConsumo"/>,<s:property value="idUnidadMedidaConsumo"/>,<s:property value="Conversion"/>,<s:property value="idFamilia"/>); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                                <a href="#" onclick="EliminarProducto(<s:property value="idProducto"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                                <a href="#" onclick="EnviarProducto(<s:property value="idProducto"/>,'<s:property value="Descripcion"/>'); return false;"><img title="Eliminar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; width: 30px; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaProducto'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
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
                    <a href="#" onclick="BuscarClienteProveedor(); return false;"><img title="Buscar Tipo Producto" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
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
                                    <a href="#" onclick="EnviarClienteProveedor(<s:property value="idClienteProveedor"/>,'<s:property value="RazonSocial"/>','<s:property value="Ruc"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>

            <table>
                <tr>
                    <td><a href="#" onclick="toleft('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 30px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaClienteProveedor'); return false;"><img width="40" height="40" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>
    </s:form>
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

<jsp:include page="../MasterPage/Inferior.jsp" />