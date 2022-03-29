/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Produto;

/**
 *
 * @author sala305b
 */
@WebServlet(name = "ProdutosServlet", urlPatterns = {"/ProdutosServlet"})
public class ProdutosServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("acao").equals("editar")) {
            String idproduto = request.getParameter("idproduto");
            String nome = request.getParameter("nome");
            String categoria = request.getParameter("categoria");
            String descricao = request.getParameter("descricao");
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            double preco = Double.parseDouble(request.getParameter("preco"));
            Produto prod = new Produto();
            prod.setId(Long.parseLong(idproduto));
            prod.setNome(nome);
            prod.setCategoria(categoria);
            prod.setDescricao(descricao);
            prod.setQuantidade(quantidade);
            prod.setPreco(preco);
            boolean atualizou = prod.Atualizar();
            if (atualizou) {
                //Somente redireciona a página escolhida
                response.sendRedirect("listar.jsp");
            } else {
                String mensagem
                        = "<h1>Edição não Efetuado com Sucesso</h1>";
                response.getWriter().print(mensagem);
            }
        } else if (request.getParameter("acao").equals("apagar")) {
            int pac = Integer.parseInt(request.getParameter("apagar"));
            Produto.Excluir(pac);
            String mensagem
                    = "<h1>Produto Apagado com Sucesso</h1>";
            response.getWriter().print(mensagem);
        } else {
            response.setContentType("text/html;charset=UTF-8");
            String nome = request.getParameter("nome");
            String categoria = request.getParameter("categoria");
            String descricao = request.getParameter("descricao");
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            double preco = Double.parseDouble(request.getParameter("preco"));
            Produto prod = new Produto();
            prod.setNome(nome);
            prod.setCategoria(categoria);
            prod.setDescricao(descricao);
            prod.setQuantidade(quantidade);
            prod.setPreco(preco);
            long novoid = prod.Cadastrar();
            if (novoid > 0) {
                //Somente redireciona a página escolhida
                response.sendRedirect("listar.jsp");
            } else {
                String mensagem
                        = "<h1>Cadastro não Efetuado com Sucesso</h1>";
                response.getWriter().print(mensagem);
            }
        }
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
