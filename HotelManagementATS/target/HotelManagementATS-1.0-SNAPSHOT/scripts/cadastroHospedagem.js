        
        var hospedes = new Array();

        adicionarHospede = function() {

           var e = document.getElementById("hospedes");
           var hospedeSelect1 = e.options[e.selectedIndex].value;
           var hospedeSelect2 = e.options[e.selectedIndex].text;

           var informacaoTabela = hospedeSelect2.split(" - ");
           
           var nome = informacaoTabela[0];
           var cpf = informacaoTabela[1];
           
           var maxHosp = document.getElementById("max").innerHTML;
           
           console.log(hospedeSelect1);
           
           if(nome.length>0 && cpf.length>0 && hospedeSelect1>0 && hospedes.length<maxHosp){
               
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

                    colunas += '<td>'+nome+'<input form="formularioCadastrar" value="'+hospedeSelect1+'" style="display: none" type="checkbox" name="hospedes" checked></td>';
                    colunas += '<td>'+cpf+'</td>';
                    colunas += '<td><p class="text-center">';
                    colunas += '<button class="btn btn-danger " onclick="removerHospede(this, '+hospedeSelect1+')" type="button">Retirar</button>';
                    colunas += '<p></td>';

                    colunas += '</tr>';

                    novaLinha.append(colunas);
                    $("#hospedes-tabela").append(novaLinha);
               }
               
               if(hospedes.length==maxHosp){
                   document.getElementById('quantidadeHospedes').innerHTML = "Quantidade: Quarto cheio!";
               }else{
                   document.getElementById('quantidadeHospedes').innerHTML = "Quantidade: "+hospedes.length;
               }
           }
           return false;
        };
        
        removerHospede = function(handler, hospedeSelect1) {
            
            var tamanhoA = hospedes.length;
            hospedes.pop(hospedeSelect1);
            var tamanhoN = hospedes.length;
            
            if(tamanhoN<tamanhoA){
                var tr = $(handler).closest('tr');

                tr.fadeOut(400, function(){ 
                    tr.remove();

                    document.getElementById('quantidadeHospedes').innerHTML = "Quantidade: "+hospedes.length;

                    return false;
                });
            }    
            return false;
      };
      
      function parseDate(str) {
            var mdy = str.split('/');
            return new Date(mdy[2], mdy[1], mdy[0]-1);
      };
      
      function calcularValor() {  
            var dataFinal1 = document.getElementById("dataFinal").value;
            var dataInicial1 = new Date();
            var dataInicial = parseDate(moment(dataInicial1, "YYYY-MM-DD").format("DD/MM/YYYY"));
            var dataFinal = parseDate(moment(dataFinal1, "YYYY-MM-DD").format("DD/MM/YYYY"));
            
            var horaFinal = document.getElementById("horaFinal").value;
            
            var informacaoHora = horaFinal.split(":");
           
            var hora = informacaoHora[0];
            var minuto = informacaoHora[1];
            
            console.log(dataInicial);
            console.log(dataFinal);
            
            if((hora>=0 && hora<=23) && (minuto>=0 && minuto<=59)){
                var valorDiaria = document.getElementById('val').innerHTML;
                
                var diferenca = Math.abs(dataFinal - dataInicial); //diferença em milésimos e positivo
                var dia = 1000*60*60*24; // milésimos de segundo correspondente a um dia
                var total = Math.round(diferenca/dia); //valor total de dias arredondado

                if(!dataInicial || !dataFinal) return false;
                if(dataInicial>dataFinal){
                    console.log("Data Inicial é maior que a Data Final!");
                    document.getElementById('valorHospedagem').value = 0.0;
                    return false;
                }
                if(dataFinal>dataInicial){
                    var momentoAtual = new Date(); 
                    var horaAtual = momentoAtual.getHours(); 
                    
                    var horaDif;
                    horaDif = hora-horaAtual; 
                    if(hora>horaAtual){
                        if(horaDif>=5){
                            document.getElementById('valorHospedagem').value = valorDiaria*(total+1);
                        }else{
                            document.getElementById('valorHospedagem').value = valorDiaria*(total);
                        }
                    }else if(horaAtual>=hora){
                        if(horaDif<=-5){
                            document.getElementById('valorHospedagem').value = valorDiaria*total;
                        }else{
                            document.getElementById('valorHospedagem').value = valorDiaria*(total+1);
                        }
                    }
                }
                if(total===0){
                    var momentoAtual = new Date(); 
                    var horaAtual = momentoAtual.getHours(); 
                    
                    if(hora>horaAtual+1){
                        document.getElementById('valorHospedagem').value = valorDiaria*1;
                    }else if(hora<horaAtual){
                        document.getElementById('valorHospedagem').value = 0.0;
                    }
                }
            }
            // document.getElementById('valorTotal').value = 0.0;
      };
      
      $('#formularioCadastrar').on('submit', function(event){
            event.preventDefault();
            
            var tabela = document.getElementById('hospedes-tabela');
            var linhas = tabela.getElementsByTagName('tr');

            var dataFinal = document.getElementById("dataFinal").value;
            var horaFinal = document.getElementById("horaFinal").value;
            var valorHospedagem = document.getElementById("valorHospedagem").value;

            var informacaoHora = horaFinal.split(":");
           
            var hora = informacaoHora[0];
            var minuto = informacaoHora[1];

            if((linhas.length-1)>0 && (hora>=0 && hora<=23) && (minuto>=0 && minuto<=59) && dataFinal!="____-__-__" && valorHospedagem>0){
                $("#confirmCadastrar").modal("show");
            }else{
                $("#infoCadastrar").modal("show");
            }
      });

     $('#yesCadastrar').click(function(){
        $('#formularioCadastrar').unbind('submit').submit();
     });
