<%-- 
    Document   : quartosCadastrados
    Created on : 27/06/2017, 10:28:24
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Quartos Cadastrados - ATS-HM</title>
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
                              <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                              <li class="active"><a href="quartosEstabelecimento.html">Quartos do Estabelecimento</a></li>
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
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Quartos do Estabelecimento</h2>
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
                                          <th>Mostrar Quarto</th>
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
                                             </c:when>
                                             <c:when test="${quarto.estado==1}">
                                                 <td>Ocupado</td>
                                             </c:when>
                                             <c:when test="${quarto.estado==2}">
                                                 <td>Desabilitado</td>
                                             </c:when>
                                          </c:choose>
                                          <td class="text-center"><form action="mostrarQuarto.html" method="POST"><button type="submit" value="${quarto.cod}" name="cod" class="btn btn-info">Mostrar</button></form></td>     
                                        </tr>
                                       </c:forEach>
                                       </tbody>
                                    </table>
                                </div>
                            </c:if>    
                            <c:if test="${empty quartos}">
                                <br><p class="text-center" style="font-size: 16px"><strong>O estabelecimento não possui quartos cadastrados</strong></p>
                            </c:if>    
                        </div>
                    </div>
                </div>                 
            </div>              
                            
           <%@ include file="../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../import/js.jsp" %>
    </body>
</html>
