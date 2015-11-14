<%@ taglib prefix="s" uri="/struts-tags" %>

<table class="tabla">
    <thead>
    <th>Orden Servicio</th>
    <th>Fecha</th>
    <th>Fecha de Entrega</th>
    <th>Monto</th>
    <th>Proveedor</th>
    <th>Sucursal</th>
    <th>Centro de Costo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaOrdenServicio">
        <tr>
            <td><s:property value="Numero"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="FechaEntrega"/></td>
            <td><s:property value="Monto"/></td>
            <td><s:property value="DClienteProveedor"/></td>
            <td><s:property value="DSucursal"/></td>
            <td><s:property value="DCentroCosto"/></td>
            <td>
                <a href="#" onclick="EnviarOrdenServicio(<s:property value="idOrdenServicio"/>,'<s:property value="Numero"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>