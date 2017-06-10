<%-- 
    Document   : index3
    Created on : 17/05/2017, 11:13:56
    Author     : Alisson
--%>

<%@ include file="../../import/contentType.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre a Aplicação - ATS-HM</title>
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
                              <li class="active"><a href="sobreAplicacao.html">Sobre a Aplicação</a></li>
                            </ul>
                        </div>
                  </div>
                </nav>
                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px;">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <h2 class="text-center" style="font-size: 30px;">Sobre o ATS - Hotel Management</h2>
                            <br>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 3%; margin-top: 1%;">
                        <div class="col-xs-offset-2 col-md-4 col-xs-offset-1 col-xs-10">
                             <img src="image/hotelQuarto.jpg" class="img-thumbnail img-responsive" alt="Imagem de Sobre a Aplicação" height="435" width="500"> 
                        </div>
                        <div class="col-md-4 col-xs-offset-1 col-xs-10">
                            <p id="descricao">O ATS - Hotel Management é um Sistema totalmente Web destinado ao gerenciamento físico de hospedagens de hotéis e pousadas de pequeno e médio porte.</p>
                            <p id="descricao">O Sistema permite ao usuário o cadastro de seus estabelecimentos, envolvendo todo o cadastro e gerenciamento de:</p>
                            <ul id="lista">
                                <li>Quartos e suas informações de descrição;</li> 
                                <li>Usuários operadores através de criação de conta (com acesso ao sistema), sendo destinados ao gerenciamento de entrada e saída de hóspedes;</li> 
                                <li>Clientes (hóspedes) e hospedagens; </li>
                                <li>Gastos de serviço de quarto. </li>
                            </ul>	
                            <p id="descricao">Além de todo o cadastro disponibilizado, o administrador pode consultar relatórios de ocupação de seu estabelecimento a partir de datas informadas.</p>
                        </div>    
                    </div>
                </div>
            </div>
            
            <%@ include file="../../import/footer.jsp" %>
        </div>
        
        <%@ include file="../../import/js.jsp" %>
    </body>
</html>
