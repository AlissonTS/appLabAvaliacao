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
            return "/WEB-INF/views/ambienteEstabelecimento/cadastrarOperador";
    }
    
    @RequestMapping("alterarExcluirOperador.html")
    public String alterarExcluirOperador(){	
            return "/WEB-INF/views/ambienteEstabelecimento/alterarExcluirOperador";
    }
    
    @RequestMapping("escolherOperadorAlterar.html")
    public String escolherOperadorAlterar(){	
            return "/WEB-INF/views/ambienteEstabelecimento/alterarOperador";
    }
    
    @RequestMapping("escolherOperadorExcluir.html")
    public String escolherOperadorExcluirAdm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/escolherOperadorExcluirAdm";
    }
    
    @RequestMapping("alterarOperador.html")
    public String alterarEstabelecimentoFormAdm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/alterarOperador";
    }
}
