<%@ taglib prefix="s" uri="/struts-tags" %>

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