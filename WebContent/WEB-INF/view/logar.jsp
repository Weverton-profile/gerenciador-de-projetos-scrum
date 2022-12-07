<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value="/entrada" var="linkEntradaServlet"/>
<form class="form" action="${linkEntradaServlet}" method="post">
	<label for="email">E-mail:</label><br>
	<input type="email" name="email" id="" required="required"><br>
	<label for="">Senha:</label><br>
	<input type="password" name="senha" id="" required="required">
	<input type="hidden" name="action" value="Login">
	<a href="/gerenciamento_de_projetos/entrada?action=CadastrarNovoUsuario">não tenho uma conta ainda</a>
	<input type="submit">
</form>