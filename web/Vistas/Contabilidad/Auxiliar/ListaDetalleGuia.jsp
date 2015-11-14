<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">    
    <thead>
    <th>Producto</th>
    <th>Cantidad</th>
    <th>Precio</th>
    <th>Subtotal</th>
    <th>Quitar</th>
</thead>
<tbody>
    <s:iterator value="ListaDetalleGuia" status="row">
        <tr>
            <td><s:property value="DProducto"/></td>
            <td><s:property value="Cantidad"/></td>
            <td><s:property value="Precio"/></td>
            <td><s:property value="SubTotal"/></td>
            <td><a href="#" onclick="QuitarDetalleGuia(<s:property value="%{#row.index}"/>); return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
        </tr>
    </s:iterator>
</tbody>
</table>