        $('#excluirEstabelecimento').click(function(){
            var $estabelecimento = $("input[name='estabelecimento']:checked").attr("id");
            $("#nomeEstabelecimento").html($estabelecimento);
        });
        $('#yesEstabelecimento').click(function(){
           $('#formularioExcluir').submit();
        });
        
        $(document).on('click', '#tblOperadores td', function(e) {
            e.preventDefault;
            
            var nome = $(this).closest('tr').find('th[data-nome]').data('nome');
            var cod = $(this).closest('tr').find('td[data-cod]').data('cod');
            
            $("#nomeOperador").html(nome);
            $("#yesOperador").val(cod);
            
            $("#nomeOperador2").html(nome);
            $("#yesOperador2").val(cod);
            
            $("#nomeOperador3").html(nome);
            $("#yesOperador3").val(cod);
        });

        $(document).on('click', '#tblQuartos td', function(e) {
            e.preventDefault;
            
            var numero = $(this).closest('tr').find('th[data-numero]').data('numero');
            var cod = $(this).closest('tr').find('td[data-cod]').data('cod');
            
            $("#numeroQuarto").html(numero);
            $("#yesQuarto").val(cod);
            
            $("#numeroQuarto2").html(numero);
            $("#yesQuarto2").val(cod);
        });
        
        $(document).on('click', '#tblHospedes td', function(e) {
            e.preventDefault;
            
            var nome = $(this).closest('tr').find('th[data-nome]').data('nome');
            var cod = $(this).closest('tr').find('td[data-cod]').data('cod');
            
            $("#nomeHospede").html(nome);
            $("#yesHospede").val(cod);
        });
