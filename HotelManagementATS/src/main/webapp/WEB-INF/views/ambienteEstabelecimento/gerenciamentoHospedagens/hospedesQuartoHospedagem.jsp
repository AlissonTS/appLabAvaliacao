<%-- 
    Document   : hospedesQuartoHospedagem
    Created on : 22/06/2017, 00:20:28
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Hóspedes Quarto - ATS-HM</title>
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
                                                    <li class="active"><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
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
                                                    <li class="active"><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
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
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="hospedagensCorrentesGasto.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px; font-size: 16px; text-align: center;">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Gerenciar gasto de Quarto</h2>
                            <c:if test="${not empty hospedagemEscolhida}">
                                <h3 class="text-center" style="font-size: 25px;">Hóspedes presentes no quarto ${hospedagemEscolhida.quarto.numero}</h3>
                                <br>
                                <c:if test="${not empty hospedagemEscolhida.hospedes}">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover">
                                          <thead>
                                            <tr>
                                              <th>Nome do Hóspede</th>
                                              <th>CPF</th>
                                              <th>Email</th>
                                              <th>Telefone Celular</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <c:forEach var="hospede" items="${hospedagemEscolhida.hospedes}">    
                                            <tr>
                                              <th>${hospede.nome}</th>
                                              <td>${hospede.cpf}</td>
                                              <td>${hospede.email}</td>
                                              <td>${hospede.telCel}</td>
                                            </tr>
                                            </c:forEach>
                                          </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty hospedagemEscolhida.hospedes}">
                                    <p class="text-center"><strong>A hospedagem não possui hóspedes vinculados.</strong></p>
                                </c:if> 
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
