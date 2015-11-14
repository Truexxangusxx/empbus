<jsp:include page="../MasterPage/Superior.jsp" />

<script type="text/javascript">
    $(document).ready(function () {
        
        $('#Inicio').addClass('active');
        $('#Mision').removeClass('active');
        $('#Vision').removeClass('active');
        $('#Nosotros').removeClass('active');
        
    });
    
    function Siguiente(imagen, index){
        var img = '../../images/Galeria/'+imagen+'.jpg';
        $('#FondoPresentacion').fadeOut(400,function(){
            $('#imgPresentacion').attr('src', img);
        });
        $('#FondoPresentacion').fadeIn(400);
        
        $('#Contenido1').fadeOut(0);
        $('#Contenido2').fadeOut(0);
        $('#Contenido3').fadeOut(0);
        
        $('#Contenido'+index).fadeIn(400);
    }
    
</script>


Bienvenidos a la pagina de Emp Buses ...

<br/>
<br/>
<div style="float: left;">
    <table style="border: 2px solid #294e79; -moz-border-radius: 15px 15px 15px 15px;-webkit-border-radius: 15px 15px 15px 15px;">
        <tr>
            <td><div id="FondoPresentacion"><img id="imgPresentacion" width="450px" height="450px" src="../../images/Galeria/bus1.jpg"></div></td>
            <td>
                <table>
                    <tr>
                        <td><a href="#" onclick="Siguiente('bus1',1);return false;"><img width="150px" height="145px" src="../../images/Galeria/bus1.jpg"></a></td>
                    </tr>
                    <tr>
                        <td><a href="#" onclick="Siguiente('bus2',2);return false;"><img width="150px" height="145px" src="../../images/Galeria/bus2.jpg"></a></td>
                    </tr>
                    <tr>
                        <td><a href="#" onclick="Siguiente('bus3',3);return false;"><img width="150px" height="145px" src="../../images/Galeria/bus3.jpg"></a></td>
                    </tr>
                </table>
            </td>
        </tr>    
    </table>
</div>
<div style="float: left;">
    &nbsp;
</div>
<div id="Contenido1" style="float: left; padding: 10px 10px 10px 10px;border: 2px solid #294e79; -moz-border-radius: 15px 15px 15px 15px;-webkit-border-radius: 15px 15px 15px 15px; width: 500px; min-height: 300px; min-width: 350px;">
    <p><h1>Nuevo Modelo de Bus Urbano</h1><p>
        <p>Les presentamos el nuevo modelo que esta disponible en nuestro stock de producto, para mayor inofrmacion comunicarse con el area de ventas.</p>
</div>
<div id="Contenido2" style="float: left; padding: 10px 10px 10px 10px;border: 2px solid #294e79; -moz-border-radius: 15px 15px 15px 15px;-webkit-border-radius: 15px 15px 15px 15px; width: 500px; display: none; min-height: 300px; min-width: 350px;">
    <p><h1>Nuevo Modelo de Bus Escolar</h1><p>
        <p>Les presentamos el nuevo modelo de transporte escolar que esta disponible en nuestro stock de producto, para mayor inofrmacion comunicarse con el area de ventas.</p>
</div>
<div id="Contenido3" style="float: left; padding: 10px 10px 10px 10px;border: 2px solid #294e79; -moz-border-radius: 15px 15px 15px 15px;-webkit-border-radius: 15px 15px 15px 15px; width: 500px; display: none; min-height: 300px; min-width: 350px;">
    <p><h1>Nueva y Moderna Planta de Produccion</h1><p>
        <p>Tenemos el agrado de presentarles nuestra nueva planta de produccion la cual cuenta con equipo de ultima generacion para una mayor eficiencia en nuestros servicios.</p>
</div>
<br style="clear: both;"/>

<jsp:include page="../MasterPage/Inferior.jsp" />