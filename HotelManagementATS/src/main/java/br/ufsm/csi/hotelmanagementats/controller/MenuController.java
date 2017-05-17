package br.ufsm.csi.hotelmanagementats.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Alisson
 */

@Controller
public class MenuController {
    
    @RequestMapping("paginaInicial.html")
    public String paginaInicial(){	
            return "index";
    }
    
    @RequestMapping("paginaInicial2.html")
    public String paginaInicial2(){	
            return "index2";
    }
    
    @RequestMapping("paginaInicial3.html")
    public String paginaInicial3(){	
            return "/WEB-INF/views/index3";
    }
}
