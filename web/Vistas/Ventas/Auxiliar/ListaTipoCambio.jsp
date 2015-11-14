<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>Moneda Pago</th>
        <th>Moneda Cobra</th>
        <th>Valor</th>
        <th>Fecha</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaTipoCambio">
                <tr>
                    <td><s:property value="DMonedaPago"/></td>
                    <td><s:property value="DMonedaCobra"/></td>
                    <td><s:property value="Valor"/></td>
                    <td><s:property value="Fecha"/></td>
                    <td align="center">
                        <a href="#" onclick="EditarTipoCambio(<s:property value="idTipoCambio"/>,'<s:property value="idMonedaPago"/>','<s:property value="idMonedaCobra"/>','<s:property value="Valor"/>','<s:property value="Fecha"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                        <a href="#" onclick="EliminarTipoCambio(<s:property value="idTipoCambio"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>