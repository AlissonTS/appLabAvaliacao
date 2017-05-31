/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.QuartoDao;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Quarto;
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
public class QuartoController {
    
    @RequestMapping("cadastrarQuartoForm.html")
    public String cadastrarQuartoForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/cadastrarQuarto";
    }
    
    /* Cadastrar Quarto */
    @RequestMapping("cadastrarQuarto.html")
    public ModelAndView cadastrarQuarto(Quarto q, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Cadastro de Quarto no Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/cadastrarQuarto");
        
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("numero")!=null && rq.getParameter("maxHosp")!=null 
           && rq.getParameter("area")!=null && rq.getParameter("descricaoExtra")!=null
           && rq.getParameter("valorDiaria")!=null){
           
           q.setEstado(0); // Quarto desocupado

           q.setEstabelecimento((Estabelecimento) session.getAttribute("estabelecimentoEscolhido"));
		   
           try{
               int retorno = qD.cadastrarQuarto(q);
               
               switch (retorno) {
                   case 2:		
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Cadastro feito com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Cadastro Concluído!");
                       break;
                   case 1:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um quarto com mesmo número de identificação!");
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
    
    @RequestMapping("alterarDesabilitarQuarto.html")
    public String alterarDesabilitarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarDesabilitarQuarto";
    }
    
    @RequestMapping("alterarQuartoForm.html")
    public String alterarQuartoForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarQuarto";
    }
    
    @RequestMapping("desabilitarQuarto.html")
    public String desabilitarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarDesabilitarQuarto";
    }
    
    @RequestMapping("habilitarQuarto.html")
    public String habilitarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarDesabilitarQuarto";
    }
    
    @RequestMapping("alterarQuarto.html")
    public String alterarQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarQuarto";
    }
}
