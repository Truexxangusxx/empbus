<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">    
    <thead>
    <th>Cuenta</th>
    <th>Centro de costo</th>
    <th>Descripcion CC</th>
    <th>Cargo MN</th>
    <th>Abono MN</th>
    <th>Cargo ME</th>
    <th>Abono ME</th>
    <th>Quitar</th>
</thead>
<tbody>
    <s:iterator value="ListaDetalleAsiento" status="row">
        <tr>
            <td><s:property value="Cuenta.Descripcion"/></td>
            <td><s:property value="CentroCosto.Codigo"/></td>
            <td><s:property value="CentroCosto.Descripcion"/></td>
            <td><s:property value="CargoMN"/></td>
            <td><s:property value="AbonoMN"/></td>
            <td><s:property value="CargoME"/></td>
            <td><s:property value="AbonoME"/></td>
            <td><a href="#" onclick="QuitarDetalleAsiento(<s:property value="%{#row.index}"/>);
                                           return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
        </tr>
    </s:iterator>
</tbody>
</table>