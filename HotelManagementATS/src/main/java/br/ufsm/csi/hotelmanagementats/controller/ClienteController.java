/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.ClienteDao;
import br.ufsm.csi.hotelmanagementats.model.Cliente;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    public String alterarClienteForm(HttpServletRequest rq){
        String retorno = rq.getParameter("cod");
        System.out.println("Cliente Selecionado: "+retorno);
        
        return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarCliente";
    }
    
    @RequestMapping("excluirCliente.html")
    public String excluirCliente(HttpServletRequest rq){
        String retorno = rq.getParameter("cod");
        System.out.println("Cliente Selecionado: "+retorno);
        
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarExcluirCliente";
    }
    
    @RequestMapping("alterarCliente.html")
    public String alterarCliente(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarCliente";
    }
    
    /* Cadastrar Cliente */
    @RequestMapping("cadastrarCliente.html")
    public ModelAndView cadastrarCliente(Cliente ct, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Cadastro de Cliente no Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/cadastrarCliente");
        
        ClienteDao cD = new ClienteDao();
        
        if(ct.getNome()!=null && ct.getCpf()!=null 
           && ct.getTelCel()!=null && ct.getEmail()!=null){
           
           ct.setEstabelecimento((Estabelecimento) session.getAttribute("estabelecimentoEscolhido"));
		   
           try{
               int retorno = cD.cadastrarCliente(ct);
               
               switch (retorno) {
                   case 2:		
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Cadastro feito com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Cadastro Concluído!");
                       break;
                   case 1:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um cliente com mesmo CPF!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao cadastrar!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de cadastro já utilizados!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao cadastrar!");
                       break;
               }
               
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de cadastro já utilizados!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao cadastrar!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
}
