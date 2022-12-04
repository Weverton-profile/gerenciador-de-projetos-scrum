package br.com.gerenciamento.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.gerenciamento.model.MembrosProjeto;

public class MembrosProjetoDAO {
	
	private Connection con;
	
	public MembrosProjetoDAO(Connection con) {
		this.con = con;
	}
	
}
