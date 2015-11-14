<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="divMensaje" style="display: none; position: absolute; bottom: 80px; right: 20px; ">
    <div class="ui-widget">
        <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;"> 
            <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                <strong>Informacion:</strong>&nbsp;&nbsp;&nbsp;<label id="lblMensaje"></label></p>
        </div>
    </div>
</div>

<div id="divError" style="display: none; position: absolute; bottom: 80px; right: 20px;">
    <div class="ui-widget">
        <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;"> 
            <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span> 
                <strong>Error:</strong>&nbsp;&nbsp;&nbsp;<label id="lblError"></label></p>
        </div>
    </div>
</div>



<div id="loadingScreen" style="display: none;" title="Trabajando">
    <img title="Agregar" src="../../images/loading.gif" width="20px" height="20px"/>&nbsp;&nbsp;&nbsp;Espere un momento ...
</div>



</div>


<div id="footer">

    
</div>

</div>
</body>

</html>
