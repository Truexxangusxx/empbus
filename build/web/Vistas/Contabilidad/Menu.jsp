<script type="text/javascript">
    
    $(document).ready(function () {        
        jQuery("#topnav").find('a').removeClass('active');
        $('#Contabilidad').addClass('active');
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
        <li><a id="mnProvision" href="LoadProvision">Provision</a></li>
        <li><a id="mnFactura" href="LoadFactura">Factura</a></li>
        <li><a id="mnGuia" href="LoadGuia">Guia</a></li>
        <li><a id="mnAsiento" href="LoadAsiento">Asientos</a></li>
        <li><a id="mnTipoCompra" href="TipoCompra.jsp">Tipo Compra</a></li>
        <li><a id="mnTipoAdquisicion" href="TipoAdquisicion.jsp">Tipo Adquisicion</a></li>
        <li><a id="mnIGV" href="IGV.jsp">IGV</a></li>
        <li><a id="mnPercepcion" href="Percepcion.jsp">Percepcion</a></li>
        <li><a id="mnRenta" href="Renta.jsp">Renta</a></li>
        <li><a id="mnAporte" href="Aporte.jsp">Aporte</a></li>
        <li><a id="mnTasa" href="Tasa.jsp">Tasa</a></li>
        <li><a id="mnPeriodo" href="Periodo.jsp">Periodo</a></li>
        <li><a id="mnCuenta" href="LoadCuenta">Cuenta</a></li>
        <li><a id="mnPuntoVenta" href="LoadPuntoVenta">Punto de venta</a></li>
        <li><a id="mnTipoVenta" href="LoadTipoVenta">Tipo de venta</a></li>
        <li><a id="mnTipoDocumento" href="LoadTipoDocumento">Tipo de documento</a></li>
        <li><a id="mnServicio" href="LoadServicio">Servicio</a></li>
        <li><a id="mnSubdiario" href="LoadSubdiario">Subdiario</a></li>
    </ul>
</div>
