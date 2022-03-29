package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

/**
 *
 * @author joaovictor
 */
public class Produto {

    private long id;
    private String nome;
    private String categoria;
    private String descricao;
    private int quantidade;
    private double preco;
    private Timestamp datacadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Timestamp getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(Timestamp datacadastro) {
        this.datacadastro = datacadastro;
    }

    public long Cadastrar() {
        try {
            Connection conn = BancoDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "INSERT INTO tb_produto";
            sql += "(nome, categoria, descricao, quantidade, preco)"
                    + " VALUES (?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getCategoria());
            ps.setString(3, this.getDescricao());
            ps.setInt(4, this.getQuantidade());
            ps.setDouble(5, this.getPreco());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final int lastId = rs.getInt(1);
                    System.out.println("O numero do id é:"
                            + lastId);
                    return lastId;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public List<Produto> ListarProduto() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM tb_produto; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Produto> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //id, nome, categoria, descricao, quantidade, preco, datacadastro
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setDescricao(rs.getString("descricao"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setPreco(rs.getDouble("preco"));
                p.setDatacadastro(rs.getTimestamp("datacadastro"));
                lista.add(p);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public static boolean Excluir(long id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "DELETE FROM tb_produto  WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("Apagou!!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

    public boolean BuscarPorId(String id) {
        try {
            long idprod = Long.parseLong(id);
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM tb_produto WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idprod);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                //id, nome, categoria, descricao, quantidade, preco, datacadastro
                this.setId(rs.getInt("id"));
                this.setNome(rs.getString("nome"));
                this.setCategoria(rs.getString("categoria"));
                this.setDescricao(rs.getString("descricao"));
                this.setQuantidade(rs.getInt("quantidade"));
                this.setPreco(rs.getDouble("preco"));
                this.setDatacadastro(rs.getTimestamp("datacadastro"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean Atualizar() {
        try {
            Connection conn = BancoDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            //id, nome, categoria, descricao, quantidade, preco, datacadastro
            String sql = "UPDATE tb_produto ";
            sql += " SET nome = ?, ";
            sql += " categoria = ?, ";
            sql += " descricao = ?, ";
            sql += " quantidade = ?, ";
            sql += " preco = ? ";
            sql += " WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getCategoria());
            ps.setString(3, this.getDescricao());
            ps.setInt(4, this.getQuantidade());
            ps.setDouble(5, this.getPreco());
            ps.setLong(6, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("atualizou!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
}
