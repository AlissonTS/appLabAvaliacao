<%-- 
    Document   : alterarExcluirQuarto
    Created on : 20/05/2017, 14:57:48
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Quartos Cadastrados - ATS-HM</title>
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
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                        <li class="active"><a href="quartosCadastrados.html">Quartos Cadastrados</a></li>
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
                                                <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                <li><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
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
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 3%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Quartos Cadastrados</h2>
                            <br>
                            
                            <jsp:useBean id="quartoDao" class="br.ufsm.csi.hotelmanagementats.dao.QuartoDao"/>
                            <c:set value="${quartoDao.getQuartosEstabelecimento(estabelecimentoEscolhido)}" var="quartos"/>
                            
                            <c:if test="${not empty quartos}">
                                <div class="table-responsive" style="font-size: 16px;">
                                    <table class="table table-bordered" id="tblQuartos">
                                      <thead>
                                        <tr>
                                          <th>N° de Identificação</th>
                                          <th>Área do quarto (m²)</th>
                                          <th>Máximo de Hóspedes</th>
                                          <th>Valor da diária (R$)</th>
                                          <th>Estado do Quarto</th>
                                          <th>Alterar Quarto</th>
                                          <th>Habilitar/Desabilitar Quarto</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                       <c:forEach var="quarto" items="${quartos}">    
                                        <tr>
                                          <th data-numero="${quarto.numero}">${quarto.numero}</th>
                                          <td data-cod="${quarto.cod}">${quarto.area}</td>
                                          <td>${quarto.maxHosp}</td>
                                          <td>${quarto.valorDiaria}</td>
                                          <c:choose>
                                             <c:when test="${quarto.estado==0}">
                                                 <td>Desocupado</td>
                                                 <td class="text-center"><form action="alterarQuartoForm.html" method="POST"><button value="${quarto.cod}" name="cod" type="submit" class="btn btn-primary">Alterar</button></form></td>
                                                 <td class="text-center"><button type="button" id="desabilitarQuarto" name="cod" class="btn btn-default" data-toggle="modal" data-target="#confirmDesabilitar">Desabilitar</button></td>
                                             </c:when>
                                             <c:when test="${quarto.estado==1}">
                                                 <td>Ocupado</td>
                                                 <td>Alteração não pode ser feita</td>
                                                 <td>Não é possível desabilitar</td>
                                             </c:when>
                                             <c:when test="${quarto.estado==2}">
                                                 <td>Desabilitado</td>
                                                 <td>Alteração não pode ser feita</td>
                                                 <td class="text-center"><button type="button" id="habilitarQuarto" name="cod" class="btn btn-default" data-toggle="modal" data-target="#confirmHabilitar">Habilitar</button></td>
                                             </c:when>
                                          </c:choose>
                                        </tr>
                                       </c:forEach>
                                       </tbody>
                                    </table>
                                </div>
                            </c:if>    
                            <c:if test="${empty quartos}">
                                <br><p class="text-center" style="font-size: 16px"><strong>O estabelecimento não possui quartos cadastrados</strong></p>
                                <p class="text-center"><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></p>
                            </c:if>    
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal Habilitar Quarto -->
            <div class="modal fade" id="confirmHabilitar" tabindex="-1" role="dialog" aria-labelledby="confirmHabilitarLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Habilitar Quarto</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja habilitar o quarto número <strong id="numeroQuarto"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioHabilitar" action="habilitarQuarto.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesQuarto" name="cod">Sim</button>
                               <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                            </form>
                        </div>
                    </div>
              </div>
            </div>
            
            <!-- Modal Desabilitar Operador -->
            <div class="modal fade" id="confirmDesabilitar" tabindex="-1" role="dialog" aria-labelledby="confirmDesabilitarLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Desabilitar Quarto</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja desabilitar o quarto número <strong id="numeroQuarto2"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioDesabilitar" action="desabilitarQuarto.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesQuarto2" name="cod">Sim</button>
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
    <script type="text/javascript" src="scripts/mask.js"></script>
    <script type="text/javascript" src="scripts/modalAcao.js"></script>
</html>

