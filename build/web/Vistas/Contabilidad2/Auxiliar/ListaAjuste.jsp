<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Descripcion</th>
    <th>Codigo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaAjuste">
        <tr>
            <td><s:property value="Descripcion"/></td>
            <td><s:property value="Codigo"/></td>
            <td align="center">
                <a href="#" onclick="EditarAjuste(<s:property value="idAjuste"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a href="#" onclick="EliminarAjuste(<s:property value="idAjuste"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>