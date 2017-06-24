<%-- 
    Document   : finalizarHospedagem
    Created on : 20/05/2017, 23:31:00
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Mostrar Hospedagem - ATS-HM</title>
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
                            <c:if test="${verificador==0}">
                                <a href="hospedagensTermino.html" style="font-size: 16px;">Voltar</a>
                            </c:if>
                            <c:if test="${verificador==1}">
                                <a href="hospedagensAtrasadas.html" style="font-size: 16px;">Voltar</a>
                            </c:if>
                            
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Mostrar Hospedagem</h2>
                            <h3 class="text-center" style="font-size: 25px;">Quarto número ${hospedagemEscolhida.quarto.numero}</h3><br>  
                         </div>    
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-12 col-xs-12">
                            <div class="row" style="font-size: 16px;">
                                <div class="col-md-offset-1 col-md-4 col-xs-12">
                                    <div class="row" style="margin-bottom: 2%;">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 class="text-center" style="font-size: 20px;">Informações Gerais:</h4>
                                            <br>
                                            <div class="row">
                                                <p class="col-xs-4"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Inicial:</p>
                                                <p class="col-xs-8"> ${hospedagemEscolhida.dataInicial} </p>
                                            </div>
                                            <div class="row">
                                                <p class="col-xs-4"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Final:</p>
                                                <p class="col-xs-8"> ${hospedagemEscolhida.dataFinal} </p>
                                            </div>
                                            <div class="row">
                                                <p class="col-xs-4">Hora Inicial:</p>
                                                <p class="col-xs-8"> ${hospedagemEscolhida.horaInicial} </p>
                                            </div>
                                            <div class="row">
                                                <p class="col-xs-4">Hora Final:</p>
                                                <p class="col-xs-8"> ${hospedagemEscolhida.horaFinal} </p>
                                            </div>
                                            <div class="row">
                                                <p class="col-xs-4">Valor da Diária:</p>
                                                <p class="col-xs-8"> ${hospedagemEscolhida.quarto.valorDiaria} </p>
                                            </div>
                                            <div class="row">
                                                <p class="col-xs-4">Valor da Hospedagem:</p>
                                                <p class="col-xs-8"> ${hospedagemEscolhida.valorHospedagem}</p>
                                            </div>
                                            
                                            <jsp:useBean id="hospedagemDao" class="br.ufsm.csi.hotelmanagementats.dao.HospedagemDao"/>
                                            <c:set value="${hospedagemDao.getTotalGastos(hospedagemEscolhida)}" var="totalGastos"/>
                                            
                                            <div class="row">
                                                <p class="col-xs-4">Valor total:</p>
                                                <p class="col-xs-8"><c:set var="valor" value="${totalGastos.valorGastos+hospedagemEscolhida.valorHospedagem}"/><fmt:formatNumber type = "number" maxFractionDigits="2" value="${valor}"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>	
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 style="font-size: 20px;">Hóspedes presentes no quarto:</h4>
                                                <c:if test="${not empty hospedagemEscolhida.hospedes}">
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-hover">
                                                          <thead>
                                                            <tr>
                                                              <th>Nome do Hóspede</th>
                                                              <th>CPF</th>
                                                            </tr>
                                                          </thead>
                                                          <tbody>
                                                            <c:forEach var="hospede" items="${hospedagemEscolhida.hospedes}">    
                                                            <tr>
                                                              <th>${hospede.nome}</th>
                                                              <td>${hospede.cpf}</td>
                                                            </tr>
                                                            </c:forEach>
                                                          </tbody>
                                                        </table>
                                                    </div>
                                                </c:if>
                                                <c:if test="${empty hospedagemEscolhida.hospedes}">
                                                    <p class="text-center"><strong>A hospedagem não possui hóspedes vinculados.</strong></p>
                                                </c:if>
                                        </div>    
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12" style="margin-top:5%">
                                            <h4 style="font-size: 20px;">Gastos com serviço de quarto:</h4>
                                            
                                            <c:if test="${totalGastos.valorGastos>0}">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover">
                                                      <thead>
                                                        <tr>
                                                          <th>Descrição</th>
                                                          <th>Valor (R$)</th>
                                                        </tr>
                                                      </thead>
                                                      <tbody>
                                                        <c:forEach var="gasto" items="${hospedagemEscolhida.gastos}">  
                                                            <tr>
                                                              <th>${gasto.descricao}</th>
                                                              <td>${gasto.valor}</td>
                                                            </tr>
                                                        </c:forEach>
                                                      </tbody>
                                                    </table>
                                                </div>
                                            </c:if>
                                            <c:if test="${totalGastos.valorGastos==0}">
                                                <br><p class="text-center"><strong>A hospedagem não possui gastos de quarto cadastrados</strong></p>
                                            </c:if>
                                        </div>    
                                    </div>
                                    <c:if test="${totalGastos.valorGastos>0}">
                                       <div class="row">
                                            <p class="col-xs-6">Total de gastos - Serviço de Quarto:</p>
                                            <p class="col-xs-6"> R$ ${totalGastos.valorGastos}</p>
                                        </div> 
                                    </c:if> 
                                </div>	
                            </div>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
</html>
