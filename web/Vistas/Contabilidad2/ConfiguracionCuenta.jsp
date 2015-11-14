<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnConfiguracionCuenta').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoConfiguracionCuenta").validationEngine();
        
        
    });
    
    
    function ObtenerTipoCambio() {
        var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoConfiguracionCuenta [name='Oconfiguracioncuenta.Fecha']").val(), "Otipocambio.idMonedaCobra": $("#formNuevoConfiguracionCuenta [name='Oconfiguracioncuenta.Moneda.idMoneda']").val(), "Otipocambio.idMonedaPago": 0};
        $.getJSON(url, data, function(resultado) {
            $("#formNuevoConfiguracionCuenta [name='Oconfiguracioncuenta.TipoCambio']").val(resultado.valor);
        });
    }
    
    
    function Nuevo(){
        $("#formNuevoConfiguracionCuenta [name='Operacion']").val('Nuevo');
    }
    function NuevoBlanco(){
        var url = "LoadConfiguracionCuenta";
        var data = {"Oconfiguracioncuenta.idConfiguracionCuenta": 0, "Operacion":"Nuevo"};
        $('body').load(url, data);
    }
function GrabarConfiguracionCuenta(){
    if($("#formNuevoConfiguracionCuenta").validationEngine('validate')){
        var url = "GrabarConfiguracionCuenta";
        var data = $("#formNuevoConfiguracionCuenta").serialize();
        $.getJSON(url,data, function(resultado){
            if (resultado.error) {
                Error(resultado.msg);
            }
            else{
                var ConfiguracionCuenta = resultado.oconfiguracioncuenta;
                var datos = {"Oconfiguracioncuenta.idConfiguracionCuenta":ConfiguracionCuenta.idConfiguracionCuenta , "Operacion":'Edicion', "msg":resultado.msg};
                var url = "LoadConfiguracionCuenta";
                $("body").load(url, datos);
            }
        });
    }
}
    
function AbrirConfiguracionCuenta(){
    $("#divBuscarConfiguracionCuenta").dialog({
        width: 'auto'
    });
}
function BuscarConfiguracionCuenta(){
    var url = "BuscarConfiguracionCuenta";
    var data = $("#formBuscarConfiguracionCuenta").serialize();
    $.get(url, data, function(resultado){
        $("#divListaConfiguracionCuenta").html(resultado);
        IniciarPagina('pagListaConfiguracionCuenta');
    });
}
function EnviarConfiguracionCuenta(idConfiguracionCuenta){
    var url = "LoadConfiguracionCuenta";
    var data = {"Oconfiguracioncuenta.idConfiguracionCuenta":idConfiguracionCuenta};
    $('body').load(url,data);
}
    
function CambiarANuevo(){
    $("#formNuevoConfiguracionCuenta [name='Operacion']").val('Nuevo');
}
    
function NuevoConfiguracionCuenta(){
    var url = "LoadConfiguracionCuenta";
    var data = {"Oconfiguracioncuenta.idConfiguracionCuenta":0, "Operacion":"Nuevo"};
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
        $("[name='Oconfiguracioncuenta.Cuenta.idCuenta']").val(idCuenta);
        $("[name='Oconfiguracioncuenta.Cuenta.Codigo']").val(codigo);
    }
    if (tipocuenta == 2){
        $("[name='Oconfiguracioncuenta.Cargo.idCuenta']").val(idCuenta);
        $("[name='Oconfiguracioncuenta.Cargo.Descripcion']").val(descripcion);
        $("[name='Oconfiguracioncuenta.Cargo.Codigo']").val(codigo);
    }
    if (tipocuenta == 3){
        $("[name='Oconfiguracioncuenta.Abono.idCuenta']").val(idCuenta);
        $("[name='Oconfiguracioncuenta.Abono.Descripcion']").val(descripcion);
        $("[name='Oconfiguracioncuenta.Abono.Codigo']").val(codigo);
    }
        
    $("#divBuscarCuenta").dialog("close");
}
    
</script>


<jsp:include page="Menu.jsp" />
<br/>


