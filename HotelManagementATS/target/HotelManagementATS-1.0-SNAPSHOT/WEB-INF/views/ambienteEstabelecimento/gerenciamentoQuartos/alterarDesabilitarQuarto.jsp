<%-- 
    Document   : alterarExcluirQuarto
    Created on : 20/05/2017, 14:57:48
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar/Desabilitar Quarto - ATS-HM</title>
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
                                <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Operadores <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                        <li><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                        <li><a href="alterarExcluirOperador.html">Operadores Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                        <li><a href="cadastrarQuartoForm.html">Cadastrar Operador</a></li>
                                        <li><a href="alterarDesabilitarQuarto.html">Operadores Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                            <a href="gerenciamentoQuartos.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 3%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Alterar/Desabilitar Quarto</h2>
                            <br>
                            
                            <jsp:useBean id="quartoDao" class="br.ufsm.csi.hotelmanagementats.dao.QuartoDao"/>
                            <c:set value="${quartoDao.getQuartosEstabelecimento(estabelecimentoEscolhido)}" var="quartos"/>
                            
                            <c:if test="${not empty quartos}">
                                <div class="table-responsive" style="font-size: 16px;">
                                    <table class="table table-bordered">
                                      <thead>
                                        <tr>
                                          <th>Número de Identificação</th>
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
                                          <th>${quarto.numero}</th>
                                          <td>${quarto.area}</td>
                                          <td>${quarto.maxHosp}</td>
                                          <td>${quarto.valorDiaria}</td>
                                          <c:choose>
                                             <c:when test="${quarto.estado==0}">
                                                 <td>Desocupado</td>
                                                 <td class="text-center"><form action="alterarQuartoForm.html" method="POST"><button value="${quarto.cod}" name="cod" type="submit" class="btn btn-primary">Alterar</button></form></td>
                                                 <td class="text-center"><form id="formularioDesabilitar" action="desabilitarQuarto.html" method="POST"><button type="submit" value="${quarto.cod}" id="desabilitarQuarto" name="cod" class="btn btn-default">Desabilitar</button></form></td>
                                             </c:when>
                                             <c:when test="${quarto.estado==1}">
                                                 <td>Ocupado</td>
                                                 <td>Alteração não pode ser feita</td>
                                                 <td>Não é possível desabilitar</td>
                                             </c:when>
                                             <c:when test="${quarto.estado==2}">
                                                 <td>Desabilitado</td>
                                                 <td>Alteração não pode ser feita</td>
                                                 <td class="text-center"><form id="formularioHabilitar" action="habilitarQuarto.html" method="POST"><button type="submit" value="${quarto.cod}" id="habilitarQuarto" name="cod" class="btn btn-default">Habilitar</button></form></td>
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
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/mask.js"></script>
</html>

