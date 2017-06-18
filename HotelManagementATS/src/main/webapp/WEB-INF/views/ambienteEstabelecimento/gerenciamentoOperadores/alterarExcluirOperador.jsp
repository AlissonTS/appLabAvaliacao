<%-- 
    Document   : alterarExcluirOperador
    Created on : 20/05/2017, 14:29:42
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar/Excluir Operador - ATS-HM</title>
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
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Operadores <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                        <li><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                        <li class="active"><a href="alterarExcluirOperador.html">Operadores Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                        <li><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                        <li><a href="alterarDesabilitarQuarto.html">Quartos Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown dropdown-lg">
                                    <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-lg row">
                                        <li class="col-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Hóspedes</li>
                                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                                <li><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></li>
                                                <li><a href="alterarExcluirHospede.html">Hóspedes Cadastrados</a></li>
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
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="gerenciamentoOperadores.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 3%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Alterar/Excluir Operador</h2>
                            <br>
                            
                            <jsp:useBean id="usuarioOpDao" class="br.ufsm.csi.hotelmanagementats.dao.UsuarioOpDao"/>
                            <c:set value="${usuarioOpDao.getOperadoresEstabelecimento(estabelecimentoEscolhido)}" var="operadores"/>
                            
                            <c:if test="${not empty operadores}">
                                <div class="table-responsive" style="font-size: 16px;">
                                    <table class="table table-bordered" id="tblOperadores">
                                      <thead>
                                        <tr>
                                          <th>Nome</th>
                                          <th>CPF</th>
                                          <th>Telefone Fixo</th>
                                          <th>Telefone Celular</th>
                                          <th>Nickname de Acesso</th>
                                          <th>Alterar Operador</th>
                                          <th>Excluir Operador</th>
                                          <th>Acesso do Operador</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <c:forEach var="op" items="${operadores}">   
                                            <tr>
                                              <th data-nome="${op.nome}">${op.nome}</th>
                                              <td data-cod="${op.cod}">${op.cpf}</td>
                                              <td>${op.telFixo}</td>
                                              <td>${op.telCel}</td>
                                              <td>${op.nickname}</td>
                                                <c:choose>
                                                    <c:when test="${op.estado==0}">
                                                        <td>Alteração não pode ser feita</td>
                                                        <td class="text-center"><button type="button" id="excluirOperador" name="cod" class="btn btn-danger" data-toggle="modal" data-target="#confirmExcluir">Excluir</button>
                                                        <td class="text-center"><button type="submit" id="habilitarOperador" name="cod" class="btn btn-default" data-toggle="modal" data-target="#confirmHabilitar">Habilitar</button></td>    
                                                    </c:when>
                                                    <c:when test="${op.estado==1}">
                                                        <td class="text-center"><form action="alterarOperadorForm.html" method="POST"><button value="${op.cod}" name="cod" type="submit" class="btn btn-primary">Alterar</button></form></td>
                                                        <td class="text-center"><button type="button" id="excluirOperador" name="cod" class="btn btn-danger" data-toggle="modal" data-target="#confirmExcluir">Excluir</button>
                                                        <td class="text-center"><button type="submit" id="desabilitarOperador" name="cod" class="btn btn-default" data-toggle="modal" data-target="#confirmDesabilitar">Desabilitar</button></td>    
                                                    </c:when>
                                                </c:choose>              
                                            </tr>
                                        </c:forEach>
                                      </tbody>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${empty operadores}">
                                <br><p class="text-center" style="font-size: 16px"><strong>O estabelecimento não possui operadores cadastrados</strong></p>
                                <p class="text-center"><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></p>
                            </c:if>
                               
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal Excluir Operador -->
            <div class="modal fade" id="confirmExcluir" tabindex="-1" role="dialog" aria-labelledby="confirmExcluirLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Excluir Operador</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja excluir o operador <strong id="nomeOperador"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioExcluir" action="excluirOperador.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesOperador" name="cod">Sim</button>
                               <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                            </form>
                        </div>
                    </div>
              </div>
            </div>
            
            <!-- Modal Habilitar Operador -->
            <div class="modal fade" id="confirmHabilitar" tabindex="-1" role="dialog" aria-labelledby="confirmHabilitarLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Habilitar Operador</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja habilitar o operador <strong id="nomeOperador2"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioHabilitar" action="habilitarOperador.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesOperador2" name="cod">Sim</button>
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
                            <h4 class="modal-title" id="myModalLabel">Desabilitar Operador</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja desabilitar o operador <strong id="nomeOperador3"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="formularioDesabilitar" action="desabilitarOperador.html" method="POST">
                               <p class="text-center"><button type="submit" class="btn btn-danger" id="yesOperador3" name="cod">Sim</button>
                               <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                            </form>
                        </div>
                    </div>
              </div>
            </div>
                            
                            
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/modalDelete.js"></script>
    </body>
</html>
