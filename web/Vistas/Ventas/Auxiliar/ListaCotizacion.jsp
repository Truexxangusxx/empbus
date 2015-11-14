<%@ taglib prefix="s" uri="/struts-tags" %>

<table class="tabla">
    <thead>
    <th>Cliente</th>
    <th>Serie</th>
    <th>Modelo Chasis</th>
    <th>Fecha</th>
    <th>Numero Chasis</th>
    <th>Tipo Carroceria</th>
    <th>Operacion</th>
</thead>
<tbody class="ParaPaginar">
    <s:iterator value="ListaCotizacion">
        <tr>
            <td><s:property value="DClienteProveedor"/></td>
            <td><s:property value="Serie"/></td>
            <td><s:property value="DModeloChasis"/></td>
            <td><s:property value="Fecha"/></td>
            <td><s:property value="NumeroChasis"/></td>
            <td><s:property value="TipoCarroceria"/></td>
            <td>
                <a class="lstImprimir" href="#" onclick="EliminarCotizacion(<s:property value="idCotizacion"/>); return false;"><img title="Eliminar" width="20" height="20" src="../../images/Remover.jpeg" /></a>
                <a class="lstEliminar" href="#" onclick="ImprimirCotizacion(<s:property value="idCotizacion"/>); return false;"><img title="Imprimir" width="20" height="20" src="../../images/Imprimir.jpeg" /></a>
                <a class="lstEnviar" href="#" onclick="EnviarCotizacion(<s:property value="idCotizacion"/>,<s:property value="idModeloChasis"/>,<s:property value="NumeroChasis"/>,<s:property value="NumeroAsientos"/>,<s:property value="NumeroParabrisas"/>,'<s:property value="Ventanas"/>','<s:property value="TipoCarroceria"/>','<s:property value="ColorFondo"/>','<s:property value="ColorArtes"/>','<s:property value="ColorOtros"/>','<s:property value="Observaciones"/>');"><img title="Enviar" width="20" height="20" src="../../images/Derecha.jpeg" /></a>
            </td>
        </tr>
    </s:iterator>
</tbody>
</table>