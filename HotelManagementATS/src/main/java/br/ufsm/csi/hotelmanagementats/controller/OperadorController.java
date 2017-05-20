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
public class OperadorController {
    
    @RequestMapping("cadastrarOperadorForm.html")
    public String cadastrarOperadorForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/cadastrarOperador";
    }
    
    @RequestMapping("alterarExcluirOperador.html")
    public String alterarExcluirOperador(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador";
    }
    
    @RequestMapping("alterarOperadorForm.html")
    public String alterarOperadorForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarOperador";
    }
    
    @RequestMapping("excluirOperador.html")
    public String excluirOperador(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador";
    }
    
    @RequestMapping("alterarOperador.html")
    public String alterarOperador(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarOperador";
    }
}
