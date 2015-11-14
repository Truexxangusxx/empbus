<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">    
    <thead>
    <th>Item</th>
    <th>Codigo</th>
    <th>Descripcion</th>
    <th>U.M.</th>
    <th>Stock</th>
    <th>Cantidad</th>
    <th>Estandar</th>
    <th>P. Unit</th>        
    <th>Importe</th>
    <th>Centro de Costo</th>
    <th>Quitar</th>
</thead>
<tbody>
<s:iterator value="ListaSalidaProducto" status="row">
    <tr>
        <td><s:property value="%{#row.index}"/></td>
    <td><s:property value="Codigo"/></td>
    <td><s:property value="DProducto"/></td>
    <td><s:property value="DUnidadMedida"/></td>
    <td><s:property value="Stock"/></td>
    <td><s:property value="Cantidad"/></td>
    <td><s:property value="Estandar"/></td>
    <td><s:property value="Precio"/></td>
    <td><s:property value="Importe"/></td>
    <td><s:property value="DCentroCosto"/></td>
    <td><a href="#" onclick="QuitarSalidaProducto(<s:property value="%{#row.index}"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a></td>
    </tr>
</s:iterator>
</tbody>
</table>                    