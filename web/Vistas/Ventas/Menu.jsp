<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#topnav").find('a').removeClass('active');
        $('#Ventas').addClass('active');
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
        <li><a id="mnListaPrecio" href="LoadListaPrecio">Precios</a></li>
        <li>
            <a id="mnCotizacion" href="LoadCotizacion">Cotizacion</a>
        </li>
        <li><a id="mnTipoCambio" href="LoadTipoCambio">Tipo de Cambio</a></li>
    </ul>    
</div>
