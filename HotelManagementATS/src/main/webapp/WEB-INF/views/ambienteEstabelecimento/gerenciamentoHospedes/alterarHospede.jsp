<%-- 
    Document   : alterarHospede
    Created on : 20/05/2017, 21:36:45
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Hóspede - ATS-HM</title>
        <%@ include file="../../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../../import/headerEstabelecimento.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                                <c:if test="${not empty administrador and empty operador}">
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Ambiente de Gerenciamento <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                            <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Operadores <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                            <li><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                            <li><a href="alterarExcluirOperador.html">Operadores Cadastrados</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                            <li><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                            <li><a href="alterarDesabilitarQuarto.html">Quartos Cadastrados</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown dropdown-lg active">
                                        <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                        <ul class="dropdown-menu dropdown-menu-lg row">
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hóspedes</li>
                                                    <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                                    <li><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></li>
                                                    <li class="active"><a href="alterarExcluirHospede.html">Hóspedes Cadastrados</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hospedagens</li>
                                                    <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                    <li><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            
                                <c:if test="${not empty operador and empty administrador}">
                                    <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                    <li class="dropdown dropdown-lg active">
                                        <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                        <ul class="dropdown-menu dropdown-menu-lg row">
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hóspedes</li>
                                                    <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                                    <li><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></li>
                                                    <li><a href="alterarExcluirHospede.html">Hóspedes Cadastrados</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hospedagens</li>
                                                    <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="alterarExcluirHospede.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 3%;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 25px;">Alterar Hóspede</h2>
                            <br>
                            <c:if test="${not empty hospede}">
                                <form id="formularioAlterar" role="form" action="alterarHospede.html" method="POST" style="font-size: 16px;">
                                    <div class="form-group row">
                                        <input class="form-control" value="${hospede.cod}" type="hidden" required="true" name="cod" id="cod" maxlength="40" pattern="[0-9]+$" title="Apenas Números">
                                        <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${hospede.nome}" type="text" placeholder="Digite o nome do hóspede" required="true" name="nome" id="nome" maxlength="40">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${hospede.cpf}" type="text" placeholder="###.###.###-##" required="true" name="cpf" id="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="###.###.###-##">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="telCel" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${hospede.telCel}" type="text" placeholder="(##) #####-####" required="true" name="telCel" id="telCel" pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}" title="(##) #####-####">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email" class="col-md-3 col-xs-4 col-form-label">Email: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${hospede.email}" type="text" placeholder="Digite o email do hóspede" required="true" name="email" id="email" maxlength="40">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12 col-xs-12">
                                            <p style="text-align: center">
                                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#confirm">Alterar</button></p>
                                        </div>    
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${empty hospede}">
                                <br><p class="text-center" style="font-size: 16px"><strong>Nenhum hóspede selecionado para alteração!</strong></p>
                            </c:if>    
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Alterar Hóspede</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja confirmar a alteração do hóspede?</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center">
                            <button type="button" class="btn btn-primary" id="yesAlterar">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                        </div>
                    </div>
              </div>
            </div>            
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/mask.js"></script>
    <script type="text/javascript" src="scripts/modalAcao.js"></script>
</html>
