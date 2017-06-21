<%-- 
    Document   : alterarExcluirHospede
    Created on : 20/05/2017, 21:36:56
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Hóspedes Cadastrados - ATS-HM</title>
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
                                                    <li class="active"><a href="hospedesCadastrados.html">Hóspedes Cadastrados</a></li>
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
                                                    <li class="active"><a href="hospedesCadastrados.html">Hóspedes Cadastrados</a></li>
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
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 3%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Hóspedes Cadastrados</h2>
                            <br>
                            
                            <jsp:useBean id="hospedeDao" class="br.ufsm.csi.hotelmanagementats.dao.HospedeDao"/>
                            <c:set value="${hospedeDao.getHospedesEstabelecimento(estabelecimentoEscolhido)}" var="hospedes"/>
                            
                            <c:if test="${not empty hospedes}">
                                <div class="table-responsive" style="font-size: 16px;">
                                    <table class="table table-bordered" id="tblHospedes">
                                      <thead>
                                        <tr>
                                          <th>Nome</th>
                                          <th>CPF</th>
                                          <th>Telefone Celular</th>
                                          <th>Email</th>
                                          <th>Alterar Hóspede</th>
                                          <th>Excluir Hóspede</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <c:forEach var="hospede" items="${hospedes}">  
                                            <tr>
                                              <th data-nome="${hospede.nome}">${hospede.nome}</th>
                                              <td data-cod="${hospede.cod}">${hospede.cpf}</td>
                                              <td>${hospede.telCel}</td>
                                              <td>${hospede.email}</td>
                                              <td class="text-center"><form action="alterarHospedeForm.html" method="POST"><button value="${hospede.cod}" name="cod" type="submit" class="btn btn-primary">Alterar</button></form></td>
                                              <td class="text-center"><button id="excluirHospede" name="cod" class="btn btn-danger" data-toggle="modal" data-target="#confirmExcluir">Excluir</button></td>
                                            </tr>
                                        </c:forEach>
                                      </tbody>
                                    </table>
                                 </div>    
                            </c:if>
                            <c:if test="${empty hospedes}">
                                <br><p class="text-center" style="font-size: 16px"><strong>O estabelecimento não possui hóspedes cadastrados</strong></p>
                                <p class="text-center"><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></p>
                            </c:if>    
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal Excluir Hóspede -->
            <div class="modal fade" id="confirmExcluir" tabindex="-1" role="dialog" aria-labelledby="confirmExcluirLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Excluir Hóspede</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja excluir o hóspede <strong id="nomeHospede"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioExcluir" action="excluirHospede.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesHospede" name="cod">Sim</button>
                               <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                            </form>
                        </div>
                    </div>
              </div>
            </div>                
                            
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/modalAcao.js"></script>
</html>
