<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Descripcion</th>
    <th>Valor</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaTasa">
        <tr>
            <td><s:property value="Descripcion"/></td>
            <td><s:property value="Valor"/></td>
            <td align="center">
                <a class="lstEditar" href="#" onclick="EditarTasa(<s:property value="idTasa"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a class="lstEliminar" href="#" onclick="EliminarTasa(<s:property value="idTasa"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                <a class="lstEnviar" href="#" onclick="EnviarTasa(<s:property value="idTasa"/>,'<s:property value="Descripcion"/>','<s:property value="Valor"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>