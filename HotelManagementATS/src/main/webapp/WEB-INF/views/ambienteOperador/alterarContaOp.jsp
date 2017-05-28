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
                              <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                              <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
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
                            <form role="form" action="alterarOperadorLogado.html" method="POST">
                                <div class="form-group row">
                                    <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" value="${operador.nome}" placeholder="Digite seu Nome" required="true" name="nome" id="nome" maxlength="40" pattern="[a-z\s]+$" title="Apenas letras!">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" value="${operador.cpf}" placeholder="###.###.###-##" required="true" name="cpf" id="cpf" pattern="\d{3}\#\d{3}\#\d{3}#\d{2}" title="###.###.###-##" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="telFixo" class="col-md-3 col-xs-4 col-form-label">Telefone Fixo (Campo não Obrigatório):  </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" value="${operador.telFixo}" placeholder="(##) ####-####" name="telFixo" id="telFixo" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4}" title="(##) ####-####">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="telCel" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" value="${operador.telCel}" placeholder="(##) #####-####" required="true" name="telCel" id="telCel" pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}" title="(##) #####-####">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="nickname" class="col-md-3 col-xs-4 col-form-label">Nickname (Apelido) de Acesso: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" value="${operador.nickname}" placeholder="Digite seu Nickname" required="true" name="nickname" id="nickname" maxlength="12" pattern='[a-zA-Z0-9]+' title="Apenas números e letras!">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="redefinir" class="col-md-3 col-xs-4 col-form-label">Redefinir Senha? </label>
                                    <div class="col-md-8 col-xs-8">
                                        <select class="form-control" id="redefinir" name="redefinir">
                                            <option value="Não">Não</option>
                                            <option value="Sim">Sim</option>
                                        </select>
                                    </div>
                                </div>    
                                <div class="form-group row" id="inputOculto">
                                    <label for="senha" class="col-md-3 col-xs-4 col-form-label">Digite sua nova Senha: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="password" placeholder="Digite sua nova senha" required="true" name="senha" id="senha" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row" id="inputOculto2">
                                    <label for="senhaN" class="col-md-3 col-xs-4 col-form-label">Digite sua nova Senha novamente: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="password" placeholder="Digite sua nova senha novamente" required="true" name="senhaN" id="senhaN">
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
        <script type="text/javascript" src="scripts/hiddenForm.js"></script>
    </body>
</html>
