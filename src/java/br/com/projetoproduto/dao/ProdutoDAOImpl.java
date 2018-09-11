/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetoproduto.dao;

import br.com.projetoproduto.model.Produto;
import br.com.projetoproduto.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC 05
 */
public class ProdutoDAOImpl implements GenericDAO {

    private Connection conexao;

    public ProdutoDAOImpl() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso!");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Produto produto = (Produto) objeto;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO produto(descricaoProduto,marcaProduto,"
                + "valorProduto) VALUES (?, ?, ?)";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, produto.getDescricaoProduto());
            stmt.setString(2, produto.getMarcaProduto());
            stmt.setFloat(3, produto.getValorProduto());
            stmt.execute();

            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar produto! Erro" + ex.getMessage());
            return false;
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os parâmetros de conexão! " + ex.getMessage());
            }
        }
    }

    @Override
    public Boolean inserir(Object objeto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean alterar(Object objeto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean excluir(int idObject) {
        PreparedStatement stmt = null;

        String sql = "DELETE FROM produto WHERE idproduto = ?";
        try {
            stmt = conexao.prepareStatement(sql);

            stmt.setInt(1, idObject);
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao excluir usuários! Erro: " + ex.getMessage());
            return false;
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os parâmetros de conexão!! Erro " + ex.getMessage());
            }
        }
    }

    @Override
    public Object carregar(int numero) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> Listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "select * from produto ";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Produto oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setDescricaoProduto(rs.getString("descricaoProduto"));
                oProduto.setMarcaProduto(rs.getString("marcaProduto"));
                oProduto.setValorProduto(rs.getFloat("valorProduto"));
                resultado.add(oProduto);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar produto! Erro:"
                    + ex.getMessage());
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os "
                        + "parâmetros de conexão! Erro: "
                        + ex.getMessage());
            }
        }
        return resultado;

    }

}
