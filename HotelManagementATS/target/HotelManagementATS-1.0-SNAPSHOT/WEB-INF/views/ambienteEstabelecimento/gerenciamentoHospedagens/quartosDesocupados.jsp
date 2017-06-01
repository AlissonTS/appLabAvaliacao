<%-- 
    Document   : quartosDesocupados
    Created on : 20/05/2017, 22:19:27
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Quartos Desocupados - ATS-HM</title>
        <%@ include file="../../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                                <c:if test="${not empty administrador and empty operador}">
                                    <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                    <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                    <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                    <li class="active"><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                    <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                                <c:if test="${not empty operador and empty administrador}">    
                                    <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                    <li class="active"><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
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
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Hospedagem</h2>
                            <h3 class="text-center" style="font-size: 25px;">Quartos Desocupados</h3>
                            <br>
                            
                            <jsp:useBean id="quartoDao" class="br.ufsm.csi.hotelmanagementats.dao.QuartoDao"/>
                            <c:set value="${quartoDao.getQuartosDesocupadosEstabelecimento(estabelecimentoEscolhido)}" var="quartos"/>
                            
                            <c:if test="${not empty quartos}">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                          <tr>
                                            <th>Número de Identificação</th>
                                            <th>Área do quarto (m²)</th>
                                            <th>Máximo de hóspedes</th>
                                            <th>Valor da diária (R$)</th>
                                            <th>Mostrar Quarto</th>
                                            <th>Escolher Quarto</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach var="quarto" items="${quartos}">  
                                            <tr>
                                              <th>${quarto.numero}</th>
                                              <td>${quarto.area}</td>
                                              <td>${quarto.maxHosp}</td>
                                              <td>${quarto.valorDiaria}</td>
                                              <td class="text-center"><a href="#" class="btn btn-info" role="button">Mostrar</a></td>
                                              <td class="text-center"><a href="cadastrarHospedagemForm.html" class="btn btn-default" role="button">Escolher</a></td>
                                            </tr>
                                          </c:forEach>
                                      </tbody>
                                    </table>
                                </div>
                                <br><p class="text-center"><strong>Para realizar o cadastro de hospedagem é preciso que os hóspedes estejam cadastrados</strong></p>
                                <p class="text-center"><a href="cadastrarClienteForm.html">Cadastrar Cliente</a></p>
                            </c:if>
                            <c:if test="${empty quartos}">
                                <br><p class="text-center"><strong>O estabelecimento não possui quartos cadastrados</strong></p>
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
