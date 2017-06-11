<%-- 
    Document   : gerenciamentoEstabelecimentos
    Created on : 19/05/2017, 22:53:02
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciamento de Estabelecimentos ADM - ATS-HM</title>
        <%@ include file="../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../import/headerAdm.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                              <li class="active dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Estabelecimentos <span class="caret"></span></a>
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
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 5%">
                        <div class="col-md-offset-3 col-md-6 col-xs-12" style="font-size: 16px;">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Gerenciamento de Estabelecimentos</h2>
                            <br>
                            <div class="row">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="cadastrarEstabelecimentoFormAdm.html" class="btn btn-link" role="button" style="font-size: 20px; text-decoration: none">Cadastrar Estabelecimento</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="escolherEstabelecimentoAlterarAdm.html" class="btn btn-link" role="button" style="font-size: 20px; text-decoration: none">Alterar Estabelecimento</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="escolherEstabelecimentoExcluirAdm.html" class="btn btn-link" role="button" style="font-size: 20px; text-decoration: none">Excluir Estabelecimento</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../import/js.jsp" %>
    </body>
</html>
