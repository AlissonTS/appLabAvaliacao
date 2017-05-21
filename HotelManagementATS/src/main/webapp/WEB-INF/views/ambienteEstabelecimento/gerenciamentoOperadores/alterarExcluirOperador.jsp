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
                                <a href="gerenciamentoOperadores.html">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Alterar/Excluir Operador</h2>
                            <br>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                  <thead>
                                    <tr>
                                      <td>Nome</td>
                                      <th>CPF</th>
                                      <th>Telefone Fixo</th>
                                      <th>Telefone Celular</th>
                                      <th>Nickname de Acesso</th>
                                      <th>Alterar Operador</th>
                                      <th>Excluir Operador</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>2</td>
                                      <td>Mark</td>
                                      <td>Otto</td>
                                      <td>@TwBootstrap</td>
                                      <td>Mark</td>
                                      <td class="text-center"><a href="alterarOperadorForm.html" class="btn btn-primary" role="button">Alterar</a></td>
                                      <td class="text-center"><a href="excluirOperador.html" class="btn btn-danger" role="button">Excluir</a></td>
                                    </tr>
                                  </tbody>
                                </table>
                            </div>    
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
</html>
