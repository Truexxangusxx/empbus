<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnCotizacion').addClass('activo');
        
        jQuery("#formNuevaCotizacion").validationEngine();
        IniciarPagina('pagListaCotizacion');
        IniciarPagina('pagListaClienteProveedor');
        IniciarPagina('pagListaCotizacionCaracteristicas');
        limpiar();      
                
        
        $("#txtProducto").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarProductoJson",
                    dataType: "json",
                    data: {"Oproducto.idFamilia":0,"Oproducto.Descripcion":request.term},
                    success: function(data) {
                        var datos = data.listaProducto;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.descripcion,
                                id: item.idProducto,
                                codigo: item.codigo,
                                unidadmedida : item.DUnidadMedidaCompra,
                                precio : item.precio
                            };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $('#hdidProducto').val(ui.item.id);
                $("#txtProducto").attr("title", "Codigo: "+ui.item.codigo).tooltip({ position: { my: "left+10 center", at: "right center" } });
                $("#txtPrecioPrincipal").val(ui.item.precio);
            }
        });
        
        $("#txtDProductoAdicional").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarProductoJson",
                    dataType: "json",
                    data: {"Oproducto.idFamilia":0,"Oproducto.Descripcion":request.term},
                    success: function(data) {
                        var datos = data.listaProducto;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.descripcion,
                                id: item.idProducto
                            };
                        }));
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                $('#hdidProductoAdicional').val(ui.item.id);
                salto($("#txtDProductoAdicional"));
            }
        });
        
    });
  
    $(function() {        
        $( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd'});        
    });


    function AgregarCotizacionProducto(){
        $( "#divAgregarAdicionales" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url="AgregarCotizacionProducto?Ocotizacionproducto.DProducto="+$("#txtDProductoAdicional option:selected").text()+"&Ocotizacionproducto.idProducto="+$("#hdidProductoAdicional").val()+"&Ocotizacionproducto.Cantidad="+$("#txtCantidad").val();
                    $.get(url,function(resultado){
                        $("#divDetalleCotizacion").html(resultado);
                        
                        limpiaForm($("#forAgregarAdicionales"));
                        //$("#forAgregarAdicionales [name='Ocotizacionproducto.idProducto']").siblings('.ui-combobox').find('.ui-autocomplete-input').focus();
                        $("#txtDProductoAdicional").focus();
                        var monto=0;
                        monto = $("#formNuevaCotizacion [name='Ocotizacion.Monto']").val();
                        monto = parseInt(monto) + parseInt($("#txtPrecioPrincipal").val());
                        $("#formNuevaCotizacion [name='Ocotizacion.Monto']").val(monto);
                    });
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });        
    }
    function RemoverCotizacionProducto(index){
        var url="RemoverCotizacionProducto?indice="+index;
        $.get(url,function(resultado){
            $("#divDetalleCotizacion").html(resultado);
            var monto=0;
            monto = $("#formNuevaCotizacion [name='Ocotizacion.Monto']").val();
            monto = parseInt(monto) + parseInt($("#txtPrecioPrincipal").val());
            $("#formNuevaCotizacion [name='Ocotizacion.Monto']").val(monto);
        });
    }
    function GrabarCotizacion(){
        if($("#formNuevaCotizacion").validationEngine('validate')){
            var url = "GrabarCotizacion";
            var data = $("#formNuevaCotizacion").serialize();
            $.getJSON(url,data, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    var cotizacion = resultado.ocotizacion;
                    
                    var datos = {"Ocotizacion.idCotizacion":cotizacion.idCotizacion , "Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadCotizacion";
                    $("body").load(url, datos);

                }
            });
        }
    }
    function ValidarCotizacion(){
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
        $( "#hdidClienteProveedor" ).val(idClienteProveedor);
        $( "#txtRazonSocial" ).val(RazonSocial);
        //$( "#lblRuc" ).text("  Ruc: "+Ruc);
        $( "#txtRazonSocial").attr("title", "Ruc: "+Ruc).tooltip({ position: { my: "left+10 center", at: "right center" } });
        $( "#divBuscarClienteProveedor" ).dialog('close');
    }    
    function BuscarCotizacion(){
        var url = "BuscarCotizacion?Ocotizacion.Serie=&Ocotizacion.idClienteProveedor="+$("#hdidClienteProveedor").val();
        $.get(url, function(resultado){  
            $("#divListaCotizacion").html(resultado);
            IniciarPagina('pagListaCotizacion');
            $( "#divBuscarCotizacion" ).dialog({width:'auto'});            
        });  
    }
    function EnviarCotizacion(idCotizacion, idModeloChasis,NumeroChasis,NumeroAsientos,NumeroParabrisas,Ventanas,TipoCarroceria,ColorFondo,ColorArtes,ColorOtros,Observaciones){
        var datos = {"Ocotizacion.idCotizacion":idCotizacion , "Operacion":'Edicion'};
        var url = "LoadCotizacion";
        $("body").load(url, datos);
    }    
    function EnviarListaCotizacionCaracteristicas(variable,indice,valor,Descripcion){
        var v="";
        if (variable == "Ocotizacioncaracteristicas.Estado" ){v = "Estado";}
        if (variable == "Ocotizacioncaracteristicas.Valor" ){v = "Valor";}
        var url = "EnviarListaCotizacionCaracteristicas?"+variable+"="+valor+"&indice="+indice+"&variable="+v;
        $.getJSON(url, function(resultado){
            if (resultado.error) {
                Error(resultado.msg);
            }
            else{
                
                try{
                    $("#divListaCotizacionCaracteristicas table tbody tr").each(function (index) {
                        var DTipo;
                        $(this).children("td").each(function (index2) {
                            switch (index2) {
                                case 0:
                                    DTipo = $(this).text();
                                    break;
                            }                            
                        })                    
                        if (index != indice && DTipo == Descripcion){
                            $(this).children("td").each(function (index2) {
                                switch (index2) {
                                    case 2:
                                        $(this).children("input").attr('checked', false);
                                        break;
                                    case 3:
                                        $(this).children("input").val('');
                                        break;
                                }
                            })
                        }
                    })
                }
                catch(e){alert(e);}
                
            }
        });
    }
    function CambiarANuevo(){
        $("#formNuevaCotizacion [name='Operacion']").val('Nuevo');
        $("#formNuevaCotizacion [name='Ocotizacion.Estado']").val('');
                  
    }
    function AprobarCotizacion(){        
        var id = $("#formNuevaCotizacion [name='Ocotizacion.idCotizacion']").val();    
        if (id == 0 || id == ""){Error("No hay Cotizacion creada en pantalla");}
        else{
            var datos = {"Ocotizacion.idCotizacion":id};
            $.getJSON("AprobarCotizacion", datos, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    $("#formNuevaCotizacion [name='Ocotizacion.Estado']").val('Aprobado');
                    Mensaje(resultado.msg);
                }
            });        
        }
    }
