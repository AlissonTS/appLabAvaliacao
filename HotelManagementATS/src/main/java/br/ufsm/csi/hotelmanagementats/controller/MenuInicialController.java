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
public class MenuInicialController{
    
    @RequestMapping("index.html")
    public String index(){	
            return "index";
    }
    
    @RequestMapping("paginaInicial.html")
    public String paginaInicial(){	
            return "/WEB-INF/views/paginaInicial";
    }
    
    @RequestMapping("cadastroAdministrador.html")
    public String cadastroAdministrador(){	
            return "/WEB-INF/views/cadastroAdministrador";
    }
    
    @RequestMapping("sobreAplicacao.html")
    public String sobreAplicacao(){	
            return "/WEB-INF/views/sobreAplicacao";
    }
}
