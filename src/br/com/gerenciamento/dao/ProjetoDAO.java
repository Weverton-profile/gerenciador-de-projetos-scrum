package br.com.gerenciamento.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import br.com.gerenciamento.model.Projeto;

public class ProjetoDAO {
	
	private Connection con;
	
	public ProjetoDAO(Connection con) {
		this.con = con;
	}
	
}
