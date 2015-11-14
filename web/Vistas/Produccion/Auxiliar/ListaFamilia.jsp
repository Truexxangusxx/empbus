<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="tabla">
            <thead>
            <th>Descripcion</th>
            <th>Codigo</th>
            <th>Cuenta</th>
            <th>Operacion</th>
            </thead>
            <tbody class="ParaPaginar">
                <s:iterator value="ListaFamilia">
                    <tr>
                        <td><s:property value="Descripcion"/></td>
                        <td><s:property value="Codigo"/></td>
                        <td><s:property value="DCuenta"/></td>
                        <td align="center">
                            <a href="#" class="lstEditar" onclick="EditarFamilia(<s:property value="idFamilia"/>,<s:property value="idCuenta"/>,'<s:property value="DCuenta"/>','<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Editar" src="../../images/Editar.jpeg" width="20px" height="20px"/></a>
                            <a href="#" class="lstEliminar" onclick="EliminarFamilia(<s:property value="idFamilia"/>); return false;"><img title="Eliminar" src="../../images/Remover.jpeg" width="20px" height="20px"/></a>
                            <a class="lstEnviar" href="#" onclick="EnviarFamilia(<s:property value="idFamilia"/>,'<s:property value="Descripcion"/>','<s:property value="Codigo"/>'); return false;"><img title="Enviar" src="../../images/Derecha.jpeg" width="20px" height="20px"/></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>