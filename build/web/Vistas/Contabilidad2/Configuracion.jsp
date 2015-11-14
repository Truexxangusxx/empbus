<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnConfiguracion').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoConfiguracion").validationEngine();
        $( "#tabs" ).tabs();
        
    });
    
    
    function ObtenerTipoCambio() {
        var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoConfiguracion [name='Oconfiguracion.Fecha']").val(), "Otipocambio.idMonedaCobra": $("#formNuevoConfiguracion [name='Oconfiguracion.Moneda.idMoneda']").val(), "Otipocambio.idMonedaPago": 0};
        $.getJSON(url, data, function(resultado) {
            $("#formNuevoConfiguracion [name='Oconfiguracion.TipoCambio']").val(resultado.valor);
        });
    }
    
    function Nuevo(){
        $("#formNuevoConfiguracion [name='Operacion']").val('Nuevo');
    }
    function NuevoBlanco(){
        var url = "LoadConfiguracion";
        var data = {"Oconfiguracion.idConfiguracion": 0, "Operacion":"Nuevo"};
        $('body').load(url, data);
    }
    function GrabarConfiguracion(){
        if($("#formNuevoConfiguracion").validationEngine('validate')){
            var url = "GrabarConfiguracion";
            var data = $("#formNuevoConfiguracion").serialize();
            $.getJSON(url,data, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    var Configuracion = resultado.oconfiguracion;
                    var datos = {"Oconfiguracion.idConfiguracion":Configuracion.idConfiguracion , "Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadConfiguracion";
                    $("body").load(url, datos);
                }
            });
        }
    }
    
    function AbrirConfiguracion(){
        $("#divBuscarConfiguracion").dialog({
            width: 'auto'
        });
    }
    function BuscarConfiguracion(){
        var url = "BuscarConfiguracion";
        var data = $("#formBuscarConfiguracion").serialize();
        $.get(url, data, function(resultado){
            $("#divListaConfiguracion").html(resultado);
            IniciarPagina('pagListaConfiguracion');
        });
    }
    function EnviarConfiguracion(idConfiguracion){
        var url = "LoadConfiguracion";
        var data = {"Oconfiguracion.idConfiguracion":idConfiguracion};
        $('body').load(url,data);
    }
    
    function CambiarANuevo(){
        $("#formNuevoConfiguracion [name='Operacion']").val('Nuevo');
    }
    
    function NuevoConfiguracion(){
        var url = "LoadConfiguracion";
        var data = {"Oconfiguracion.idConfiguracion":0, "Operacion":"Nuevo"};
        $('body').load(url,data);
    }
    
    function AbrirCuenta(){
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
       
        $("#formAgregarDetalleConfiguracion [name='Odetalleconfiguracion.Cuenta.idCuenta']").val(idCuenta);
        $("#formAgregarDetalleConfiguracion [name='Odetalleconfiguracion.Cuenta.Descripcion']").val(descripcion);
        $("#formAgregarDetalleConfiguracion [name='Odetalleconfiguracion.Cuenta.Codigo']").val(codigo);
        
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
        $("[name='Oconfiguracion.Familia.idFamilia']").val(idFamilia);
        $("[name='Oconfiguracion.Familia.Codigo']").val(codigo);
        
        $("#divBuscarFamilia").dialog("close");
    }
    
    function AbrirSubdiario(tipocuenta){
        $("#tipocuenta").val(tipocuenta);
        $("#divBuscarSubdiario").dialog({
            width: 'auto'
        });
    }
    function BuscarSubdiario(){
        var url = "BuscarSubdiario";
        var data = $("#formBuscarSubdiario").serialize();
        $.get(url, data, function(resultado){
            $("#divListaSubdiario").html(resultado);
            IniciarPagina('pagListaSubdiario');
        });
    }
    function EnviarSubdiario(idSubdiario,descripcion,codigo){
        $("[name='Oconfiguracion.Subdiario.idSubdiario']").val(idSubdiario);
        $("[name='Oconfiguracion.Subdiario.Descripcion']").val(descripcion);
        
        $("#divBuscarSubdiario").dialog("close");
    }
    
    function AgregarDetalleConfiguracion(tipo) {
        limpiaForm($("#formAgregarDetalleConfiguracion"));
        $("#divAgregarDetalleConfiguracion").dialog({
            width: 'auto',
            modal: true,
            buttons: {
                "Agregar": function() {
                    if (tipo == 1){
                        var url = "AgregarDetalleConfiguracionCargo";
                        var data = $("#formAgregarDetalleConfiguracion").serialize();
                        $.get(url, data, function(resultado){
                            $("#divListaDetalleConfiguracionCargo").html(resultado);
                            IniciarPagina('pagListaDetalleConfiguracionCargo');
                        });
                        limpiaForm($("#formAgregarDetalleConfiguracionCargo"));
                    }
                    else{
                        if (tipo == 2){
                            var url = "AgregarDetalleConfiguracionAbono";
                            var data = $("#formAgregarDetalleConfiguracion").serialize();
                            $.get(url, data, function(resultado){
                                $("#divListaDetalleConfiguracionAbono").html(resultado);
                                IniciarPagina('pagListaDetalleConfiguracionAbono');
                            });
                            limpiaForm($("#formAgregarDetalleConfiguracionAbono"));
                        }
                    }
                    
                    
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function QuitarDetalleConfiguracionCargo(index) {

        var url = "QuitarDetalleConfiguracionCargo";
        var data ={ "index":index};
        $.get(url, data, function(resultado){
            $("#divListaDetalleConfiguracionCargo").html(resultado);
            IniciarPagina('pagListaDetalleConfiguracionCargo');
        });
         
    }
    function QuitarDetalleConfiguracionAbono(index) {

        var url = "QuitarDetalleConfiguracionAbono";
        var data ={ "index":index};
        $.get(url, data, function(resultado){
            $("#divListaDetalleConfiguracionAbono").html(resultado);
            IniciarPagina('pagListaDetalleConfiguracionAbono');
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
        $("[name='Odetalleconfiguracion.CentroCosto.idCentroCosto']").val(idCentroCosto);
        $("[name='Odetalleconfiguracion.CentroCosto.Descripcion']").val(descripcion);
        $("[name='Odetalleconfiguracion.CentroCosto.Codigo']").val(codigo);
        $("#divBuscarCentroCosto").dialog("close");
    }
    
</script>


<jsp:include page="Menu.jsp" />
<br/>

<s:hidden id="tipocuenta"/>


<s:form id="formNuevoConfiguracion" theme="simple">
    <s:hidden name="Oconfiguracion.idConfiguracion"/>




    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarDetalleConfiguracion();
                    return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarConfiguracion();
                    return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirConfiguracion();
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
                            <s:textfield name="Oconfiguracion.Numero" readonly="true" cssStyle="font-weight: bold;"/>
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
                            <s:label value="Familia:"/>
                            <s:hidden name="Oconfiguracion.Familia.idFamilia" />
                            <s:textfield name="Oconfiguracion.Familia.Codigo" onclick="AbrirFamilia(); return false;"/>
                        </td>
                        <td>
                            <s:label value="Subdiario:"/>
                            <s:hidden name="Oconfiguracion.Subdiario.idSubdiario" />
                            <s:textfield name="Oconfiguracion.Subdiario.Descripcion" onclick="AbrirSubdiario(); return false;"/>
                        </td>
                        <td>
                            <s:label value="Descripcion:"/>
                            <s:textfield name="Oconfiguracion.Descripcion" />
                        </td>
                    </tr>
                </table>


            </td>


        </tr>

        <tr>
            <td colspan="2" class="cuadro">
                <h3>Detalle</h3>


                <table style="width: 100%;" border="1">
                    <tr>
                        <td colspan="2" class="cuadro">
                            <h3>Cuentas cargo</h3>
                            <br/>
                               <a href="#" onclick="AgregarDetalleConfiguracion(1);
                                   return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>


                            <div id="pagListaDetalleConfiguracionCargo">
                                <div id="divListaDetalleConfiguracionCargo">
                                    <jsp:include page="Auxiliar/ListaDetalleConfiguracionCargo.jsp" />
                                </div>
                                <table>
                                    <tr>
                                        <td><a href="#" onclick="toleft('pagListaDetalleConfiguracionCargo'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                                        <td><a href="#" onclick="left('pagListaDetalleConfiguracionCargo'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                                        <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                                        <td><a href="#" onclick="rigth('pagListaDetalleConfiguracionCargo'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                                        <td><a href="#" onclick="torigth('pagListaDetalleConfiguracionCargo'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
                                    </tr>
                                </table>
                                <input type="hidden" class="count" />
                                <input type="hidden" class="number" value="10" />
                            </div>


                        </td>
                        <td colspan="2" class="cuadro">
                            <h3>Cuentas abono</h3>
                            <br/>
                               <a href="#" onclick="AgregarDetalleConfiguracion(2);
                                   return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>


                            <div id="pagListaDetalleConfiguracionAbono">
                                <div id="divListaDetalleConfiguracionAbono">
                                    <jsp:include page="Auxiliar/ListaDetalleConfiguracionAbono.jsp" />
                                </div>
                                <table>
                                    <tr>
                                        <td><a href="#" onclick="toleft('pagListaDetalleConfiguracionAbono'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                                        <td><a href="#" onclick="left('pagListaDetalleConfiguracionAbono'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                                        <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                                        <td><a href="#" onclick="rigth('pagListaDetalleConfiguracionAbono'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                                        <td><a href="#" onclick="torigth('pagListaDetalleConfiguracionAbono'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
                                    </tr>
                                </table>
                                <input type="hidden" class="count" />
                                <input type="hidden" class="number" value="10" />
                            </div>


                        </td>
                    </tr>
                </table>



            </td>


        </tr>



    </table>




</s:form>






<!------------------------------------------------------------------------------------------------------------------>


<div id="divBuscarConfiguracion" style="display: none;" title="Buscar Configuracion">
    <s:form id="formBuscarConfiguracion">

        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Oconfiguracion.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarConfiguracion(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarConfiguracion(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaConfiguracion">
        <div id="divListaConfiguracion">
            <jsp:include page="Auxiliar/ListaConfiguracion.jsp" />
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaConfiguracion'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaConfiguracion'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaConfiguracion'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaConfiguracion'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
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


<div id="divBuscarSubdiario" style="display: none;" title="Buscar Subdiario">
    <s:form id="formBuscarSubdiario">
        <table>
            <tr>
                <td>Descripcion:</td>
                <td><s:textfield name="Osubdiario.Descripcion" onkeypress="if(event.keyCode == 13){ BuscarSubdiario(); return false; }"/></td>
            </tr>
            <tr>
                <td>Codigo:</td>
                <td><s:textfield name="Osubdiario.Codigo" onkeypress="if(event.keyCode == 13){ BuscarSubdiario(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarSubdiario(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaSubdiario">
        <div id="divListaSubdiario">
            <jsp:include page="../Contabilidad/Auxiliar/ListaSubdiario.jsp" />
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaSubdiario'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>        



<div id="divAgregarDetalleConfiguracion" title="Agregar Detalle de Factura" style="display: none;">

    <form id="formAgregarDetalleConfiguracion" theme="simple">
        <s:hidden name="Odetalleconfiguracion.idDetalleConfiguracion"/>
        <s:label value="Centro de costo:"/>
        <s:hidden name="Odetalleconfiguracion.CentroCosto.idCentroCosto"/>
        <s:hidden name="Odetalleconfiguracion.CentroCosto.Codigo"/>
        <s:textfield name="Odetalleconfiguracion.CentroCosto.Descripcion" onclick="AbrirCentroCosto();" cssClass="validate[required]"/>
        <s:label value="Cuenta:"/>
        <s:hidden name="Odetalleconfiguracion.Cuenta.idCuenta" />
        <s:hidden name="Odetalleconfiguracion.Cuenta.Codigo" />
        <s:textfield name="Odetalleconfiguracion.Cuenta.Descripcion" onclick="AbrirCuenta();" cssClass="validate[required]"/>
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


