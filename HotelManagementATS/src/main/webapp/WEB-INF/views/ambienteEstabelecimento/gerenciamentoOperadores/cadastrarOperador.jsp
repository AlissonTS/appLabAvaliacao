<%-- 
    Document   : cadastrarOperador
    Created on : 20/05/2017, 11:39:46
    Author     : Alisson
--%>

<%@ include file="../../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Cadastrar Operador - ATS-HM</title>
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
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Operadores <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li class="active"><a href="cadastrarOperadorForm.html">Cadastrar Operador</a></li>
                                        <li><a href="operadoresCadastrados.html">Operadores Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Quartos <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="cadastrarQuartoForm.html">Cadastrar Quarto</a></li>
                                        <li><a href="quartosCadastrados.html">Quartos Cadastrados</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown dropdown-lg">
                                    <a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Hospedagens <span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-lg row">
                                        <li class="col-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Hóspedes</li>
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
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Operador</h2>
                            <br>
                            <form id="form" role="form" action="cadastrarOperador.html" method="POST" style="font-size: 16px;">
                                <div class="form-group row">
                                    <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite o nome do operador" required="true" name="nome" id="nome" maxlength="40" pattern="^[A-Za-záàâãéèêíïóôõöúüçñÁÀÂÃÉÈÍÏÓÔÕÖÚÜÇÑ'\s]+$" title="Apenas letras!">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="###.###.###-##" required="true" name="cpf" id="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="###.###.###-##">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="telFixo" class="col-md-3 col-xs-4 col-form-label">Telefone Fixo (Campo não Obrigatório):  </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="(##) ####-####" name="telFixo" id="telFixo" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4}" title="(##) ####-####">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="telCel" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="(##) #####-####" required="true" name="telCel" id="telCel" pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}" title="(##) #####-####">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="nickname" class="col-md-3 col-xs-4 col-form-label">Nickname de Acesso (Apelido)*: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" placeholder="Digite nickname de Acesso" required="true" name="nickname" id="nickname" maxlength="40" pattern='[a-zA-Z0-9]+' title="Apenas números e letras!">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="senha" class="col-md-3 col-xs-4 col-form-label">Senha: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="password" placeholder="Digite a senha do operador" required="true" name="senha" id="senha">
                                    </div>
                                </div>
                                <div class="form-group row">
                                        <label for="senhaN" class="col-md-3 col-xs-4 col-form-label">Digite a Senha novamente: </label>
                                        <div class="col-md-8 col-xs-8">
                                            <input class="form-control" style="height: 50px;" type="password" placeholder="Digite novamente a senha do operador" required="true" name="senhaN" id="senhaN" maxlength="20">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12" id="avisoDiv">
                                            <div class="alert alert-danger">
                                                <a data-dismiss="alert"></a><p id="avisoContent"></p>
                                            </div>    
                                        </div>  
                                    </div>
                                <div class="form-group row">
                                    <div class="col-md-12 col-xs-12">
                                        <p style="text-align: center">
                                        <button type="submit" class="btn btn-success btn-lg">Cadastrar</button></p>
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
    <script type="text/javascript" src="scripts/cadastraContaForm.js"></script>
</html>
