<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">

    $(document).ready(function() {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnAsiento').addClass('activo');
        $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
        jQuery("#formNuevoAsiento").validationEngine();
        $( "#tabs" ).tabs();
        
        
    });
    function ObtenerTipoCambio() {
       var url = "OtenerTipoCambioPorFecha";
        var data = {"Otipocambio.Fecha": $("#formNuevoAsiento [name='Oasiento.Fecha']").val(), "Otipocambio.idMonedaCobra": $("#formNuevoAsiento [name='Oasiento.Moneda.idMoneda']").val(), "Otipocambio.idMonedaPago": 0};
        $.getJSON(url, data, function(resultado) {
            $("#formNuevoAsiento [name='Oasiento.TipoCambio']").val(resultado.valor);
        });
    }
    
    
    function Nuevo(){
        $("#formNuevoAsiento [name='Operacion']").val('Nuevo');
    }
    function NuevoBlanco(){
        var url = "LoadAsiento";
        var data = {"Oasiento.idAsiento": 0, "Operacion":"Nuevo"};
        $('body').load(url, data);
    }
    function GrabarAsiento(){
        if($("#formNuevoAsiento").validationEngine('validate')){
            var url = "GrabarAsiento";
            var data = $("#formNuevoAsiento").serialize();
            $.getJSON(url,data, function(resultado){
                if (resultado.error) {
                    Error(resultado.msg);
                }
                else{
                    var Asiento = resultado.oasiento;
                    var datos = {"Oasiento.idAsiento":Asiento.idAsiento , "Operacion":'Edicion', "msg":resultado.msg};
                    var url = "LoadAsiento";
                    $("body").load(url, datos);
                }
            });
        }
    }
    
    function AbrirAsiento(){
        $("#divBuscarAsiento").dialog({
            width: 'auto'
        });
    }
    function BuscarAsiento(){
        var url = "BuscarAsiento";
        var data = $("#formBuscarAsiento").serialize();
        $.get(url, data, function(resultado){
            $("#divListaAsiento").html(resultado);
            IniciarPagina('pagListaAsiento');
        });
    }
    function EnviarAsiento(idAsiento){
        var url = "LoadAsiento";
        var data = {"Oasiento.idAsiento":idAsiento};
        $('body').load(url,data);
    }
    
    function CambiarANuevo(){
        $("#formNuevoAsiento [name='Operacion']").val('Nuevo');
    }
    
    function NuevoAsiento(){
        var url = "LoadAsiento";
        var data = {"Oasiento.idAsiento":0, "Operacion":"Nuevo"};
        $('body').load(url,data);
    }
    
    function AgregarDetalleAsiento() {
        limpiaForm($("#formAgregarDetalleAsiento"));
        $("#divAgregarDetalleAsiento").dialog({
            width: 'auto',
            modal: true,
            buttons: {
                "Agregar": function () {
                    var url = "AgregarDetalleAsiento";
                    var data = $("#formAgregarDetalleAsiento").serialize();
                    $.get(url, data, function (resultado) {
                        $("#divListaDetalleAsiento").html(resultado);
                        IniciarPagina('pagListaDetalleAsiento');
                    });
                    limpiaForm($("#formAgregarDetalleAsiento"));
                },
                "Cancelar": function () {
                    $(this).dialog("close");
                }
            }
        });
    }
    function QuitarDetalleAsiento(index) {

        var url = "QuitarDetalleAsiento";
        var data ={ "index":index};
        $.get(url, data, function(resultado){
            $("#divListaDetalleAsiento").html(resultado);
            IniciarPagina('pagListaDetalleAsiento');
        });
         
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
       
        $("#formAgregarDetalleAsiento [name='Odetalleasiento.Cuenta.idCuenta']").val(idCuenta);
        $("#formAgregarDetalleAsiento [name='Odetalleasiento.Cuenta.Descripcion']").val(descripcion);
        $("#formAgregarDetalleAsiento [name='Odetalleasiento.Cuenta.Codigo']").val(codigo);
        
        $("#divBuscarCuenta").dialog("close");
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
        $("[name='Odetalleasiento.CentroCosto.idCentroCosto']").val(idCentroCosto);
        $("[name='Odetalleasiento.CentroCosto.Descripcion']").val(descripcion);
        $("[name='Odetalleasiento.CentroCosto.Codigo']").val(codigo);
        $("#divBuscarCentroCosto").dialog("close");
    }
</script>


<jsp:include page="Menu.jsp" />
<br/>




