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
public class AcessoController {
    
    @RequestMapping("realizarLogin.html")
    public String realizarLogin(){	
            return "/WEB-INF/views/ambienteAdministrador/paginaPrincipalAdm";
    }
    
    @RequestMapping("realizarLogout.html")
    public String realizarLogout(){	
            return "/WEB-INF/views/paginaInicial";
    }
}
