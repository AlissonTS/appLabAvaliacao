<%-- 
    Document   : footer
    Created on : 19/05/2017, 14:54:48
    Author     : Alisson
--%>

    <div id="footer">
        <footer class="footer" style="margin-top: 1%;">
            <c:if test="${not empty operador and empty administrador}">
                <div class="row" style="margin-left: 0px; margin-right: 0px;">
                    <div class="col-md-offset-9 col-md-3 col-xs-offset-4 col-xs-8">
                        <p class="text-center" style="font-size: 13px">Usuário Operador: ${operador.nickname}</p>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty operador and not empty administrador}">
                <div class="row" style="margin-left: 0px; margin-right: 0px;">
                    <div class="col-md-offset-9 col-md-3 col-xs-offset-4 col-xs-8">
                        <p class="text-center" style="font-size: 13px">Usuário Administrador: ${administrador.email}</p>
                    </div>
                </div>
            </c:if> 
            <div class="row" style="margin-left: 0px; margin-right: 0px;">
                <div class="col-md-offset-3 col-md-6 col-xs-offset-2 col-xs-8">
                    <p class="text-center" style="font-family: opensans, sans-serif;">Desenvolvido por AlissonTS7 © 2017</p>
                </div>
            </div>
        </footer>
    </div>
