<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnClienteProveedor').addClass('activo');        
    });    

</script>

<jsp:include page="Menu.jsp" />
<br/>


<form>
    <fieldset style="width: 80%;">
        <legend>Datos Generales</legend>
        <table>
            <tr>
                <td>
                    <label>Nombre</label>
                    <input type="text"/>
                </td>
                <td>
                    <label>Apellidos</label>
                    <input type="text"/>
                </td>
                <td>
                    <label>DNI</label>
                    <input type="text"/>
                </td>
                <td>
                    <label>Contraseña</label>
                    <input type="password"/>
                </td>
            </tr>
        </table>
    </fieldset>
</form>



<jsp:include page="../MasterPage/Inferior.jsp" />