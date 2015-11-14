<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">

    $(document).ready(function () {
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnFamilia').addClass('activo');
        IniciarPagina('pagListaFamilia');

        $("#formNuevoFamilia").validationEngine();
        $("#formEditarFamilia").validationEngine();
    });

    function GrabarFamilia() {
        $("#divNuevoFamilia").dialog({
            height: 'auto',
            modal: true,
            autoOpen: true,
            buttons: {
                "Continuar": function () {
                    if ($("#formNuevoFamilia").validationEngine('validate')) {
                        var url = "GrabarFamilia";
                        var data = $("#formNuevoFamilia").serialize();
                        $.getJSON(url, data, function (resultado) {
                            if (resultado.error == false) {
                                $.get("BuscarFamilia?Ofamilia.Descripcion=", function (resultado) {
                                    $("#divListaFamilia").html(resultado);
                                    IniciarPagina('pagListaFamilia');
                                });
                                Mensaje(resultado.msg);
                            }
                            else {
                                Error(resultado.msg);
                            }
                            $("#divNuevoFamilia").dialog("close")
                        })
                    }
                },
                "Cancelar": function () {
                    $(this).dialog("close");
                }
            },
            close: function (event, ui) {
                $(".formError").remove()
            }
        });
    }
    function BuscarFamilia() {
        var url = "BuscarFamilia";
        var data = $("#formBuscarFamilia").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaFamilia").html(resultado);
            IniciarPagina('pagListaFamilia');
        });
    }
    function EliminarFamilia(idFamilia) {
        $("#divEliminarFamilia").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function () {
                    var url = "EliminarFamilia?Ofamilia.idFamilia=" + idFamilia;
                    $.getJSON(url, function (resultado) {
                        if (resultado.error == false) {
                            $.get("BuscarFamilia?Ofamilia.Descripcion=", function (resultado) {
                                $("#divListaFamilia").html(resultado);
                                IniciarPagina('pagListaFamilia');
                            });
                            Mensaje(resultado.msg);
                        }
                        else {
                            Error(resultado.msg);
                        }
                        $("#divEliminarFamilia").dialog("close")
                    })
                },
                "Cancelar": function () {
                    $(this).dialog("close");
                }
            }
        });
    }
    function EditarFamilia(idFamilia, idCuenta, DCuenta, Descripcion, Codigo) {
        $("#formEditarFamilia input[name='Ofamilia.idFamilia']").val(idFamilia);
        $("#formEditarFamilia input[name='Ofamilia.idCuenta']").val(idCuenta);
        $("#formEditarFamilia input[name='Ofamilia.DCuenta']").val(DCuenta);
        $("#formEditarFamilia input[name='Ofamilia.Descripcion']").val(Descripcion);
        $("#formEditarFamilia input[name='Ofamilia.Codigo']").val(Codigo);

        $("#divEditarFamilia").dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function () {
                    if ($("#formEditarFamilia").validationEngine('validate')) {
                        var url = "EditarFamilia";
                        var data = $("#formEditarFamilia").serialize();
                        $.getJSON(url, data, function (resultado) {
                            if (resultado.error == false) {
                                $.get("BuscarFamilia?Ofamilia.Descripcion=", function (resultado) {
                                    $("#divListaFamilia").html(resultado);
                                    IniciarPagina('pagListaFamilia');
                                });
                                Mensaje(resultado.msg);
                            }
                            else {
                                Error(resultado.msg);
                            }
                            $("#divEditarFamilia").dialog("close")
                        })
                    }
                },
                "Cancelar": function () {
                    $(this).dialog("close");
                }
            },
            close: function (event, ui) {
                $(".formError").remove()
            }
        });
    }

    function AbrirBuscarCuenta() {
        $("#divBuscarCuenta").dialog({
            height: 'auto',
            width: 'auto',
            modal: true
        });
    }

    function BuscarCuenta() {
        var url = "BuscarCuenta";
        var data = $("#formBuscarCuenta").serialize();
        $.get(url, data, function (resultado) {
            $("#divListaCuenta").html(resultado);
            IniciarPagina('pagListaCuenta');
        });
    }

    function EnviarCuenta(idCuenta, Descripcion, Cuenta) {

 $("#divNuevoFamilia").dialog({
        autoOpen: false
    });

        if ($("#divNuevoFamilia").dialog("isOpen")) {
            $("#formNuevoFamilia input[name='Ofamilia.idCuenta']").val(idCuenta);
            $("#formNuevoFamilia input[name='Ofamilia.DCuenta']").val(Descripcion);
            $("#divBuscarCuenta").dialog('close');
            $("#formNuevoFamilia input[name='Ofamilia.Descripcion']").focus();
        }else{
        
            $("#formEditarFamilia input[name='Ofamilia.idCuenta']").val(idCuenta);
            $("#formEditarFamilia input[name='Ofamilia.DCuenta']").val(Descripcion);
            $("#divBuscarCuenta").dialog('close');
            $("#formEditarFamilia input[name='Ofamilia.Descripcion']").focus();
         
        }
    }

