<%-- 
    Document   : alterarEstabelecimentoFormAdm
    Created on : 20/05/2017, 09:45:20
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Cadastrar Estabelecimento ADM - ATS-HM</title>
        <%@ include file="../../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../../import/headerAdm.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                              <li class="active dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Estabelecimentos</a>
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="gerenciamentoEstabelecimentosAdm.html">Gerenciamento de Estabelecimentos</a></li>
                                  <li><a href="cadastrarEstabelecimentoFormAdm.html">Cadastrar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoAlterarAdm.html">Alterar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoExcluirAdm.html">Excluir Estabelecimento</a></li>
                                </ul>  
                              </li>
                              <li><a href="gerenciamentoContaAdm.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                              <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="gerenciamentoEstabelecimentosAdm.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 5%">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Alterar Estabelecimento</h2>
                            <br>
                            <c:if test="${not empty estabelecimento}">
                               <form role="form" action="alterarEstabelecimentoAdm.html" method="POST" style="font-size:16px;">
                                    <div class="form-group row">
                                        <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" type="text" value="${estabelecimento.nome}" placeholder="Digite o nome do Estabelecimento" required="true" name="nome" id="nome" maxlength="40">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cnpj" class="col-md-3 col-xs-4 col-form-label">CNPJ: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" type="text" value="${estabelecimento.cnpj}" placeholder="##.###.###/####-##" required="true" name="cnpj" id="cnpj" pattern="\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}" title="99.999.999/9999-99" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="telFixo" class="col-md-3 col-xs-4 col-form-label">Telefone Fixo:  </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" type="text" value="${estabelecimento.telFixo}" placeholder="(##) ####-####" name="telFixo" id="telFixo" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4}" title="(##) ####-####">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12 col-xs-12">
                                            <p style="text-align: center">
                                            <button type="submit" class="btn btn-primary btn-lg">Alterar</button></p>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${empty estabelecimento}">
                                <br><p class="text-center" style="font-size: 16px"><strong>Nenhum estabelecimento selecionado para alteração!</strong></p>
                            </c:if>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/mask.js"></script>
    </body>
</html>
