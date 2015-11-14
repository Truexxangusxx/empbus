<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../MasterPage/combo.jsp" />

<script type="text/javascript">
        
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnPermisos').addClass('activo');
    });
            
    function BuscarPermiso(){
        var url="BuscarPermiso?Ousuario.idUsuario="+$("#cboUsuario").val();
        $.get(url,function(resultado){
            $("#divListaPermiso").html(resultado);
        });
    }
    
    function AgregarPermiso(){
        var url="AgregarPermiso?Opermiso.DModulo="+$("#cboModulo option:selected").text()+"&Opermiso.DOpcion="+$("#cboOpcion option:selected").text()+"&Opermiso.DUsuario="+$("#cboUsuario option:selected").text()+"&Opermiso.idModulo="+$('#cboModulo').val()+"&Opermiso.idOpcion="+$('#cboOpcion').val()+"&Opermiso.idUsuario="+$('#cboUsuario').val();
        $.get(url,function(resultado){
            $("#divListaPermiso").html(resultado);
        });
    }
    function RemoverPermiso(indice){
        var url="RemoverPermiso?indice="+indice;
        $.get(url,function(resultado){
            $("#divListaPermiso").html(resultado);
        });
    }
    function GrabarPermiso(){
        $.getJSON("GrabarPermiso", function(data){
            if (data.error) {
                Error(data.msg);
            }
            else{
                Mensaje(data.msg);
            }
        });
    }
    function BuscarOpcion(idModulo){
        var url="BuscarOpcion?Omodulo.idModulo="+idModulo;
        $.get(url,function(resultado){
            $("#divOpcion").html(resultado);
        });
    }
    
</script>

<jsp:include page="Menu.jsp" />


<br/>

<s:form theme="simple">
    <table>
        <tr>
            <td>Usuario:</td>
            <td><s:select id="cboUsuario" cssClass="combobox" name="Oopcion.idUsuario" list="ListaUsuario" listKey="idUsuario" listValue="Nick"/></td>
        </tr>
        <tr>
            <td>Modulo:</td>
            <td><s:select id="cboModulo" name="Omodulo.idModulo" list="ListaModulo" listKey="idModulo" listValue="Descripcion" onchange="BuscarOpcion(this.value); return false;"/></td>
        </tr>
        <tr>
            <td>Opcion:</td>
            <td><div id="divOpcion"><s:select id="cboOpcion" cssClass="combobox" name="Oopcion.idOpcion" list="ListaOpcion" listKey="idOpcion" listValue="Descripcion"/></div></td>
        </tr>
        <tr>
            <td><a href="#" onclick="AgregarPermiso(); return false;"><img title="Agregar" src="../../images/Agregar.jpeg" width="40px" height="40px"/></a></td>
            <td><a href="#" onclick="BuscarPermiso(); return false;"><img title="Buscar" src="../../images/Buscar.jpeg" width="40px" height="40px"/></a></td>
        </tr>
    </table>
    <div id="divListaPermiso">
        <table class="tabla">
            <thead>
            <th>Usuario</th>
            <th>Modulo</th>
            <th>Opcion</th>
            <th>Eliminar</th>
            </thead>
            <tbody>
                <s:iterator value="ListaPermiso" status="row">
                    <tr>
                        <td><s:property value="DUsuario"/></td>
                        <td><s:property value="DModulo"/></td>
                        <td><s:property value="DOpcion"/></td>
                        <td><a href="#" onclick="RemoverPermiso(<s:property value="%{#row.index}"/>);return false;"><img src="../../images/Remover.jpeg" width="20px" height="20px"/></a></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <table>
        <tr>
            <td><a href="#" onclick="GrabarPermiso(); return false;"><img title="Grabar" src="../../images/Grabar.jpeg" width="40px" height="40px"/></a></td>
            <td><a href="LoadPermiso"><img title="Cancelar" src="../../images/Cancelar.jpeg" width="40px" height="40px"/></a></td>
        </tr>
    </table>
</s:form>


<jsp:include page="../MasterPage/Inferior.jsp" />