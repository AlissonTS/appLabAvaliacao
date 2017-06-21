<%-- 
    Document   : escolherEstabelecimentoAlterar
    Created on : 20/05/2017, 09:13:46
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
                              <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                              <li class="active dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Estabelecimentos <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="cadastrarEstabelecimentoFormAdm.html">Cadastrar Estabelecimento</a></li>
                                  <li class="active"><a href="escolherEstabelecimentoAlterarAdm.html">Alterar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoExcluirAdm.html">Excluir Estabelecimento</a></li>
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
                            <h2 class="text-center" style="font-size: 28px;">Alterar Estabelecimento </h2>
                            <br>
                            
                            <jsp:useBean id="estabelecimentoDao" class="br.ufsm.csi.hotelmanagementats.dao.EstabelecimentoDao"/>
                            <c:set value="${estabelecimentoDao.getEstabelecimentosAdm(administrador)}" var="estabelecimentos"/>
                            
                            <c:if test="${not empty estabelecimentos}">
                                <h4 class="text-center" style="font-size: 20px;">Escolha o estabelecimento para alteração: </h4>
                                <form action="alterarEstabelecimentoFormAdm.html" method="POST" style="font-size: 16px;">
                                    <div class="form-group row">
                                        <center>
                                            <c:set value="0" var="contador"/>
                                            <c:forEach var="estabelecimento" items="${estabelecimentos}">
                                                <c:if test="${contador>0}">
                                                    <label for="estabelecimento"><input type="radio" name="estabelecimento" value="${estabelecimento.cod}"> ${estabelecimento.nome} - ${estabelecimento.cnpj}</label><br>
                                                </c:if>
                                                <c:if test="${contador==0}">
                                                    <label for="estabelecimento"><input type="radio" name="estabelecimento" value="${estabelecimento.cod}" checked> ${estabelecimento.nome} - ${estabelecimento.cnpj}</label><br>
                                                    <c:set value="1" var="contador"/>    
                                                </c:if>
                                            </c:forEach>
                                        </center>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12 col-xs-12" style="text-align: center;">
                                            <button type="submit" class="btn btn-primary btn-lg">Alterar Estabelecimento</button></div>
                                    </div>	
                                </form>
                            </c:if>
                            <c:if test="${empty estabelecimentos}">
                                <br><p class="text-center" style="font-size: 15px"><strong>Você não possui estabelecimentos cadastrados</strong></p>
                                <p class="text-center"><a href="cadastrarEstabelecimentoFormAdm.html">Cadastrar Estabelecimento</a></p>
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
