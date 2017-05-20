<%-- 
    Document   : alterarContaOp
    Created on : 20/05/2017, 09:57:56
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Conta Operador - ATS-HM</title>
        <%@ include file="../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="#">Página Principal - Estabelecimento</a></li>
                              <li><a href="#">Gerenciamento de Hospedagens</a></li>
                              <li class="active"><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                              <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="gerenciamentoContaOp.html">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 5%">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Alterar Conta</h2>
                            <br>
                            <form role="form" action="#" method="POST">
                                <div class="form-group row">
                                    <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite seu Nome" required="true" name="nome" id="nome" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="###.###.###-##" required="true" name="cpf" id="cpf">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fixo" class="col-md-3 col-xs-4 col-form-label">Telefone Fixo (Campo não Obrigatório):  </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="(##) ####-####" name="fixo" id="fixo">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="celular" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="(##) #####-####" required="true" name="celular" id="celular">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="nickname" class="col-md-3 col-xs-4 col-form-label">Nickname (Apelido) de Acesso: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite seu Nickname" required="true" name="nickname" id="nickname">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="senha" class="col-md-3 col-xs-4 col-form-label">Senha: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="password" placeholder="Digite sua senha" required="true" name="senha" id="senha">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="senha" class="col-md-3 col-xs-4 col-form-label">Digite a Senha novamente: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="password" placeholder="Digite sua senha novamente" required="true" name="senha" id="senha">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12 col-xs-12">
                                        <p style="text-align: center">
                                        <button type="submit" class="btn btn-primary">Alterar</button></p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/mask.js"></script>
    </body>
</html>
