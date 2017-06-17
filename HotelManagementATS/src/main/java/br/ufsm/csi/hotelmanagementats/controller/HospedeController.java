/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.HospedeDao;
import br.ufsm.csi.hotelmanagementats.model.Hospede;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Alisson
 */
@Controller
public class HospedeController {
    
    @RequestMapping("cadastrarHospedeForm.html")
    public String cadastrarHospedeForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedes/cadastrarHospede";
    }
    
    @RequestMapping("alterarExcluirHospede.html")
    public String alterarExcluirHospede(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedes/alterarExcluirHospede";
    }
    
    @RequestMapping(value = "alterarHospedeForm.html", method = RequestMethod.POST)
    public ModelAndView alterarHospedeForm(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Hóspede para Alteração...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedes/alterarExcluirHospede");
        
        HospedeDao hD = new HospedeDao();
        
        if(rq.getParameter("cod")!=null){
            int codHospede = Integer.parseInt(rq.getParameter("cod"));
            
            Hospede hp = new Hospede();
            hp.setCod(codHospede);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            hp.setEstabelecimento(est);
			
            hp = hD.carregarHospedeEscolhido(hp);
            
            if(hp!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedes/alterarHospede");
                mv.addObject("hospede", hp);
                System.out.println("Hóspede buscado para alteração!");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "alterarHospedeForm.html", method = RequestMethod.GET)
    public String alterarHospedeFormGET(){	
        return "forward:alterarExcluirHospede.html";
    }
    
    /* Excluir Hospede */
    @RequestMapping(value = "excluirHospede.html", method = RequestMethod.POST)
    public ModelAndView excluirHospede(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Exclusão de Hóspede do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedes/alterarExcluirHospede");
        
        HospedeDao hD = new HospedeDao();

        if(rq.getParameter("cod")!=null){
            int codHospede = Integer.parseInt(rq.getParameter("cod"));
            
            Hospede hp = new Hospede();
            hp.setCod(codHospede);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            hp.setEstabelecimento(est);
		   
           try{
               int retorno = hD.excluirHospede(hp);
               
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
    
    @RequestMapping(value = "excluirHospede.html", method = RequestMethod.GET)
    public String excluirHospedeGET(){	
        return "forward:alterarExcluirHospede.html";
    }
    
    /* Alterar Hospede */
    @RequestMapping(value = "alterarHospede.html", method = RequestMethod.POST)
    public ModelAndView alterarHospede(Hospede hp, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Alteração de Hóspede do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedes/alterarExcluirHospede");
        
        HospedeDao hD = new HospedeDao();
        
        if(rq.getParameter("cod")!=null && hp.getNome()!=null && hp.getCpf()!=null && 
           hp.getTelCel()!=null && hp.getEmail()!=null){
           int codHospede = Integer.parseInt(rq.getParameter("cod"));
           hp.setCod(codHospede);

           Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
		   
           hp.setEstabelecimento(est);
		   
           try{
               int retorno = hD.alterarHospede(hp);
               
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
    
    @RequestMapping(value = "alterarHospede.html", method = RequestMethod.GET)
    public String alterarHospedeGET(){	
        return "forward:alterarExcluirHospede.html";
    }
    
    /* Cadastrar Hospede */
    @RequestMapping(value = "cadastrarHospede.html", method = RequestMethod.POST)
    public ModelAndView cadastrarHospede(Hospede hp, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Cadastro de Hospede no Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedes/cadastrarHospede");
        
        HospedeDao hD = new HospedeDao();
        
        if(hp.getNome()!=null && hp.getCpf()!=null 
           && hp.getTelCel()!=null && hp.getEmail()!=null){
           
           hp.setEstabelecimento((Estabelecimento) session.getAttribute("estabelecimentoEscolhido"));
		   
           try{
               int retorno = hD.cadastrarHospede(hp);
               
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
    
    @RequestMapping(value = "cadastrarHospede.html", method = RequestMethod.GET)
    public String cadastrarHospedeGET(){	
        return "forward:cadastrarHospedeForm.html";
    }
}
