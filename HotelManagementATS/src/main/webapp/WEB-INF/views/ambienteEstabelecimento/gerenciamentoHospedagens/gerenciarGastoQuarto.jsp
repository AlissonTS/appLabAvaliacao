<%-- 
    Document   : gerenciarGastoQuarto
    Created on : 20/05/2017, 23:48:18
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
                                    <li><a href="quartosEstabelecimento.html">Quartos do Estabelecimento</a></li>
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
                    <div class="row" style="margin-top: 1%; margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="hospedagensCorrentesGasto.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Gerenciar gasto de Quarto</h2>
                            <h3 class="text-center" style="font-size: 25px;">Quarto número ${hospedagemEscolhida.quarto.numero}</h3>
                            <br>
                         </div>    
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <div class="row" style="font-size: 16px;">
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row" style="margin-bottom: 3%;">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 class="text-center" style="font-size: 20px;">Cadastrar gasto de Quarto:</h4>
                                            <br>
                                            <c:if test="${not empty mensagem}">
                                                <div class="alert alert-${tipo}" style="font-size: 16px;">
                                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                    ${mensagem}
                                                </div>
                                            </c:if>
                                            <form id="formularioCadastrar" role="form" action="cadastrarGastoQuarto.html" method="POST">
                                                <input class="form-control" value="${hospedagemEscolhida.cod}" type="hidden" required="true" name="cod" id="cod" maxlength="40" pattern="[0-9]+$" title="Apenas Números">
                                                <div class="form-group row">
                                                    <label for="descricaoGasto" class="col-xs-4 col-form-label">Descrição do gasto:</label>
                                                    <div class="col-xs-8">
                                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite a descrição do gasto" id="descricaoGasto" name="descricaoGasto" required="true" maxlength="20">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="valorGasto" class="col-xs-4 col-form-label">Valor do gasto:</label>
                                                    <div class="col-xs-8">
                                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite o valor do gasto" id="valorGasto" name="valorGasto" required="true" maxlength="6">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-md-12 col-xs-12"> 
                                                        <p style="text-align: center">
                                                         <button type="submit" class="btn btn-success">Cadastrar Gasto</button></p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>	
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 style="font-size: 20px;">Gastos com serviço de quarto já cadastrados:</h4>
                                            
                                            <jsp:useBean id="hospedagemDao" class="br.ufsm.csi.hotelmanagementats.dao.HospedagemDao"/>
                                            <c:set value="${hospedagemDao.getTotalGastos(hospedagemEscolhida)}" var="totalGastos"/>
                                            
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
             
            <!-- Modal -->
            <div class="modal fade" id="confirmCadastrar" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Cadastrar gasto de Quarto</h4>
                        </div>
                        <div class="modal-body" style="font-size: 17px;">
                            <p class="text-center"><strong>Gasto:</strong></p>
                            <p class="text-center">Descrição: <strong id="descricao"></strong></p>
                            <p class="text-center">Preço: R$ <strong id="valor"></strong></p>
                            <p>Deseja confirmar a o cadastro de gasto de quarto?</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center">
                            <button type="button" class="btn btn-primary" id="yesCadastrar">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                        </div>
                    </div>
              </div>
            </div> 
                                            
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/mask.js"></script>
        <script type="text/javascript" src="scripts/modalAcao.js"></script>
    </body>
</html>
