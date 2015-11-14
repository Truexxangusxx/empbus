<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>C.Costo</th>
        <th>Descripcion</th>
        <th>Cuenta</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaDetalleConfiguracionCargo" status="row">
                <tr>
                    <td><s:property value="CentroCosto.Codigo"/></td>
                    <td><s:property value="CentroCosto.Descripcion"/></td>
                    <td><s:property value="Cuenta.Codigo"/></td>
                    <td align="center">
                        <a href="#" onclick="QuitarDetalleConfiguracionCargo(<s:property value="%{#row.index}"/>); return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>