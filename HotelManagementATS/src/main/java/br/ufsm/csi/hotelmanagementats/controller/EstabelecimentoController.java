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
public class EstabelecimentoController {
    
    @RequestMapping("cadastrarEstabelecimentoFormAdm.html")
    public String cadastrarEstabelecimentoFormAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/cadastrarEstabelecimentoAdm";
    }
    
    @RequestMapping("escolherEstabelecimentoAlterarAdm.html")
    public String escolherEstabelecimentoAlterarAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/escolherEstabelecimentoAlterarAdm";
    }
    
    @RequestMapping("escolherEstabelecimentoExcluirAdm.html")
    public String escolherEstabelecimentoExcluirAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/escolherEstabelecimentoExcluirAdm";
    }
    
    @RequestMapping("alterarEstabelecimentoFormAdm.html")
    public String alterarEstabelecimentoFormAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/alterarEstabelecimentoAdm";
    }
    
    @RequestMapping("excluirEstabelecimentoAdm.html")
    public String excluirEstabelecimentoAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/escolherEstabelecimentoExcluirAdm";
    }
}
