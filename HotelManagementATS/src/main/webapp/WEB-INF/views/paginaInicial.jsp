<%-- 
    Document   : index3
    Created on : 17/05/2017, 11:13:56
    Author     : Alisson
--%>

<%@ include file="../../import/contentType.jsp" %>
<html>
    <head>
        <title>Página Inicial - ATS-HM</title>
        <%@ include file="../../import/head.jsp" %>
    </head>
    <body>
      
        <div id="wrapper">  
            <%@ include file="../../import/header.jsp" %>

            <div id="content">
                <nav class="navbar navbar-default">
                  <div class="container-fluid">
                        <%@ include file="../../import/menu.jsp" %>
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav navbar-right">
                              <li class="active"><a href="paginaInicial.html">Acesso ao Sistema</a></li>
                              <li><a href="cadastroAdministrador.html">Cadastrado de Administrador</a></li>
                              <li><a href="sobreAplicacao.html">Sobre a Aplicação</a></li>
                            </ul>
                        </div>
                  </div>
                </nav>
                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 2%;">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <h2 class="text-center" style="font-size: 25px;">Acesso ao Sistema</h2>
                            <br>
                             <form role="form" action="realizarLogin.html" method="POST" style="margin-top: 4%">
                                <div class="form-group row">
                                    <label for="login" class="col-md-2 col-xs-4 col-form-label">Login *: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite seu Login" required="true" name="login" id="login" maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="senha" class="col-md-2 col-xs-4 col-form-label">Senha: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <input class="form-control" type="text" placeholder="Digite sua Senha" required="true" name="senha" id="login" maxlength="30">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-md-12 col-xs-12">
                                        <p class="text-center">
                                            <button type="submit" class="btn btn-default">Entrar no Sistema <span class="glyphicon glyphicon-log-in"></span></button>
                                        </p>
                                    </div>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-md-offset-2 col-md-8 col-xs-offset-1 col-xs-10">
                                    <p id="formulario"><b>* Importante:</b></p>
                                    <p id="formulario">Login - Perfil usuário administrador: Use seu email cadastrado.</p>
                                    <p id="formulario">Login - Perfil usuário operador: Use nickname (apelido) cadastrado.</p>
                                    <div style="text-align: center">
                                        <p><b>Deseja administrar as hospedagens de seus hotéis?</b></p>
                                        <a href="#">Cadastre-se Aqui!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
            <%@ include file="../../import/footer.jsp" %>
        </div>    
        
        <%@ include file="../../import/js.jsp" %>
    </body>
</html>
