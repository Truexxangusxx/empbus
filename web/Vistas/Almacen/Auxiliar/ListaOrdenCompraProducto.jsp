<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Producto</th>
    <th>Codigo</th>
    <th>UM</th>
    <th>Precio</th>
    <th>Cantidad</th>
    <th>Centro de Costo</th>
    <th>Seleccionar</th>
</thead>
<tbody>
    <s:iterator value="ListaOrdenCompraProducto" status="row">
        <tr>
            <td><s:property value="DProducto"/><s:hidden name="idProducto"/></td>
            <td><s:property value="Codigo"/></td>
            <td><s:property value="DUnidadMedida"/></td>
            <td><s:property value="PrecioUnitario"/></td>
            <td><s:textfield name="Cantidad" theme="simple"/></td>
            <td><s:select cssClass="centro" name="idCentroCosto" list="ListaCentroCosto" listKey="idCentroCosto" listValue="Descripcion" theme="simple"/></td>
            <td><s:checkbox name="Seleccionar" theme="simple"/></td>
        </tr>
    </s:iterator>
</tbody>
</table>    