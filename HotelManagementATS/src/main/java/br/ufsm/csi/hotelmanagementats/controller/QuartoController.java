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
public class QuartoController {
    
    @RequestMapping("cadastrarQuartoForm.html")
    public String cadastrarQuartoForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/cadastrarQuarto";
    }
    
    @RequestMapping("alterarDesabilitarQuarto.html")
    public String alterarDesabilitarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarDesabilitarQuarto";
    }
    
    @RequestMapping("alterarQuartoForm.html")
    public String alterarQuartoForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarQuarto";
    }
    
    @RequestMapping("desabilitarQuarto.html")
    public String desabilitarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarDesabilitarQuarto";
    }
    
    @RequestMapping("habilitarQuarto.html")
    public String habilitarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarDesabilitarQuarto";
    }
    
    @RequestMapping("alterarQuarto.html")
    public String alterarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarQuarto";
    }
}
