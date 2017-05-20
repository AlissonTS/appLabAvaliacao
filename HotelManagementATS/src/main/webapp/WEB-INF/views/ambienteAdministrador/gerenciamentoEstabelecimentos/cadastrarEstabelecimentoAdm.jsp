<%-- 
    Document   : cadastrarEstabelecimentoFormAdm
    Created on : 20/05/2017, 09:31:51
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Cadastrar Estabelecimento ADM - ATS-HM</title>
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
                              <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                              <li class="active"><a href="gerenciamentoEstabelecimentosAdm.html">Gerenciamento de Estabelecimentos</a></li>
                              <li><a href="gerenciamentoContaAdm.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                              <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="gerenciamentoEstabelecimentosAdm.html">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 5%">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Cadastrar Estabelecimento</h2>
                            <br>
                            <form role="form" action="cadastrarEstabelecimentoAdm.html" method="POST">
                                <div class="form-group row">
                                    <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite o nome do Estabelecimento" required="true" name="nome" id="nome" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cnpj" class="col-md-3 col-xs-4 col-form-label">CNPJ: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="##.###.###/####-##" required="true" name="cnpj" id="cnpj">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fixo" class="col-md-3 col-xs-4 col-form-label">Telefone:  </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="(##) ####-####" name="fixo" id="fixo">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12 col-xs-12">
                                        <p style="text-align: center">
                                        <button type="submit" class="btn btn-success">Cadastrar</button></p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/mask.js"></script>
    </body>
</html>