<s:form id="formNuevoAsiento" theme="simple">
    <s:hidden name="Oasiento.idAsiento"/>




    <table style="width: 80%;border:1px solid #666666;" border="1">    

        <tr>
            <td style="width: 50%;">
                <a href="#" onclick="AgregarDetalleAsiento();
                   return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="GrabarAsiento();
                       return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="AbrirAsiento();
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
                            <s:textfield name="Oasiento.Numero" readonly="true" cssStyle="font-weight: bold;"/>
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
                            <s:textfield name="Oasiento.Periodo" />
                        </td>
                        <td>
                            <s:label value="Subdiario:"/>
                            <s:select name="Oasiento.Subdiario.idSubdiario" list="ListaSubdiario" listKey="idSubdiario" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Fecha:"/>
                            <s:textfield name="Oasiento.Fecha" cssClass="datepicker"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label value="Sucursal:"/>
                            <s:select name="Oasiento.Sucursal.idSucursal" list="ListaSucursal" listKey="idSucursal" listValue="Descripcion" />
                        </td>
                        <td>
                            <s:label value="Moneda:"/>
                            <s:select name="Oasiento.Moneda.idMoneda" list="ListaMoneda" listKey="idMoneda" listValue="Descripcion" onchange="ObtenerTipoCambio(); return false;"/>
                        </td>
                        <td>
                            <s:label value="Tipo Cambio:"/>
                            <s:textfield name="Oasiento.TipoCambio" />
                        </td>

                    </tr>
                </table>
 
            </td>


        </tr>

        <tr>
            <td colspan="2" class="cuadro">
                <h3>Otros Datos</h3>


                <s:label value="Glosa:"/>
                <s:textarea name="Oasiento.Glosa" cols="120" cssClass="validate[required]"/>

            </td>


        </tr>
        <tr style="min-height: 100px;">
            <td colspan="2" ></td>
        </tr>


    </table>




</s:form>


<div id="tabs" style="width: 80%;">
    <ul style="height: 40px;">
        <li><a href="#tabs-1">Detalle del Documento</a></li>
        <li><a href="#tabs-2">Historial</a></li>
    </ul>
    <div id="tabs-1">


                <div id="pagListaDetalleAsiento">
            <div id="divListaDetalleAsiento">

                <table class="tabla">    
                    <thead>
                    <th>Cuenta</th>
                    <th>Centro de costo</th>
                    <th>Descripcion CC</th>
                    <th>Cargo MN</th>
                    <th>Abono MN</th>
                    <th>Cargo ME</th>
                    <th>Abono ME</th>
                    <th>Quitar</th>
                    </thead>
                    <tbody>
                        <s:iterator value="ListaDetalleAsiento" status="row">
                            <tr>
                                <td><s:property value="Cuenta.Descripcion"/></td>
                                <td><s:property value="CentroCosto.Codigo"/></td>
                                <td><s:property value="CentroCosto.Descripcion"/></td>
                                <td><s:property value="CargoMN"/></td>
                                <td><s:property value="AbonoMN"/></td>
                                <td><s:property value="CargoME"/></td>
                                <td><s:property value="AbonoME"/></td>
                                       <td><a href="#" onclick="QuitarDetalleAsiento(<s:property value="%{#row.index}"/>);
                                           return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>

            </div>
            <table>
                <tr>
                       <td><a href="#" onclick="toleft('pagListaDetalleAsiento');
                           return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                           <td><a href="#" onclick="left('pagListaDetalleAsiento');
                               return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                    <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                           <td><a href="#" onclick="rigth('pagListaDetalleAsiento');
                               return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                           <td><a href="#" onclick="torigth('pagListaDetalleAsiento');
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



<!-- divs flotantes-------------------------------------------------------------------------------------- -->


<div id="divBuscarAsiento" style="display: none;" title="Buscar Asiento">
    <s:form id="formBuscarAsiento">

        <table>
            <tr>
                <td>Numero:</td>
                <td><s:textfield name="Oasiento.Numero" onkeypress="if(event.keyCode == 13){ BuscarAsiento(); return false; }"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="#" onclick="BuscarAsiento(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
                </td>
            </tr>
        </table>
    </s:form>
    <div id="pagListaAsiento">
        <div id="divListaAsiento">
            <jsp:include page="Auxiliar/ListaAsiento.jsp" />
        </div>
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaAsiento'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaAsiento'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaAsiento'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaAsiento'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</div>



<div id="divAgregarDetalleAsiento" title="Agregar Detalle de Asiento" style="display: none;">

    <form id="formAgregarDetalleAsiento" theme="simple">
        <s:hidden name="Odetalleasiento.Cuenta.idCuenta"/>
        <s:hidden name="Odetalleasiento.Cuenta.Codigo"/>
        <s:label value="Cuenta"/>
        <s:textfield name="Odetalleasiento.Cuenta.Descripcion" paso="1" onclick="AbrirCuenta();" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:hidden name="Odetalleasiento.CentroCosto.idCentroCosto"/>
        <s:hidden name="Odetalleasiento.CentroCosto.Codigo"/>
        <s:label value="CentroCosto"/>
        <s:textfield name="Odetalleasiento.CentroCosto.Descripcion" paso="2" onclick="AbrirCentroCosto();" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="CargoMN"/>
        <s:textfield name="Odetalleasiento.CargoMN" paso="3" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="AbonoMN"/>
        <s:textfield name="Odetalleasiento.AbonoMN" paso="4" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="CargoME"/>
        <s:textfield name="Odetalleasiento.CargoME" paso="5" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="AbonoME"/>
        <s:textfield name="Odetalleasiento.AbonoME" paso="6" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Glosa"/>
        <s:textfield name="Odetalleasiento.Glosa" paso="7" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
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


