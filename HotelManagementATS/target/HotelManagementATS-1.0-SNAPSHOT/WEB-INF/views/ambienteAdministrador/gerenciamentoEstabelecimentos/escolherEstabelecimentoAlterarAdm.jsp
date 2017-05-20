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
            <%@ include file="../../../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="paginaPrincipalAdm.html">P�gina Principal - ADM</a></li>
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
                            <h2 class="text-center" style="font-size: 25px;">Gerenciamento de Estabelecimentos </h2>
                            <br>
                            <h4 class="text-center">Escolha o Estabelecimento para Altera��o: </h4>
                            <form action="alterarEstabelecimentoFormAdm.html" method="POST">
                                <div class="form-group row">
                                    <center>	
                                      <input type="radio" name="gender" value="male" checked> Hotel Santa Maria - Santa Maria/RS<br>
                                      <input type="radio" name="gender" value="female"> Hotel Unidos de Manchester - Novo Hamburgo/RS<br>
                                      <input type="radio" name="gender" value="other"> Pousada Mar Azul - Torres/RS
                                    </center>
                                </div>
                                <div class="form-group row">
                                    <br>
                                    <p style="text-align: center">
                                    <button type="submit" class="btn btn-primary">Alterar Estabelecimento</button></p>
                                </div>		
                            </form>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
</html>