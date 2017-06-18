/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.UsuarioOpDao;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.UsuarioOperador;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.codec.binary.Base64;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Alisson
 */
@Controller
public class UsuarioOpController {
    
    @RequestMapping("cadastrarOperadorForm.html")
    public String cadastrarOperadorForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/cadastrarOperador";
    }
    
    @RequestMapping("alterarExcluirOperador.html")
    public String alterarExcluirOperador(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador";
    }
    
    /* Excluir Operador */
    @RequestMapping(value = "excluirOperador.html", method = RequestMethod.POST)
    public ModelAndView excluirOperador(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Exclusão de Operador do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador");
        
        UsuarioOpDao cD = new UsuarioOpDao();

        System.out.println("Código: "+rq.getParameter("cod"));
        
        if(rq.getParameter("cod")!=null){
           int codOperador = Integer.parseInt(rq.getParameter("cod"));
            
           UsuarioOperador u = new UsuarioOperador();
           u.setCod(codOperador);
			
           Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
           u.setEstabelecimento(est);
		   
           try{
               int retorno = cD.excluirOperador(u);
               
               switch (retorno) {
                   case 1:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Exclusão feita com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Exclusão Concluída!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Exclusão do operador não efetuada!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao excluir!");
                       break;
               } 
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Exclusão do operador não efetuada!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao excluir!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }

    @RequestMapping(value = "excluirOperador.html", method = RequestMethod.GET)
    public String excluirOperadorGET(){	
        return "forward:alterarExcluirOperador.html";
    }
    
    @RequestMapping(value = "alterarOperadorEstabelecimento.html", method = RequestMethod.POST)
    public ModelAndView alterarOperadorEstabelecimento(UsuarioOperador u, HttpServletRequest rq, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException{	
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Alteração de Operador do Estabelecimento - Adm..."); 

        Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");

        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador");

        String redefinir = rq.getParameter("redefinir");
        String senhaN = rq.getParameter("senhaN");
        
        UsuarioOpDao uD = new UsuarioOpDao();
        boolean verificador = false;
        
        if(rq.getParameter("cod")!=null && u.getNome()!=null 
            && u.getCpf()!=null && u.getTelFixo()!=null 
            && u.getTelCel()!=null && u.getNickname()!=null && u.getSenha()!=null 
            && senhaN!=null && redefinir!=null){
			
           if(redefinir.equals("Sim")){
               byte[] senha = rq.getParameter("senha").getBytes(); 
           
               MessageDigest md = MessageDigest.getInstance("SHA-256");
               byte[] hashSenha = md.digest(senha);

               byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
               String valorSenha = new String(hashSenhaBase, "ISO-8859-1");

               u.setSenha(valorSenha);
               verificador = true;
           }
		   
           u.setEstabelecimento(est);
           
           try{
               boolean retorno = uD.alterarUsuarioOperador(u, verificador);
               
               if(retorno){				 
                   mv.addObject("mensagem", "<Strong>Sucesso</Strong> Alteração feita com sucesso!");
                   mv.addObject("tipo", "success");
                   System.out.println("Alteração Concluída!");
               }else{
                   mv.addObject("mensagem", "<Strong>Erro</Strong> Dados alterados já utilizados por outro usuário operador cadastrado no Sistema.");
                   mv.addObject("tipo", "danger");
                   System.out.println("Erro ao Alterar!");
               }
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Dados alterados já utilizados por outro usuário operador cadastrado no Sistema.");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao Alterar!");
           }
            
        }

        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "alterarOperadorEstabelecimento.html", method = RequestMethod.GET)
    public String alterarOperadorEstabelecimentoGET(){	
        return "forward:alterarExcluirOperador.html";
    }
    
    @RequestMapping("alterarContaOp.html")
    public String alterarContaAdm(){	
            return "/WEB-INF/views/ambienteOperador/alterarContaOp";
    }
    
    @RequestMapping(value = "alterarOperadorLogado.html", method = RequestMethod.POST)
    public ModelAndView alterarOperadorLogado(UsuarioOperador u, HttpServletRequest rq, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException{	
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Alteração de Operador Logado..."); 

        UsuarioOperador uA = (UsuarioOperador) session.getAttribute("operador");
        Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");

        ModelAndView mv;

        String senhaAntiga="";
        int codUsuario=0;

	mv = new ModelAndView("/WEB-INF/views/ambienteOperador/alterarContaOp");

	senhaAntiga = uA.getSenha();
	codUsuario = uA.getCod();

        String redefinir = rq.getParameter("redefinir");
        String senhaN = rq.getParameter("senhaN");
        
        UsuarioOpDao uD = new UsuarioOpDao();
        
        boolean verificador = false;
        
        if(u.getNome()!=null && u.getCpf()!=null && 
           u.getTelFixo()!=null && u.getTelCel()!=null &&
           u.getNickname()!=null && u.getSenha()!=null && 
           senhaN!=null && redefinir!=null){

           u.setCod(codUsuario);

           if(redefinir.equals("Sim")){
               byte[] senha = rq.getParameter("senha").getBytes(); 
           
               MessageDigest md = MessageDigest.getInstance("SHA-256");
               byte[] hashSenha = md.digest(senha);

               byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
               String valorSenha = new String(hashSenhaBase, "ISO-8859-1");

               u.setSenha(valorSenha);
               
               verificador = true;
           }else{
               u.setSenha(senhaAntiga);
           }
           
           u.setEstabelecimento(est);
           
           try{
               boolean retorno = uD.alterarUsuarioOperador(u, verificador);
               
               if(retorno){
                   session.setAttribute("operador", u);
                   mv = new ModelAndView("/WEB-INF/views/ambienteOperador/gerenciamentoContaOp");
					 
                   mv.addObject("mensagem", "<Strong>Sucesso</Strong> Alteração feita com sucesso!");
                   mv.addObject("tipo", "success");
                   System.out.println("Alteração Concluída!");
               }else{
                   mv.addObject("mensagem", "<Strong>Erro</Strong> Dados alterados já utilizados por outro usuário do Sistema.");
                   mv.addObject("tipo", "danger");
                   System.out.println("Erro ao Alterar!");
               }
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Dados alterados já utilizados por outro usuário do Sistema.");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao Alterar!");
           }
            
        }

        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "alterarOperadorLogado.html", method = RequestMethod.GET)
    public String alterarOperadorLogadoGET(){	
        return "forward:alterarContaOp.html";
    }
    
    /* Cadastrar Operador */
    @RequestMapping(value = "cadastrarOperador.html", method = RequestMethod.POST)
    public ModelAndView cadastrarOperador(UsuarioOperador u, HttpServletRequest rq, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Cadastro de Operador do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/cadastrarOperador");
        
        UsuarioOpDao uD = new UsuarioOpDao();
        
        if(u.getNome()!=null && u.getCpf()!=null 
           && u.getTelCel()!=null && u.getTelFixo()!=null 
           && u.getNickname()!=null && u.getSenha()!=null){
           
           u.setEstabelecimento((Estabelecimento) session.getAttribute("estabelecimentoEscolhido"));
		   
	   byte[] senha = rq.getParameter("senha").getBytes(); 
           
           MessageDigest md = MessageDigest.getInstance("SHA-256");
           byte[] hashSenha = md.digest(senha);
           
           byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
           String valorSenha = new String(hashSenhaBase, "ISO-8859-1");
           
           u.setSenha(valorSenha);
		   
           try{
               int retorno = uD.cadastrarOperador(u);
               
               switch (retorno) {
                   case 2:		
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Cadastro feito com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Cadastro Concluído!");
                       break;
                   case 1:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um operador com mesmo CPF!");
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
    
    @RequestMapping(value = "cadastrarOperador.html", method = RequestMethod.GET)
    public String cadastrarOperadorGET(){	
        return "forward:cadastrarOperadorForm.html";
    }
    
    @RequestMapping(value = "alterarOperadorForm.html", method = RequestMethod.POST)
    public ModelAndView alterarOperadorForm(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Operador do estabelecimento para Alteração...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador");
        
        UsuarioOpDao uD = new UsuarioOpDao();
        
        if(rq.getParameter("cod")!=null){
            int codOperador = Integer.parseInt(rq.getParameter("cod"));
            
            UsuarioOperador u = new UsuarioOperador();
            u.setCod(codOperador);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            u.setEstabelecimento(est);
			
            u = uD.carregarOperadorEscolhido(u);
            
            if(u!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarOperador");
                mv.addObject("operadorEscolhido", u);
                System.out.println("Operador buscado para alteração!");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "alterarOperadorForm.html", method = RequestMethod.GET)
    public String alterarOperadorFormGET(){	
        return "forward:alterarExcluirOperador.html";
    }
    
    /* Desabilitar Acesso do Usuario Operador */
    @RequestMapping(value = "desabilitarOperador.html", method = RequestMethod.POST)
    public ModelAndView desabilitarOperador(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de desabilitação de acesso do Usuário operador do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador");
        
        UsuarioOpDao uD = new UsuarioOpDao();

        if(rq.getParameter("cod")!=null){
           int codOperador = Integer.parseInt(rq.getParameter("cod"));
            
           UsuarioOperador u = new UsuarioOperador();
           u.setCod(codOperador);
			
           Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
           u.setEstabelecimento(est);
           u.setEstado(0);
		   
           int escolha = 2; // 1 - habilitar, 2 - Desabilitar
		   
           try{
               int retorno = uD.abilitarDesabilitarOperador(u, escolha);
               
               switch (retorno) {
                   case 1:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Usuário operador sem acesso ao Sistema!");
                       mv.addObject("tipo", "success");
                       System.out.println("Desabilitação do usuário operador Concluída!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Desabilitação do usuário operador não efetuada!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao desabilitar!");
                       break;
               } 
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Desabilitação do usuário operador não efetuada!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao desabilitar!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "desabilitarOperador.html", method = RequestMethod.GET)
    public String desabilitarOperadorGET(){	
        return "forward:alterarExcluirOperador.html";
    }
    
    /* Habilitar Usuário Operador */
    @RequestMapping(value = "habilitarOperador.html", method = RequestMethod.POST)
    public ModelAndView habilitarOperador(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de habilitação de acesso do usuário operador do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador");
        
        UsuarioOpDao uD = new UsuarioOpDao();

        if(rq.getParameter("cod")!=null){
           int codUsuario = Integer.parseInt(rq.getParameter("cod"));
            
           UsuarioOperador u = new UsuarioOperador();
           u.setCod(codUsuario);
			
           Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
           u.setEstabelecimento(est);
           u.setEstado(1);
		   
           int escolha = 1; // 1 - habilitar, 2 - Desabilitar
		   
           try{
               int retorno = uD.abilitarDesabilitarOperador(u, escolha);
               
               switch (retorno) {
                   case 1:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Usuário operador com acesso ao Sistema!");
                       mv.addObject("tipo", "success");
                       System.out.println("Habilitação Concluída!");
                       break;   
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Habilitação do usuário operador não efetuada!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao habilitar!");
                       break;
               } 
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Habilitação do usuário operador não efetuada!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao habilitar!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "habilitarOperador.html", method = RequestMethod.GET)
    public String habilitarOperadorGET(){	
        return "forward:alterarExcluirOperador.html";
    }
}
