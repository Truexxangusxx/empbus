<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Codigo</th>
    <th>Producto Principal</th>
    <th>Cantidad</th>
    <th>Codigo</th>
    <th>Producto</th>
    <th>Operacion</th>
</thead>
<tbody>
    <s:iterator value="ListaEstandar" status="row">
        <tr>
            <td><s:property value="CodigoProductoPrincipal"/></td>
            <td><s:property value="DProductoPrincipal"/></td>
            <td><s:property value="Cantidad"/></td>
            <td><s:property value="CodigoProducto"/></td>
            <td><s:property value="DProducto"/></td>
            <td>
                <a href="#" onclick="QuitarEstandar(<s:property value="%{#row.index}"/>); return false;"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>