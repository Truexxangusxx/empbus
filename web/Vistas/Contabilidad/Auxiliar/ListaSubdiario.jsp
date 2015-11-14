<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Descripcion</th>
    <th>Codigo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaSubdiario">
        <tr>
            <td><s:property value="Descripcion"/></td>
            <td><s:property value="Codigo"/></td>
            <td align="center">
                <a class="lstEditar" href="#" onclick="EditarSubdiario(<s:property value="idSubdiario"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a class="lstEliminar" href="#" onclick="EliminarSubdiario(<s:property value="idSubdiario"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                <a class="lstEnviar" href="#" onclick="EnviarSubdiario(<s:property value="idSubdiario"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>