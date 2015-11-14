<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#topnav").find('a').removeClass('active');
        $('#Usuarios').addClass('active');
    });
    
    function ConfirmarPermiso(){
        $.getJSON("ConfirmarPermiso", function(resultado){
            if (resultado.permiso == true){location.href="LoadPermiso";}
            else{Error("No cuenta con permisos para este modulo");}
        })
    }
</script>
    
<style type="text/css">
    a.activo {
        background-color: #294e79;
        color: white;
        font: bold;
    }
</style>
    
<div style="float: right;">
    <ul id="menu">
        <li><a id="mnUsuarios" class="activo" href="LoadUsuario">Usuarios</a></li>
        <li><a id="mnPermisos" href="#" onclick="ConfirmarPermiso(); return false;">Permisos</a></li>
        <li><a id="mnEmpleado" href="LoadEmpleado">Empleados</a></li>
    </ul>    
</div>
