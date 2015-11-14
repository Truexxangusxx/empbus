<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Razon Social</th>
    <th>Ruc</th>
    <th>Dni</th>
    <th>Telefono1</th>
    <th>Telefono2</th>
    <th>Direccion</th>
    <th>Correo</th>
    <th>Contacto</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
<s:iterator value="ListaClienteProveedor">
    <tr>
        <td><s:property value="RazonSocial"/></td>
    <td><s:property value="Ruc"/></td>
    <td><s:property value="Dni"/></td>
    <td><s:property value="Telefono1"/></td>
    <td><s:property value="Telefono2"/></td>
    <td><s:property value="Direccion"/></td>
    <td><s:property value="Correo"/></td>
    <td><s:property value="Contacto"/></td>
    <td align="center">
        <a href="#" onclick="EnviarClienteProveedor(<s:property value="idClienteProveedor"/>,'<s:property value="RazonSocial"/>','<s:property value="Ruc"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
    </td>
    </tr>
</s:iterator>
</tbody>
</table>