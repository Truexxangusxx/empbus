/*
Paginacion: pagina una tabla de acuerdo a la cantidad de filas que se indiquen.
Autor: Carlos Medina Carranza
Nick: @Angus
 */


$(document).ready(function (){
                
                IniciarPagina();
                
            })

            function IniciarPagina(div){
                var number;
                number = $("#"+div+" .number").val();
                var count = 0;
                count = $("#"+div+" .ParaPaginar tr").length;
                
                $("#"+div+" .ParaPaginar tr").hide();
                $("#"+div+" .ParaPaginar tr").each(function (index) {
                    if (index < number) {$(this).show();}
                });

                $("#"+div+" .indice").val("1");
                $("#"+div+" .count").val(count);
            }
                       
            function toleft(div){
                var x = $("#"+div+" .number").val();
                $("#"+div+" .ParaPaginar tr").each(function (index) {
                    if (index >= 0 && index < x) {$(this).fadeIn(1200);}
                    else {$(this).hide();}
                })
                $("#"+div+" .indice").val(1);
            }
            
            function left(div){
                var indice = $("#"+div+" .indice").val();
                var x = $("#"+div+" .number").val();

                if (indice == 1) {  }
                else {
                    indice--;
                    $("#"+div+" .ParaPaginar tr").each(function (index) {
                        if (index >= (indice - parseInt(1))*x && index < indice*x) {$(this).fadeIn(1200);}
                        else {$(this).hide();}
                    })
                    $("#"+div+" .indice").val(indice);
                }
            }
            function rigth(div){
                var indice = $("#"+div+" .indice").val();
                var count = $("#"+div+" .count").val();
                var x = $("#"+div+" .number").val();

                if (indice * x >= count) {}
                else {
                    $("#"+div+" .ParaPaginar tr").each(function (index) {
                        if (index >= x*indice && index < x*(parseInt(indice) + parseInt(1))) {$(this).fadeIn(1200);}
                        else {$(this).hide();}
                    })
                    indice++;
                    $("#"+div+" .indice").val(indice);
                }
            }
            function torigth(div){
                var count = $("#"+div+" .count").val();
                var x = $("#"+div+" .number").val();
                var indice = $("#"+div+" .indice").val();

                if (indice * x >= count) {}
                else {
                    $("#"+div+" .ParaPaginar tr").each(function (index) {
                        if (index >= x*(Math.ceil(count / x)-parseInt(1))) {$(this).fadeIn(1200);}
                        else {$(this).hide();}
                    })
                    $("#"+div+" .indice").val(Math.ceil(count / x));
                }
            }