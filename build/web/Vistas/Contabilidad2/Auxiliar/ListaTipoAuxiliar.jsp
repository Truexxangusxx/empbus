<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Descripcion</th>
    <th>Codigo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaTipoAuxiliar">
        <tr>
            <td><s:property value="Descripcion"/></td>
            <td><s:property value="Codigo"/></td>
            <td align="center">
                <a href="#" onclick="EditarTipoAuxiliar(<s:property value="idTipoAuxiliar"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a href="#" onclick="EliminarTipoAuxiliar(<s:property value="idTipoAuxiliar"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>