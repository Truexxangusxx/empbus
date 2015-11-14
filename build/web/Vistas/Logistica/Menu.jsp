<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#topnav").find('a').removeClass('active');
        $('#Logistica').addClass('active');
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
        <li><a id="mnClienteProveedor" href="LoadClienteProveedor">Cliente Proveedor</a></li>
        <li><a id="mnSucursal" href="LoadSucursal">Sucursal</a></li>
        <li><a id="mnAlmacen" href="LoadAlmacen">Almacen</a></li>
        <li><a id="mnOrdenCompra" href="LoadOrdenCompra">Orden de Compra</a></li>
        <li><a id="mnOrdenServicio" href="LoadOrdenServicio">Orden de Servicio</a></li>
    </ul>
</div>
