
$(document).ready(function(){});

$('#estado').change(function (){
	$('#cidade option').remove();
	var codigoUf = $('#estado').val();
	$.ajax({
    	method: 'GET',
    	url: '/trabalheconosco/postoAtendimento/pesquisarCidadePorEstado/'+codigoUf,
    	dataType: "json",
    	beforeSend: function(){
    	},
    	success: function (result) {
        	$.each(result, function() {
        		option = "<option value="+this.codigoIbge+">"+this.nome+"</option>";
				$('#cidade').append(option);
        	});
    	},
    	error: function () {
      		alert("Ocorreu um erro no processamento dos dados.");
    	}
  	});
});