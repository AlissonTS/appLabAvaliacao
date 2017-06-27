
        $('#filtro').change(function() 
        { 
            var valorSelecionado = parseInt(jQuery(this).val());

            switch(valorSelecionado){
                case 1:
                    $('#hospedagensAtrasadas').hide();
                    $('#hospedagensAlterar').hide();
                    $('#hospedagensTermino').show();
                    break;
                case 2:
                    $('#hospedagensTermino').hide();
                    $('#hospedagensAlterar').hide();
                    $('#hospedagensAtrasadas').show();
                    break;
                case 3:
                    $('#hospedagensTermino').hide();
                    $('#hospedagensAtrasadas').hide();
                    $('#hospedagensAlterar').show();
                    break;
                default:
                    break;
            }
        });


