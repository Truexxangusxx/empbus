<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
        <thead>
        <th>Codigo</th>
        <th>Nombre</th>
        <th>OT</th>
        <th>Actividad</th>
        <th>Descripcion Actividad</th>
        <th>H. Inicio</th>
        <th>H. Fin</th>
        <th>Horas</th>
        <th>Codigo CC</th>
        <th>Centro Costo</th>
        <th>Operacion</th>
        </thead>
        <tbody class="ParaPaginar">
            <s:iterator value="ListaDetalleTareo" status="row">
                <tr>
                    <td><s:property value="Empleado.Codigo"/></td>
                    <td><s:property value="Empleado.Nombre"/></td>
                    <td><s:property value="OrdenProduccion.Numero"/></td>
                    <td><s:property value="Actividad.Codigo"/></td>
                    <td><s:property value="Actividad.Descripcion"/></td>
                    <td><s:property value="HoraInicio"/></td>
                    <td><s:property value="HoraFin"/></td>
                    <td><s:property value="Horas"/></td>
                    <td><s:property value="CentroCosto.Codigo"/></td>
                    <td><s:property value="CentroCosto.Descripcion"/></td>
                    <td align="center">
                        <a href="#" onclick="QuitarDetalleTareo(<s:property value="%{#row.index}"/>); return false"><img title="Quitar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>