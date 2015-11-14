<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Descripcion</th>
    <th>Codigo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
<s:iterator value="ListaCuenta">
    <tr>
        <td><s:property value="Descripcion"/></td>
    <td><s:property value="Codigo"/></td>
    <td align="center">
        <a class="lstEditar" href="#" onclick="EditarCuenta(<s:property value="idCuenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
        <a class="lstEliminar" href="#" onclick="EliminarCuenta(<s:property value="idCuenta"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
        <a class="lstEnviar" href="#" onclick="EnviarCuenta(<s:property value="idCuenta"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
    </td>
    </tr>
</s:iterator>
</tbody>
</table>