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
            <%@ include file="../../../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                                <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                <li class="active"><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
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
                                    <table class="table table-bordered">
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
                                              <th>${op.nome}</th>
                                              <td>${op.cpf}</td>
                                              <td>${op.telFixo}</td>
                                              <td>${op.telCel}</td>
                                              <td>${op.nickname}</td>
                                                <c:choose>
                                                    <c:when test="${op.estado==0}">
                                                        <td>Alteração não pode ser feita</td>
                                                        <td class="text-center"><form id="formularioExcluir" action="excluirOperador.html" method="POST"><button type="submit" value="${op.cod}" id="excluirOperador" name="cod" class="btn btn-danger">Excluir</button></form>
                                                        <td class="text-center"><form action="habilitarOperador.html" method="POST"><button type="submit" value="${op.cod}" id="habilitarOperador" name="cod" class="btn btn-default">Habilitar</button></form></td>    
                                                    </c:when>
                                                    <c:when test="${op.estado==1}">
                                                        <td class="text-center"><form action="alterarOperadorForm.html" method="POST"><button value="${op.cod}" name="cod" type="submit" class="btn btn-primary">Alterar</button></form></td>
                                                        <td class="text-center"><form id="formularioExcluir" action="excluirOperador.html" method="POST"><button type="submit" value="${op.cod}" id="excluirOperador" name="cod" class="btn btn-danger">Excluir</button></form>
                                                        <td class="text-center"><form action="desabilitarOperador.html" method="POST"><button type="submit" value="${op.cod}" id="desabilitarOperador" name="cod" class="btn btn-default">Desabilitar</button></form></td>    
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
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
</html>
