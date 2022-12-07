package br.com.gerenciamento.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.gerenciamento.jdbc.ConnectionFactory;

public class Projetos implements Acao {
	
	public String executa(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
		try (Connection con = new ConnectionFactory().recuperarConexao()) {
			return "forward:projetos.jsp";
		}	
	}
	
}
