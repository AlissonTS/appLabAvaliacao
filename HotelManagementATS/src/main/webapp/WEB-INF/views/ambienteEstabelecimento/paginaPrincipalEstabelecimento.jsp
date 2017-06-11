<%-- 
    Document   : paginaPrincipalEstabelecimento
    Created on : 20/05/2017, 11:06:06
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>P�gina Principal Estabelecimento - ATS-HM</title>
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
                                <c:if test="${not empty administrador and empty operador}">
                                    <li class="active"><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                    <li><a href="paginaPrincipalAdm.html">P�gina Principal - ADM</a></li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Operadores <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                            <li><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                            <li><a href="alterarExcluirOperador.html">Operadores Cadastrados</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                            <li><a href="cadastrarQuartoForm.html">Cadastrar Operador</a></li>
                                            <li><a href="alterarDesabilitarQuarto.html">Operadores Cadastrados</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                                <c:if test="${not empty operador and empty administrador}">    
                                    <li class="active"><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                    <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                    <li><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-left: 0px; margin-right: 0px;">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">P�gina Principal - Estabelecimento </h2>

                            <c:if test="${not empty operador and empty administrador}">   
                                <p class="text-center" style="font-size: 18px">Ol�, ${operador.nome}</p>
                            </c:if> 
                            <br>    
                            <c:if test="${not empty estabelecimentoEscolhido}">
                                <div style="font-size: 19px">
                                    <p class="text-center">Nome do Hotel: ${estabelecimentoEscolhido.nome}</p>
                                    <p class="text-center">CNPJ: ${estabelecimentoEscolhido.cnpj}</p>
                                    <p class="text-center">Telefone Fixo: ${estabelecimentoEscolhido.telFixo}</p>
                                </div>
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
