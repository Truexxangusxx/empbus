<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">    
    <thead>
    <th>Referencia</th>
    <th>Cuenta</th>
    <th>CentroCosto</th>
    <th>Importe</th>
    <th>Quitar</th>
</thead>
<tbody>
    <s:iterator value="ListaDetalleProvision" status="row">
        <tr>
            <td><s:property value="DIngreso"/></td>
            <td><s:property value="Cuenta.Descripcion"/></td>
            <td><s:property value="CentroCosto.Descripcion"/></td>
            <td><s:property value="Importe"/></td>
            <td><a href="#" onclick="QuitarDetalleProvision(<s:property value="%{#row.index}"/>); return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
        </tr>
    </s:iterator>
</tbody>
</table>