<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (request.getAttribute("editar") != null){
        
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
            <h1>
                Cadastro de Produtos
            </h1>
            <hr size="5">
            <table border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td colspan="2">
                        <label for="txtNomeProduto">Nome Produto:<br></label>
                        <input size="45" 
                               type="text"
                               id="txtNomeProduto"
                               placeholder="Digite o nome do produto..."
                               name="nome" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="txtCategoria">Categoria:<br></label>
                        <select id="sltCategoria" name="categoria">
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
                                <td colspan="3">
                                    <label for="">Quantidade:</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input size="20" 
                                           type="text"
                                           id="txtQuantidade"
                                           placeholder="Digite a quantidade..."
                                           name="quantidade" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="1" cellspacing="0" cellpadding="5">
                            <tr>
                                <td colspan="2">
                                    <label>Preço:<br></label>
                                    <input size="20" 
                                           type="text"
                                           id="txtPreco"
                                           placeholder="Digite o preço..."
                                           name="preco" />
                                </td>
                            </tr>
                        </table>
                </tr>
                <tr>
                    <td colspan="3">
                        <label for="sltDescricao">Descrição:</label><br>
                        <input size="55" 
                               type="text"
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
