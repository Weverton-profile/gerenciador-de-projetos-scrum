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
				<input type="hidden" name="idProjeto" value="${projeto.getId() }">
				<input type="submit">
			</form>
		</div>
	</c:if>
	<h1 class="titulo">${projeto.getNome()}</h1>
	<div class="container-1">
		<div class="todo">
			<c:if test="${projeto.getGerente_id() == idUsuario}">
					<form class="form form-tarefa" action="${linkEntradaServlet}" method="post">
						<label for="nomeTarefa">Nova Tarefa:</label>
						<input type="text" name="nomeTarefa" id="" required="required"><br>
						<label for="nomeTarefa">Tempo da Tarefa:</label>
						<input type="number" name="tempoTarefa" id="" required="required">
						<input type="hidden" name="idProjeto" value="${projeto.getId() }">
						<input type="submit">
					</form>
			</c:if>
		</div>
		<div class="doing">
		</div>
		<div class="done">
		</div>
	</div>
</body>
</html>