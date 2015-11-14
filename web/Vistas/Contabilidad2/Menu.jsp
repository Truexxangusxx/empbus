<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#topnav").find('a').removeClass('active');
        $('#Contabilidad2').addClass('active');
    });
    
    
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
        <li><a id="mnClase" href="LoadClase">Clase</a></li>        
        <li><a id="mnNaturaleza" href="LoadNaturaleza">Naturaleza</a></li>        
        <li><a id="mnTipoAuxiliar" href="LoadTipoAuxiliar">Tipo Auxiliar</a></li>        
        <li><a id="mnAjuste" href="LoadAjuste">Ajustes</a></li>        
        <li><a id="mnActividad" href="LoadActividad">Actividad</a></li>        
        <li><a id="mnTipoCambioCuenta" href="LoadTipoCambioCuenta">Tipo Cambio</a></li>
        <li><a id="mnConfiguracionCuenta" href="LoadConfiguracionCuenta">Configuracion de cuentas</a></li>
        <li><a id="mnConfiguracionAlmacen" href="LoadConfiguracionAlmacen">Configuracion de almacen</a></li>
        <li><a id="mnTareo" href="LoadTareo">Tareo</a></li>
        <li><a id="mnConfiguracion" href="LoadConfiguracion">Configuracion</a></li>
    </ul>
</div>