</script>

<jsp:include page="Menu.jsp" />
<br/>

<s:form id="formAuxiliar">
    <s:hidden name="msg"/>
    <s:hidden name="Operacion"/>
    <s:hidden name="Ocotizacion.idCotizacion"/>    
</s:form>

<s:form theme="simple" id="formNuevaCotizacion"> 

    <s:hidden name="Ocotizacion.idCotizacion"/>

    <table style="width: 70%;border:1px solid #666666;" border="1">
        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarCotizacionProducto(); return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarCotizacion(); return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarCotizacion(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                <a href="LoadCotizacion?Operacion=Nuevo"><img title="Nuevo en Blanco" src="../../images/NuevoBlanco.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="CambiarANuevo(); return false;"><img title="Nuevo" src="../../images/Nuevo.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AprobarCotizacion(); return false;"><img title="Aprobar" src="../../images/Aprobado.jpeg" width="40px" height="40px"/></a>
            </td>
            <td style="width: 50%;">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Operacion:"/>
                            <s:textfield name="Operacion" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                        <td><div id="numeroserie">
                                <s:label value="Numero:"/>
                                <s:textfield name="Ocotizacion.Serie" readonly="true" cssStyle="font-weight: bold;"/>
                            </div></td>
                        <td>
                            <s:label value="Estado:"/>
                            <s:textfield name="Ocotizacion.Estado" readonly="true" cssStyle="font-weight: bold;"/>
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 100%;">

                <table style="width: 100%;" border="1">
                    <tr>
                        <td class="cuadro">
                            <h3>Datos Generales</h3>
                            <div>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 50%;">
                                            <s:hidden id="hdidClienteProveedor" name="Ocotizacion.idClienteProveedor" cssClass="validate[required]"/>
                                            <s:label value="Fecha:"/>
                                            <s:textfield name="Ocotizacion.Fecha" cssClass="datepicker"/>
                                            <s:label value="Cliente:"/>
                                            <s:textfield name="Ocotizacion.DClienteProveedor" id="txtRazonSocial" cssClass="validate[required]" readonly="true" onclick="ValidarCotizacion(); return false;" title="Ruc: %{Ocotizacion.Ruc}"/><label style="float: right;" id="lblRuc"></label>
                                            <s:label value="Modelo de Chasis:"/>
                                            <s:select name="Ocotizacion.idModeloChasis" list="ListaModeloChasis" listKey="idModeloChasis" listValue="Descripcion"/>                                                                
                                        </td>
                                        <td style="width: 50%;">
                                            <s:label value="Tipode de Carroceria:"/>                                
                                            <s:select name="Ocotizacion.TipoCarroceria" list="ListaTipoCarroceria" />
                                            <s:label value="Articulo Principal:"/>
                                            <s:textfield id="txtProducto" name="Ocotizacion.producto.Descripcion" title="Codigo: %{Ocotizacion.producto.Codigo}" cssClass="validate[required]"/><s:hidden id="hdidProducto" name="Ocotizacion.producto.idProducto"/>
                                            <s:label value="Centro de Costo:"/>
                                            <s:select name="Ocotizacion.centrocosto.idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion"/>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </td>

                        <td style="width: 25%;" class="cuadro">
                            <h3>Cantidades</h3>
                            <div>

                                <s:label value="Numero de Chasis:"/>
                                <s:textfield name="Ocotizacion.NumeroChasis"/>
                                <s:label value="N° Asientos:"/>
                                <s:textfield name="Ocotizacion.NumeroAsientos" cssClass="validate[required,custom[number]]"/>
                                <s:label value="N° Parabrisas:"/>
                                <s:textfield name="Ocotizacion.NumeroParabrisas" cssClass="validate[required]"/>
                                <s:label value="Modelo de Ventanas:"/>                                
                                <s:select name="Ocotizacion.Ventanas" list="ListaModeloVentanas" />

                            </div>
                        </td>
                        <td style="width: 25%;" class="cuadro">
                            <h3>Colores</h3>
                            <div>

                                <s:label value="Color Fondo:"/>
                                <s:textarea name="Ocotizacion.ColorFondo"/>
                                <s:label value="Color Artes:"/>
                                <s:textarea name="Ocotizacion.ColorArtes"/>
                                <s:label value="Color Otros:"/>
                                <s:textarea name="Ocotizacion.ColorOtros"/>

                            </div>

                        </td>
                    </tr>

                    <tr>

                        <td colspan="3">
                            <s:label value="Observaciones:"/>
                            <s:textarea name="Ocotizacion.Observaciones" cols="120" cssClass="validate[required]"/>
                        </td>

                    </tr>

                </table>

            </td>
        </tr>
        <tr>
            <td style="width: 50%;" class="cuadro">
                <h3>Adicionales</h3>
                <div>
                    <table>
                        <tr>
                            <td>&nbsp;&nbsp;<a href="#" onclick="AgregarCotizacionProducto(); return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a></td>
                            <td>&nbsp;&nbsp;Articulo principal:&nbsp;&nbsp;<s:textfield id="txtPrecioPrincipal" name="Ocotizacion.Producto.Precio"/></td>
                        </tr>
                    </table>
                    <div id="divDetalleCotizacion">
                        <table class="tabla">
                            <thead>
                            <th>Codigo</th>
                            <th>Adicional</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                            <th>SubTotal</th>
                            <th>Opcion</th>
                            </thead>
                            <tbody>
                                <s:iterator value="ListaCotizacionProducto" status="row">
                                    <tr>
                                        <td><s:property value="CodigoProducto"/></td>
                                        <td><s:property value="DProducto"/></td>
                                        <td><s:property value="Cantidad"/></td>
                                        <td><s:property value="Precio"/></td>
                                        <td><s:property value="SubTotal"/></td>
                                        <td><a href="#" onclick="RemoverCotizacionProducto(<s:property value="%{#row.index}"/>);return false;"><img src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
                                    </tr>
                                </s:iterator>
                            </tbody>
                        </table>
                        <s:label value="Monto:"/>
                        <s:textfield readonly="true" name="Ocotizacion.Monto"/>
                    </div>
                </div>
            </td>

            <td style="width: 50%;" class="cuadro">
                <h3>Caracteristicas</h3>
                <div>
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
                                            <td><s:checkbox name="Estado" onchange="EnviarListaCotizacionCaracteristicas('Ocotizacioncaracteristicas.Estado',%{#row.index},this.checked,'%{DTipoCaracteristica}'); return false;"/></td>
                                            <td><s:textfield name="Valor" onchange="EnviarListaCotizacionCaracteristicas('Ocotizacioncaracteristicas.Valor',%{#row.index},this.value,'%{DTipoCaracteristica}'); return false;"/></td>
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
                </div>
            </td>
        </tr>
    </table>

</s:form>

<div id="divAgregarAdicionales" style="display: none;" title="Agregar Adicional">    
    <s:form id="forAgregarAdicionales" theme="simple">    
        <s:label value="Producto:"/>
        <%--<s:select id="cboProducto" cssClass="combobox" name="Ocotizacionproducto.idProducto" list="ListaProducto" listKey="idProducto" listValue="Descripcion" onchange="$('#txtCantidad').focus();"/>--%>
        <s:textfield id="txtDProductoAdicional" name="Ocotizacionproducto.DProducto"  paso="1"/>
        <s:hidden id="hdidProductoAdicional" name="Ocotizacionproducto.idProducto"/>
        <s:label value="Cantidad:"/>
        <s:textfield id="txtCantidad" name="Ocotizacionproducto.Cantidad" paso="2" onkeydown="BotonDialog($(this));"/>
    </s:form>
</div>    


<div id="divBuscarClienteProveedor" style="display: none;" title="Buscar Cliente">
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
                    <td><a href="#" onclick="toleft('pagListaClienteProveedor'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                    <td><a href="#" onclick="left('pagListaClienteProveedor'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                    <td><a href="#" onclick="rigth('pagListaClienteProveedor'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                    <td><a href="#" onclick="torigth('pagListaClienteProveedor'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
                </tr>
            </table>
            <input type="hidden" class="count" />
            <input type="hidden" class="number" value="10" />
        </div>
    </s:form>
</div>

<div id="divBuscarCotizacion" style="display: none;" title="Buscar Cotizacion">
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



<jsp:include page="../MasterPage/Inferior.jsp" />