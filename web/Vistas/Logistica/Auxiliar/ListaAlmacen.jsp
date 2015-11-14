<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Sucursal</th>
    <th>Almacen</th>
    <th>Codigo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaAlmacen">
        <tr>
            <td><s:property value="DSucursal"/></td>
            <td><s:property value="Descripcion"/></td>
            <td><s:property value="Codigo"/></td>
            <td>
                <a href="#" onclick="EditarAlmacen(<s:property value="idAlmacen"/>, <s:property value="idSucursal"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a href="#" onclick="EliminarAlmacen(<s:property value="idAlmacen"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>