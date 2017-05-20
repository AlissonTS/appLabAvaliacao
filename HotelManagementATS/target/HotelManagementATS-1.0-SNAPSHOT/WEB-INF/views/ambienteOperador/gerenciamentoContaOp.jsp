<%-- 
    Document   : gerenciamentoContaOp
    Created on : 20/05/2017, 10:00:38
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciamento de Conta Operador - ATS-HM</title>
        <%@ include file="../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="#">Página Principal - Estabelecimento</a></li>
                              <li><a href="#">Gerenciamento de Hospedagens</a></li>
                              <li class="active"><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                              <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 5%">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Gerenciamento de Conta</h2>
                            <br>
                            <p class="text-center">Nome Completo: Fulano Brasil</p>
                            <p class="text-center">CNPJ: 999.999.99-99</p>
                            <p class="text-center">Telefone Celular: (55) 90000-0005</p>
                            <p class="text-center">Telefone Fixo: (55) 0000-0004</p>
                            <p class="text-center">Nickname (Apelido) de Acesso: fulanoBr</p>
                            <p class="text-center">Senha: *********</p>
                            <div class="row" style="margin-top: 3%">
                                <div class="col-md-12 col-xs-12" style="text-align: center;">
                                    <a href="alterarContaOp.html" class="btn btn-primary" role="button">Alterar Conta</a>
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
