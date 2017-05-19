<%-- 
    Document   : index3
    Created on : 17/05/2017, 11:13:56
    Author     : Alisson
--%>

<%@ include file="../../import/contentType.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro Administrador - ATS-HM</title>
        <%@ include file="../../import/head.jsp" %>
    </head>
    <body>
        
        <div id="wrapper">
            <%@ include file="../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                          <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
                          <span class="sr-only">Toggle navigation</span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </button>
                      </div>
                      <div class="collapse navbar-collapse" id="menu">
                          <ul class="nav navbar-nav navbar-right">
                            <li><a href="paginaInicial.html">Acesso ao Sistema</a></li>
                            <li class="active"><a href="cadastroAdministrador.html">Cadastrado de Administrador</a></li>
                            <li><a href="sobreAplicacao.html">Sobre a Aplicação</a></li>
                          </ul>
                      </div>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 2%;">
                            <div class="col-md-offset-3 col-md-6 col-xs-12">
                                <h2 class="text-center" style="font-size: 25px;">Cadastro de Administrador</h2>
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
                                        <label for="email" class="col-md-3 col-xs-4 col-form-label">E-mail de Acesso: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="email" placeholder="Digite seu e-mail" required="true" name="email" id="email" maxlength="40">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="senha" class="col-md-3 col-xs-4 col-form-label">Senha: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="password" placeholder="Digite sua senha" required="true" name="senha" id="senha">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12 col-xs-12">
                                            <p style="text-align: center">
                                            <button type="submit" class="btn btn-success">Cadastrar</button></p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
                
            <%@ include file="../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../import/js.jsp" %>
    </body>
</html>
