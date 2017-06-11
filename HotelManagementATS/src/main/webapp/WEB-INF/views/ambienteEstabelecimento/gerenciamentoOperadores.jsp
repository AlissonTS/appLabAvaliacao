<%-- 
    Document   : gerenciamentoOperadores
    Created on : 20/05/2017, 11:19:25
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciamento de Operadores - ATS-HM</title>
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
                                <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Operadores <span class="caret"></span></a>
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
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Gerenciamento de Operadores </h2>
                            <br>
                            <div class="row">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="cadastrarOperadorForm.html" class="btn btn-link" role="button" style="font-size: 20px; text-decoration: none">Cadastrar Operador</a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center">
                                    <a href="alterarExcluirOperador.html" class="btn btn-link" role="button" style="font-size: 20px; text-decoration: none">Alterar/Excluir Operador</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../import/js.jsp" %>
    </body>
</html>
