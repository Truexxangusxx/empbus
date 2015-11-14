<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
    <thead>
    <th>Familia</th>
        <th>Descripcion</th>
        <th>Tipo de Producto</th>
        <th>Codigo</th>
        <th>UM Compra</th>
        <th>UM Consumo</th>
        <th>Conversion</th>
        <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaProducto">
        <tr>
            <td><s:property value="DFamilia"/></td>
            <td><s:property value="Descripcion"/></td>
            <td><s:property value="DTipoProducto"/></td>
            <td><s:property value="Codigo"/></td>
            <td><s:property value="UmCompra"/><s:property value="DUnidadMedidaCompra"/></td>
            <td><s:property value="UmConsumo"/><s:property value="DUnidadMedidaConsumo"/></td>
            <td><s:property value="Conversion"/></td>                    
            <td align="center">
                <a href="#" class="lstEditar" onclick="EditarProducto(<s:property value="idProducto"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>',<s:property value="idTipoProducto"/>,<s:property value="UmCompra"/>,<s:property value="idUnidadMedidaCompra"/>,<s:property value="UmConsumo"/>,<s:property value="idUnidadMedidaConsumo"/>,<s:property value="Conversion"/>,<s:property value="idFamilia"/>); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                <a href="#" class="lstEliminar" onclick="EliminarProducto(<s:property value="idProducto"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                <a href="#" class="lstEnviar" onclick="EnviarProducto(<s:property value="idProducto"/>,'<s:property value="Descripcion"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>