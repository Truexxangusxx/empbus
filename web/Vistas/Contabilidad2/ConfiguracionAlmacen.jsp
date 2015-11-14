<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnConfiguracionAlmacen').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoConfiguracionAlmacen").validationEngine();
        $( "#tabs" ).tabs();
        
    });
    
    
    function ObtenerTipoCambio() {
        var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoConfiguracionAlmacen [name='Oconfiguracionalmacen.Fecha']").val(), "Otipocambio.idMonedaCobra": $("#formNuevoConfiguracionAlmacen [name='Oconfiguracionalmacen.Moneda.idMoneda']").val(), "Otipocambio.idMonedaPago": 0};
        $.getJSON(url, data, function(resultado) {
            $("#formNuevoConfiguracionAlmacen [name='Oconfiguracionalmacen.TipoCambio']").val(resultado.valor);
        });
    }
    
    
    function Nuevo(){
        $("#formNuevoConfiguracionAlmacen [name='Operacion']").val('Nuevo');
    }
    function NuevoBlanco(){
        var url = "LoadConfiguracionAlmacen";
        var data = {"Oconfiguracionalmacen.idConfiguracionAlmacen": 0, "Operacion":"Nuevo"};
        $('body').load(url, data);
    }
    function GrabarConfiguracionAlmacen(){
        if($("#formNuevoConfiguracionAlmacen").validationEngine('validate')){
            var url = "GrabarConfiguracionAlmacen";
            var data = $("#formNuevoConfiguracionAlmacen").serialize();
            $.getJSON(url,data, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    var ConfiguracionAlmacen = resultado.oconfiguracionalmacen;
                    var datos = {"Oconfiguracionalmacen.idConfiguracionAlmacen":ConfiguracionAlmacen.idConfiguracionAlmacen , "Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadConfiguracionAlmacen";
                    $("body").load(url, datos);
                }
            });
        }
    }
    
    function AbrirConfiguracionAlmacen(){
        $("#divBuscarConfiguracionAlmacen").dialog({
            width: 'auto'
        });
    }
    function BuscarConfiguracionAlmacen(){
        var url = "BuscarConfiguracionAlmacen";
        var data = $("#formBuscarConfiguracionAlmacen").serialize();
        $.get(url, data, function(resultado){
            $("#divListaConfiguracionAlmacen").html(resultado);
            IniciarPagina('pagListaConfiguracionAlmacen');
        });
    }
    function EnviarConfiguracionAlmacen(idConfiguracionAlmacen){
        var url = "LoadConfiguracionAlmacen";
        var data = {"Oconfiguracionalmacen.idConfiguracionAlmacen":idConfiguracionAlmacen};
        $('body').load(url,data);
    }
    
    function CambiarANuevo(){
        $("#formNuevoConfiguracionAlmacen [name='Operacion']").val('Nuevo');
    }
    
    function NuevoConfiguracionAlmacen(){
        var url = "LoadConfiguracionAlmacen";
        var data = {"Oconfiguracionalmacen.idConfiguracionAlmacen":0, "Operacion":"Nuevo"};
        $('body').load(url,data);
    }
    
    function AbrirCuenta(tipocuenta){
        $("#tipocuenta").val(tipocuenta);
        $("#divBuscarCuenta").dialog({
            width: 'auto'
        });
    }
    function BuscarCuenta(){
        var url = "BuscarCuenta";
        var data = $("#formBuscarCuenta").serialize();
        $.get(url, data, function(resultado){
            $("#divListaCuenta").html(resultado);
            IniciarPagina('pagListaCuenta');
        });
    }
    function EnviarCuenta(idCuenta,descripcion,codigo){
        var tipocuenta = $("#tipocuenta").val();
        if (tipocuenta == 1){
            $("[name='Oconfiguracionalmacen.CuentaExistencias.idCuenta']").val(idCuenta);
            $("[name='Oconfiguracionalmacen.CuentaExistencias.Descripcion']").val(descripcion);
            $("[name='Oconfiguracionalmacen.CuentaExistencias.Codigo']").val(codigo);
        }
        if (tipocuenta == 2){
            $("[name='Oconfiguracionalmacen.CuentaCompras.idCuenta']").val(idCuenta);
            $("[name='Oconfiguracionalmacen.CuentaCompras.Descripcion']").val(descripcion);
            $("[name='Oconfiguracionalmacen.CuentaCompras.Codigo']").val(codigo);
        }
        if (tipocuenta == 3){
            $("[name='Oconfiguracionalmacen.CuentaVariacionExistencias.idCuenta']").val(idCuenta);
            $("[name='Oconfiguracionalmacen.CuentaVariacionExistencias.Descripcion']").val(descripcion);
            $("[name='Oconfiguracionalmacen.CuentaVariacionExistencias.Codigo']").val(codigo);
        }
        if (tipocuenta == 4){
            $("[name='Oconfiguracionalmacen.CuentaTransferencia.idCuenta']").val(idCuenta);
            $("[name='Oconfiguracionalmacen.CuentaTransferencia.Descripcion']").val(descripcion);
            $("[name='Oconfiguracionalmacen.CuentaTransferencia.Codigo']").val(codigo);
        }
        if (tipocuenta == 5){
            $("[name='Oconfiguracionalmacen.CuentaProducto.idCuenta']").val(idCuenta);
            $("[name='Oconfiguracionalmacen.CuentaProducto.Descripcion']").val(descripcion);
            $("[name='Oconfiguracionalmacen.CuentaProducto.Codigo']").val(codigo);
        }
        if (tipocuenta == 6){
            $("[name='Oconfiguracionalmacen.CuentaVariacionProducto.idCuenta']").val(idCuenta);
            $("[name='Oconfiguracionalmacen.CuentaVariacionProducto.Descripcion']").val(descripcion);
            $("[name='Oconfiguracionalmacen.CuentaVariacionProducto.Codigo']").val(codigo);
        }
        if (tipocuenta == 7){
            $("[name='Odetalleconfiguracionalmacen.Cuenta.idCuenta']").val(idCuenta);
            $("[name='Odetalleconfiguracionalmacen.Cuenta.Descripcion']").val(descripcion);
            $("[name='Odetalleconfiguracionalmacen.Cuenta.Codigo']").val(codigo);
        }
        
        $("#divBuscarCuenta").dialog("close");
    }
    
    function AbrirFamilia(tipocuenta){
        $("#tipocuenta").val(tipocuenta);
        $("#divBuscarFamilia").dialog({
            width: 'auto'
        });
    }
    function BuscarFamilia(){
        var url = "BuscarFamilia";
        var data = $("#formBuscarFamilia").serialize();
        $.get(url, data, function(resultado){
            $("#divListaFamilia").html(resultado);
            IniciarPagina('pagListaFamilia');
        });
    }
    function EnviarFamilia(idFamilia,descripcion,codigo){
        $("[name='Oconfiguracionalmacen.Familia.idFamilia']").val(idFamilia);
        $("[name='Oconfiguracionalmacen.Familia.Codigo']").val(codigo);
        
        $("#divBuscarFamilia").dialog("close");
    }
    function AgregarDetalleConfiguracionAlmacen() {
        limpiaForm($("#formAgregarDetalleConfiguracionAlmacen"));
        $("#divAgregarDetalleConfiguracionAlmacen").dialog({
            width: 'auto',
            modal: true,
            buttons: {
                "Agregar": function() {
                    var url = "AgregarDetalleConfiguracionAlmacen";
                    var data = $("#formAgregarDetalleConfiguracionAlmacen").serialize();
                    $.get(url, data, function(resultado){
                        $("#divListaDetalleConfiguracionAlmacen").html(resultado);
                        IniciarPagina('pagListaDetalleConfiguracionAlmacen');
                    });
                    limpiaForm($("#formAgregarDetalleConfiguracionAlmacen"));
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function QuitarDetalleConfiguracionAlmacen(index) {

        var url = "QuitarDetalleConfiguracionAlmacen";
        var data ={ "index":index};
        $.get(url, data, function(resultado){
            $("#divListaDetalleConfiguracionAlmacen").html(resultado);
            IniciarPagina('pagListaDetalleConfiguracionAlmacen');
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
        $("[name='Odetalleconfiguracionalmacen.CentroCosto.idCentroCosto']").val(idCentroCosto);
        $("[name='Odetalleconfiguracionalmacen.CentroCosto.Descripcion']").val(descripcion);
        $("[name='Odetalleconfiguracionalmacen.CentroCosto.Codigo']").val(codigo);
        $("#divBuscarCentroCosto").dialog("close");
    }
    
</script>


<jsp:include page="Menu.jsp" />
<br/>

<s:hidden id="tipocuenta"/>


<s:form id="formNuevoConfiguracionAlmacen" theme="simple">
    <s:hidden name="Oconfiguracionalmacen.idConfiguracionAlmacen"/>




    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarDetalleConfiguracionAlmacen();
                    return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarConfiguracionAlmacen();
                    return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirConfiguracionAlmacen();
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
                            <s:textfield name="Oconfiguracionalmacen.Numero" readonly="true" cssStyle="font-weight: bold;"/>
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
                <h3>Identificador</h3>


                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Codigo:"/>
                            <s:hidden name="Oconfiguracionalmacen.Familia.idFamilia" />
                            <s:textfield name="Oconfiguracionalmacen.Familia.Codigo" onclick="AbrirFamilia(); return false;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Descripcion:"/>
                            <s:textfield name="Oconfiguracionalmacen.Descripcion" />
                        </td>
                    </tr>
                </table>


            </td>


        </tr>

        <tr>
            <td colspan="2" class="cuadro">
                <h3>Cuerpo</h3>


                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Existencias:"/>
                            <s:hidden name="Oconfiguracionalmacen.CuentaExistencias.idCuenta" />
                            <s:textfield name="Oconfiguracionalmacen.CuentaExistencias.Codigo" onclick="AbrirCuenta(1); return false;"/>
                            <s:textfield name="Oconfiguracionalmacen.CuentaExistencias.Descripcion" onclick="AbrirCuenta(1); return false;"/>
                        </td>
                        <td>
                            <s:label value="Compras:"/>
                            <s:hidden name="Oconfiguracionalmacen.CuentaCompras.idCuenta" />
                            <s:textfield name="Oconfiguracionalmacen.CuentaCompras.Codigo" onclick="AbrirCuenta(2); return false;"/>
                            <s:textfield name="Oconfiguracionalmacen.CuentaCompras.Descripcion" onclick="AbrirCuenta(2); return false;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Variacion de existencias:"/>
                            <s:hidden name="Oconfiguracionalmacen.CuentaVariacionExistencias.idCuenta" />
                            <s:textfield name="Oconfiguracionalmacen.CuentaVariacionExistencias.Codigo" onclick="AbrirCuenta(3); return false;"/>
                            <s:textfield name="Oconfiguracionalmacen.CuentaVariacionExistencias.Descripcion" onclick="AbrirCuenta(3); return false;"/>
                        </td>
                        <td>
                            <s:label value="Transferencia:"/>
                            <s:hidden name="Oconfiguracionalmacen.CuentaTransferencia.idCuenta" />
                            <s:textfield name="Oconfiguracionalmacen.CuentaTransferencia.Codigo" onclick="AbrirCuenta(4); return false;"/>
                            <s:textfield name="Oconfiguracionalmacen.CuentaTransferencia.Descripcion" onclick="AbrirCuenta(4); return false;"/>
                        </td>
                    </tr>
                </table>


            </td>


        </tr>
        <tr>
            <td colspan="2" class="cuadro">
                <h3>Cuentas</h3>


                <table style="width: 100%;">
                    <tr>
                        <td>
                            <s:label value="Producto en proceso:"/>
                            <s:hidden name="Oconfiguracionalmacen.CuentaProducto.idCuenta" />
                            <s:textfield name="Oconfiguracionalmacen.CuentaProducto.Codigo" onclick="AbrirCuenta(5); return false;"/>
                            <s:textfield name="Oconfiguracionalmacen.CuentaProducto.Descripcion" onclick="AbrirCuenta(5); return false;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Variacion de producto en proceso:"/>
                            <s:hidden name="Oconfiguracionalmacen.CuentaVariacionProducto.idCuenta" />
                            <s:textfield name="Oconfiguracionalmacen.CuentaVariacionProducto.Codigo" onclick="AbrirCuenta(6); return false;"/>
                            <s:textfield name="Oconfiguracionalmacen.CuentaVariacionProducto.Descripcion" onclick="AbrirCuenta(6); return false;"/>
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

        <div id="divListaDetalleConfiguracionAlmacen">
            <jsp:include page="Auxiliar/ListaDetalleConfiguracionAlmacen.jsp" />
        </div>
        
    </div>

    <div id="tabs-2">



    </div>

</div>



<!------------------------------------------------------------------------------------------------------------------>


<div id="divBuscarConfiguracionAlmacen" style="display: none;" title="Buscar ConfiguracionAlmacen">
    <s:form id="formBuscarConfiguracionAlmacen">

        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Oconfiguracionalmacen.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarConfiguracionAlmacen(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarConfiguracionAlmacen(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaConfiguracionAlmacen">
        <div id="divListaConfiguracionAlmacen">
            <jsp:include page="Auxiliar/ListaConfiguracionAlmacen.jsp" />
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaConfiguracionAlmacen'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaConfiguracionAlmacen'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaConfiguracionAlmacen'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaConfiguracionAlmacen'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>


<div id="divBuscarCuenta" style="display: none;" title="Buscar Cuenta">
    <s:form id="formBuscarCuenta">
        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Ocuenta.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarCuenta(); return false; }"/></td>
            </tr>
            <tr>
                <td>Codigo:</td>
                <td><s:textfield name="Ocuenta.Codigo" onkeypress="if(event.keyCode == 13){ BuscarCuenta(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarCuenta(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaCuenta">
        <div id="divListaCuenta">
            <jsp:include page="../Contabilidad/Auxiliar/ListaCuenta.jsp" />
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
</div>

<div id="divBuscarFamilia" style="display: none;" title="Buscar Familia">
    <s:form id="formBuscarFamilia">
        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Ofamilia.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarFamilia(); return false; }"/></td>
            </tr>
            <tr>
                <td>Codigo:</td>
                <td><s:textfield name="Ofamilia.Codigo" onkeypress="if(event.keyCode == 13){ BuscarFamilia(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarFamilia(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaFamilia">
        <div id="divListaFamilia">
            <jsp:include page="../Produccion/Auxiliar/ListaFamilia.jsp" />
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaFamilia'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaFamilia'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaFamilia'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaFamilia'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>


<div id="divAgregarDetalleConfiguracionAlmacen" title="Agregar Detalle de Factura" style="display: none;">

    <form id="formAgregarDetalleConfiguracionAlmacen" theme="simple">
        <s:hidden name="Odetalleconfiguracionalmacen.idDetalleConfiguracionAlmacen"/>
        <s:label value="Centro de costo:"/>
        <s:hidden name="Odetalleconfiguracionalmacen.CentroCosto.idCentroCosto"/>
        <s:hidden name="Odetalleconfiguracionalmacen.CentroCosto.Codigo"/>
        <s:textfield name="Odetalleconfiguracionalmacen.CentroCosto.Descripcion" onclick="AbrirCentroCosto();" cssClass="validate[required]"/>
        <s:label value="Cuenta:"/>
        <s:hidden name="Odetalleconfiguracionalmacen.Cuenta.idCuenta" />
        <s:hidden name="Odetalleconfiguracionalmacen.Cuenta.Codigo" />
        <s:textfield name="Odetalleconfiguracionalmacen.Cuenta.Descripcion" onclick="AbrirCuenta(7);" cssClass="validate[required]"/>
    </form>

</div>
            

<div id="divBuscarCentroCosto" style="display: none;" title="Buscar CentroCosto">
    <s:form id="formBuscarCentroCosto">
        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Ocentrocosto.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarCentroCosto(); return false; }"/></td>
            </tr>
            <tr>
                <td>Codigo:</td>
                <td><s:textfield name="Ocentrocosto.Codigo" onkeypress="if(event.keyCode == 13){ BuscarCentroCosto(); return false; }"/></td>
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


