<%-- 
    Document   : gerenciamentoHospedagens
    Created on : 20/05/2017, 11:28:47
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciamento de Hospedagens - ATS-HM</title>
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
                                <c:if test="${not empty administrador and empty operador}">
                                    <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                    <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                    <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                    <li class="active"><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                    <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            </ul>
                            <c:if test="${not empty operador and empty administrador}">
                                <li><a href="#">Página Principal - Estabelecimento</a></li>
                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                <li><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </c:if>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Gerenciamento de Hospedagens </h2>
                            <br>
                            <div class="row">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="cadastrarClienteForm.html" class="btn btn-link" role="button" style="font-size: 16px; text-decoration: none">Cadastrar Cliente</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="alterarExcluirCliente.html" class="btn btn-link" role="button" style="font-size: 16px; text-decoration: none">Alterar/Excluir Cliente</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="quartosDesocupados.html" class="btn btn-link" role="button" style="font-size: 16px; text-decoration: none">Cadastrar Hospedagem</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="hospedagensCorrentesAlterar.html" class="btn btn-link" role="button" style="font-size: 16px; text-decoration: none">Alterar Hospedagem</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="hospedagensTermino.html" class="btn btn-link" role="button" style="font-size: 16px; text-decoration: none">Hospedagens em Término</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="hospedagensCorrentesGasto.html" class="btn btn-link" role="button" style="font-size: 16px; text-decoration: none">Gerenciar gasto de Quarto</a>
                                </div>
                            </div>
                            <c:if test="${not empty administrador and empty operador}">
                                <div class="row" style="margin-top: 3%">
                                    <div class="col-md-12 col-xs-12" style="text-align: center">
                                        <a href="relatoriosHospedagem.html" class="btn btn-link" role="button" style="font-size: 16px; text-decoration: none">Relatórios de Hospedagem</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../import/js.jsp" %>
    </body>
</html>
