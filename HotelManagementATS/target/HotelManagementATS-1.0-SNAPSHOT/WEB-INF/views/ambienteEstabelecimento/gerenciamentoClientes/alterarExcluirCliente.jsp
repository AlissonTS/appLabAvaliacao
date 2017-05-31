<%-- 
    Document   : alterarExcluirCliente
    Created on : 20/05/2017, 21:36:56
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar/Excluir Cliente - ATS-HM</title>
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
                                <a href="gerenciamentoHospedagens.html">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 3%;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 25px;">Alterar/Excluir Cliente</h2>
                            <br>
                            
                            <jsp:useBean id="clienteDao" class="br.ufsm.csi.hotelmanagementats.dao.ClienteDao"/>
                            <c:set value="${clienteDao.getClientesEstabelecimento(estabelecimentoEscolhido)}" var="clientes"/>
                            
                            <c:if test="${not empty clientes}">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                      <thead>
                                        <tr>
                                          <th>Nome</th>
                                          <th>CPF</th>
                                          <th>Telefone Celular</th>
                                          <th>Email</th>
                                          <th>Alterar Cliente</th>
                                          <th>Excluir Cliente</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <c:forEach var="cliente" items="${clientes}">  
                                            <tr>
                                              <th>${cliente.nome}</th>
                                              <td>${cliente.cpf}</td>
                                              <td>${cliente.telCel}</td>
                                              <td>${cliente.email}</td>
                                              <td class="text-center"><form action="alterarClienteForm.html" method="POST"><button value="${cliente.cod}" name="cod" type="submit" class="btn btn-primary">Alterar</button></form></td>
                                              <td class="text-center"><form id="formularioExcluir" action="excluirCliente.html" method="POST"><button type="submit" value="${cliente.cod}" id="excluirCliente" name="cod" class="btn btn-danger">Excluir</button></form>
                                            </tr><!-- data-toggle="modal" data-target="#confirm"-->
                                        </c:forEach>
                                      </tbody>
                                    </table>
                                    
                                    <!-- Modal 
                                    <div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel">Excluir Cliente</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p style="font-size: 17px;">Deseja excluir o cliente <strong id="nomeCliente"></strong>?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <p class="text-center">
                                                    <button type="button" class="btn btn-danger" id="yesCliente">Desejo excluir o cliente</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                                                </div>
                                            </div>
                                      </div>
                                    </div> -->
                                 </div>    
                            </c:if>
                            <c:if test="${empty clientes}">
                                <br><p class="text-center" style="font-size: 15px"><strong>O estabelecimento não possui clientes cadastrados</strong></p>
                                <p class="text-center"><a href="cadastrarClienteForm.html">Cadastrar Cliente</a></p>
                            </c:if>    
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <!-- <script type="text/javascript" src="scripts/modalDelete.js"></script> -->
</html>
