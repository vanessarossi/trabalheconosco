function somenteNumeros(num) {
        var er = /[^0-9]/;
        er.lastIndex = 0;
        var campo = num;
        if (er.test(campo.value)) {
          campo.value = "";
        }
}


function gerarNovaSenha() {
    var cpf = $('#login').val();
    if (cpf != null && cpf != '') {
        $.ajax({
            method: 'GET',
            url: '/trabalheconosco/gerar/senha/'+cpf,
            dataType: "json",
            beforeSend: function(){},
            success: function (result) {},
            error: function () {
                alert("Ocorreu um erro no processamento dos dados.");
            }
        });
        alert("ENVIAMOS UMA NOVA SENHA PARA O E-MAIL CADASTRADO NESTE CPF.");
    }else{
        alert("DIGITE O CPF CADASTRADO NO SISTEMA E CLIQUE EM ESQUECI MINHA SENHA.")
    }
}