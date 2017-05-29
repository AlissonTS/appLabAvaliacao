<%-- 
    Document   : index3
    Created on : 17/05/2017, 11:13:56
    Author     : Alisson
--%>

<%@ include file="../../import/contentType.jsp" %>
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
                        <%@ include file="../../import/menu.jsp" %>  
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav navbar-right">
                              <li><a href="paginaInicial.html">Acesso ao Sistema</a></li>
                              <c:if test="${empty administrador and empty operador}">
                                <li class="active"><a href="cadastroAdministrador.html">Cadastrado de Administrador</a></li>
                              </c:if>
                              <li><a href="sobreAplicacao.html">Sobre a Aplicação</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 2%;">
                            <div class="col-md-offset-3 col-md-6 col-xs-12">
                                <c:if test="${not empty mensagem}">
                                    <div class="alert alert-${tipo}">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        ${mensagem}
                                    </div>
                                </c:if>
                                <h2 class="text-center" style="font-size: 25px;">Cadastro de Administrador</h2>
                                <br>
                                <form role="form" action="cadastrarAdministrador.html" method="POST">
                                    <div class="form-group row">
                                        <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="text" placeholder="Digite seu Nome" required="true" name="nome" id="nome" maxlength="40" pattern="[a-ZA-Zá-úÁ=Ú\s]+$" title="Apenas letras!">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="text" placeholder="###.###.###-##" required="true" name="cpf" id="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="###.###.###-##">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="telFixo" class="col-md-3 col-xs-4 col-form-label">Telefone Fixo (Campo não Obrigatório):  </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="text" placeholder="(##) ####-####" name="telFixo" id="telFixo" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4}" title="(##) ####-####">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="telCel" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="text" placeholder="(##) #####-####" required="true" name="telCel" id="telCel" pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}" title="(##) #####-####">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email" class="col-md-3 col-xs-4 col-form-label">E-mail de Acesso: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="email" placeholder="Digite seu e-mail" required="true" name="email" id="email" maxlength="30">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="senha" class="col-md-3 col-xs-4 col-form-label">Senha: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" type="password" placeholder="Digite sua senha" required="true" name="senha" id="senha" maxlength="20">
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
        <script type="text/javascript" src="scripts/mask.js"></script>
    </body>
</html>
