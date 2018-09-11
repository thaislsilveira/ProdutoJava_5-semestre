<%-- 
    Document   : listarProduto
    Created on : 06/09/2018, 08:59:20
    Author     : PC 05
--%>

<%@page import="br.com.projetoproduto.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciaamento de Usuários</title>
    </head>
    <body>
        <h1 align="center">Fatec Jales</h1>
        <hr>
        <table align="center" border="1">
            
            <tr>
                <td colspan="6" align="center"> Listar de Usuários</td>
            </tr>
            <tr>
                <th align="center">ID</th>
                <th align="center">Nome</th>
                <th align="center">Data Nascimento</th>
                <th align="center">Login</th>
                <th aligin="center" colspan="2">Editar</th>
            </tr>
            <%
                List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                for (Produto produto: produtos){
                    
            %>
            <tr>
                <td align="center"><%=produto.getIdProduto()%></td>
                <td align="center"><%=produto.getDescricaoProduto()%></td>
                <td align="center"><%=produto.getMarcaProduto()%></td>
                <td align="center"><%=produto.getValorProduto()%></td>
                <td align="center"><a href="ExcluirProduto?idProduto=<%=produto.getIdProduto()%>">Excluir</a></td>
                <td align="center"><a href="CarregarProduto?idProduto=<%=produto.getIdProduto()%>">Carregar</a></td>
            </tr>
            
            <% } %>
            
            <tr>
                <td align="center" colspan="6"><h5><a href="index.jsp">Voltar</a></h5></td>
            </tr>
        </table>
    </body>
</html>
