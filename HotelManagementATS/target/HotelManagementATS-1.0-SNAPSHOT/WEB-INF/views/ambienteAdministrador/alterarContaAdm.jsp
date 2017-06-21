<%-- 
    Document   : alterarContaAdm
    Created on : 19/05/2017, 23:25:09
    Author     : Alisson
--%>

<%@ include file="../../../import/contentType.jsp" %>
<html>
    <head>
        <title>Alterar Conta ADM - ATS-HM</title>
        <%@ include file="../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../import/headerAdm.jsp" %>
            
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../import/menu.jsp" %>    
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                              <li><a href="paginaPrincipalAdm.html">Página Principal - ADM</a></li>
                              <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Estabelecimentos <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="cadastrarEstabelecimentoFormAdm.html">Cadastrar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoAlterarAdm.html">Alterar Estabelecimento</a></li>
                                  <li><a href="escolherEstabelecimentoExcluirAdm.html">Excluir Estabelecimento</a></li>
                                </ul>  
                              </li>
                              <li class="active"><a href="gerenciamentoContaAdm.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                              <li><a href="realizarLogout.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                <div class="container-fluid">
                    <div class="row" style="margin-top: 1%">
                        <div class="col-md-offset-3 col-md-3 col-xs-offset-1 col-xs-5">
                                <a href="gerenciamentoContaAdm.html" style="font-size: 16px;">Voltar</a>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 5%">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 5%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Alterar Conta</h2>
                            <br>
                            <form id="formularioAlterar" role="form" action="alterarAdministrador.html" method="POST" style="font-size: 16px;">
                                <div class="form-group row">
                                    <label for="nome" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" value="${administrador.nome}" placeholder="Digite seu Nome" required="true" name="nome" id="nome" maxlength="40" pattern="^[A-Za-záàâãéèêíïóôõöúüçñÁÀÂÃÉÈÍÏÓÔÕÖÚÜÇÑ'\s]+$" title="Apenas letras!">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cpf" class="col-md-3 col-xs-4 col-form-label">CPF: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" value="${administrador.cpf}" placeholder="###.###.###-##" required="true" name="cpf" id="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="###.###.###-##" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="telFixo" class="col-md-3 col-xs-4 col-form-label">Telefone Fixo (Campo não Obrigatório):  </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" value="${administrador.telFixo}" placeholder="(##) ####-####" name="telFixo" id="telFixo" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4}" title="(##) ####-####">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="telCel" class="col-md-3 col-xs-4 col-form-label">Telefone Celular:</label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="text" value="${administrador.telCel}" placeholder="(##) #####-####" required="true" name="telCel" id="telCel" pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}" title="(##) #####-####">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-md-3 col-xs-4 col-form-label">E-mail de Acesso: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="email" value="${administrador.email}" placeholder="Digite seu e-mail" required="true" name="email" id="email" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="redefinir" class="col-md-3 col-xs-4 col-form-label">Redefinir Senha? </label>
                                    <div class="col-md-8 col-xs-8">
                                        <select class="form-control" id="redefinir" name="redefinir" style="height: 50px;">
                                            <option value="Não">Não</option>
                                            <option value="Sim">Sim</option>
                                        </select>
                                    </div>
                                </div>    
                                <div class="form-group row" id="inputOculto">
                                    <label for="senha" class="col-md-3 col-xs-4 col-form-label">Digite sua nova Senha: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="password" placeholder="Digite sua nova senha" required="true" name="senha" id="senha" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row" id="inputOculto2">
                                    <label for="senhaN" class="col-md-3 col-xs-4 col-form-label">Digite sua nova Senha novamente: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" style="height: 50px;" type="password" placeholder="Digite sua nova senha novamente" required="true" name="senhaN" id="senhaN">
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
                                        <button type="submit" class="btn btn-primary btn-lg">Alterar</button></p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>                 
            </div>
            
            <!-- Modal --> 
            <div class="modal fade" id="confirmAlterar" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Alterar Conta</h4>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 17px;">Deseja confirmar a alteração de sua conta?</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center">
                            <button type="button" class="btn btn-primary" id="yesAlterar">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                        </div>
                    </div>
              </div>
            </div>                       
                                    
           <%@ include file="../../../import/footer.jsp" %>
        </div>  
        
        <%@ include file="../../../import/js.jsp" %>
        <script type="text/javascript" src="scripts/mask.js"></script>
        <script type="text/javascript" src="scripts/hiddenForm.js"></script>
        <script type="text/javascript" src="scripts/modalAcao.js"></script> 
    </body>
</html>
