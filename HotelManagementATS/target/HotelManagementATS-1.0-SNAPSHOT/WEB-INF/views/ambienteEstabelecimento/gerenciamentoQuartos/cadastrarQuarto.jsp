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
            <%@ include file="../../../../import/header.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                                <li><a href="paginaPrincipalEstabelecimento.html">P�gina Principal - Estabelecimento</a></li>
                                <li><a href="gerenciamentoOperadores.html">Gerenciamento de Operadores</a></li>
                                <li class="active"><a href="gerenciamentoQuartos.html">Gerenciamento de Quartos</a></li>
                                <li><a href="gerenciamentoHospedagens.html">Gerenciamento de Hospedagens</a></li>
                                <li><a href="paginaPrincipalAdm.html">P�gina Principal - ADM</a></li>
                                <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid" style="margin-bottom: 3%">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="gerenciamentoQuartos.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
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
                                    <label for="numero" class="col-md-3 col-xs-4 col-form-label">N�mero de Identifica��o: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite o n�mero de identifica��o do quarto" required="true" name="numero" id="numero" maxlength="4" pattern="[0-9]+$" title="Apenas N�meros">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="area" class="col-md-3 col-xs-4 col-form-label">�rea do quarto (m�): </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" data-thousands="" data-decimal="." type="text" placeholder="Digite a �rea do quarto" required="true" name="area" id="area" maxlength="7">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="maxHosp" class="col-md-3 col-xs-4 col-form-label">M�ximo de h�spedes:  </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite o m�ximo de h�spedes" name="maxHosp" id="maxHosp" maxlength="3" pattern="[0-9]+$" title="Apenas N�meros">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="valorDiaria" class="col-md-3 col-xs-4 col-form-label">Valor cobrado pela di�ria (R$):</label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" data-thousands="" data-decimal="." type="text" placeholder="Digite o valor a ser cobrado pela di�ria" required="true" name="valorDiaria" id="valorDiaria" maxlength="7">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="descricaoExtra" class="col-md-3 col-xs-4 col-form-label">Informa��es extras sobre o quarto (N�o obrigat�rio): </label>
                                    <div class="col-md-8 col-xs-8">
                                        <textarea class="form-control" style="height: 120px;" rows="5" id="descricaoExtra" name="descricaoExtra" maxlength="120"></textarea>
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
