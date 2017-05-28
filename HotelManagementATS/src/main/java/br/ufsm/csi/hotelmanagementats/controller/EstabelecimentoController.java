/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.EstabelecimentoDao;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.UsuarioAdministrador;
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
public class EstabelecimentoController {
    
    @RequestMapping("cadastrarEstabelecimentoFormAdm.html")
    public String cadastrarEstabelecimentoFormAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/cadastrarEstabelecimentoAdm";
    }
    
    @RequestMapping("escolherEstabelecimentoAlterarAdm.html")
    public String escolherEstabelecimentoAlterarAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/escolherEstabelecimentoAlterarAdm";
    }
    
    @RequestMapping("escolherEstabelecimentoExcluirAdm.html")
    public String escolherEstabelecimentoExcluirAdm(){	
            return "/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/escolherEstabelecimentoExcluirAdm";
    }
    
    /* Cadastrar Estabelecimento */
    @RequestMapping("cadastrarEstabelecimentoAdm.html")
    public ModelAndView cadastrarEstabelecimentoAdm(Estabelecimento est, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Cadastro de Estabelecimento do Adm...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/cadastrarEstabelecimentoAdm");
        
        EstabelecimentoDao eD = new EstabelecimentoDao();
        
        if(est.getNome()!=null && est.getCnpj()!=null && 
           est.getTelFixo()!=null){
           
           est.setUsuarioAdm((UsuarioAdministrador) session.getAttribute("administrador"));
		   
           try{
               int retorno = eD.cadastrarEstabelecimento(est);
               
               switch (retorno) {
                   case 2:
                       mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentosAdm");
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Cadastro feito com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Cadastro Concluído!");
                       break;
                   case 1:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um estabelecimento com mesmo nome!");
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
    
    @RequestMapping("alterarEstabelecimentoFormAdm.html")
    public ModelAndView alterarEstabelecimentoFormAdm(Estabelecimento est, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Estabelecimento de Cadastro de Estabelecimento do Adm...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentosAdm");
        
        EstabelecimentoDao eD = new EstabelecimentoDao();
        
        if(rq.getParameter("estabelecimento")!=null){
            int codEstabelecimento = Integer.parseInt(rq.getParameter("estabelecimento"));
            
            UsuarioAdministrador uA = (UsuarioAdministrador) session.getAttribute("administrador");
            
            est = eD.carregarFormAlterarEstabelecimento(uA, codEstabelecimento);
            
            if(est!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentos/alterarEstabelecimentoAdm");
                mv.addObject("estabelecimento", est);
                System.out.println("Estabelecimento buscado para alteração!");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    /* Alterar Estabelecimento */
    @RequestMapping("alterarEstabelecimentoAdm.html")
    public ModelAndView alterarEstabelecimentoAdm(Estabelecimento est, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Alteração de Estabelecimento do Adm...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentosAdm");
        
        EstabelecimentoDao eD = new EstabelecimentoDao();
        
        if(est.getNome()!=null && est.getCnpj()!=null && 
           est.getTelFixo()!=null){
           
           est.setUsuarioAdm((UsuarioAdministrador) session.getAttribute("administrador"));
		   
           try{
               int retorno = eD.alterarEstabelecimento(est);
               
               switch (retorno) {
                   case 2:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Alteração feita com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Alteração Concluída!");
                       break;
                   case 1:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um outro estabelecimento com mesmo nome!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao alterar!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de alteração já utilizados por outro estabelecimento!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao alterar!");
                       break;
               }     
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de alteração já utilizados por outro estabelecimento!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao alterar!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    /* Excluir Estabelecimento */
    @RequestMapping("excluirEstabelecimentoAdm.html")
    public ModelAndView excluirEstabelecimentoAdm(Estabelecimento est, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Exclusão de Estabelecimento do Adm...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/gerenciamentoEstabelecimentosAdm");
        
        EstabelecimentoDao eD = new EstabelecimentoDao();

        if(rq.getParameter("estabelecimento")!=null){
           
           est.setCod(Integer.parseInt(rq.getParameter("estabelecimento")));
           est.setUsuarioAdm((UsuarioAdministrador) session.getAttribute("administrador"));
		   
           try{
               int retorno = eD.excluirEstabelecimento(est);
               
               switch (retorno) {
                   case 1:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Exclusão feita com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Exclusão Concluída!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Exclusão do estabelecimento não efetuada!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao excluir!");
                       break;
               } 
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Exclusão do estabelecimento não efetuada!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao excluir!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
}
