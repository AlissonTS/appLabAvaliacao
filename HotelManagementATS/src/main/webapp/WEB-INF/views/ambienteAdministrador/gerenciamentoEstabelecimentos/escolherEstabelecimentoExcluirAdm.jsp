<%-- 
    Document   : escolherEstabelecimentoExcluir
    Created on : 20/05/2017, 09:15:14
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Estabelecimento - ATS-HM</title>
        <%@ include file="../../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../../import/headerAdm.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="paginaPrincipalAdm.html">P�gina Principal - ADM</a></li>
                              <li class="active dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Estabelecimentos <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="cadastrarEstabelecimentoFormAdm.html">Cadastrar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoAlterarAdm.html">Alterar Estabelecimento</a></li>
                                  <li class="active"><a href="escolherEstabelecimentoExcluirAdm.html">Excluir Estabelecimento</a></li>
                                </ul>  
                              </li>
                              <li><a href="gerenciamentoContaAdm.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                              <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 5%">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Excluir Estabelecimento </h2>
                            <br>
                            
                            <jsp:useBean id="estabelecimentoDao" class="br.ufsm.csi.hotelmanagementats.dao.EstabelecimentoDao"/>
                            <c:set value="${estabelecimentoDao.getEstabelecimentosAdm(administrador)}" var="estabelecimentos"/>
                            
                            <c:if test="${not empty estabelecimentos}">
                                <h4 class="text-center" style="font-size: 20px;">Escolha o estabelecimento para exclus�o *: </h4>
                                <form id="formularioExcluir" action="excluirEstabelecimentoAdm.html" method="POST" style="font-size: 16px;">
                                    <div class="form-group row">
                                        <center>
                                            <c:set value="0" var="contador"/>
                                            <c:forEach var="estabelecimento" items="${estabelecimentos}">
                                                <c:if test="${contador>0}">
                                                    <label for="estabelecimento"><input type="radio" name="estabelecimento" value="${estabelecimento.cod}" id="${estabelecimento.nome}"> ${estabelecimento.nome} - ${estabelecimento.cnpj}</label><br>
                                                </c:if>
                                                <c:if test="${contador==0}">
                                                    <label for="estabelecimento"><input type="radio" name="estabelecimento" value="${estabelecimento.cod}" id="${estabelecimento.nome}" checked> ${estabelecimento.nome} - ${estabelecimento.cnpj}</label><br>
                                                    <c:set value="1" var="contador"/>    
                                                </c:if>
                                            </c:forEach>
                                        </center>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12 col-xs-12" style="text-align: center;">
                                          <button id="excluirEstabelecimento" type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#confirm">Excluir Estabelecimento</button></div>
                                    </div>	
                                </form>
                                <p class="text-center" style="font-size: 16px"><strong>Apenas estabelecimentos sem hist�rico de operadores, quartos, clientes ou hospedagens cadastradas podem ser exclu�dos.</strong></p>            
                            </c:if>
                            <c:if test="${empty estabelecimentos}">
                                <br><p class="text-center" style="font-size: 16px"><strong>Voc� n�o possui estabelecimentos cadastrados</strong></p>
                                <p class="text-center"><a href="cadastrarEstabelecimentoFormAdm.html">Cadastrar Estabelecimento</a></p>
                            </c:if>
                        </div>
                    </div>
                </div>
                            
                <!-- Modal -->
                <div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Excluir Estabelecimento</h4>
                            </div>
                            <div class="modal-body">
                                <p style="font-size: 17px;">Deseja excluir o estabelecimento <strong id="nomeEstabelecimento"></strong>?</p>
                            </div>
                            <div class="modal-footer">
                                <p class="text-center">
                                <button type="button" class="btn btn-danger" id="yesExcluir">Sim</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">N�o</button></p>
                            </div>
                        </div>
                  </div>
                </div>            
                            
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/modalAcao.js"></script>
    </body>
</html>
