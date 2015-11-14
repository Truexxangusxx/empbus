<%@ taglib prefix="s" uri="/struts-tags" %>

<table class="tabla">
    <thead>
    <th>Usuario</th>
    <th>Modulo</th>
    <th>Opcion</th>
    <th>Eliminar</th>
</thead>
<tbody>
    <s:iterator value="ListaPermiso" status="row">
    <tr>
        <td><s:property value="DUsuario"/></td>
    <td><s:property value="DModulo"/></td>
    <td><s:property value="DOpcion"/></td>
    <td><a href="#" onclick="RemoverPermiso(<s:property value="%{#row.index}"/>);return false;"><img src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
    </tr>
</s:iterator>
</tbody>
</table>