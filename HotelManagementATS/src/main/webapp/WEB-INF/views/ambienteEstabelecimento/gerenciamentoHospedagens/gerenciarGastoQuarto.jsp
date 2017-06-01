<%-- 
    Document   : gerenciarGastoQuarto
    Created on : 20/05/2017, 23:48:18
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Gerenciar Gasto de Quarto - ATS-HM</title>
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
                                <c:if test="${not empty administrador and empty operador}">
                                    <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                    <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                    <li><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                    <li class="active"><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                    <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                                <c:if test="${not empty operador and empty administrador}">    
                                    <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                    <li class="active"><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                    <li><a href="gerenciamentoContaOp.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%; margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="hospedagensCorrentesGasto.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Gerenciar gasto de Quarto</h2>
                            <h3 class="text-center" style="font-size: 25px;">Quarto ??</h3>
                            <br>
                         </div>    
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <div class="row" style="font-size: 16px;">
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row" style="margin-bottom: 3%;">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 class="text-center" style="font-size: 20px;">Cadastrar gasto de Quarto:</h4>
                                            <br>
                                            <form role="form" action="#" method="POST">
                                                <div class="form-group row">
                                                    <label for="descricaoGasto" class="col-xs-4 col-form-label">Descrição do gasto:</label>
                                                    <div class="col-xs-8">
                                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite a descrição do gasto" id="descricaoGasto" name="descricaoGasto" required="true" maxlength="10">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="valorGasto" class="col-xs-4 col-form-label">Valor do gasto:</label>
                                                    <div class="col-xs-8">
                                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite o valor do gasto" id="valorGasto" name="valorGasto" required="true">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-md-12 col-xs-12"> 
                                                        <p style="text-align: center">
                                                         <button type="submit" class="btn btn-success">Cadastrar Gasto</button></p>
                                                    </div>    
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>	
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 style="font-size: 20px;">Gastos com serviço de quarto já cadastrados:</h4>
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-hover">
                                                  <thead>
                                                    <tr>
                                                      <th>Descrição</th>
                                                      <th>Valor</th>
                                                    </tr>
                                                  </thead>
                                                  <tbody>
                                                    <tr>
                                                      <th>1</th>
                                                      <td>Conteúdo</td>
                                                    </tr>
                                                    <tr>
                                                      <th>2</th>
                                                      <td>Conteúdo</td>
                                                    </tr>
                                                  </tbody>
                                                </table>
                                            </div>
                                        </div>    
                                    </div>
                                    <div class="row">
                                        <p class="col-xs-6">Total de gastos - Serviço de Quarto:</p>
                                        <p class="col-xs-6"> R$10,00</p>
                                    </div>
                                </div>	
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
