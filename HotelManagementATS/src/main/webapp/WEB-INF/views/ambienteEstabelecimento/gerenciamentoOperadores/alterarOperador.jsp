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
                                <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                <li class="active"><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="alterarExcluirOperador.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Alterar Operador</h2>
                            <br>
                            <c:if test="${not empty operadorEscolhido}">
                                <form role="form" action="alterarOperadorEstabelecimento.html" method="POST" style="font-size: 16px;">
                                    <div class="form-group row">
                                        <input class="form-control" value="${operadorEscolhido.cod}" type="hidden" required="true" name="cod" id="cod" maxlength="40" pattern="[0-9]+$" title="Apenas Números">
                                        <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${operadorEscolhido.nome}" type="text" placeholder="Digite seu Nome" required="true" name="nome" id="nome" maxlength="40" pattern="[a-ZA-Zá-úÁ=Ú\s]+$" title="Apenas letras!">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${operadorEscolhido.cpf}" type="text" placeholder="###.###.###-##" required="true" name="cpf" id="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="###.###.###-##" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="telFixo" class="col-md-3 col-xs-4 col-form-label">Telefone Fixo (Campo não Obrigatório):  </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${operadorEscolhido.telFixo}" type="text" placeholder="(##) ####-####" name="telFixo" id="telFixo" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4}" title="(##) ####-####">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="telCel" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${operadorEscolhido.telCel}" type="text" placeholder="(##) #####-####" required="true" name="telCel" id="telCel" pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}" title="(##) #####-####">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="nickname" class="col-md-3 col-xs-4 col-form-label">Nickname de Acesso (Apelido)*: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${operadorEscolhido.nickname}" type="text" placeholder="Digite nickname de Acesso" required="true" name="nickname" id="nickname" maxlength="12" pattern='[a-zA-Z0-9]+' title="Apenas números e letras!">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="redefinir" class="col-md-3 col-xs-4 col-form-label">Redefinir Senha? </label>
                                        <div class="col-md-8 col-xs-8">
                                            <select class="form-control" id="redefinir" name="redefinir" style="height: 50px;">
                                                <option value="Não">Não</option>
                                                <option value="Sim">Sim</option>
                                            </select>
                                        </div>
                                    </div>    
                                    <div class="form-group row" id="inputOculto">
                                        <label for="senha" class="col-md-3 col-xs-4 col-form-label">Digite sua nova Senha: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" type="password" placeholder="Digite sua nova senha" required="true" name="senha" id="senha" maxlength="30">
                                        </div>
                                    </div>
                                    <div class="form-group row" id="inputOculto2">
                                        <label for="senhaN" class="col-md-3 col-xs-4 col-form-label">Digite sua nova Senha novamente: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" type="password" placeholder="Digite sua nova senha novamente" required="true" name="senhaN" id="senhaN">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12" id="avisoDiv">
                                            <div class="alert alert-danger">
                                                <a data-dismiss="alert"></a><p id="avisoContent"></p>
                                            </div>    
                                        </div>  
                                    </div>     
                                    <div class="form-group row">
                                        <div class="col-md-12 col-xs-12">
                                            <p style="text-align: center">
                                            <button type="submit" class="btn btn-primary btn-lg">Alterar</button></p>
                                        </div>
                                    </div>
                                    <p class="text-center">* Nickname: O nickname ou apelido deve ser único ao usuário operador, pois é a partir dele que o mesmo possui acesso ao ambiente de gerenciamento do estabelecimento em que ele está vinculado.</p>
                                </form>
                            </c:if>
                            <c:if test="${empty operadorEscolhido}">
                                <br><p class="text-center" style="font-size: 15px"><strong>Nenhum operador selecionado para alteração!</strong></p>
                            </c:if>        
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/mask.js"></script>
    <script type="text/javascript" src="scripts/hiddenForm.js"></script>
</html>
