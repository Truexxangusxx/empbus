<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Numero</th>
    <th>Cliente</th>
    <th>Sucursal</th>
    <th>Fecha</th>
    <th>Estado</th>
    <th>Operacion</th>
</thead>
<tbody>
    <s:iterator value="ListaOrdenCompra">
        <tr>
            <td><s:property value="Numero"/></td>
            <td><s:property value="DClienteProveedor"/></td>
            <td><s:property value="DSucursal"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="Estado"/></td>
            <td><a href="#" onclick="EnviarOrdenCompra(<s:property value="idOrdenCompra"/>,'<s:property value="Numero"/>'); return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
        </tr>
    </s:iterator>
</tbody>
</table>