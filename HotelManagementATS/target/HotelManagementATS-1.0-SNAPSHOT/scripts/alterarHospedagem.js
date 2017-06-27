      
      function parseDate(str) {
            var mdy = str.split('/');
            return new Date(mdy[2], mdy[1], mdy[0]-1);
      };
      
      function calcularValorAlterar() {  
            var dataFinal1 = document.getElementById("dataFinal").value;
            var dataInicial1 = document.getElementById('di').innerHTML;
            
            console.log(dataInicial1);
            console.log(dataFinal1);
            
            var dataInicial = parseDate(moment(dataInicial1, "YYYY-MM-DD").format("DD/MM/YYYY"));
            var dataFinal = parseDate(moment(dataFinal1, "YYYY-MM-DD").format("DD/MM/YYYY"));
            
            var horaFinal = document.getElementById("horaInicial").value;
            
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

                console.log(total);

                if(!dataInicial || !dataFinal) return false;
                if(dataInicial>dataFinal){
                    console.log("Data Inicial é maior que a Data Final!");
                    document.getElementById('valorHospedagem').value = 0.0;
                    return false;
                }
                if(dataFinal>dataInicial){
                    
                    var dataAtual1 = new Date();
                    var dataAtual = parseDate(moment(dataAtual1, "YYYY-MM-DD").format("DD/MM/YYYY"));
                    
                    if(dataFinal>=dataAtual){
                        console.log("Entrou no dataFinal>dataAtual");
                        var momentoAtual = new Date(); 
                        var horaAtual = momentoAtual.getHours(); 

                        var horaDif;
                        horaDif = hora-horaAtual; 
                        if(hora>horaAtual){
                            if(horaDif>=5){
                                console.log("Entrou no horaDif>5");
                                document.getElementById('valorHospedagem').value = valorDiaria*(total+1);
                            }else{
                                console.log("Entrou no else do horaDif>5");
                                document.getElementById('valorHospedagem').value = valorDiaria*(total);
                            }
                        }else if(horaAtual>=hora){
                            if(horaDif<=-5){
                                console.log("Entrou no horaDif<=-5");
                                document.getElementById('valorHospedagem').value = valorDiaria*total;
                            }else{
                                console.log("Entrou no else do horaDif<=-5");
                                document.getElementById('valorHospedagem').value = valorDiaria*(total+1);
                            }
                        }
                    }else if(dataFinal===dataAtual){
                        console.log("Entrou no dataIgual");
                        var momentoAtual = new Date(); 
                        var horaAtual = momentoAtual.getHours(); 
                        
                        if(hora>horaAtual+1){
                            console.log("Entrou no hora>horaAtual+1");
                            document.getElementById('valorHospedagem').value = valorDiaria*1;
                        }
                    }
                }
                if(total===0){
                    var momentoAtual = new Date(); 
                    var horaAtual = momentoAtual.getHours(); 

                    if(hora>horaAtual+1){
                        console.log("Entrou no total==0 preimeiro if");
                        document.getElementById('valorHospedagem').value = valorDiaria*1;
                    }else if(hora<horaAtual){
                        document.getElementById('valorHospedagem').value = 0.0;
                    }
                }
            }
            // document.getElementById('valorTotal').value = 0.0;
      };
      
      $('#formularioAlterar').on('submit', function(event){
            event.preventDefault();
            
            var dataFinal = document.getElementById("dataFinal").value;
            var horaFinal = document.getElementById("horaFinal").value;
            var valorHospedagem = document.getElementById("valorHospedagem").value;

            var informacaoHora = horaFinal.split(":");
           
            var hora = informacaoHora[0];
            var minuto = informacaoHora[1];

            if((hora>=0 && hora<=23) && (minuto>=0 && minuto<=59) && dataFinal!="____-__-__" && valorHospedagem>0){
                $("#confirmAlterar").modal("show");
            }else{
                $("#infoAlterar").modal("show");
            }
      });

     $('#yesAlterar').click(function(){
        $('#formularioAlterar').unbind('submit').submit();
     });
