var totalPaginas;
var totalElementos;
var numero = 0;
var textoPesquisa = $("#pesquisa").val();

$(document).ready(function(){
	pesquisarPagina(numero, textoPesquisa);
});


$('#pesquisa').keypress(function() {
	var valorPesquisa = $("#pesquisa").val();
	pesquisarPagina(numero, valorPesquisa);
});


function pesquisarPagina(numeroPagina, textoPesquisa) {
	$.ajax({
		url : '/trabalheconosco/candidato/pesquisa',
		type : 'get',
		data: {page : numeroPagina, textoPesquisa:textoPesquisa},
		beforeSend : function(){}
	})
	.done(function(response){
		var listaCandidato = response["content"];
		totalPaginas = response["totalPages"];
		totalElementos = response["totalElements"];
		numero = response["number"];
		montarTabela(listaCandidato);
		montarPaginacao(totalPaginas, numero);
	})
	.fail(function(jqXHR, textStatus, msg){});
}

function montarTabela(listaCandidato) {
	$('#tabelaCandidato > tbody > tr').remove();
	for (var i = 0; i < listaCandidato.length; i++) {

		var btn = "";
		if (listaCandidato[i]["caminhoAnexo"] != null && listaCandidato[i]["caminhoAnexo"] != '') {
			btn = '<a href="/trabalheconosco/candidato/imprimir/'+listaCandidato[i]["id"]+'" class="btn btn-sm btn-secondary"><i class="fas fa-download"></i></a>' +"</td>";
		}

		var row = "<tr>";
		    row += "<td>"+ listaCandidato[i]["nome"] +"</td>";
		    row += "<td>"+ '<a href="/trabalheconosco/candidato/visualizar/informacoes/'+listaCandidato[i]["id"]+'" class="btn btn-sm btn-secondary"><i class="fas fa-search-plus"></i></a>' +"</td>";
		    row += "<td>"+ btn;
			row += "</tr>";
		$('#tabelaCandidato').append(row);
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