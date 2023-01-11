package br.com.gerenciamento.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import br.com.gerenciamento.dao.LogDAO;
import br.com.gerenciamento.jdbc.ConnectionFactory;
import br.com.gerenciamento.model.Log;


public class GerarRelatorio implements Acao {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException {
        try (Connection con = new ConnectionFactory().recuperarConexao()) {
            Document documento = new Document(PageSize.A4);
            LogDAO logDao = new LogDAO(con);
            String paramId = req.getParameter("idProjeto");
            Integer id = Integer.valueOf(paramId);
            try {
                //tipo de conteúdo
                resp.reset();
                resp.setContentType("Application/pdf");
                //nome do documento
                resp.addHeader("Content-Disposition", "inline filename"+"relatorio.pdf");
                PdfWriter.getInstance(documento, resp.getOutputStream());
                //abrir o documento
                documento.open();
                documento.addTitle("Relatorio do Projeto");
                documento.add(new Paragraph("Relatorios do Projeto"));
                documento.add(new Paragraph(" "));
                PdfPTable tabela = new PdfPTable(2);
                PdfPCell col1 = new PdfPCell(new Paragraph("Descrição"));
                PdfPCell col2 = new PdfPCell(new Paragraph("Data"));
               
                tabela.addCell(col1);
                tabela.addCell(col2);
                ArrayList<Log> logs = new ArrayList<Log>();
                logs = logDao.listarLogs(id);
                for (Log log : logs) {
                    tabela.addCell(log.getDescricao());
                    tabela.addCell(log.getData());
                }
                documento.add(tabela);
                documento.close();
            } catch (Exception e) {
                System.out.println(e);
                documento.close();
            }
            return null;
        }
    }

}
