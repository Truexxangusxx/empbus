<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Numero</th>
    <th>Periodo</th>
    <th>Fecha</th>
    <th>Importe</th>
    <th>Cliente</th>
    <th>CotizacionOP</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaFactura">
        <tr>
            <td><s:property value="Numero"/></td>
            <td><s:property value="Periodo"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="Importe"/></td>
            <td><s:property value="DCliente"/></td>
            <td><s:property value="CotizacionOP"/></td>
            <td align="center">
                <a class="lstEnviar" href="#" onclick="EnviarFactura(<s:property value="idFactura"/>); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>