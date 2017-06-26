
        var hospedes = new Array();

        adicionarHospede = function() {

           var e = document.getElementById("hospedes");
           var hospedeSelect1 = e.options[e.selectedIndex].value;
           var hospedeSelect2 = e.options[e.selectedIndex].text;

           var informacaoTabela = hospedeSelect2.split(" - ");
           
           var nome = informacaoTabela[0];
           var cpf = informacaoTabela[1];
           
           if(nome.length>0 && cpf.length>0 && hospedeSelect1>0){
               
               var verificador=0;
               
               if(hospedes.length===0){
                   hospedes.push(hospedeSelect1);
               }else{
                   for (i=0; i<hospedes.length; i++) {
                       if(hospedeSelect1===hospedes[i]){
                           verificador=1;
                       }
                   }
                   if(verificador===0){
                        hospedes.push(hospedeSelect1);
                   }
               }
               
               if(verificador===0){
                    var novaLinha = $("<tr>");
                    var colunas = "";

                    colunas += '<td>'+nome+'</td>';
                    colunas += '<td>'+cpf+'</td>';
                    colunas += '<td>';
                    colunas += '<button class="btn btn-danger center" onclick="removerHospede(this, '+hospedeSelect1+')" type="button">Retirar</button>';
                    colunas += '</td>';

                    colunas += '</tr>';

                    novaLinha.append(colunas);
                    $("#hospedes-tabela").append(novaLinha);
               }
           }
        };
