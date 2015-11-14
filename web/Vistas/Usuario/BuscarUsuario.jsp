<%@ taglib prefix="s" uri="/struts-tags" %>

<table class="tabla" id="tbListaUsuarios">
        <thead>
        <th>IdUsuario</th>
        <th>Nick</th>
        <th>Password</th>
        <th>Nombre</th>
        <th>Email</th>
        <th>Operaciones</th>
    </thead>
    <tbody class="ParaPaginar">
        <s:iterator value="ListaUsuario">
            <tr>
                <td><s:property value="idUsuario"/></td>
                <td><s:property value="Nick"/></td>
                <td><s:property value="Password"/></td>
                <td><s:property value="Nombre"/></td>
                <td><s:property value="Email"/></td>
                <td align="center">
                    <a href="#" onclick="EliminarUsuario('<s:property value="idUsuario"/>'); return false;"><img width="20" height="20" title="Eliminar Usuario" src="../../images/Remover.jpeg"/></a>
                    <a href="#" onclick="EditarUsuario('<s:property value="idUsuario"/>','<s:property value="Nick"/>','<s:property value="Password"/>','<s:property value="Nombre"/>','<s:property value="Email"/>'); return false;"><img width="20" height="20" title="Editar Usuario" src="../../images/Editar.jpeg"/></a>
                </td>
            </tr>
        </s:iterator>
    </tbody>
</table>