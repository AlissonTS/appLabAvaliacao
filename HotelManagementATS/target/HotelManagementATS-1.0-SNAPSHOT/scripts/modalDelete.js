        $('#excluirEstabelecimento').click(function(){
            var $estabelecimento = $("input[name='estabelecimento']:checked").attr("id");
            $("#nomeEstabelecimento").html($estabelecimento);
        });
        $('#yesEstabelecimento').click(function(){
           $('#formularioExcluir').submit();
        });
        $("#excluirCliente").click(function(){
            var $cliente = $(this).attr('value');
            console.log($cliente);
            $("#nomeCliente").html($cliente);
        });
        $('#yesCliente').click(function(){
           $('#formularioExcluir').submit();
        });


