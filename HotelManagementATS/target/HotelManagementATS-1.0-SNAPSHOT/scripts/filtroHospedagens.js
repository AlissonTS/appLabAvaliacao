
        $('#filtro').change(function() 
        { 
            var valorSelecionado = parseInt(jQuery(this).val());

            switch(valorSelecionado){
                case 1:
                    $('#hospedagensAtrasadas').hide();
                    $('#hospedagensTermino').show();
                    break;
                case 2:
                    $('#hospedagensTermino').hide();
                    $('#hospedagensAtrasadas').show();
                    break;
                //etc... 
                default:
                    break;
            }
        });


