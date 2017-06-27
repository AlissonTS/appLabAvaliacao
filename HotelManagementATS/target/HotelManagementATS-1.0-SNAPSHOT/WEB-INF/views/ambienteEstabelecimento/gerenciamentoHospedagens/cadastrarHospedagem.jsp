<%-- 
    Document   : cadastrarHospedagem
    Created on : 20/05/2017, 22:27:52
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Cadastrar Hospedagem - ATS-HM</title>
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
                                                    <li class="active"><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
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
                                                    <li class="active"><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
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
                                <a href="quartosDesocupados.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Hospedagem</h2>
                            <h3 class="text-center" style="font-size: 25px;">Quarto número ${quarto.numero}</h3>   
                         </div>    
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <div class="row" style="font-size: 16px; margin-bottom: 3%;">
                                <div class="col-md-offset-3 col-md-6 col-xs-12">
                                    <span style="display: none" id="max">${quarto.maxHosp}</span>
                                    <span style="display: none" id="val">${quarto.valorDiaria}</span>
                                    <h4 class="text-center" style="font-size: 20px;">Informações do Período:</h4>
                                    <br>
                                    <div class="form-group row">
                                            <label for="valorDiaria" class="col-md-4 col-xs-4 col-form-label">Valor da Diária:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" value="${quarto.valorDiaria}" type="text" id="valorDiaria" name="valorDiaria" required="true" maxlength="10" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##" disabled>
                                            </div>
                                        </div>
                                    <div class="form-group row" id="dataFinal-Div">
                                        <label for="dataFinal" class="col-md-4 col-xs-4 col-form-label"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Final:</label>
                                        <div class="col-md-5 col-xs-8">
                                            <input form="formularioCadastrar" class="form-control" style="height: 50px;" type="text" id="dataFinal" name="dataFinal" required="true" maxlength="10" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##" onblur="calcularValor()">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="horaFinal" class="col-md-4 col-xs-4 col-form-label">Hora Final:</label>
                                        <div class="col-md-5 col-xs-8">
                                            <input form="formularioCadastrar" class="form-control" style="height: 50px;" type="text" placeholder="##:##" required="true" name="horaFinal" id="horaFinal" pattern="([01][0-9]|2[0-3]):[0-5][0-9]" title="##:##" onblur="calcularValor()">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="valorHospedagem" class="col-md-4 col-xs-4 col-form-label">Valor da Hospedagem:</label>
                                        <div class="col-md-6 col-xs-8">
                                            <input form="formularioCadastrar" class="form-control" style="height: 50px;" type="text" placeholder="Valor da Hospedagem" required="true" name="valorHospedagem" id="valorHospedagem" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                            <div class="row" style="font-size: 16px;">
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row" style="margin-bottom: 3%;">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 class="text-center" style="font-size: 20px;">Insira os Hóspedes:</h4>
                                                <br>
                                                <div class="form-group row">
                                                    <label for="hospedes" class="col-md-4 col-xs-4 col-form-label">Hóspedes:</label>
                                                        <div class="col-md-8 col-xs-8">
                                                            <select data-placeholder="Escolha um Hóspede" class="chosen-select" tabindex="2" id="hospedes" style="height: 50px;">
                                                                <option></option>
                                                                <c:forEach var="hospede" items="${hospedes}"> 
                                                                    <option value="${hospede.cod}">${hospede.nome} - ${hospede.cpf}</option>
                                                                </c:forEach>
                                                            </select><br><br>
                                                            <button type="button" class="btn btn-default" onclick="adicionarHospede()">Adicionar Hóspede</button>
                                                        </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>	
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12" style="margin-top:0%">
                                            <h4 style="font-size: 20px;">Hóspedes adicionados:</h4>
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-hover" id="hospedes-tabela">
                                                  <thead>
                                                    <tr>
                                                      <th>Nome do Hóspede</th>
                                                      <th>CPF</th>
                                                      <th>Retirar Hóspede</th>
                                                    </tr>
                                                  </thead>
                                                  <tbody></tbody>
                                                </table>
                                                <p>Máximo de hóspedes que o quarto pode hospedar: ${quarto.maxHosp}</p>
                                                <p id="quantidadeHospedes">Quantidade: 0</p>
                                            </div>
                                        </div>    
                                    </div>
                                </div>	
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 2%; margin-bottom: 3%;">
                        <div class="col-lg-offset-3 col-lg-6">
                            <form id="formularioCadastrar" role="form" action="cadastrarHospedagem.html" method="POST">
                                <input class="form-control" value="${quarto.cod}" type="hidden" required="true" name="cod" id="cod" maxlength="40" pattern="[0-9]+$" title="Apenas Números">
                                <p style="text-align: center">
                                <button type="submit" class="btn btn-success btn-lg">Cadastrar Hospedagem</button></p>
                            </form>
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal -->  
            <div class="modal fade" id="confirmCadastrar" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Cadastrar Hospedagem</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja confirmar o cadastro da hospedagem?</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center">
                            <button type="button" class="btn btn-primary" id="yesCadastrar">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                        </div>
                    </div>
              </div>
            </div>
            
            <!-- Modal -->  
            <div class="modal fade" id="infoCadastrar" tabindex="-1" role="dialog" aria-labelledby="infoLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Atenção!</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Falta de informações necessárias para realizar a hospedagem!</p>
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
        <script type="text/javascript" src="scripts/chosenHospedagem.js"></script>
        <script type="text/javascript" src="scripts/cadastroHospedagem.js"></script>
    </body>
</html>
