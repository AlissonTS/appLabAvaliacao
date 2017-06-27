<%-- 
    Document   : gerenciamentoContaOp
    Created on : 20/05/2017, 10:00:38
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciamento de Conta Operador - ATS-HM</title>
        <%@ include file="../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../import/headerEstabelecimento.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                              <li><a href="quartosEstabelecimento.html">Quartos do Estabelecimento</a></li>
                              <li class="dropdown dropdown-lg">
                                <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                <ul class="dropdown-menu dropdown-menu-lg row">
                                    <li class="col-sm-6">
                                        <ul>
                                            <li class="dropdown-header">Hóspedes</li>
                                            <li><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></li>
                                            <li><a href="hospedesCadastrados.html">Hóspedes Cadastrados</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-sm-6">
                                        <ul>
                                            <li class="dropdown-header">Hospedagens</li>
                                            <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                            <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                            <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                            <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                            <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                        </ul>
                                    </li>
                                </ul>
                              </li>
                              <li><a href="dadosEstabelecimento.html"><span class="glyphicon glyphicon-info-sign"></span> Estabelecimento</a></li>
                              <li class="active"><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
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
                            <p class="text-center">Nome Completo: ${operador.nome}</p>
                            <p class="text-center">CPF: ${operador.cpf}</p>
                            <p class="text-center">Telefone Celular: ${operador.telCel}</p>
                            <p class="text-center">Telefone Fixo: ${operador.telFixo}</p>
                            <p class="text-center">Nickname (Apelido) de Acesso: ${operador.nickname}</p>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center;">
                                    <a href="alterarContaOp.html" class="btn btn-primary btn-lg" role="button">Alterar Conta</a>
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
