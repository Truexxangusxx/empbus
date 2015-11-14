<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#topnav").find('a').removeClass('active');
        $('#Almacen').addClass('active');
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
        <li><a id="mnTipoMovimiento" href="LoadTipoMovimiento">Tipo de Movimiento</a></li>
        <li><a id="mnIngreso" href="LoadIngreso">Ingresos</a></li>
        <li><a id="mnSalida" href="LoadSalida">Salidas</a></li>
        <li><a id="mnPedido" href="LoadPedido">Pedidos</a></li>
    </ul>
</div>
