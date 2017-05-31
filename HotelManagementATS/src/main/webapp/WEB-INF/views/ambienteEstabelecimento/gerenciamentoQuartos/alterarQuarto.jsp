<%-- 
    Document   : alterarQuarto
    Created on : 20/05/2017, 14:57:59
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Quarto - ATS-HM</title>
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
                                <li class="active"><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
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
                                <a href="alterarDesabilitarQuarto.html">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Alterar Quarto</h2>
                            <br>
                            <c:if test="${not empty quartoEscolhido}">
                                <form role="form" action="alterarQuarto.html" method="POST">
                                    <input class="form-control" value="${quartoEscolhido.cod}" type="hidden" required="true" name="cod" id="cod" maxlength="40" pattern="[0-9]+$" title="Apenas Números">
                                    <div class="form-group row">
                                        <label for="numero" class="col-md-3 col-xs-4 col-form-label">Número de Identificação: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" value="${quartoEscolhido.numero}" type="text" placeholder="Digite o número de identificação do quarto" required="true" name="numero" id="numero" maxlength="4" pattern="[0-9]+$" title="Apenas Números">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="area" class="col-md-3 col-xs-4 col-form-label">Área do quarto (m²): </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" value="${quartoEscolhido.area}" data-thousands="" data-decimal="."  type="text" placeholder="Digite a área do quarto" required="true" name="area" id="area" maxlength="7">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="maxhospedes" class="col-md-3 col-xs-4 col-form-label">Máximo de clientes hospedados:  </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" value="${quartoEscolhido.maxHosp}" type="text" placeholder="Digite o máximo de hóspedes" name="maxHosp" id="maxHosp" maxlength="3" pattern="[0-9]+$" title="Apenas Números">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="valorDiaria" class="col-md-3 col-xs-4 col-form-label">Valor cobrado pela diária (R$):</label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" value="${quartoEscolhido.valorDiaria}" data-thousands="" data-decimal="." type="text" placeholder="Digite o valor a ser cobrado pela diária" required="true" name="valorDiaria" id="valorDiaria" maxlength="6">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="descricaoExtra" class="col-md-3 col-xs-4 col-form-label">Informações extras sobre o quarto (Não obrigatório): </label>
                                        <div class="col-md-8 col-xs-8">
                                            <textarea class="form-control" rows="5" id="descricaoExtra" name="descricaoExtra" maxlength="60">${quartoEscolhido.descricaoExtra}</textarea>
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
                                            <button type="submit" class="btn btn-primary">Alterar</button></p>
                                        </div>    
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${empty quartoEscolhido}">
                                <br><p class="text-center" style="font-size: 15px"><strong>Nenhum quarto selecionado para alteração!</strong></p>
                            </c:if>    
                        </div>
                    </div>
                </div>                 
            </div>
                        
           <%@ include file="../../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../../import/js.jsp" %>
    </body>
    <script type="text/javascript" src="js/jquery.maskMoney.js"></script>
    <script type="text/javascript" src="scripts/mask.js"></script>
</html>
