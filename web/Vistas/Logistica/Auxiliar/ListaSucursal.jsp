<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Descripcion</th>
    <th>Direccion</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaSucursal">
        <tr>
            <td><s:property value="Descripcion"/></td>
            <td><s:property value="Direccion"/></td>
            <td>
                <a href="#" onclick="EditarSucursal(<s:property value="idSucursal"/>,'<s:property value="Descripcion"/>','<s:property value="Direccion"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a href="#" onclick="EliminarSucursal(<s:property value="idSucursal"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>