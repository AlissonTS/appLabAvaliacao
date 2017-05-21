/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Alisson
 */
@Controller
public class HospedagemController {
    
    @RequestMapping("relatoriosHospedagem.html")
    public String relatoriosHospedagem(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/relatoriosHospedagem";
    }
    
    @RequestMapping("quartosDesocupados.html")
    public String quartosDesocupados(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/quartosDesocupados";
    }
    
    @RequestMapping("cadastrarHospedagemForm.html")
    public String cadastrarHospedagemForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/cadastrarHospedagem";
    }
    
    @RequestMapping("hospedagensCorrentesAlterar.html")
    public String hospedagensCorrentesAlterar(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesAlterar";
    }
    
    @RequestMapping("alterarHospedagemForm.html")
    public String alterarHospedagemForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/alterarHospedagem";
    }
    
    @RequestMapping("hospedagensTermino.html")
    public String hospedagensTermino(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensTermino";
    }
    
    @RequestMapping("finalizarHospedagem.html")
    public String finalizarHospedagem(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/finalizarHospedagem";
    }
    
    @RequestMapping("hospedagensCorrentesGasto.html")
    public String hospedagensCorrentesGasto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesGasto";
    }
    
    @RequestMapping("gerenciarGastoQuarto.html")
    public String gerenciarGastoQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/gerenciarGastoQuarto";
    }
}
