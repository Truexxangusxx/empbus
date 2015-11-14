<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">    
    <thead>
    <th>Item</th>
    <th>Codigo</th>
    <th>Descripcion</th>
    <th>Cantidad</th>
    <th>Estandar</th>
    <th>Glosa</th>
    <th>Quitar</th>
</thead>
<tbody>
    <s:iterator value="ListaPedidoProducto" status="row">
        <tr>
            <td><s:property value="%{#row.index}"/></td>
            <td><s:property value="CodigoProducto"/></td>
            <td><s:property value="DProducto"/></td>
            <td><s:property value="Cantidad"/></td>
            <td><s:property value="Estandar"/></td>
            <td><s:property value="Glosa"/></td>
            <td><a href="#" onclick="QuitarPedidoProducto(<s:property value="%{#row.index}"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
        </tr>
    </s:iterator>
</tbody>
</table>