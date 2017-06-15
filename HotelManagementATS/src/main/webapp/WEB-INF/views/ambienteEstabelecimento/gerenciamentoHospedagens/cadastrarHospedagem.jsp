<%-- 
    Document   : cadastrarHospedagem
    Created on : 20/05/2017, 22:27:52
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Cadastrar Hospedagem - ATS-HM</title>
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
                                                    <li class="active"><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                    <li><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                                </c:if>
                            
                                <c:if test="${not empty operador and empty administrador}">
                                    <li><a href="paginaPrincipalEstabelecimento.html">Página Principal - Estabelecimento</a></li>
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
                                                    <li class="active"><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                    <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                    <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                    <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
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
                                <a href="quartosDesocupados.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-2 col-md-8 col-xs-12">
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Hospedagem</h2>
                            <h3 class="text-center" style="font-size: 25px;">Quarto ??</h3>   
                         </div>    
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-1 col-md-10 col-xs-12">
                            <div class="row" style="font-size: 16px; margin-bottom: 3%;">
                                <div class="col-md-offset-3 col-md-6 col-xs-12">
                                    <h4 class="text-center" style="font-size: 20px;">Informações do Período:</h4>
                                    <br>
                                    <form role="form" action="#" method="POST">
                                        <div class="form-group row">
                                            <label for="dataFinal" class="col-md-4 col-xs-4 col-form-label"><i class="fa fa-calendar" style="font-size: 20px;"></i> Data Final:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" type="text" id="dataFinal" name="dataFinal" required="true" maxlength="10" placeholder="####-##-##" pattern="\d{4}\-\d{2}\-\d{2}" title="####-##-##">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="horaFinal" class="col-md-4 col-xs-4 col-form-label">Hora Final:</label>
                                            <div class="col-md-5 col-xs-8">
                                                <input class="form-control" style="height: 50px;" type="text" placeholder="##:##" required="true" name="horaFinal" id="horaFinal" pattern="([01][0-9]|2[0-3]):[0-5][0-9]" title="##:##">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="valorTotal" class="col-md-4 col-xs-4 col-form-label">Valor da Hospedagem:</label>
                                            <div class="col-md-6 col-xs-8">
                                                <input class="form-control" style="height: 50px;" type="text" placeholder="Valor da Hospedagem" required="true" name="valorTotal" id="valorTotal">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>    
                            <div class="row" style="font-size: 16px;">
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row" style="margin-bottom: 3%;">
                                        <div class="col-md-12 col-xs-12">
                                            <h4 class="text-center" style="font-size: 20px;">Insira os Hóspedes:</h4>
                                                <br>
                                                <div class="form-group row">
                                                    <label for="hospedes" class="col-md-4 col-xs-4 col-form-label">Hóspedes:</label>
                                                        <div class="col-md-8 col-xs-8">
                                                            <select class="form-control" id="hospedes" style="height: 50px;">
                                                                <option>Alisson - 1111111111</option>
                                                                <option>Trindade - 1111111111</option>
                                                                <option>Souza - 1111111111</option>
                                                                <option>Mario - 1111111111</option>
                                                                <option>Gabriel - 1111111111</option>
                                                                <option>Alcantara - 1111111111</option>
                                                                <option>Trineros - 1111111111</option>
                                                                <option>Mito - 1111111111</option>
                                                                <option>Brasil - 1111111111</option>
                                                                <option>Gab - 1111111111</option>
                                                                <option>Alcantara - 1111111111</option>
                                                                <option>Trineros - 1111111111</option>
                                                                <option>Mito - 1111111111</option>
                                                                <option>Brasil - 1111111111</option>
                                                                <option>Gab - 1111111111</option>
                                                            </select><br>
                                                            <button type="submit" class="btn btn-default">Inserir Hóspede</button>
                                                        </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>	
                                <div class="col-md-offset-1 col-md-5 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12" style="margin-top:0%">
                                            <h4 style="font-size: 20px;">Hóspedes adicionados:</h4>
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-hover">
                                                  <thead>
                                                    <tr>
                                                      <th>Nome do Hóspede</th>
                                                      <th>CPF</th>
                                                      <th>Retirar Hóspede</th>
                                                    </tr>
                                                  </thead>
                                                  <tbody>
                                                    <tr>
                                                      <th>1</th>
                                                      <td>Conteúdo</td>
                                                      <td class="text-center"><button type="button" class="btn btn-danger">Retirar</button></td>
                                                    </tr>
                                                    <tr>
                                                      <th>2</th>
                                                      <td>Conteúdo</td>
                                                      <td class="text-center"><button type="button" class="btn btn-danger">Retirar</button></td>
                                                    </tr>
                                                  </tbody>
                                                </table>
                                            </div>
                                        </div>    
                                    </div>
                                </div>	
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 3%;">
                        <div class="col-lg-offset-3 col-lg-6">
                            <p style="text-align: center">
                            <button type="submit" class="btn btn-success btn-lg">Cadastrar Hospedagem</button></p>
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
