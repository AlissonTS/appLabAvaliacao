<%-- 
    Document   : relatoriosHospedagem
    Created on : 20/05/2017, 21:55:17
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Relatórios de Hospedagem - ATS-HM</title>
        <%@ include file="../../../../import/head.jsp" %> 
        <link rel="stylesheet" href="css/cssPrintRelatorio.css">
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
                                                <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                                <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                <li class="active"><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
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
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Relatórios de Hospedagem</h2>  
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-4 col-md-4 col-xs-12">
                            <br>
                            <form role="form" action="gerarRelatorioHospedagem.html" method="POST">
                                <div class="form-group row">
                                    <label for="dataInicial" class="col-md-4 col-xs-4 col-form-label"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Inicial: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input value="${data}" class="form-control" style="height: 50px;" type="text" id="dataInicial" name="dataInicial" required="true" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##">
                                    </div>
                                </div>
                                <div class="form-group row" id="botaoData">
                                    <div class="col-md-12 col-xs-12">
                                        <p style="text-align: center">
                                        <button type="submit" class="btn btn-default">Gerar Relatório</button></p>
                                    </div>
                                </div>    
                            </form>
                        </div>
                    </div>
                                    
                    <c:if test="${not empty relatorio && verificador==1}">
                        <div class="row" style="margin-top: 3%">
                            <div class="col-md-offset-2 col-md-8 col-xs-12">
                                <h4 class="text-center">Relatório Gerado</h4>	
                            </div>
                        </div>	
                        <div class="row">
                            <div class="col-md-offset-2 col-md-8 col-xs-12">
                                <h5 class="text-center">Informações Gerais</h5>	
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-offset-3 col-md-6 col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                      <thead>
                                        <tr>
                                          <th>Total de Quartos</th>
                                          <th>Quartos Ocupados</th>
                                          <th>% de Ocupação</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <jsp:useBean id="quartoDao" class="br.ufsm.csi.hotelmanagementats.dao.QuartoDao"/>
                                        <c:set value="${quartoDao.getQuartosQuantidade(estabelecimentoEscolhido)}" var="quantidadeQuartos"/>
                                        <tr>
                                          <th>${quantidadeQuartos}</th>
                                          <td>${fn:length(relatorio)}</td>
                                          <td><c:set var="valor" value="${(fn:length(relatorio)*100)/quantidadeQuartos}"/>
                                              <fmt:formatNumber type = "number" maxFractionDigits="2" value="${valor}"/>%</td>
                                        </tr>
                                      </tbody>
                                    </table>
                                </div>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-offset-2 col-md-8 col-xs-12">
                                <h5 class="text-center">Lista de Quartos Ocupados</h5>	
                            </div>
                        </div>
                        <div class="row">	
                            <div class="col-md-offset-2 col-md-8 col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                          <tr>
                                            <th>Número do Quarto</th>
                                            <th>Início da Hospedagem</th>
                                            <th>Final da Hospedagem</th>
                                            <th>Total de Gastos (R$)</th>
                                            <th>Valor Total (R$)</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <jsp:useBean id="hospedagemDao" class="br.ufsm.csi.hotelmanagementats.dao.HospedagemDao"/>  
                                          <c:forEach var="hospedagem" items="${relatorio}">
                                            <tr>
                                              <th>${hospedagem.quarto.numero}</th>
                                              <td>${hospedagem.dataInicial} - ${hospedagem.horaInicial}</td>
                                              <td>${hospedagem.dataFinal} - ${hospedagem.horaFinal}</td>
                                              <c:set value="${hospedagemDao.getTotalGastos(hospedagem)}" var="totalGastos"/>
                                              <c:if test="${totalGastos.valorGastos>0}">
                                                  <td>${totalGastos.valorGastos}</td>
                                              </c:if>
                                              <c:if test="${totalGastos.valorGastos==0}">
                                                  <td>Sem gastos de quarto</td>
                                              </c:if>
                                              <td><c:set var="valor" value="${totalGastos.valorGastos+hospedagem.valorHospedagem}"/><fmt:formatNumber type = "number" maxFractionDigits="2" value="${valor}"/></td>
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                    </table>
                                </div>   
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 3%;">	
                            <div class="col-md-12 col-xs-12">
                                <p style="text-align: center">
                                    <input type="button" class="btn btn-success btn-lg" name="print" id="botaoImprimir" value="Imprimir Relatório" onClick="imprimir()" style="margin-top: 1%">
                                </p>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${empty relatorio && verificador==1}">
                        <div class="row" style="margin-top: 3%">
                            <div class="col-md-offset-2 col-md-8 col-xs-12">
                                <br><p class="text-center"><strong>Relatório sem informações em relação à data inserida.</strong></p>
                            </div>
                        </div>
                    </c:if>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/calendarioJs.js"></script>
    <script type="text/javascript" src="scripts/mask.js"></script>
    <script type="text/javascript" src="scripts/imprimir.js"></script>
</html>
