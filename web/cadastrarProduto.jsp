<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : cadastrarProduto
    Created on : 30/08/2018, 08:48:06
    Author     : PC 05
--%>

<%@page import="br.com.projetoproduto.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Controle de Produto</title>
    </head>
    <body>
        <h1 class="font-weight-light text-primary" align="center">Fatec Jales</h1>
        <hr>
        <c:if test="${not empty mensagem}">
            <div class="container">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>O cadastro .. ${mensagem}</strong> 
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div> 
        </c:if>
        <div class="container">           
            <form action="CadastrarProduto"  method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="descricaoProduto">Descrição:</label>
                        <input type="text" class="form-control" id="descricaoProduto" name="descricaoProduto" value="${produto.descricaoProduto}" >
                    </div>
                    <div class="form-group col-md-6">
                        <label for="marcaProduto">Marca:</label>
                        <input type="text" class="form-control" id="marcaProduto" name="marcaProduto" value="${produto.marcaProduto}" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="valorProduto">Valor:</label>
                    <input  type="text" name="valorProduto" id="valorProduto" class="form-control" value="${produto.valorProduto}" >
                </div>               
                <button type="submit" class="btn btn-primary">Cadastrar</button>
                <a href="index.jsp" class="btn btn-primary">Voltar</a>
            </form>
        </div>       
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>
