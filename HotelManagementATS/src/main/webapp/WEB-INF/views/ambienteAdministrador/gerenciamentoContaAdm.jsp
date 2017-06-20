<%-- 
    Document   : gerenciamentoContaAdm
    Created on : 19/05/2017, 23:16:42
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciamento de Conta ADM - ATS-HM</title>
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
                              <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Estabelecimentos <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="cadastrarEstabelecimentoFormAdm.html">Cadastrar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoAlterarAdm.html">Alterar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoExcluirAdm.html">Excluir Estabelecimento</a></li>
                                </ul>  
                              </li>
                              <li class="active"><a href="gerenciamentoContaAdm.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
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
                            <h2 class="text-center" style="font-size: 28px;">Gerenciamento de Conta</h2>
                            <br>
                            <p class="text-center">Nome Completo: ${administrador.nome}</p>
                            <p class="text-center">CPF: ${administrador.cpf}</p>
                            <p class="text-center">Telefone Celular: ${administrador.telCel}</p>
                            <p class="text-center">Telefone Fixo: ${administrador.telFixo}</p>
                            <p class="text-center">Email de Acesso: ${administrador.email}</p>
                            <div class="row" style="margin-top: 5%">
                                <div class="col-md-12 col-xs-12" style="text-align: center;">
                                    <a href="alterarContaAdmForm.html" class="btn btn-primary btn-lg" role="button">Alterar Conta</a>
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
