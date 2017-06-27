<%-- 
    Document   : alterarHospedagem
    Created on : 20/05/2017, 23:11:56
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Hospedagem - ATS-HM</title>
        <%@ include file="../../../../import/head.jsp" %>
        <link rel="stylesheet" href="css/bootstrap-chosen.css"/>
        <script type="text/javascript" src="js/moment.js"></script>
        <script>
            moment().format();
        </script>
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
                                            <li><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                            <li><a href="operadoresCadastrados.html">Operadores Cadastrados</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                            <li><a href="quartosCadastrados.html">Quartos Cadastrados</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown dropdown-lg active">
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
                                                    <li class="active"><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                    <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                    <li><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="dadosEstabelecimento.html"><span class="glyphicon glyphicon-info-sign"></span> Estabelecimento</a></li>
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
                                                    <li><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></li>
                                                    <li><a href="hospedesCadastrados.html">Hóspedes Cadastrados</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hospedagens</li>
                                                    <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li class="active"><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                    <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="dadosEstabelecimento.html"><span class="glyphicon glyphicon-info-sign"></span> Estabelecimento</a></li>
                                    <li><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%; margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="hospedagensCorrentesAlterar.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Alterar Hospedagem</h2>
                            <h3 class="text-center" style="font-size: 25px;">Quarto número ${hospedagem.quarto.numero}</h3>  
                         </div>    
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <div class="row" style="font-size: 16px; margin-bottom: 3%;">
                                <div class="col-md-offset-3 col-md-6 col-xs-12">
                                    <h4 class="text-center" style="font-size: 20px;">Informações do Período:</h4>
                                    <br>
                                    <form role="form" id="formularioAlterar" action="alterarHospedagem.html" method="POST">
                                        <span style="display: none" id="val">${hospedagem.quarto.valorDiaria}</span>
                                        <span style="display: none" id="di">${hospedagem.dataInicial}</span>
                                        <div class="form-group row">
                                            <label for="valorDiaria" class="col-md-4 col-xs-4 col-form-label">Valor da Diária:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" value="${hospedagem.quarto.valorDiaria}" type="text" id="valorDiaria" name="valorDiaria" required="true" maxlength="10" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="dataInicial" class="col-md-4 col-xs-4 col-form-label"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Inicial:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" value="${hospedagem.dataInicial}" type="text" id="dataInicial" name="dataInicial" required="true" maxlength="10" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="horaInicial" class="col-md-4 col-xs-4 col-form-label">Hora Inicial:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" value="${hospedagem.horaInicial}" type="text" placeholder="##:##" required="true" name="horaInicial" id="horaInicial" pattern="([01][0-9]|2[0-3]):[0-5][0-9]" title="##:##" disabled>
                                            </div>
                                        </div>    
                                        <div class="form-group row">
                                            <label for="dataFinal" class="col-md-4 col-xs-4 col-form-label"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Final:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" value="${hospedagem.dataFinal}" type="text" id="dataFinal" name="dataFinal" required="true" maxlength="10" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##" onblur="calcularValorAlterar()">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="horaFinal" class="col-md-4 col-xs-4 col-form-label">Hora Final:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" value="${hospedagem.horaFinal}" type="text" placeholder="##:##" required="true" name="horaFinal" id="horaFinal" pattern="([01][0-9]|2[0-3]):[0-5][0-9]" title="##:##" onblur="calcularValorAlterar()">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="valorHospedagem" class="col-md-4 col-xs-4 col-form-label">Valor da Hospedagem:</label>
                                            <div class="col-md-6 col-xs-8">
                                                <input class="form-control" style="height: 50px;" value="${hospedagem.valorHospedagem}" type="text" placeholder="Valor da Hospedagem" required="true" name="valorHospedagem" id="valorHospedagem">
                                            </div>
                                        </div>
                                        <input class="form-control" value="${hospedagem.cod}" type="hidden" required="true" name="cod" id="cod" maxlength="40" pattern="[0-9]+$" title="Apenas Números"> 
                                        <p style="text-align: center">
                                            <button type="submit" class="btn btn-primary btn-lg">Alterar Hospedagem</button></p>    
                                    </form>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal -->  
            <div class="modal fade" id="confirmAlterar" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Alterar Hospedagem</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja confirmar a alteração da hospedagem?</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center">
                            <button type="button" class="btn btn-primary" id="yesAlterar">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                        </div>
                    </div>
              </div>
            </div>
            
            <!-- Modal -->  
            <div class="modal fade" id="infoAlterar" tabindex="-1" role="dialog" aria-labelledby="infoLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Atenção!</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Falta de informações necessárias para realizar a alteração da hospedagem!</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                        </div>
                    </div>
              </div>
            </div>                                 
                                            
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/calendarioJs.js"></script>
        <script type="text/javascript" src="scripts/mask.js"></script>

        <script type="text/javascript" src="js/chosen.jquery.js"></script>
        <script type="text/javascript" src="scripts/alterarHospedagem.js"></script>
    </body>
</html>
