
$(document).ready(function(){

	$('input').keypress(function (e) {
        var code = null;
        code = (e.keyCode ? e.keyCode : e.which);                
        return (code == 13) ? false : true;
   });

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
                    seleciona = (codCidade == this.id) ? 'selected' : '';

                    option = "<option value='"+this.id+"' "+seleciona+">"+this.nome+"</option>";
                    $('#cidade').append(option);
                });
            },
            error: function () {
                alert("Ocorreu um erro no processamento dos dados.");
            }
        });
    }
});


function somenteNumeros(num) {
        var er = /[^0-9]/;
        er.lastIndex = 0;
        var campo = num;
        if (er.test(campo.value)) {
          campo.value = "";
        }
}

// adicionar experiencia profissional
function adicionarExperienciaProfissional() {
    var nomeEmpresa = $('#nomeEmpresa').val();
    var nomeCargo = $('#nomeCargo').val();
    var dataInicio = $('#dataInicioExperienciaProfissional').val();
    var dataFim = $('#dataFimExperienciaProfissional').val();
    var contadorExperienciasProfissionais = $('#contadorExperienciasProfissionais').val();

    var totalLinhasTabela = $('#tabelaExperienciaProfissional tbody tr').length;
    if (nomeEmpresa != null && nomeEmpresa != '' && nomeCargo != null && nomeCargo != '' && dataInicio != null && dataInicio != '' ) {
       if (totalLinhasTabela <= 3) {
             var row = "<tr id='experienciaProfissional"+contadorExperienciasProfissionais+"'>";
                row += "<input type='hidden' name=experienciasProfissionais["+contadorExperienciasProfissionais+"].nomeEmpresa value='"+nomeEmpresa+"'>";
                row += "<input type='hidden' name=experienciasProfissionais["+contadorExperienciasProfissionais+"].nomeCargo value='"+nomeCargo+"'>";
                row += "<input type='hidden' name=experienciasProfissionais["+contadorExperienciasProfissionais+"].dataInicio value="+dataInicio+">";
                row += "<input type='hidden' name=experienciasProfissionais["+contadorExperienciasProfissionais+"].dataFim value="+dataFim+">";
                row += "<td>" + nomeEmpresa + "</td>";
                row += "<td>" + nomeCargo + "</td>";
                row += "<td>" + dataInicio + "</td>";
                row += "<td>" + dataFim + "</td>";
                row += "<td>";
                row += '<a class="btn btn-sm btn-danger" onclick="deletarExperienciaProfissional('+contadorExperienciasProfissionais+',0)"><span class="fas fa-trash-alt"></span></a>';
                row += "</td>";
                row += "</tr>";
                $('#tabelaExperienciaProfissional').append(row);
                $('#nomeEmpresa').val("");
                $('#nomeCargo').val("");
                $('#dataInicioExperienciaProfissional').val("");
                $('#dataFimExperienciaProfissional').val("");
                $('#contadorExperienciasProfissionais').val(parseInt(contadorExperienciasProfissionais) + 1);
       }else{
            alert("LIMITE DE EXPERIENCIA PROFISSIONAL ATINGIDO.");
       }
    }else{
        alert("ALERTA! ESTÁ FALTANDO ALGUMA INFORMAÇÃO.");
    }
};


// adicionar formações academicas
function adicionarFormacaoAcademica() {
    var nivelFormacao = $('#nivelFormacao').val();
    var nivelFormacaoTexto = $('#nivelFormacao :selected').text();
    var instituicao = $('#instituicaoFormacaoAcademica').val();
    var nomeCurso = $('#nomeCursoFormacaoAcademica').val();
    var dataInicio = $('#dataInicioFormacaoAcademica').val();
    var dataFim = $('#dataFimFormacaoAcademica').val();
    var contadorFormacoesAcademica = $('#contadorFormacoesAcademica').val();

    if (nivelFormacao != null && nivelFormacao != '' && instituicao != null && instituicao != '' && nomeCurso != null && nomeCurso != '' && dataInicio != null && dataInicio != '' ) {
        var row = "<tr id='formacaoAcademica"+contadorFormacoesAcademica+"'>";
        row += "<input type='hidden' name=formacoesAcademicas["+contadorFormacoesAcademica+"].nivelFormacao.id value='"+nivelFormacao+"'>";
        row += "<input type='hidden' name=formacoesAcademicas["+contadorFormacoesAcademica+"].instituicao  value='"+instituicao+"'>";
        row += "<input type='hidden' name=formacoesAcademicas["+contadorFormacoesAcademica+"].nomeCurso value='"+nomeCurso+"'>";
        row += "<input type='hidden' name=formacoesAcademicas["+contadorFormacoesAcademica+"].dataInicio value="+dataInicio+">";
        row += "<input type='hidden' name=formacoesAcademicas["+contadorFormacoesAcademica+"].dataFim  value="+dataFim+">";
        row += "<td>" + nivelFormacaoTexto + "</td>";
        row += "<td>" + instituicao + "</td>";
        row += "<td>" + nomeCurso + "</td>";
        row += "<td>" + dataInicio + "</td>";
        row += "<td>" + dataFim + "</td>";
        row += "<td>";
        row += '<a class="btn btn-sm btn-danger" onclick="deletarFormacaoAcademica('+contadorFormacoesAcademica+',0)"><span class="fas fa-trash-alt"></span></a>';
        row += "</td>";
        row += "</tr>";
        $('#tabelaFormacoesAcademica').append(row);
        $('#nivelFormacao').val("");
        $('#instituicaoFormacaoAcademica').val("");
        $('#nomeCursoFormacaoAcademica').val("");
        $('#dataInicioFormacaoAcademica').val("");
        $('#dataFimFormacaoAcademica').val("");
        $('#contadorFormacoesAcademica').val(parseInt(contadorFormacoesAcademica) + 1);
    }else{
        alert("ALERTA! ESTÁ FALTANDO ALGUMA INFORMAÇÃO.");
    }
};


