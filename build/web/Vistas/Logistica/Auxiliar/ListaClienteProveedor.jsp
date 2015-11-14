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
        <a href="#" onclick="EditarClienteProveedor(<s:property value="idClienteProveedor"/>,'<s:property value="RazonSocial"/>','<s:property value="Ruc"/>','<s:property value="Dni"/>','<s:property value="Telefono1"/>','<s:property value="Telefono2"/>','<s:property value="Direccion"/>','<s:property value="Correo"/>','<s:property value="Contacto"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
        <a href="#" onclick="EliminarClienteProveedor(<s:property value="idClienteProveedor"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
    </td>
    </tr>
</s:iterator>
</tbody>
</table>