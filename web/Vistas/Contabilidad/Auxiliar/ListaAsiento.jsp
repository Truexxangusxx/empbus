<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>Numero</th>
        <th>Periodo</th>
        <th>Subdiario</th>
        <th>Fecha</th>
        <th>Sucursal</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaAsiento">
                <tr>
                    <td><s:property value="Numero"/></td>
                    <td><s:property value="Periodo"/></td>
                    <td><s:property value="Subdiario.Descripcion"/></td>
                    <td><s:property value="Fecha"/></td>
                    <td><s:property value="Sucursal.Descripcion"/></td>
                    <td align="center">
                        <a class="lstEnviar" href="#" onclick="EnviarAsiento(<s:property value="idAsiento"/>); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>