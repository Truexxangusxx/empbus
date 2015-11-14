<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Numero</th>
    <th>Periodo</th>
    <th>Fecha</th>
    <th>ServicioCompra</th>
    <th>Codigo</th>
    <th>RazonSocial</th>
    <th>Ruc</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaProvision">
        <tr>
            <td><s:property value="Numero"/></td>
            <td><s:property value="Periodo"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="ServicioCompra"/></td>
            <td><s:property value="Codigo"/></td>
            <td><s:property value="RazonSocial"/></td>
            <td><s:property value="Ruc"/></td>
            <td align="center">
                <a class="lstEnviar" href="#" onclick="EnviarProvision(<s:property value="idProvision"/>); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>