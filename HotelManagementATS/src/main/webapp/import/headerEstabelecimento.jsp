<%-- 
    Document   : header
    Created on : 19/05/2017, 14:55:18
    Author     : Alisson
--%>

    <div id="header" style="background: url('image/header.jpg');">
        <div class="row" style="margin-top: 0.5%; margin-left: 0px; margin-right: 0px">
            <div class="col-md-offset-2 col-md-8 col-xs-12">
                <c:if test="${not empty estabelecimentoEscolhido}">
                    <h1 class="text-center" style="font-size: 40px; font-family: opensans, sans-serif;">${estabelecimentoEscolhido.nome}</h1>
                </c:if>
            </div>
        </div>
    </div>
