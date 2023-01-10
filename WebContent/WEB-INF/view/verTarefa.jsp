<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/entrada" var="linkEntradaServlet"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://kit.fontawesome.com/bf175f9272.js"></script>
<style><%@include file="./css/ver_tarefa/style.css"%></style>
<title>Gerenciador de Projetos</title>
</head>
<body>
    <header class="header">
        <div class="logo">
            <h2>Gerenciador de Projetos</h2>
            <i class="fa-solid fa-list-check"></i>
        </div>
        	<ul>
                <li class="login-logout">
                    <a href="entrada?action=Logout">Sair</a>
                </li>
        	</ul>
        <div class="clear"></div>

    </header>
	<c:if test="${projeto.getGerente_id() == idUsuario}">
		<div class="opcoes-gerente">
			<form class="form" action="${linkEntradaServlet}" method="post">
				<label for="stringUsuario">Adicionar Membro:</label>
				<input type="text" name="stringUsuario" id="" required="required" placeholder="Buscar Usuario">
				<input type="hidden" name="action" value="BuscarUsuario">
				<input type="hidden" name="idProjeto" value="${projeto.getId() }">
				<input type="submit">
			</form>
		</div>
	</c:if>
	<div class="opcoes-projeto">
		<a href="" class="opcoes-projeto-btn">Finalizar Projeto</a>
		<a href="" class="opcoes-projeto-btn">Relatorio <i class="fa-solid fa-file-pdf"></i></a>
	</div>
	<h1 class="titulo">${projeto.getNome()}</h1>
	<div class="container-1">
		<div class="todo">
			<c:if test="${projeto.getGerente_id() == idUsuario}">
					<form class="form form-tarefa" action="${linkEntradaServlet}" method="post">
						<label for="nomeTarefa">Nova Tarefa:</label>
						<input type="text" name="nomeTarefa" id="" required="required"><br>
						<label for="nomeTarefa">Tempo da Tarefa:</label>
						<input type="hidden" name="action" value="NovaTarefa">
						<input type="number" name="tempoTarefa" id="" required="required">
						<input type="hidden" name="idProjeto" value="${projeto.getId() }">
						<input type="submit">
					</form>
			</c:if>
			<c:forEach items="${tarefas}" var="tarefa">
				<c:if test="${tarefa.getAndamento().equals('PARA FAZER')}">
					<div class="card">
						<div>
							${tarefa.getNome()} | ${tarefa.getTempo()}H estimado
							<div class="links">
								<a class="avanco" href="">FAZENDO</a>
								<c:if test="${projeto.getGerente_id() == idUsuario}">
									<a href="entrada?action=ExcluirTarefa&andamento=${tarefa.getAndamento() }&idTarefa=${tarefa.getId() }&idProjeto=${projeto.getId()}"><i class="excluir fa-solid fa-trash"></i></a>
								</c:if>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="doing">
			<c:forEach items="${tarefas}" var="tarefa">
				<c:if test="${tarefa.getAndamento().equals('FAZENDO')}">
					<div class="card">
						<div>
							${tarefa.getNome()}
							<div class="links">
								<c:if test="${tarefa.getMembro_id() == idUsuario}">
									<a class="avanco" href="">FEITO</a>
								</c:if>
								<c:if test="${projeto.getGerente_id() == idUsuario}">
									<a href="entrada?action=ExcluirTarefa&andamento=${tarefa.getAndamento() }&idTarefa=${tarefa.getId()}&idProjeto=${projeto.getId()}"><i class="excluir fa-solid fa-trash"></i></a>
								</c:if>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="done">
			<c:forEach items="${tarefas}" var="tarefa">
				<c:if test="${tarefa.getAndamento().equals('FEITO')}">
					<div class="card">
						<div>
							${tarefa.getNome()}
							<div class="links">
								<i class="feito fa-solid fa-circle-check"></i>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<h4 class="titulo">Membros do Projeto:</h4>
	<div class="membros">
		<c:forEach items="${usuarios}" var="usuario">
			<c:if test="${usuario.getId() != idUsuario}">
				<div class="card-membro">
					<c:if test="${usuario.getId() == projeto.getGerente_id()}">
						<span>Administrador : ${usuario.getNomeUsuario()}</span> 
					</c:if>
					<c:if test="${usuario.getId() != projeto.getGerente_id()}">
						<span>${usuario.getNomeUsuario()}</span>
					</c:if>
					 - <span>${usuario.getEmail()}</span> 
					<c:if test="${projeto.getGerente_id() == idUsuario}">
						- <a href="entrada?action=ExcluirDoProjeto&idProjeto=${idProjeto}&usuarioId=${usuario.getId()}"><i class="excluir fa-solid fa-trash"></i></a>
					</c:if>
				</div>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>