
$(document).ready(function(){

  	$('.cpf').mask('000.000.000-00', {reverse: true});
  	$('.cep').mask('00000-000');
  	$('.data').mask('00/00/0000');
  	$('.telefone').mask('(00) 0000-0000');
  	$('.celular').mask('(00) 00000-0000');


	var mask = function (val) {
	  return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
	},
	options = {
	  onKeyPress: function(val, e, field, options) {
	      field.mask(mask.apply({}, arguments), options);
	    }
	};


  	$('.contato').mask(mask, options);
});
