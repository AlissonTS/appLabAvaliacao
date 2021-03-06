/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Alisson
 */
@Controller
public class MenuPrincipalAdmController {
    
    @RequestMapping("paginaPrincipalAdm.html")
    public String paginaPrincipalAdm(HttpSession session){
        
        Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
        
        Estabelecimento e = null;
        
        if(est!=null){
            session.setAttribute("estabelecimentoEscolhido", e);
        }
        
        return "/WEB-INF/views/ambienteAdministrador/paginaPrincipalAdm";
    }
    
    @RequestMapping("gerenciamentoContaAdm.html")
    public String gerenciamentoContaAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoContaAdm";
    }
}