<s:hidden id="tipocuenta"/>

<s:form id="formNuevoConfiguracionCuenta" theme="simple">
    <s:hidden name="Oconfiguracioncuenta.idConfiguracionCuenta"/>




    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="xxxxx();
                return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarConfiguracionCuenta();
                return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirConfiguracionCuenta();
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
                            <s:textfield name="Oconfiguracioncuenta.Numero" readonly="true" cssStyle="font-weight: bold;"/>
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
                            <s:hidden name="Oconfiguracioncuenta.Cuenta.idCuenta" />
                            <s:textfield name="Oconfiguracioncuenta.Cuenta.Codigo" onclick="AbrirCuenta(1); return false;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Descripcion:"/>
                            <s:textfield name="Oconfiguracioncuenta.Descripcion" />
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
                            <s:label value="Tipo Configuracion:"/>
                            <s:select name="Oconfiguracioncuenta.idTipoConfiguracionCuenta" list="ListaTipoConfiguracionCuenta" listKey="idTipoConfiguracionCuenta" listValue="Descripcion"/>
                        </td>
                        <td>
                            <s:label value="Exige centro de costo:"/>
                            <s:checkbox name="Oconfiguracioncuenta.ExigeCC" />
                        </td>
                        <td>
                            <s:label value="Clase:"/>
                            <s:select name="Oconfiguracioncuenta.idClase" list="ListaClase" listKey="idClase" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Naturaleza de la cuenta:"/>
                            <s:select name="Oconfiguracioncuenta.idNaturaleza" list="ListaNaturaleza" listKey="idNaturaleza" listValue="Descripcion" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Moneda:"/>
                            <s:select name="Oconfiguracioncuenta.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Tipo de auxiliar:"/>
                            <s:select name="Oconfiguracioncuenta.idTipoAuxiliar" list="ListaTipoAuxiliar" listKey="idTipoAuxiliar" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Ajuste diferencia de cambio:"/>
                            <s:select name="Oconfiguracioncuenta.idAjuste" list="ListaAjuste" listKey="idAjuste" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Tipo de Cambio:"/>
                            <s:select name="Oconfiguracioncuenta.idTipoCambioCuenta" list="ListaTipoCambioCuenta" listKey="idTipoCambioCuenta" listValue="Descripcion" />
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
                            <s:label value="Cuenta cargo:"/>
                            <s:hidden name="Oconfiguracioncuenta.Cargo.idCuenta" />
                            <s:textfield name="Oconfiguracioncuenta.Cargo.Codigo" onclick="AbrirCuenta(2); return false;"/>
                            <s:textfield name="Oconfiguracioncuenta.Cargo.Descripcion" onclick="AbrirCuenta(2); return false;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Cuenta abono:"/>
                            <s:hidden name="Oconfiguracioncuenta.Abono.idCuenta" />
                            <s:textfield name="Oconfiguracioncuenta.Abono.Codigo" onclick="AbrirCuenta(3); return false;"/>
                            <s:textfield name="Oconfiguracioncuenta.Abono.Descripcion" onclick="AbrirCuenta(3); return false;"/>
                        </td>
                    </tr>
                </table>


            </td>
        </tr>


    </table>




</s:form>



<!-- divs flotantes-------------------------------------------------------------------------------------- -->


<div id="divBuscarConfiguracionCuenta" style="display: none;" title="Buscar ConfiguracionCuenta">
    <s:form id="formBuscarConfiguracionCuenta">

        <table>
            <tr>
                <td>Numero:</td>
                <td><s:textfield name="Oconfiguracioncuenta.Numero" onkeypress="if(event.keyCode == 13){ BuscarConfiguracionCuenta(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarConfiguracionCuenta(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaConfiguracionCuenta">
        <div id="divListaConfiguracionCuenta">
            <jsp:include page="Auxiliar/ListaConfiguracionCuenta.jsp" />
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaConfiguracionCuenta'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaConfiguracionCuenta'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaConfiguracionCuenta'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaConfiguracionCuenta'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
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



<jsp:include page="../MasterPage/Inferior.jsp" />


