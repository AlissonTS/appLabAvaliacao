<%-- 
    Document   : hospedagensCorrentesGasto
    Created on : 20/05/2017, 23:43:36
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciar Gasto de Quarto - ATS-HM</title>
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
                                                    <li><a href="alterarExcluirHospede.html">Hóspedes Cadastrados</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hospedagens</li>
                                                    <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                    <li class="active"><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
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
                                                    <li class="active"><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
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
                                <a href="gerenciamentoHospedagens.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px; font-size: 16px;">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Gerenciar gasto de Quarto</h2>
                            <h3 class="text-center" style="font-size: 25px;">Hospedagens Correntes</h3>
                            <br>
                            
                            <jsp:useBean id="hospedagemDao" class="br.ufsm.csi.hotelmanagementats.dao.HospedagemDao"/>
                            <c:set value="${hospedagemDao.getHospedagensCorrentes(estabelecimentoEscolhido)}" var="hospedagens"/>
                            
                            <c:if test="${not empty hospedagens}">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                          <tr>
                                            <th>N° do Quarto</th>
                                            <th>Horário de Entrada</th>
                                            <th>Horário de Saída</th>
                                            <th>Valor da Diária</th>
                                            <th>Total de Gastos</th>
                                            <th>Valor Total</th>
                                            <th>Gerenciar Gasto de Quarto</th>
                                          </tr>
                                        </thead>
                                        <c:forEach var="hospedagem" items="${hospedagens}"> 
                                            <tr>
                                              <th>${hospedagem.quarto.numero}</th>
                                              <td>${hospedagem.dataInicial} - ${hospedagem.horaInicial}</td>
                                              <td>${hospedagem.dataFinal} - ${hospedagem.horaFinal}</td>
                                              <td>${hospedagem.quarto.valorDiaria}</td>
                                              
                                              <c:set value="${hospedagemDao.getTotalGastos(hospedagem)}" var="totalGastos"/>
                                              <c:if test="${totalGastos.valorGastos>0}">
                                                  <td>${totalGastos.valorGastos}</td>
                                              </c:if>
                                              <c:if test="${totalGastos.valorGastos==0}">
                                                  <td>Sem gastos de quarto</td>
                                              </c:if>
                                              <td>${totalGastos.valorGastos+hospedagem.valorHospedagem}</td>
                                              <td class="text-center"><a href="gerenciarGastoQuarto.html" class="btn btn-default" role="button">Gerenciar</a></td>
                                             </tr>
                                        </c:forEach>     
                                      </tbody>
                                    </table>
                                </div> 
                            </c:if>
                            <c:if test="${empty hospedagens}">
                                <br><p class="text-center"><strong>O estabelecimento não possui hospedagens em andamento.</strong></p>
                            </c:if>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
</html>
