        $('#excluirEstabelecimento').click(function(){
            var $estabelecimento = $("input[name='estabelecimento']:checked").attr("id");
            $("#nomeEstabelecimento").html($estabelecimento);
        });
        $('#yesEstabelecimento').click(function(){
           $('#formularioExcluir').submit();
        });
        
        /* $("#excluirCliente").click(function(e){
            e.preventDefault;
            var $cliente = $(this).closest('tr').find('th[data-nome]').data('nome');
            console.log($cliente);
            $("#nomeCliente").html($cliente);
        });
        $('#yesCliente').click(function(){
           $('#formularioExcluir').submit();
        }); */


