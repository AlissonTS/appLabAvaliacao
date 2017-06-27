<%-- 
    Document   : paginaPrincipalEstabelecimento
    Created on : 20/05/2017, 11:06:06
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Página Principal Estabelecimento - ATS-HM</title>
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
                                <c:if test="${not empty administrador and empty operador}">
                                    <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Ambiente de Gerenciamento <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li class="active"><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
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
                                                    <li><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="dadosEstabelecimento.html"><span class="glyphicon glyphicon-info-sign"></span> Estabelecimento</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                                <c:if test="${not empty operador and empty administrador}">    
                                    <li class="active"><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
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
                                    <li><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-left: 0px; margin-right: 0px;">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Página Principal - Estabelecimento </h2>
                            <br>
                            
                            <div class="row">
                                <div class="col-md-offset-4 col-md-4 col-xs-12">
                                    <div class="form-group text-center">
                                        <a href="quartosDesocupados.html" class="btn btn-default" role="button">Cadastrar Hospedagem</a>
                                        <br><br><br>
                                        <p style="font-size: 16px;"><strong>Visualzar Hospedagens:</strong></p><label for="filtro">Selecione um tipo de filtro:</label>
                                        <select class="form-control" id="filtro">
                                            <option selected disabled hidden>Filtro de Postagens</option>
                                            <option value="1">Hospedagens em Término</option>
                                            <option value="2">Hospedagens Atrasadas</option>
                                            <option value="3">Hospedagens Correntes - Alterar</option>
                                        </select>
                                    </div>
                                </div> 
                            </div>
                            
                            <jsp:useBean id="hospedagemDao" class="br.ufsm.csi.hotelmanagementats.dao.HospedagemDao"/>
                            
                            <div class="row" id="hospedagensTermino" style="margin-top: 1%;">
                                <div class="col-md-12 col-xs-12">
                                    <div>
                                        <h2 class="text-center" style="font-size: 24px;">Hospedagens em Término</h2>

                                        <c:set value="${hospedagemDao.getHospedagensTermino(estabelecimentoEscolhido)}" var="hospedagensTermino"/>

                                        <c:if test="${not empty hospedagensTermino}">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="tblHospedagensTermino">
                                                    <thead>
                                                      <tr>
                                                        <th>N° do Quarto</th>
                                                        <th>Horário de Entrada</th>
                                                        <th>Horário de Saída</th>
                                                        <th>Valor da Diária</th>
                                                        <th>Valor Total</th>
                                                        <th>Mostrar Hospedagem</th>
                                                        <th>Finalizar Hospedagem</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                      <c:forEach var="hospedagem" items="${hospedagensTermino}">   
                                                        <tr>
                                                          <th data-numero="${hospedagem.quarto.numero}">${hospedagem.quarto.numero}</th>
                                                          <td data-cod="${hospedagem.cod}">${hospedagem.dataInicial} - ${hospedagem.horaInicial}</td>
                                                          <td>${hospedagem.dataFinal} - ${hospedagem.horaFinal}</td>
                                                          <td>${hospedagem.quarto.valorDiaria}</td>

                                                          <c:set value="${hospedagemDao.getTotalGastos(hospedagem)}" var="totalGastos"/>

                                                          <td><c:set var="valor" value="${totalGastos.valorGastos+hospedagem.valorHospedagem}"/><fmt:formatNumber type = "number" maxFractionDigits="2" value="${valor}"/></td>
                                                          <td class="text-center"><form action="mostrarHospedagemTermino.html" method="POST"><button type="submit" value="${hospedagem.cod}" name="cod" class="btn btn-info">Mostrar</button></form></td>
                                                          <td class="text-center"><button type="button" id="finalizarHospedagem" name="cod" class="btn btn-default" data-toggle="modal" data-target="#confirmFinalizarTermino">Finalizar</button></td>
                                                        </tr>
                                                      </c:forEach>
                                                  </tbody>
                                                </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty hospedagensTermino}">
                                            <br><p class="text-center"><strong>O estabelecimento não possui hospedagens em término no dia*.</strong></p><br>
                                            <p class="text-center"><strong>* Hospedagens que devem ser finalizadas antes de seu horário de término no dia de hoje.</strong></p>
                                        </c:if> 
                                    </div>
                                </div>    
                            </div>
                                        
                            <div class="row" id="hospedagensAtrasadas" style="margin-top: 1%; display: none;">
                                <div class="col-md-12 col-xs-12">            
                                    <div>
                                        <h2 class="text-center" style="font-size: 24px;">Hospedagens Atrasadas</h2>                                

                                        <c:set value="${hospedagemDao.getHospedagensAtrasadas(estabelecimentoEscolhido)}" var="hospedagensAtrasadas"/>

                                        <c:if test="${not empty hospedagensAtrasadas}">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="tblHospedagensAtrasadas">
                                                    <thead>
                                                      <tr>
                                                        <th>N° do Quarto</th>
                                                        <th>Horário de Entrada</th>
                                                        <th>Horário de Saída ¹</th>
                                                        <th>Valor da Diária</th>
                                                        <th>Valor Total ¹</th>
                                                        <th>Mostrar Hospedagem</th>
                                                        <th>Finalizar Hospedagem</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                      <c:forEach var="hospedagem" items="${hospedagensAtrasadas}">   
                                                        <tr>
                                                          <th data-numero="${hospedagem.quarto.numero}">${hospedagem.quarto.numero}</th>
                                                          <td data-cod="${hospedagem.cod}">${hospedagem.dataInicial} - ${hospedagem.horaInicial}</td>
                                                          <td>${hospedagem.dataFinal} - ${hospedagem.horaFinal}</td>
                                                          <td>${hospedagem.quarto.valorDiaria}</td>

                                                          <c:set value="${hospedagemDao.getTotalGastos(hospedagem)}" var="totalGastos"/>

                                                          <td><c:set var="valor" value="${totalGastos.valorGastos+hospedagem.valorHospedagem}"/><fmt:formatNumber type = "number" maxFractionDigits="2" value="${valor}"/></td>
                                                          <td class="text-center"><form action="mostrarHospedagemAtrasada.html" method="POST"><button type="submit" value="${hospedagem.cod}" name="cod" class="btn btn-info">Mostrar</button></form></td>
                                                          <td class="text-center"><button type="button" id="finalizarHospedagem" name="cod" class="btn btn-default" data-toggle="modal" data-target="#confirmFinalizarAtrasada">Finalizar</button></td>
                                                        </tr>
                                                      </c:forEach>
                                                  </tbody>
                                                </table>
                                            </div>
                                            <br><p class="text-center"><strong>1 - Horário de saída e valor total da hospedagem serão atualizados ao finalizar a hospedagem.</strong></p>
                                        </c:if>
                                        <c:if test="${empty hospedagensAtrasadas}">
                                            <br><p class="text-center"><strong>O estabelecimento não possui hospedagens atrasadas.</strong></p>
                                        </c:if>
                                    </div>
                                </div>    
                            </div>
                            
                            <div class="row" id="hospedagensAlterar" style="margin-top: 1%; display: none;">
                                <div class="col-md-12 col-xs-12">
                                    <h2 class="text-center" style="font-size: 24px;">Alterar Hospedagem</h2>
                                    <h3 class="text-center" style="font-size: 21px;">Hospedagens Correntes</h3>
                                    <br>
                                    <c:set value="${hospedagemDao.getHospedagensCorrentes(estabelecimentoEscolhido)}" var="hospedagensAlterar"/>

                                    <c:if test="${not empty hospedagensAlterar}">
                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                  <tr>
                                                    <th>N° do Quarto</th>
                                                    <th>Horário de Entrada</th>
                                                    <th>Horário de Saída</th>
                                                    <th>Valor da Diária (R$)</th>
                                                    <th>Valor da Hospedagem (R$)</th>
                                                    <th>Mostrar Hóspedes</th>
                                                    <th>Alterar Hospedagem</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="hospedagem" items="${hospedagensAlterar}"> 
                                                        <tr>
                                                          <th>${hospedagem.quarto.numero}</th>
                                                          <td>${hospedagem.dataInicial} - ${hospedagem.horaInicial}</td>
                                                          <td>${hospedagem.dataFinal} - ${hospedagem.horaFinal}</td>
                                                          <td>${hospedagem.quarto.valorDiaria}</td>
                                                          <td>${hospedagem.valorHospedagem}</td>
                                                          <td class="text-center"><form action="hospedesQuartoHospedagemAlterar.html" method="POST"><button type="submit" value="${hospedagem.cod}" name="cod" class="btn btn-info">Mostrar</button></form></td>
                                                          <td class="text-center"><form action="alterarHospedagemForm.html" method="POST"><button type="submit" value="${hospedagem.cod}" name="cod" class="btn btn-primary">Alterar</button></form></td>
                                                        </tr>
                                                    </c:forEach>   
                                              </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty hospedagensAlterar}">
                                        <br><p class="text-center"><strong>O estabelecimento não possui hospedagens em andamento.</strong></p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal Finalizar Hospedagem em Término -->                            
            <div class="modal fade" id="confirmFinalizarTermino" tabindex="-1" role="dialog" aria-labelledby="confirmFinalizarTerminoLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Finalizar Hospedagem</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja finalizar a hospedagem do quarto número <strong id="numeroQuarto"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioHabilitar" action="finalizarHospedagemTermino.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesQuarto" name="cod">Sim</button>
                               <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>  
            
            <!-- Modal Finalizar Hospedagem Atrasada -->                            
            <div class="modal fade" id="confirmFinalizarAtrasada" tabindex="-1" role="dialog" aria-labelledby="confirmFinalizarAtrasadaLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Finalizar Hospedagem</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja finalizar a hospedagem do quarto número <strong id="numeroQuarto2"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioHabilitar" action="finalizarHospedagemAtrasada.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesQuarto2" name="cod">Sim</button>
                               <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>                              
                                        
           <%@ include file="../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/filtroHospedagens.js"></script>
        <script type="text/javascript" src="scripts/modalAcao.js"></script>
    </body>
</html>
