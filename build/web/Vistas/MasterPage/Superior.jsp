<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session='true'%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Global Buss</title>
        <link rel="stylesheet" href="../../CSS/layout.css" type="text/css" />
        <link rel="stylesheet" href="../../CSS/custom-theme/jquery-ui-1.10.0.custom.css" type="text/css" />
        <link rel="stylesheet" href="../../CSS/validationEngine.jquery.css" type="text/css" />
        <script src="../../JS/jquery-1.9.0.js"></script>
        <script src="../../JS/jquery-ui-1.10.0.custom.js"></script>
        <script src="../../JS/paginacion.js"></script>
        <script src="../../JS/jquery.validationEngine-es.js"></script>
        <script src="../../JS/jquery.validationEngine.js"></script>
        

        <style>
            .ui-menu { width: 150px; }
        </style>
        <style>
            .ui-autocomplete-loading {
                background: white url('../../images/ui-anim_basic_16x16.gif') right center no-repeat;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                
                $('#Login').click(function(e){
                    e.preventDefault();
                    $( "#DivLogin" ).dialog({
                        height: 'auto',
                        modal: true,
                        buttons: {
                            "Continuar": function() {
                                ValidarUsuario();
                            },
                            "Cancelar": function() {
                                $(this).dialog( "close" );
                            }
                        }
                    });
                })
        
                $( "#menu" ).menu();
                $( "[title]" ).tooltip();
        
                if($("#msg").val()!=""){Mensaje($("#msg").val());}                
                
                $("#loadingScreen").dialog({
                    autoOpen: false,    // set this to false so we can manually open it
                    dialogClass: "loadingScreenWindow",
                    closeOnEscape: false,
                    draggable: false,
                    width: 460,
                    minHeight: 50,
                    modal: true,
                    buttons: {},
                    resizable: false,
                    open: function() {
                        // scrollbar fix for IE
                        $('body').css('overflow','hidden');
                    },
                    close: function() {
                        // reset overflow
                        $('body').css('overflow','auto');
                    }

                }); // end of dialog
                
                
                
                
            });
            
            function AbrirLoading() {
                $("#loadingScreen").dialog('open');
            }
            function CerrarLoading() {
                $("#loadingScreen").dialog('close');
            }

    
            function ValidarUsuario(){
                var url = "ValidarUsuario";
                var data = $("#FormLogin").serialize();
                $.getJSON(url, data, function(resultado){
                    if (resultado.error){Error(resultado.msg);}
                    else{location.href="/WebAppEmpBus/Vistas/Home/index.jsp";}
                })
            }
            
            function SalirUsuario(){
                var url = "SalirUsuario";
                $.get(url, function(){
                    location.href="/WebAppEmpBus/Vistas/Home/index.jsp";
                })
            }
    
            function Mensaje(mensaje){
                $('#divMensaje').stop(true);
                $('#divMensaje').hide();
                $('#lblMensaje').text(mensaje);
                /*$('#divMensaje').show("slide", {}, 1000).delay(7000).hide("slide", {}, 1500);*/
                $('#divMensaje').fadeIn(1000).delay(7000).fadeOut(1500);
            }
            function Error(mensaje){
                $('#divError').stop(true);
                $('#divError').hide();
                $('#lblError').text(mensaje);
                $('#divError').fadeIn(1000).delay(7000).fadeOut(1500);
            }
            function limpiar(){
                $(":text").each(function(){	
                    if ($($(this)).val() == 0){$($(this)).val('');}
                });                
            }
            function limpiaForm(miForm) {
                $(':input', miForm).each(function() {
                    var type = this.type;
                    var tag = this.tagName.toLowerCase();
                    if (type == 'text' || type == 'password' || tag == 'textarea' || tag == 'hidden')
                        this.value = "";
                    else if (type == 'checkbox' || type == 'radio')
                        this.checked = false;
                    else if (tag == 'select')
                        this.selectedIndex = -1;
                });
            }
    
            function salto(tag) {
                if (event.which || event.keyCode) {
                    if ((event.which == 13) || (event.keyCode == 13))
                    {
                        var numero = tag.attr("paso");
                        numero = parseInt(numero) + 1;
                        $(tag).parent("form").find(" input[paso='" + numero + "']").focus();
                        //$("#"+formulario+" input[paso='" + numero + "']").focus();
                        return false;
                    }
                    else {
                        if ((event.which == 27) || (event.keyCode == 27))
                        {
                            var numero = tag.attr("paso");
                            numero = parseInt(numero) - 1;
                            $(tag).parent("form").find(" input[paso='" + numero + "']").focus();
                            //$("#"+formulario+" input[paso='" + numero + "']").focus();
                            return false;
                        }
                        else {
                            return true;
                        }
                    }
                }
            }
            
            function Ejecutar(metodo){
                if (event.which || event.keyCode) {
                    if ((event.which == 13) || (event.keyCode == 13))
                    {
                        event.preventDefault();
                        metodo();
                    }
                }
            }
            function BotonDialog(tag){
                if (event.which || event.keyCode) {
                    if ((event.which == 13) || (event.keyCode == 13))
                    {
                        event.preventDefault();
                        $(tag).closest("div").parent("div").find('.ui-dialog-buttonset :button:eq(0)').focus();
                    }
                }
            }
        </script>


    </head>        

    <div id="DivLogin" title="Ingresar al Sistema" style="display: none;">
        <s:form theme="simple" id="FormLogin">
            <s:label value="Nick:"/>
            <s:textfield name="Ousuario.Nick" paso="1" onkeydown="salto($(this));"/>
            <s:label value="Password:"/>
            <s:password name="Ousuario.Password" paso="2" onkeydown="BotonDialog($(this));"/>
        </s:form>
    </div>


    <body id="top">
        <div id="envoltura">
            <div id="head">

                <s:if test="%{#session.Usuario!=null}">
                    <div style="float: right; padding-top: 10px; padding-right: 15px;">
                        <span align="right">Bienvenido: <s:property value="%{#session.Usuario.Nombre}"></s:property></span>
                        <br/>
                        <br/>
                        <span><s:property value="%{#session.ValoresGlobales}"></s:property></span>
                    </div>
                </s:if>
            
                <s:hidden id="msg" name="msg"/>

                <h1><a href="#">Global Buss</a></h1>
                <p>Buses y Carrocerias</p>
                <div id="topnav">
                    <ul>
                        <li><a id="Inicio" class="active" href="/WebAppEmpBus/Vistas/Home/index.jsp">Inicio</a></li>
                        <s:if test="%{#session.Usuario==null}">
                            <li><a id="Mision" href="Mision.jsp">Mision</a></li>
                            <li><a id="Vision" href="Vision.jsp">Vision</a></li>
                            <li><a id="Nosotros" href="Nosotros.jsp">Nosotros</a></li>
                            <li class="last"><a id="Login" href="#">Iniciar Sesion</a></li>
                        </s:if>
                        <s:elseif test="%{#session.Usuario!=null}">
                            <li><a id="Usuarios" href="LoadUsuario">Usuarios</a></li>
                            <li><a id="Ventas" href="../Ventas/index.jsp">Ventas</a></li>
                            <li><a id="Produccion" href="../Produccion/index.jsp">Produccion</a></li>
                            <li><a id="Almacen" href="../Almacen/index.jsp">Almacen</a></li>
                            <li><a id="Logistica" href="../Logistica/index.jsp">Logistica</a></li>
                            <li><a id="Costos" href="../Costos/index.jsp">Costos</a></li>
                            <li><a id="Contabilidad" href="../Contabilidad/index.jsp">Contabilidad</a></li>
                            <li><a id="Contabilidad2" href="../Contabilidad2/index.jsp">Contabilidad2</a></li>
                            <li class="last"><a id="Salir" href="#" onclick="SalirUsuario(); return false;">Salir</a></li>
                        </s:elseif>                
                    </ul>
                </div>

            </div>

            <div class="wrapper col2">



