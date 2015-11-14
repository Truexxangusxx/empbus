<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>Codigo</th>
        <th>Descripcion</th>
        <th>Cargo Codigo</th>
        <th>Cargo Descripcion</th>
        <th>Abono Codigo</th>
        <th>Abono Descripcion</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaConfiguracionCuenta">
                <tr>
                    <td><s:property value="Cuenta.Codigo"/></td>
                    <td><s:property value="Descripcion"/></td>
                    <td><s:property value="Cargo.Codigo"/></td>
                    <td><s:property value="Cargo.Descripcion"/></td>
                    <td><s:property value="Abono.Codigo"/></td>
                    <td><s:property value="Abono.Descripcion"/></td>
                    <td align="center">
                        <a class="lstEnviar" href="#" onclick="EnviarConfiguracionCuenta(<s:property value="idConfiguracionCuenta"/>); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>