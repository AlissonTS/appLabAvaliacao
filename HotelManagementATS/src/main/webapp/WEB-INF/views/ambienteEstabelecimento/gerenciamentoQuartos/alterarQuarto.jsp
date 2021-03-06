<%-- 
    Document   : alterarQuarto
    Created on : 20/05/2017, 14:57:59
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Quarto - ATS-HM</title>
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
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Ambiente de Gerenciamento <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                        <li><a href="paginaPrincipalAdm.html">P�gina Principal - ADM</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Operadores <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                        <li><a href="operadoresCadastrados.html">Operadores Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                        <li><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                        <li><a href="quartosCadastrados.html">Quartos Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown dropdown-lg">
                                    <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-lg row">
                                        <li class="col-sm-6">
                                            <ul>
                                                <li class="dropdown-header">H�spedes</li>
                                                <li><a href="cadastrarHospedeForm.html">Cadastrar H�spede</a></li>
                                                <li><a href="hospedesCadastrados.html">H�spedes Cadastrados</a></li>
                                            </ul>
                                        </li>
                                        <li class="col-sm-6">
                                            <ul>
                                               <li class="dropdown-header">Hospedagens</li>
                                               <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                               <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                               <li><a href="hospedagensTermino.html">Hospedagens em T�rmino</a></li>
                                               <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                               <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                               <li><a href="relatoriosHospedagem.html">Relat�rios de Hospedagem</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="dadosEstabelecimento.html"><span class="glyphicon glyphicon-info-sign"></span> Estabelecimento</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="quartosCadastrados.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Alterar Quarto</h2>
                            <br>
                            <c:if test="${not empty quartoEscolhido}">
                                <form id="formularioAlterar" role="form" action="alterarQuarto.html" method="POST" style="font-size: 16px;">
                                    <input class="form-control" value="${quartoEscolhido.cod}" type="hidden" required="true" name="cod" id="cod" maxlength="40" pattern="[0-9]+$" title="Apenas N�meros">
                                    <div class="form-group row">
                                        <label for="numero" class="col-md-3 col-xs-4 col-form-label">N�mero de Identifica��o: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${quartoEscolhido.numero}" type="text" placeholder="Digite o n�mero de identifica��o do quarto" required="true" name="numero" id="numero" maxlength="4" pattern="[0-9]+$" title="Apenas N�meros">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="area" class="col-md-3 col-xs-4 col-form-label">�rea do quarto (m�): </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${quartoEscolhido.area}" data-thousands="" data-decimal="."  type="text" placeholder="Digite a �rea do quarto" required="true" name="area" id="area" maxlength="7">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="maxhospedes" class="col-md-3 col-xs-4 col-form-label">M�ximo de h�spedes:  </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${quartoEscolhido.maxHosp}" type="text" placeholder="Digite o m�ximo de h�spedes" name="maxHosp" id="maxHosp" maxlength="3" pattern="[0-9]+$" title="Apenas N�meros">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="valorDiaria" class="col-md-3 col-xs-4 col-form-label">Valor cobrado pela di�ria (R$):</label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" value="${quartoEscolhido.valorDiaria}" data-thousands="" data-decimal="." type="text" placeholder="Digite o valor a ser cobrado pela di�ria" required="true" name="valorDiaria" id="valorDiaria" maxlength="6">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="descricaoExtra" class="col-md-3 col-xs-4 col-form-label">Informa��es extras sobre o quarto (N�o obrigat�rio): </label>
                                        <div class="col-md-8 col-xs-8">
                                            <textarea class="form-control" style="height: 120px;" rows="5" id="descricaoExtra" name="descricaoExtra" maxlength="120" placeholder="Digite informa��es extras sobre o quarto, como por exemplo: mob�lia e servi�os disponibilizados">${quartoEscolhido.descricaoExtra}</textarea>
                                        </div>
                                    </div><!--
                                    <div class="form-group row">
                                        <label for="foto" class="col-md-3 col-xs-4 col-form-label">Selecione fotos do quarto: </label>
                                        <div class="col-md-8 col-xs-8">	                                
                                            <input type="file" name="foto" accept="image/*">
                                        </div>
                                    </div> -->
                                    <div class="form-group row">
                                        <div class="col-md-12 col-xs-12">
                                            <p style="text-align: center">
                                            <button type="submit" class="btn btn-primary btn-lg">Alterar</button></p>
                                        </div>   
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${empty quartoEscolhido}">
                                <br><p class="text-center" style="font-size: 16px"><strong>Nenhum quarto selecionado para altera��o!</strong></p>
                            </c:if>    
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="confirmAlterar" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Alterar Quarto</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja confirmar a altera��o do quarto?</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center">
                            <button type="button" class="btn btn-primary" id="yesAlterar">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">N�o</button></p>
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
