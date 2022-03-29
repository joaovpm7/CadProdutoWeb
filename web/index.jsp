<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idproduto = "", nome = "", categoria = "",
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
            <input type="hidden" name="acao" value="editar"
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
                            <option value="AC">Acessórios</option>
                            <option value="EL">Eletrônicos</option>
                            <option value="GM">Games</option>
                            <option value="IF">Informática</option>
                            <option value="TL">Telefone</option>
                            <option value="CM">Cama, Mesa e Banho</option>
                            <option value="FM">Ferramentas</option>
                            <option value="LV">Livros</option>
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
                    <td colspan="4" style="text-align: center;">
                        <input type="submit" value="Cadastrar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
