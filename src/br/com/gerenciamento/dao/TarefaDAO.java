package br.com.gerenciamento.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.gerenciamento.model.Tarefa;

public class TarefaDAO {
	
	private Connection con;
	
	public TarefaDAO(Connection con) {
		this.con = con;
	}

}
