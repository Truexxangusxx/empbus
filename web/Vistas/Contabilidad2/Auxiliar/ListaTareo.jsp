<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>Numero</th>
        <th>Periodo</th>
        <th>Codigo</th>
        <th>Empleado</th>
        <th>Fecha</th>
        <th>Horas</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaTareo" status="row">
                <tr>
                    <td><s:property value="Numero"/></td>
                    <td><s:property value="Periodo"/></td>
                    <td><s:property value="Empleado.Codigo"/></td>
                    <td><s:property value="Empleado.Nombre"/></td>
                    <td><s:property value="Fecha"/></td>
                    <td><s:property value="TotalHoras"/></td>
                    <td align="center">
                        <a class="lstEnviar" href="#" onclick="EnviarTareo(<s:property value="idTareo"/>); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>