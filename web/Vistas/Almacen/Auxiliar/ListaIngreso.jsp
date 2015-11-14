<%@ taglib prefix="s" uri="/struts-tags" %>

<table class="tabla">
    <thead>
    <th>Numero</th>
    <th>Fecha</th>
    <th>Almacen</th>
    <th>Movimiento</th>
    <th>Orden de Compra</th>
    <th>Proveedor</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaIngreso">
        <tr>
            <td><s:property value="Numero"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="DAlmacen"/></td>
            <td><s:property value="DTipoMovimiento"/></td>
            <td><s:property value="DOrdenCompra"/></td>
            <td><s:property value="DClienteProveedor"/></td>
            <td>
                <a href="#" onclick="EnviarIngreso(<s:property value="idIngreso"/>);"><img width="20" height="20" src="../../images/Derecha.jpeg" /></a>
            </td>                    
        </tr>
    </s:iterator>
</tbody>
</table>