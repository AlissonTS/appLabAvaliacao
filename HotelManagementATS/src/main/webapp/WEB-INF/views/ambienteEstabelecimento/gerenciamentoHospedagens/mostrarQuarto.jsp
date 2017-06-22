<%-- 
    Document   : mostrarQuartoDesocupado
    Created on : 21/06/2017, 23:09:09
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Mostrar Quarto - ATS-HM</title>
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
                                            <li><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                            <li><a href="paginaPrincipalAdm.html">P�gina Principal - ADM</a></li>
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
                                                    <li class="dropdown-header">H�spedes</li>
                                                    <li><a href="cadastrarHospedeForm.html">Cadastrar H�spede</a></li>
                                                    <li><a href="hospedesCadastrados.html">H�spedes Cadastrados</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hospedagens</li>
                                                    <li class="active"><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em T�rmino</a></li>
                                                    <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                    <li><a href="relatoriosHospedagem.html">Relat�rios de Hospedagem</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="dadosEstabelecimento.html"><span class="glyphicon glyphicon-info-sign"></span> Estabelecimento</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            
                                <c:if test="${not empty operador and empty administrador}">
                                    <li><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                    <li class="dropdown dropdown-lg active">
                                        <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                        <ul class="dropdown-menu dropdown-menu-lg row">
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">H�spedes</li>
                                                    <li><a href="cadastrarHospedeForm.html">Cadastrar H�spede</a></li>
                                                    <li><a href="hospedesCadastrados.html">H�spedes Cadastrados</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-sm-6">
                                                <ul>
                                                    <li class="dropdown-header">Hospedagens</li>
                                                    <li class="active"><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em T�rmino</a></li>
                                                    <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
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
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="quartosDesocupados.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px; font-size: 18px; text-align: center;">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Hospedagem</h2>
                            <c:if test="${not empty quartoEscolhido}">
                                <h3 class="text-center" style="font-size: 25px;">Quarto n�mero ${quartoEscolhido.numero}</h3>
                                <br>
                                <p>�rea do quarto (m�): ${quartoEscolhido.area} m�.</p>
                                <p>M�ximo de h�spedes que podem estar presentes no quarto: ${quartoEscolhido.maxHosp} pessoa(s).</p>
                                <p>Valor cobrado pela di�ria no quarto: R$ ${quartoEscolhido.valorDiaria}.</p>
                                <p>Informa��es extras sobre o quarto: </p>
                                <c:if test="${not empty quartoEscolhido.descricaoExtra}">
                                    <p>${quartoEscolhido.descricaoExtra}</p>
                                </c:if>
                                <c:if test="${empty quartoEscolhido}">
                                    <p>Nenhuma informa��o extra informada sobre o quarto desocupado.</p>
                                </c:if>
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
