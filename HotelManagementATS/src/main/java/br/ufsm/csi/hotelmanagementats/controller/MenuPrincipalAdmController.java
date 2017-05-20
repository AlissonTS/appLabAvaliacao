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
public class MenuPrincipalAdmController {
    
    @RequestMapping("paginaPrincipalAdm.html")
    public String paginaPrincipalAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/paginaPrincipalAdm";
    }
    
    @RequestMapping("gerenciamentoEstabelecimentosAdm.html")
    public String gerenciamentoEstabelecimentosAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentosAdm";
    }
    
    @RequestMapping("gerenciamentoContaAdm.html")
    public String gerenciamentoContaAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoContaAdm";
    }
}
