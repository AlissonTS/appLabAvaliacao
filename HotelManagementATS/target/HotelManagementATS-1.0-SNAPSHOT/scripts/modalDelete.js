        $('#excluir').click(function(){
            var $estabelecimento = $("input[name='estabelecimento']:checked").attr("id");
            $("#nomeEstabelecimento").html($estabelecimento);
        });
        $('#yes').click(function(){
            /* when the submit button in the modal is clicked, submit the form */
           alert('submitting');
           $('#formularioExcluir').submit();
       });


