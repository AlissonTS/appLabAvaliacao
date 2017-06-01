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
    public ModelAndView alterarClienteForm(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Cliente para Alteração...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarExcluirCliente");
        
        ClienteDao cD = new ClienteDao();
        
        if(rq.getParameter("cod")!=null){
            int codCliente= Integer.parseInt(rq.getParameter("cod"));
            
            Cliente ct = new Cliente();
            ct.setCod(codCliente);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            ct.setEstabelecimento(est);
			
            ct = cD.carregarClienteEscolhido(ct);
            
            if(ct!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarCliente");
                mv.addObject("cliente", ct);
                System.out.println("Cliente buscado para alteração!");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    /* Excluir Cliente */
    @RequestMapping("excluirCliente.html")
    public ModelAndView excluirCliente(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Exclusão de Cliente do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarExcluirCliente");
        
        ClienteDao cD = new ClienteDao();

        if(rq.getParameter("cod")!=null){
            int codCliente= Integer.parseInt(rq.getParameter("cod"));
            
            Cliente ct = new Cliente();
            ct.setCod(codCliente);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            ct.setEstabelecimento(est);
		   
           try{
               int retorno = cD.excluirCliente(ct);
               
               switch (retorno) {
                   case 1:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Exclusão feita com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Exclusão Concluída!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Exclusão do hóspede não efetuada!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao excluir!");
                       break;
               } 
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Exclusão do hóspede não efetuada!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao excluir!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    /* Alterar Cliente */
    @RequestMapping("alterarCliente.html")
    public ModelAndView alterarCliente(Cliente ct, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Alteração de Cliente do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoClientes/alterarExcluirCliente");
        
        ClienteDao cD = new ClienteDao();
        
        if(rq.getParameter("cod")!=null && ct.getNome()!=null && ct.getCpf()!=null && 
           ct.getTelCel()!=null && ct.getEmail()!=null){
           int codCliente= Integer.parseInt(rq.getParameter("cod"));
           ct.setCod(codCliente);

           Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
		   
           ct.setEstabelecimento(est);
		   
           try{
               int retorno = cD.alterarCliente(ct);
               
               switch (retorno) {
                   case 2:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Alteração feita com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Alteração Concluída!");
                       break;
                   case 1:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um outro hóspede com mesmo CPF!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao alterar!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de alteração já utilizados por outro hóspede!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao alterar!");
                       break;
               }     
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de alteração já utilizados por outro hóspede!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao alterar!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
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
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um hóspede com mesmo CPF!");
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
