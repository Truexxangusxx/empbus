<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">    
    <thead>
    <th>Item</th>
    <th>Codigo</th>
    <th>Descripcion</th>
    <th>U.M.</th>
    <th>Cantidad</th>
    <th>P. Unit</th>
    <th>% Descuento</th>
    <th>Importe</th>
    <th>Glosa</th>
    <th>Quitar</th>
</thead>
<tbody>
    <s:iterator value="ListaOrdenCompraProducto" status="row">
        <tr>
            <td><s:property value="%{#row.index}"/></td>
            <td><s:property value="Codigo"/></td>
            <td><s:property value="DProducto"/></td>
            <td><s:property value="DUnidadMedida"/></td>
            <td><s:property value="Cantidad"/></td>
            <td><s:property value="PrecioUnitario"/></td>
            <td><s:property value="Descuento"/></td>
            <td><s:property value="Importe"/></td>
            <td><s:property value="Glosa"/></td>
            <td><a href="#" onclick="QuitarOrdenCompraProducto(<s:property value="%{#row.index}"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
        </tr>
    </s:iterator>
</tbody>
</table>
<s:hidden id="hdTotal" name="Oordencompra.Total"/>