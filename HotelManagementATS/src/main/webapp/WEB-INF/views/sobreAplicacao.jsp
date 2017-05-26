<%-- 
    Document   : index3
    Created on : 17/05/2017, 11:13:56
    Author     : Alisson
--%>

<%@ include file="../../import/contentType.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre a Aplica��o - ATS-HM</title>
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
                              <li><a href="paginaInicial.html">Acesso ao Sistema</a></li>
                              <c:if test="${empty administrador and empty operador}">
                                <li><a href="cadastroAdministrador.html">Cadastrado de Administrador</a></li>
                              </c:if>
                              <li class="active"><a href="sobreAplicacao.html">Sobre a Aplica��o</a></li>
                            </ul>
                        </div>
                  </div>
                </nav>
                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 2%;">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <h2 class="text-center" style="font-size: 25px;">Sobre o ATS - HM</h2>
                            <br>
                            <p id="descricao">O ATS - Hotel Management � um Sistema totalmente Web destinado ao gerenciamento f�sico de hospedagens de hot�is e pousadas de pequeno e m�dio porte.</p>
                            <p id="descricao">O Sistema permite ao usu�rio o cadastro de seus estabelecimentos, envolvendo todo o cadastro e gerenciamento de:</p>
                            <ul id="lista">
                                    <li>Quartos e suas informa��es de descri��o;</li> 
                                    <li>Usu�rios operadores atrav�s de cria��o de conta (com acesso ao sistema), sendo destinados ao gerenciamento de entrada e sa�da de h�spedes;</li> 
                                    <li>Clientes (h�spedes) e hospedagens; </li>
                                    <li>Gastos de servi�o de quarto. </li>
                            </ul>	
                            <p id="descricao">Al�m de todo o cadastro disponibilizado, o administrador pode consultar relat�rios de ocupa��o de seu estabelecimento a partir de datas informadas.</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <%@ include file="../../import/footer.jsp" %>
        </div>
        
        <%@ include file="../../import/js.jsp" %>
    </body>
</html>
