<%-- 
    Document   : relatoriosHospedagem
    Created on : 20/05/2017, 21:55:17
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Relatórios de Hospedagem - ATS-HM</title>
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
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Ambiente de Gerenciamento <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
                                        <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                                    </ul>
                                </li>
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
                                        <li><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                        <li><a href="alterarDesabilitarQuarto.html">Quartos Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown dropdown-lg active">
                                    <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-lg row">
                                        <li class="col-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Hóspedes</li>
                                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                                <li><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></li>
                                                <li><a href="alterarExcluirHospede.html">Hóspedes Cadastrados</a></li>
                                            </ul>
                                        </li>
                                        <li class="col-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Hospedagens</li>
                                                <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                <li class="active"><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="gerenciamentoHospedagens.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Relatórios de Hospedagem</h2>  
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-4 col-md-4 col-xs-12">
                            <br>
                            <form role="form" action="gerarRelatorioHospedagem.html" method="POST">
                                <div class="form-group row">
                                    <label for="dataInicial" class="col-md-4 col-xs-4 col-form-label"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Inicial: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input value="${data}" class="form-control" style="height: 50px;" type="text" id="dataInicial" name="dataInicial" required="true" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12 col-xs-12">
                                        <p style="text-align: center">
                                        <button type="submit" class="btn btn-default">Gerar Relatório</button></p>
                                    </div>
                                </div>    
                            </form>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 3%">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h4 class="text-center">Relatório Gerado</h4>	
                        </div>
                    </div>	
                    <div class="row">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h5 class="text-center">Informações Gerais</h5>	
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                  <thead>
                                    <tr>
                                      <th>Total de Quartos</th>
                                      <th>Quartos Ocupados</th>
                                      <th>Quartos Desocupados</th>
                                      <th>Quartos Desabilitados</th>
                                      <th>% de Ocupação</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th>1</th>
                                      <td>Conteúdo</td>
                                      <td>Conteúdo</td>
                                      <td>Conteúdo</td>
                                      <td>Conteúdo</td>
                                    </tr>
                                  </tbody>
                                </table>
                            </div>   
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h5 class="text-center">Lista de Quartos</h5>	
                        </div>
                    </div>
                    <div class="row">	
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                      <tr>
                                        <th>Número do Quarto</th>
                                        <th>Estado do Quarto</th>
                                        <th>Início da Hospedagem</th>
                                        <th>Final da Hospedagem</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr>
                                        <th>1</th>
                                        <td>Conteúdo</td>
                                        <td>Conteúdo</td>
                                        <td>Conteúdo</td>
                                      </tr>
                                    </tbody>
                                </table>
                            </div>   
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 3%;">	
                        <div class="col-md-12 col-xs-12">
                            <p style="text-align: center">
                                <button type="submit" class="btn btn-success btn-lg">Imprimir Relatório</button></p>
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="scripts/calendarioJs.js"></script>
    <script type="text/javascript" src="scripts/mask.js"></script>
</html>
