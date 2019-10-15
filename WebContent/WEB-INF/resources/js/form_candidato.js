$(document).ready(function(){
	$('input').keypress(function (e) {
        var code = null;
        code = (e.keyCode ? e.keyCode : e.which);                
        return (code == 13) ? false : true;
   });

});

function somenteNumeros(num) {
	var er = /[^0-9]/;
        er.lastIndex = 0;
    var campo = num;
    if (er.test(campo.value)) {
          campo.value = "";
    }
}
