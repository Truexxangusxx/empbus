<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">
    
    $(document).ready(function () {
        
        
$(".TablaCuenta").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarCuentaJson",
                    dataType: "json",
                    data: {"Ocuenta.Codigo":"","Ocuenta.Descripcion":request.term},
                    success: function(data) {
                        var datos = data.listaCuenta;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.descripcion,
                                id: item.idCuenta,
                                codigo: item.codigo
                            };
                        }));
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                $(this).parent("td").children("[name='Cuenta.idCuenta']").val(ui.item.id);
            }
        });
        
        $(".TablaCentroCosto").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarCentroCostoJson",
                    dataType: "json",
                    data: {"Ocentrocosto.Codigo":"","Ocentrocosto.Descripcion":request.term},
                    success: function(data) {
                        var datos = data.listaCentroCosto;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.descripcion,
                                id: item.idCentroCosto,
                                codigo: item.codigo
                            };
                        }));
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                $(this).parent("td").children("[name='CentroCosto.idCentroCosto']").val(ui.item.id);
                $(this).parent("td").parent("tr").children(".CodigoCentroCosto").text(ui.item.codigo);
            }
        });
        
        $(".TablaOP").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "BuscarOrdenProduccionJson",
                    dataType: "json",
                    data: {"Oordenproduccion.numero":request.term},
                    success: function(data) {
                        var datos = data.listaOrdenProduccion;
                        response($.map(datos, function(item) {                                
                            return {
                                label: item.numero,
                                id: item.idOrdenProduccion
                            };
                        }));
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                $(this).parent("td").children("[name='OrdenProduccion.idOrdenProduccion']").val(ui.item.id);
            }
        });
        
    });
    
    
    
    
</script>


<s:form theme="simple">
<table class="tabla">    
    <thead>
    <th>Referencia</th>
    <th>Cuenta</th>
    <th>Descripcion</th>
    <th>OP</th>
    <th>Centro de Costo</th>
    <th>Codigo CC</th>
    <th>Importe</th>

</thead>
<tbody>
    <s:iterator value="ListaDetalleProvision" status="row">
        <tr>
            <td>
                <s:property value="DIngreso"/>
                <s:hidden name="idIngreso"/>
            </td>
            <td>
                <s:hidden name="Cuenta.idCuenta"/>
                <s:textfield name="Cuenta.Descripcion" cssClass="TablaCuenta"/>
            </td>
            <td><s:textfield name="Descripcion" cssClass="TablaDescripcion"/></td>
            <td>
                <s:hidden name="OrdenProduccion.idOrdenProduccion"/>
                <s:textfield name="OrdenProduccion.Numero" cssClass="TablaOP"/>
            </td>
            <td>
                <s:hidden name="CentroCosto.idCentroCosto"/>
                <s:textfield name="CentroCosto.Descripcion" cssClass="TablaCentroCosto"/>
            </td>
            <td class="CodigoCentroCosto"><s:property value="CentroCosto.Codigo"/></td>
            <td><s:textfield name="Importe"/></td>
            <%--<td><a href="#" onclick="QuitarDetalleProvision(<s:property value="%{#row.index}"/>); return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>--%>
        </tr>
    </s:iterator>
</tbody>
</table>
</s:form>