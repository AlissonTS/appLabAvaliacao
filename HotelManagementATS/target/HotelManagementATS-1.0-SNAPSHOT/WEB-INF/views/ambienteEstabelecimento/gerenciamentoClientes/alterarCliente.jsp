<%-- 
    Document   : alterarCliente
    Created on : 20/05/2017, 21:36:45
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Cliente - ATS-HM</title>
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
                                <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                <li class="active"><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="alterarExcluirCliente.html">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Alterar Cliente</h2>
                            <br>
                            <form role="form" action="#" method="POST">
                                <div class="form-group row">
                                    <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite seu Nome" required="true" name="nome" id="nome" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="###.###.###-##" required="true" name="cpf" id="cpf">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="telCel" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="(##) #####-####" required="true" name="telCel" id="telCel">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-md-3 col-xs-4 col-form-label">E-Mail: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite o e-mail do cliente" required="true" name="email" id="email" maxlength="40">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12 col-xs-12">
                                        <p style="text-align: center">
                                        <button type="submit" class="btn btn-primary">Alterar</button></p>
                                    </div>    
                                </div>
                                <p class="text-center">* Nickname: O nickname ou apelido deve ser único ao usuário operador, pois é a partir dele que o mesmo possui acesso ao ambiente de gerenciamento do estabelecimento em que ele está vinculado.</p>
                            </form>    
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/mask.js"></script>
</html>
