<%-- 
    Document   : alterarOperador
    Created on : 20/05/2017, 14:45:05
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Operador - ATS-HM</title>
        <%@ include file="../../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                                <li><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                <li class="active"><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                <li><a href="paginaPrincipalAdm.html">P�gina Principal - ADM</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="alterarExcluirOperador.html">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Alterar Operador</h2>
                            <br>
                            <form role="form" action="alterarOperador.html" method="POST">
                                <div class="form-group row">
                                    <label for="nome" class="col-xs-4 col-form-label">Nome Completo: </label>
                                    <div class="col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite seu Nome" required="true" name="nome" id="nome" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cpf" class="col-xs-4 col-form-label">CPF: </label>
                                    <div class="col-xs-8">
                                        <input class="form-control" type="text" placeholder="###.###.###-##" required="true" name="cpf" id="cpf">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fixo" class="col-xs-4 col-form-label">Telefone Fixo (Campo n�o Obrigat�rio):  </label>
                                    <div class="col-xs-8">
                                        <input class="form-control" type="text" placeholder="(##) ####-####" name="fixo" id="fixo">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="celular" class="col-xs-4 col-form-label">Telefone Celular:</label>
                                    <div class="col-xs-8">
                                        <input class="form-control" type="text" placeholder="(##) #####-####" required="true" name="celular" id="celular">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="nickname" class="col-xs-4 col-form-label">Nickname de Acesso (Apelido)*: </label>
                                    <div class="col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite nickname de Acesso" required="true" name="nickname" id="nickname" maxlength="40">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="senha" class="col-xs-4 col-form-label">Senha: </label>
                                    <div class="col-xs-8">
                                        <input class="form-control" type="password" placeholder="Digite sua senha" required="true" name="senha" id="senha">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="senha" class="col-xs-4 col-form-label">Digite a senha novamente: </label>
                                    <div class="col-xs-8">
                                        <input class="form-control" type="password" placeholder="Digite sua senha novamente" required="true" name="senha" id="senha">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <p style="text-align: center">
                                    <button type="submit" class="btn btn-primary">Alterar</button></p>
                                </div>
                                <p class="text-center">* Nickname: O nickname ou apelido deve ser �nico ao usu�rio operador, pois � a partir dele que o mesmo possui acesso ao ambiente de gerenciamento do estabelecimento em que ele est� vinculado.</p>
                            </form>    
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/mask.js"></script>
</html>