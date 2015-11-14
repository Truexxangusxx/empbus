<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Valor</th>
    <th>Activo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
<s:iterator value="ListaIGV">
    <tr>
        <td><s:property value="Valor"/></td>
        <td><s:checkbox name="Activo" theme="simple" disabled="true"/></td>
    <td align="center">
        <a class="lstEditar" href="#" onclick="EditarIGV(<s:property value="idIGV"/>,'<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
        <a class="lstEnviar" href="#" onclick="EnviarIGV(<s:property value="idIGV"/>,'<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
    </td>
    </tr>
</s:iterator>
</tbody>
</table>