<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#topnav").find('a').removeClass('active');
        $('#Produccion').addClass('active');
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
        <li><a id="mnFamilia" href="LoadFamilia">Familia</a></li>
        <li><a id="mnTipoProducto" href="LoadTipoProducto">Tipos de Producto</a></li>
        <li><a id="mnProducto" href="LoadProducto">Producto</a></li>
        <li><a id="mnOrdenProduccion" href="LoadOrdenProduccion">Orden Produccion</a></li>
        <li><a id="mnEstandar" href="LoadEstandar">Estandar o Kit</a></li>
    </ul>    
</div>
