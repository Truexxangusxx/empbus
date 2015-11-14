<jsp:include page="../MasterPage/Superior.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>


<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#menu").find('a').removeClass('activo');
        $('#mnUsuarios').addClass('activo');
        IniciarPagina('pagListaUsuario');
    });
    
    function BuscarUsuario(){
        var url = "BuscarUsuario";
        var data = $("#formUsuario").serialize();
        $.get(url, data, function(resultado){  
            $("#divListaUsuario").html(resultado);
            IniciarPagina('pagListaUsuario');
        });  
        Mensaje(resultado.msg);
    }
    function GrabarUsuario(){
        $( "#divNuevoUsuario" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "GrabarUsuario";
                    var data = $("#formNuevoUsuario").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var url = "BuscarUsuario";
                            var data = $("#formUsuario").serialize();
                            $.get(url, data, function(resultado){   
                                $("#divListaUsuario").html(resultado);
                                IniciarPagina('pagListaUsuario');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divNuevoUsuario" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EditarUsuario(idUsuario,Nick,Password,Nombre,Email){
        $("#formEditarUsuario input[name='Ousuario.IdUsuario']").val(idUsuario);
        $("#formEditarUsuario input[name='Ousuario.Nick']").val(Nick);
        $("#formEditarUsuario input[name='Ousuario.Password']").val(Password);
        $("#formEditarUsuario input[name='Ousuario.Nombre']").val(Nombre);
        $("#formEditarUsuario input[name='Ousuario.Email']").val(Email);
    
        $( "#divEditarUsuario" ).dialog({
            height: 'auto',
            modal: true,
            buttons: {
                "Continuar": function() {
                    var url = "EditarUsuario";
                    var data = $("#formEditarUsuario").serialize();
                    $.getJSON(url, data, function(resultado){
                        if (resultado.error == false){
                            var url = "BuscarUsuario";
                            var data = $("#formUsuario").serialize();
                            $.get(url, data, function(resultado){   
                                $("#divListaUsuario").html(resultado);
                                IniciarPagina('pagListaUsuario');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $( "#divEditarUsuario" ).dialog("close")
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    function EliminarUsuario(IdUsuario){
        var url = "EliminarUsuario?Ousuario.IdUsuario="+IdUsuario;
        $('#divEliminarUsuario').dialog({
            height: 'auto',
            resizable: false,
            modal: true,
            buttons: {
                "Continuar": function() {
                    $.getJSON(url, function(resultado){
                        if (resultado.error == false){
                            var url = "BuscarUsuario";
                            var data = $("#formUsuario").serialize();
                            $.get(url, data, function(resultado){   
                                $("#divListaUsuario").html(resultado);  
                                IniciarPagina('pagListaUsuario');
                            });  
                            Mensaje(resultado.msg);
                        }
                        else{Error(resultado.msg);}
                        $('#divEliminarUsuario').dialog("close");
                    })
                },
                "Cancelar": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }
    
</script>

<jsp:include page="Menu.jsp" />

<s:form theme="simple" id="formUsuario">
    <table>
        <tr>
            <td><label>Nick:</label>
                <s:textfield name="Ousuario.Nick" onkeydown="Ejecutar(BuscarUsuario);"/></td>
        </tr>
        <td>
            <a href="#" onclick="BuscarUsuario(); return false;"><img width="40" height="40" title="Buscar Usuario" src="../../images/Buscar.jpeg"/></a>
            <a href="#" onclick="GrabarUsuario(); return false;"><img width="40" height="40" title="Nuevo Usuario" src="../../images/Agregar.jpeg"/></a>
        </td>
    </table>
    <div id="pagListaUsuario">
        <div id="divListaUsuario">
            <table class="tabla" id="tbListaUsuarios">
                <thead>
                <th>IdUsuario</th>
                <th>Nick</th>
                <th>Password</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Operaciones</th>
                </thead>
                <tbody class="ParaPaginar">
                    <s:iterator value="ListaUsuario">
                        <tr>
                            <td><s:property value="idUsuario"/></td>
                            <td><s:property value="Nick"/></td>
                            <td><s:property value="Password"/></td>
                            <td><s:property value="Nombre"/></td>
                            <td><s:property value="Email"/></td>
                            <td align="center">
                                <a href="#" onclick="EliminarUsuario('<s:property value="idUsuario"/>'); return false;"><img width="20" height="20" title="Eliminar Usuario" src="../../images/Remover.jpeg"/></a>
                                <a href="#" onclick="EditarUsuario('<s:property value="idUsuario"/>','<s:property value="Nick"/>','<s:property value="Password"/>','<s:property value="Nombre"/>','<s:property value="Email"/>'); return false;"><img width="20" height="20" title="Editar Usuario" src="../../images/Editar.jpeg"/></a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>    
        <table>
            <tr>
                <td><a href="#" onclick="toleft('pagListaUsuario'); return false;"><img width="25" height="25" src="../../images/MasIzquierda.jpeg" /></a></td>
                <td><a href="#" onclick="left('pagListaUsuario'); return false;"><img width="25" height="25" src="../../images/Izquierda.jpeg" /></a></td>
                <td><input type="text" readonly="true" style="text-align: center; height: 20px;" class="indice" /></td>
                <td><a href="#" onclick="rigth('pagListaUsuario'); return false;"><img width="25" height="25" src="../../images/Derecha.jpeg" /></a></td>
                <td><a href="#" onclick="torigth('pagListaUsuario'); return false;"><img width="25" height="25" src="../../images/MasDerecha.jpeg" /></a></td>
            </tr>
        </table>
        <input type="hidden" class="count" />
        <input type="hidden" class="number" value="10" />
    </div>
</s:form>

<div id="divNuevoUsuario" style="display: none;" title="Nuevo Usuario">    
    <s:form theme="simple" id="formNuevoUsuario">
        <s:label value="Nick:"/>
        <s:textfield name="Ousuario.Nick"/>
        <s:label value="Passeword:"/>
        <s:textfield name="Ousuario.Password"/>
        <s:label value="Nombre:"/>
        <s:textfield name="Ousuario.Nombre"/>
        <s:label value="Email:"/>
        <s:textfield name="Ousuario.Email"/>
    </s:form>
</div>

<div id="divEditarUsuario" style="display: none;" title="Editar Usuario">    
    <s:form theme="simple" id="formEditarUsuario">
        <s:hidden name="Ousuario.IdUsuario"/>
        <s:label value="Nick:"/>
        <s:textfield name="Ousuario.Nick"/>
        <s:label value="Passeword:"/>
        <s:textfield name="Ousuario.Password"/>
        <s:label value="Nombre:"/>
        <s:textfield name="Ousuario.Nombre"/>
        <s:label value="Email:"/>
        <s:textfield name="Ousuario.Email"/>
    </s:form>
</div>

<div id="divEliminarUsuario" style="display: none;">
    <p>¿Esta seguro de eliminar este usuario?</p>
</div>









<jsp:include page="../MasterPage/Inferior.jsp" />