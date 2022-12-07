<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value="/entrada" var="linkEntradaServlet"/>
<form class="form" action="${linkEntradaServlet}" method="post">
	<label for="nome">Nome de Usuario:</label><br>
	<input type="text" name="nome" id="" required="required"><br>
	<label for="email">E-mail:</label><br>
	<input type="email" name="email" id="" required="required"><br>
	<label for="">Senha:</label><br>
	<input type="password" name="senha" id="" required="required">
	<input type="hidden" name="action" value="Inscricao">
	<a href="/gerenciamento_de_projetos/entrada?action=Logar">já possuo uma conta</a>
	<input type="submit">
</form>