<%-- 
    Document   : cadastrarQuarto
    Created on : 20/05/2017, 14:57:35
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Cadastrar Quarto - ATS-HM</title>
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
                                        <li><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                        <li><a href="operadoresCadastrados.html">Operadores Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li class="active"><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                        <li><a href="quartosCadastrados.html">Quartos Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown dropdown-lg">
                                    <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-lg row">
                                        <li class="col-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Hóspedes</li>
                                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                                <li><a href="cadastrarHospedeForm.html">Cadastrar Hóspede</a></li>
                                                <li><a href="hospedesCadastrados.html">Hóspedes Cadastrados</a></li>
                                            </ul>
                                        </li>
                                        <li class="col-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Hospedagens</li>
                                                <li><a href="quartosDesocupados.html">Cadastrar Hospedagem</a></li>
                                                <li><a href="hospedagensCorrentesAlterar.html">Alterar Hospedagem</a></li>
                                                <li><a href="hospedagensTermino.html">Hospedagens em Término</a></li>
                                                <li><a href="hospedagensAtrasadas.html">Hospedagens Atrasadas</a></li>
                                                <li><a href="hospedagensCorrentesGasto.html">Gerenciar gasto de Quarto</a></li>
                                                <li><a href="relatoriosHospedagem.html">Relatórios de Hospedagem</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="dadosEstabelecimento.html"><span class="glyphicon glyphicon-info-sign"></span> Estabelecimento</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 3%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Quarto</h2>
                            <br>
                            <form role="form" action="cadastrarQuarto.html" method="POST" style="font-size: 16px;">
                                <div class="form-group row">
                                    <label for="numero" class="col-md-3 col-xs-4 col-form-label">Número de Identificação: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite o número de identificação do quarto" required="true" name="numero" id="numero" maxlength="4" pattern="[0-9]+$" title="Apenas Números">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="area" class="col-md-3 col-xs-4 col-form-label">Área do quarto (m²): </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" data-thousands="" data-decimal="." type="text" placeholder="Digite a área do quarto" required="true" name="area" id="area" maxlength="7">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="maxHosp" class="col-md-3 col-xs-4 col-form-label">Máximo de hóspedes:  </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite o máximo de hóspedes" name="maxHosp" id="maxHosp" maxlength="3" pattern="[0-9]+$" title="Apenas Números">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="valorDiaria" class="col-md-3 col-xs-4 col-form-label">Valor cobrado pela diária (R$):</label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" data-thousands="" data-decimal="." type="text" placeholder="Digite o valor a ser cobrado pela diária" required="true" name="valorDiaria" id="valorDiaria" maxlength="7">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="descricaoExtra" class="col-md-3 col-xs-4 col-form-label">Informações extras sobre o quarto (Não obrigatório): </label>
                                    <div class="col-md-8 col-xs-8">
                                        <textarea class="form-control" style="height: 120px;" rows="5" id="descricaoExtra" name="descricaoExtra" maxlength="120" placeholder="Digite informações extras sobre o quarto, como por exemplo: mobília e serviços disponibilizados"></textarea>
                                    </div>
                                </div><!--
                                <div class="form-group row">
                                    <label for="foto" class="col-md-3 col-xs-4 col-form-label">Selecione fotos do quarto: </label>
                                    <div class="col-md-8 col-xs-8">	                                
                                        <input type="file" name="foto" accept="image/*">
                                    </div>
                                </div> -->
                                <div class="form-group row">
                                    <div class="col-md-12 col-xs-12">
                                        <p style="text-align: center">
                                        <button type="submit" class="btn btn-success btn-lg">Cadastrar</button></p>
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
    </body>
    <script type="text/javascript" src="scripts/mask.js"></script>
</html>
