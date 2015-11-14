<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>Codigo</th>
        <th>Descripcion</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaConfiguracionAlmacen" status="row">
                <tr>
                    <td><s:property value="Familia.Codigo"/></td>
                    <td><s:property value="Descripcion"/></td>
                    <td align="center">
                        <a class="lstEnviar" href="#" onclick="EnviarConfiguracionAlmacen(<s:property value="idConfiguracionAlmacen"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>