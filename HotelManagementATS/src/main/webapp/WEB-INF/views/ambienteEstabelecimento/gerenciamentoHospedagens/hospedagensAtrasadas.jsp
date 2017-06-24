<%-- 
    Document   : hospedagensDiaFinalizar
    Created on : 21/06/2017, 22:39:56
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Hospedagens Atrasadas - ATS-HM</title>
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
                                </c:if>
                            
                                <c:if test="${not empty operador and empty administrador}">
                                    <li><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                    <li class="dropdown dropdown-lg active">
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
                    <div class="row" style="margin-left: 0px; margin-right: 0px; font-size: 16px;">
                        <div class="col-md-12 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Hospedagens Atrasadas</h2>
                            <br>
                            
                            <jsp:useBean id="hospedagemDao" class="br.ufsm.csi.hotelmanagementats.dao.HospedagemDao"/>
                            <c:set value="${hospedagemDao.getHospedagensAtrasadas(estabelecimentoEscolhido)}" var="hospedagens"/>
                            
                            <c:if test="${not empty hospedagens}">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                          <tr>
                                            <th>N� do Quarto</th>
                                            <th>Hor�rio de Entrada</th>
                                            <th>Hor�rio de Sa�da �</th>
                                            <th>Valor da Di�ria</th>
                                            <th>Valor Total �</th>
                                            <th>Mostrar Hospedagem</th>
                                            <th>Finalizar Hospedagem</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach var="hospedagem" items="${hospedagens}">   
                                            <tr>
                                              <td>${hospedagem.quarto.numero}</td>
                                              <td>${hospedagem.dataInicial} - ${hospedagem.horaInicial}</td>
                                              <td>${hospedagem.dataFinal} - ${hospedagem.horaFinal}</td>
                                              <td>${hospedagem.quarto.valorDiaria}</td>
                                              
                                              <c:set value="${hospedagemDao.getTotalGastos(hospedagem)}" var="totalGastos"/>
                                              
                                              <td><c:set var="valor" value="${totalGastos.valorGastos+hospedagem.valorHospedagem}"/><fmt:formatNumber type = "number" maxFractionDigits="2" value="${valor}"/></td>
                                              <td class="text-center"><form action="mostrarHospedagemAtrasada.html" method="POST"><button type="submit" value="${hospedagem.cod}" name="cod" class="btn btn-info">Mostrar</button></form></td>
                                              <td class="text-center"><a href="finalizarHospedagem.html" class="btn btn-default">Finalizar</a></td>
                                            </tr>
                                          </c:forEach>
                                      </tbody>
                                    </table>
                                </div>
                                <br><p class="text-center"><strong>1 - Hor�rio de sa�da desatualizado.</strong></p>
                                <p class="text-center"><strong>2 - Valor total desatualizado.</strong></p>
                                <p class="text-center"><strong>Ser�o atualizados ao finalizar a hospedagem.</strong></p>
                            </c:if>
                            <c:if test="${empty hospedagens}">
                                <br><p class="text-center"><strong>O estabelecimento n�o possui hospedagens atrasadas.</strong></p>
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
