        $('#excluirEstabelecimento').click(function(){
            var $estabelecimento = $("input[name='estabelecimento']:checked").attr("id");
            $("#nomeEstabelecimento").html($estabelecimento);
        });
        
        $('#yesExcluir').click(function(){
           $('#formularioExcluir').submit();
        });
        
        $('#formularioAlterar').on('submit', function(event){
            event.preventDefault();
           $("#confirmAlterar").modal("show");
        });
        
        $('#yesAlterar').click(function(){
           $('#formularioAlterar').unbind('submit').submit();
        });

        $('#formularioCadastrar').on('submit', function(event){
            event.preventDefault();
        
            var descricao = $("input[name=descricaoGasto]").val();
            var valor = $("input[name=valorGasto]").val();
            
            $("#descricao").html(descricao);
            $("#valor").html(valor);
        
            $("#confirmCadastrar").modal("show");
        });
        
        $('#yesCadastrar').click(function(){
           $('#formularioCadastrar').unbind('submit').submit();
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

        $(document).on('click', '#tblHospedagensAtrasadas td', function(e) {
            e.preventDefault;
            
            var numero = $(this).closest('tr').find('th[data-numero]').data('numero');
            var cod = $(this).closest('tr').find('td[data-cod]').data('cod');
            
            $("#numeroQuarto2").html(numero);
            $("#yesQuarto2").val(cod);
        });
        
        $(document).on('click', '#tblHospedagensTermino td', function(e) {
            e.preventDefault;
            
            var numero = $(this).closest('tr').find('th[data-numero]').data('numero');
            var cod = $(this).closest('tr').find('td[data-cod]').data('cod');
            
            $("#numeroQuarto").html(numero);
            $("#yesQuarto").val(cod);
        });