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
public class MenuEstabelecimentoController {
    
    @RequestMapping("gerenciamentoContaOp.html")
    public String gerenciamentoContaOp(){	
            return "/WEB-INF/views/ambienteOperador/gerenciamentoContaOp";
    }
    
    @RequestMapping("paginaPrincipalEstabelecimento.html")
    public String paginaPrincipalEstabelecimento(){	
            return "/WEB-INF/views/ambienteEstabelecimento/paginaPrincipalEstabelecimento";
    }
    
    @RequestMapping("dadosEstabelecimento.html")
    public String dadosEstabelecimento(){	
            return "/WEB-INF/views/ambienteEstabelecimento/dadosEstabelecimento";
    }
}
