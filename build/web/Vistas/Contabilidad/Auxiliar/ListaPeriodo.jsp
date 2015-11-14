<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Anio</th>
    <th>Mes</th>
    <th>Activo</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaPeriodo">
        <tr>
            <td><s:property value="Anio"/></td>
            <td><s:property value="Mes"/></td>
            <td><s:checkbox name="Activo"  theme="simple" disabled="true"/></td>
            <td align="center">
                <a class="lstEditar" href="#" onclick="EditarPeriodo(<s:property value="idPeriodo"/>,<s:property value="Anio"/>,'<s:property value="Mes"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a class="lstEnviar" href="#" onclick="EnviarPeriodo(<s:property value="idPeriodo"/>,<s:property value="Anio"/>,'<s:property value="Mes"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>