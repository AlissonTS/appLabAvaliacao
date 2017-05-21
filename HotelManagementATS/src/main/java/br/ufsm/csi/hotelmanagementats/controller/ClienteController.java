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
public class ClienteController {
    
    @RequestMapping("cadastrarClienteForm.html")
    public String cadastrarClienteForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/cadastrarCliente";
    }
    
    @RequestMapping("alterarExcluirCliente.html")
    public String alterarExcluirCliente(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarExcluirCliente";
    }
    
    @RequestMapping("alterarClienteForm.html")
    public String alterarClienteForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarCliente";
    }
    
    @RequestMapping("excluirCliente.html")
    public String excluirCliente(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarExcluirCliente";
    }
    
    @RequestMapping("alterarCliente.html")
    public String alterarCliente(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarCliente";
    }
}
