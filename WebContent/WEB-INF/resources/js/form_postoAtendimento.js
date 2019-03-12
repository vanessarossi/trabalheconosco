$(document).ready(function(){

    var codigoUf = $('#estado').val();
    var codCidade = $('#cidadeEscolhida').val();
    if(codigoUf != '' && codigoUf != null){
        $.ajax({
            method: 'GET',
            url: '/trabalheconosco/postoAtendimento/pesquisarCidadePorEstado/'+codigoUf,
            dataType: "json",
            beforeSend: function(){
            },
            success: function (result) {
                $.each(result, function() {
                    seleciona = (codCidade == this.codigoIbge) ? 'selected' : '';

                    option = "<option value='"+this.codigoIbge+"' "+seleciona+">"+this.nome+"</option>";
                    $('#cidade').append(option);
                });
            },
            error: function () {
                alert("Ocorreu um erro no processamento dos dados.");
            }
        });
    }
});