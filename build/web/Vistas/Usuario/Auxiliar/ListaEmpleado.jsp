<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Nombre</th>
    <th>DNI</th>
    <th>Direccion</th>
    <th>Codigo</th>
    <th>Telefono1</th>
    <th>Telefono2</th>
    <th>Puesto</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaEmpleado">
        <tr>
            <td><s:property value="Nombre"/></td>
            <td><s:property value="DNI"/></td>
            <td><s:property value="Direccion"/></td>
            <td><s:property value="Codigo"/></td>
            <td><s:property value="Telefono1"/></td>
            <td><s:property value="Telefono2"/></td>
            <td><s:property value="Puesto"/></td>
            <td align="center">
                <a class="lstEditar" href="#" onclick="EditarEmpleado(<s:property value="idEmpleado"/>,'<s:property value="Nombre"/>','<s:property value="DNI"/>','<s:property value="Direccion"/>','<s:property value="Codigo"/>','<s:property value="Telefono1"/>','<s:property value="Telefono2"/>','<s:property value="Puesto"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a class="lstEliminar" href="#" onclick="EliminarEmpleado(<s:property value="idEmpleado"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                <a class="lstEnviar" href="#" onclick="EnviarEmpleado(<s:property value="idEmpleado"/>,'<s:property value="Nombre"/>','<s:property value="DNI"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>