// adicionar cursos
function adicionarCurso() {
    var nomeCurso = $('#nomeCurso').val();
    var instituicao = $('#instituicaoCurso').val();
    var dataInicio = $('#dataInicioCurso').val();
    var dataFim = $('#dataFimCurso').val();
    var contadorCursos = $('#contadorCursos').val();

    if (nomeEmpresa != null && nomeEmpresa != '' && nomeCargo != null && nomeCargo != '' && dataInicio != null && dataInicio != '' ) {
        var row = "<tr id='curso"+contadorCursos+"'>";
        row += "<input type='hidden' name=cursos["+contadorCursos+"].nome id=nomeCurso"+contadorCursos+" value='"+nomeCurso+"'>";
        row += "<input type='hidden' name=cursos["+contadorCursos+"].instituicao id=instituicaoCurso"+contadorCursos+" value='"+instituicao+"'>";
        row += "<input type='hidden' name=cursos["+contadorCursos+"].dataInicio id=dataInicioCurso"+contadorCursos+" value="+dataInicio+">";
        row += "<input type='hidden' name=cursos["+contadorCursos+"].dataFim id=dataFimCurso"+contadorCursos+" value="+dataFim+">";
        row += "<td>" + nomeCurso + "</td>";
        row += "<td>" + instituicao + "</td>";
        row += "<td>" + dataInicio + "</td>";
        row += "<td>" + dataFim + "</td>";
        row += "<td>";
        row += '<a class="btn btn-sm btn-danger" onclick="deletarCurso('+contadorCursos+',0)"><span class="fas fa-trash-alt"></span></a>';
        row += "</td>";
        row += "</tr>";
        $('#tabelaCursos').append(row);
        $('#nomeCurso').val("");
        $('#instituicaoCurso').val("");
        $('#dataInicioCurso').val("");
        $('#dataFimCurso').val("");
        $('#contadorCursos').val(parseInt(contadorCursos) + 1);
    }else{
        alert("ALERTA! ESTÁ FALTANDO ALGUMA INFORMAÇÃO.");
    }
};

function deletarFormacaoAcademica(contador, id) {
   if (parseInt(id) == 0) {
        $('#formacaoAcademica'+contador).remove();
    }else{
    	$('#formacaoAcademica'+contador).remove();
        $.ajax({
            url: '/trabalheconosco/candidato/deletar/formacaoAcademica/'+id,
            type: "GET",
            dataType: 'json',
            beforeSend: function(){},
            success: function (result){},
            error: function () {
                alert("Ocorreu um erro no processamento dos dados.");
            }
        });
    }
};

function deletarCurso(contador, id) {
    if (parseInt(id) == 0) {
        $('#curso'+contador).remove();
    }else{
    	$('#curso'+contador).remove();
        $.ajax({
            url: '/trabalheconosco/candidato/deletar/curso/'+id,
            type: "GET",
            dataType: 'json',
            beforeSend: function(){},
            success: function (result) {},
            error: function () {
                alert("Ocorreu um erro no processamento dos dados.");
            }
        });
        $('#curso'+contador).remove();
    }
};

function deletarExperienciaProfissional(contador, id) {
    if (parseInt(id) == 0) {
            $('#experienciaProfissional'+contador).remove();
        }else{
        	$('#experienciaProfissional'+contador).remove();
            $.ajax({
                url: '/trabalheconosco/candidato/deletar/experienciaProfissional/'+id,
                type: "GET",
                dataType: 'json',
                beforeSend: function(){},
                success: function (result){},
                error: function () {
                    alert("Ocorreu um erro no processamento dos dados.");
                }
            });
        }
}