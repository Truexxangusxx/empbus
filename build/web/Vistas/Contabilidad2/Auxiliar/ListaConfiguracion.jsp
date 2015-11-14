<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>Descripcion</th>
        <th>Subdiario</th>
        <th>Familia</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaConfiguracion" status="row">
                <tr>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Subdiario.Descripcion"/></td>
                    <td><s:property value="Familia.Descripcion"/></td>
                    <td align="center">
                        <a href="#" onclick="EnviarConfiguracion(<s:property value="idConfiguracion"/>); return false"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>