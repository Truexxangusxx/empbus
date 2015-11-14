<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Numero</th>
    <th>Fecha</th>
    <th>Pedido</th>
    <th>Tipo Movimiento</th>
    <th>Responsable</th>
    <th>Observaciones</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaSalida">
        <tr>
            <td><s:property value="Numero"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="DPedido"/></td>
            <td><s:property value="DTipoMovimiento"/></td>
            <td><s:property value="Empleado.Nombre"/></td>
            <td><s:property value="Observaciones"/></td>
            <td><a href="#" onclick="EnviarSalida(<s:property value="idSalida"/>); return false;"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a></td>
        </tr>
    </s:iterator>
</tbody>
</table>