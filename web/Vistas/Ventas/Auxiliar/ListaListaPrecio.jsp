<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Producto</th>
    <th>Precio</th>
    <th>Tipo de Cambio</th>
    <th>Fecha</th>
    <th>Estado</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaListaPrecio">
        <tr>
            <td><s:property value="DProducto"/></td>
            <td><s:property value="Precio"/></td>
            <td><s:property value="TipoCambio"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="Estado"/></td>
            <td align="center">
                <a href="#" onclick="EditarListaPrecio(<s:property value="idListaPrecio"/>,<s:property value="idProducto"/>,<s:property value="Precio"/>,<s:property value="TipoCambio"/>,'<s:property value="Fecha"/>',<s:property value="Estado"/>); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a href="#" onclick="EliminarListaPrecio(<s:property value="idListaPrecio"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>