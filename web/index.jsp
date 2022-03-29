<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String acao = "cadastrar", idproduto = "", nome = "", categoria = "",
            quantidade = "", preco = "", datacadastro = "", descricao = "";

    Produto prod = new Produto();
    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idproduto = request.getParameter("idproduto");
            boolean achou = prod.BuscarPorId(idproduto);
            if (!achou) {
                out.print("<script>"
                        + "window.alert('Cliente não Encontrado');"
                        + "</script>");
            } else {
                //id, nome, categoria, descricao, quantidade, preco, datacadastro
                acao = "editar";
                idproduto = String.valueOf(prod.getId());
                nome = prod.getNome();
                categoria = prod.getCategoria();
                descricao = prod.getDescricao();
                quantidade = String.valueOf(prod.getQuantidade());
                preco = String.valueOf(prod.getPreco());
                datacadastro = String.valueOf(prod.getDatacadastro());
            }
        }
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
    </head>
    <body>
        <form action="ProdutosServlet" method="POST">
            <input type="hidden" name="acao" value="<%= acao %>"
                   <h1>
                Cadastro de Produtos
            </h1>
            <hr size="5">
            <table border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td colspan="2">
                        <label for="">ID:<br></label>
                        <input size="1"
                               value="<%=idproduto%>"
                               type="text"                   
                               name="idproduto"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="txtNomeProduto">Nome Produto:<br></label>
                        <input size="45" 
                               type="text"
                               value="<%=nome%>"
                               id="txtNomeProduto"
                               placeholder="Digite o nome do produto..."
                               name="nome"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="txtCategoria">Categoria:<br></label>
                        <select id="sltCategoria" name="categoria" value="<%=categoria%>">
                            <option <%= categoria.equals("AC") ? "selected": "" %> 
                                value="AC">Acessórios</option>
                            <option <%= categoria.equals("LE") ? "selected": "" %>
                                value="EL">Eletrônicos</option>
                            <option <%= categoria.equals("GM") ? "selected": "" %>
                                value="GM">Games</option>
                            <option <%= categoria.equals("IF") ? "selected": "" %>
                                value="IF">Informática</option>
                            <option <%= categoria.equals("TL") ? "selected": "" %>
                                value="TL">Telefone</option>
                            <option <%= categoria.equals("CM") ? "selected": "" %>
                                value="CM">Cama, Mesa e Banho</option>
                            <option <%= categoria.equals("FM") ? "selected": "" %>
                                value="FM">Ferramentas</option>
                            <option <%= categoria.equals("LV") ? "selected": "" %>
                                value="LV">Livros</option>
                        </select>
                    </td>
                    <td>
                        <table border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <label for="">Quantidade:</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input size="20" 
                                           type="text"
                                           value="<%=quantidade%>"
                                           id="txtQuantidade"
                                           placeholder="Digite a quantidade..."
                                           name="quantidade" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <label>Preço:<br></label>
                                    <input size="20" 
                                           type="number"
                                           value="<%=preco%>"
                                           id="txtPreco"
                                           placeholder="Digite o preço..."
                                           name="preco" />
                                </td>
                            </tr>
                        </table>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="sltDescricao">Descrição:</label><br>
                        <input size="55" 
                               type="text"
                               value="<%=descricao%>"
                               id="txtDescricao"
                               placeholder="Digite uma descrição..."
                               name="descricao" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Cadastrar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
