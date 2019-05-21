var totalPaginas;
var totalElementos;
var numero = 0;
var vagaId = $('#vagaId').val();

$(document).ready(function(){
	pesquisarPagina(numero);
});

function pesquisarPagina(numeroPagina) {
	$.ajax({
		url : '/trabalheconosco/vaga/pesquisa/candidatura',
		type : 'get',
		data: {page : numeroPagina, vagaId : vagaId},
		beforeSend : function(){}
	})
	.done(function(response){
		var listaCandidatura = response["content"];
		totalPaginas = response["totalPages"];
		totalElementos = response["totalElements"];
		numero = response["number"];
		montarTabela(listaCandidatura);
		montarPaginacao(totalPaginas, numero);
	})
	.fail(function(jqXHR, textStatus, msg){});
}

function montarTabela(listaCandidatura) {
	$('#tabelaCandidatura > tbody > tr').remove();
	for (var i = 0; i < listaCandidatura.length; i++) {
		var row = "<tr>";
		    row += "<td>"+ listaCandidatura[i]["candidato"]["nome"] +"</td>";
		    row += "<td>"+ '<a href="/trabalheconosco/candidato/visualizar/informacoes/'+listaCandidatura[i]["candidato"]["id"]+'" class="btn btn-sm btn-secondary"><i class="fas fa-search-plus"></i></a>' +"</td>";
			row += "</tr>";
		$('#tabelaCandidatura').append(row);
	}
}

function montarPaginacao(totalPaginas, numero) {
	$('#paginacao > li ').remove();
	var liInicial = "<li class='page-item'><a class='page-link' href='#' onclick='pesquisarPagina("+0+")'>Primeira</a></li>";
	$("#paginacao").append(liInicial);

	if (totalPaginas > 10) {
		if (numero <= 5) {
			for (var i = 0; i <= numero ; i ++) {
				var active = numero === i ? 'active' : '';
				var li = "<li class='page-item "+active+"'><a class='page-link' href='#' onclick='pesquisarPagina("+i+")'>"+(parseInt(i)+1)+"</a></li>";
				$('#paginacao').append(li);
			}
			for (var i = (numero+1); i < 10 ; i++) {
				var active = numero === i ? 'active' : '';
				var li = "<li class='page-item "+active+"'><a class='page-link' href='#' onclick='pesquisarPagina("+i+")'>"+(parseInt(i)+1)+"</a></li>";
				$('#paginacao').append(li);
			}
		}
		if (numero > 5) {
			for (var i = (numero - 5); i <= numero ; i ++) {
				var active = numero === i ? 'active' : '';
				var li = "<li class='page-item "+active+"'><a class='page-link' href='#' onclick='pesquisarPagina("+i+")'>"+(parseInt(i)+1)+"</a></li>";
				$('#paginacao').append(li);
			}
			var numeroMaximo = ((numero + 5)  > totalPaginas) ? totalPaginas : (numero + 5);
			for (var i = (numero+1); i < numeroMaximo ; i++) {
				var active = numero === i ? 'active' : '';
				var li = "<li class='page-item "+active+"'><a class='page-link' href='#' onclick='pesquisarPagina("+i+")'>"+(parseInt(i)+1)+"</a></li>";
				$('#paginacao').append(li);
			}
		}
	}else{
		for (var i = 0; i < totalPaginas; i++) {
			var active = numero === i ? 'active' : '';
			var li = "<li class='page-item "+active+"'><a class='page-link' href='#' onclick='pesquisarPagina("+i+")'>"+(parseInt(i)+1)+"</a></li>";
			$('#paginacao').append(li);
		}
	}
	var liFinal = "<li class='page-item'><a class='page-link' href='#' onclick='pesquisarPagina("+(parseInt(totalPaginas) -1)+")'>Último</a></li>";
	$("#paginacao").append(liFinal);
}