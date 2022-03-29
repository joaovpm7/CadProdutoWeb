<%-- 
    Document   : listar
    Created on : 28/03/2022, 09:04:12
    Author     : sala305b
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Produto> produtos = new Produto().ListarProduto();
        %>
        <table border="1" cellspacing="0" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Categoria</th>
                <th>Descrição</th>
                <th>Quantidade</th>
                <th>Preço</th>
                <th>Data Cadastro</th>
                <th>Ações</th>
            </tr>
            <%
                for (Produto c : produtos) {
                    out.print("<tr>");

                    out.print("<td>");
                    out.print(c.getId());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(c.getNome());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(c.getCategoria());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(c.getDescricao());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(c.getQuantidade());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(c.getPreco());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(c.getDatacadastro());
                    out.print("</td>");

                    out.print("<td>");

                    out.print("<div style='display:inline-block'>");;
                    out.print("<form action='index.jsp' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='editar' />");
                    out.print("<input name='idproduto' type='hidden' value='" + c.getId() + "' />");
                    out.print("<button type='submit'>Editar</button>");
                    out.print("</form>");
                    out.print("</div>");
                    
                    out.print("&nbsp;");
                    out.print("&nbsp;");
                    
                    out.print("<div style='display:inline-block'>");
                    out.print("<form action='ProdutosServlet' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='apagar' />");
                    out.print("<input name='idproduto' type='hidden' value='" + c.getId() + "' />");
                    out.print("<button type='submit'>Deletar</button>");
                    out.print("</form>");
                    out.print("</div>");
                    
                    out.print("</td>");
                    out.print("</tr>");
                }
            %>
        </table>
    </body>
</html>
