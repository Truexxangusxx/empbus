<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Pedido</th>
    <th>Fecha</th>
    <th>OP</th>
    <th>Centro de Costo</th>
    <th>Encargado</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaPedido">
        <tr>
            <td><s:property value="Numero"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="DOrdenProduccion"/></td>
            <td><s:property value="DCentroCosto"/></td>
            <td><s:property value="DEmpleado"/></td>
            <td>
                <a href="#" onclick="EnviarPedido(<s:property value="idPedido"/>,'<s:property value="Numero"/>');"><img title="Enviar" width="20" height="20" src="../../images/Derecha.jpeg"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>