</script>


<jsp:include page="Menu.jsp" />
<br/>
<s:form id="formBuscarFamilia" theme="simple">
    <table>
        <tr><td>Descripcion:</td></tr>
        <tr>
            <td><s:textfield name="Ofamilia.Descripcion" onkeydown="Ejecutar(BuscarFamilia);"/></td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="GrabarFamilia();"><img title="Nuevo" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a>
                <a href="#" onclick="BuscarFamilia();
                        return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
            </td>            
        </tr>
    </table>
</s:form>

<div id="pagListaFamilia">
    <div id="divListaFamilia">
        <table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Cuenta</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaFamilia">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td><s:property value="DCuenta"/></td>
                        <td align="center">
                            <a href="#" onclick="EditarFamilia(<s:property value="idFamilia"/>,<s:property value="idCuenta"/>, '<s:property value="DCuenta"/>', '<s:property value="Descripcion"/>', '<s:property value="Codigo"/>');
                                    return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a href="#" onclick="EliminarFamilia(<s:property value="idFamilia"/>);
                                    return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="toleft('pagListaFamilia');
                    return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
            <td><a href="#" onclick="left('pagListaFamilia');
                    return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
            <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
            <td><a href="#" onclick="rigth('pagListaFamilia');
                    return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
            <td><a href="#" onclick="torigth('pagListaFamilia');
                    return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
        </tr>
    </table>
    <input type="hidden" class="count" />
    <input type="hidden" class="number" value="10" />
</div>

<div id="divNuevoFamilia" style="display: none;" title="Nueva Familia">
    <s:form id="formNuevoFamilia" theme="simple">
        <s:label value="Cuenta"/>
        <s:hidden name="Ofamilia.idCuenta" />
        <s:textfield name="Ofamilia.DCuenta" paso="1" onkeydown="salto($(this));" cssClass="validate[required]" onclick="AbrirBuscarCuenta(); return false;"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Ofamilia.Descripcion" paso="2" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Ofamilia.Codigo" paso="3" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divEliminarFamilia" style="display: none;" title="Eliminar Familia">
    ¿Esta seguro de querer eliminar esta Familia?
</div>

<div id="divEditarFamilia" style="display: none;" title="Editar Familia">
    <s:form id="formEditarFamilia" theme="simple">
        <s:hidden name="Ofamilia.idFamilia"/>
        <s:label value="Cuenta"/>
        <s:hidden name="Ofamilia.idCuenta" />
        <s:textfield name="Ofamilia.DCuenta" paso="1" onkeydown="salto($(this));" cssClass="validate[required]" onclick="AbrirBuscarCuenta(); return false;"/>
        <s:label value="Descripcion"/>
        <s:textfield name="Ofamilia.Descripcion" paso="2" onkeydown="salto($(this));" cssClass="validate[required]"/>
        <s:label value="Codigo"/>
        <s:textfield name="Ofamilia.Codigo" paso="3" onkeydown="BotonDialog($(this));" cssClass="validate[required]"/>
    </s:form>
</div>

<div id="divBuscarCuenta" style="display: none;" title="Buscar Cuenta">
    <s:form id="formBuscarCuenta" theme="simple">
        <s:label value="Descripcion"/>
        <s:textfield name="Ocuenta.Descripcion" paso="1" onkeydown="salto($(this));" cssClass="validate[required]" />
        <s:label value="Codigo"/>
        <s:textfield name="Ocuenta.Codigo" paso="2" onkeydown="Ejecutar(BuscarCuenta);" cssClass="validate[required]"/>
        <br/>
        <br/>
        <a href="#" onclick="BuscarCuenta();
                return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a>
        </s:form>
    <div id="divListaCuenta">
    </div>
</div>

<jsp:include page="../MasterPage/Inferior.jsp" />