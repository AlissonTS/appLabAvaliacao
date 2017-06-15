/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import br.ufsm.csi.hotelmanagementats.model.UsuarioAdministrador;
import br.ufsm.csi.hotelmanagementats.dao.UsuarioAdmDao;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.binary.Base64;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Alisson
 */
@Controller
public class UsuarioAdmController {
    
    /* Cadastrar Usuário */
    @RequestMapping(value = "cadastrarAdministrador.html", method = RequestMethod.POST)
    public ModelAndView cadastrarUsuarioAdm(UsuarioAdministrador u, HttpServletRequest rq) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        System.out.println("-------------------------------");
	System.out.println("Submit Formulário de Cadastro de Administrador...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/cadastroAdministrador");
        
        UsuarioAdmDao uD = new UsuarioAdmDao();
        
        if(u.getNome()!=null && u.getCpf()!=null && 
           u.getTelFixo()!=null && u.getTelCel()!=null &&
           u.getEmail()!=null && u.getSenha()!=null){
            
           byte[] senha = rq.getParameter("senha").getBytes(); 
           
           MessageDigest md = MessageDigest.getInstance("SHA-256");
           byte[] hashSenha = md.digest(senha);
           
           byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
           String valorSenha = new String(hashSenhaBase, "ISO-8859-1");
           
           u.setSenha(valorSenha);
           
           try{
               boolean retorno = uD.cadastrarUsuarioAdm(u);
               
               if(retorno){
                   mv = new ModelAndView("/WEB-INF/views/paginaInicial");
                   mv.addObject("mensagem", "<Strong>Sucesso</Strong> Cadastro feito com sucesso!");
                   mv.addObject("tipo", "success");
                   System.out.println("Cadastro Concluído!");
               }else{
                   mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de cadastro já utilizados!");
                   mv.addObject("tipo", "danger");
                   System.out.println("Erro ao cadastrar!");
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
    
    @RequestMapping("alterarContaAdmForm.html")
    public String alterarContaAdmForm(){	
            return "/WEB-INF/views/ambienteAdministrador/alterarContaAdm";
    }
    
    @RequestMapping(value = "alterarAdministrador.html", method = RequestMethod.POST)
    public ModelAndView alterarAdministrador(UsuarioAdministrador u, HttpServletRequest rq, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException{	
        System.out.println("-------------------------------");
	System.out.println("Submit Formulário de Alteração de Administrador..."); 
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/alterarContaAdm");
        
        String redefinir = rq.getParameter("redefinir");
        String senhaN = rq.getParameter("senhaN");
        
        UsuarioAdministrador uA = (UsuarioAdministrador) session.getAttribute("administrador");
        String senhaAntiga = uA.getSenha();
        String cpfAntigo = uA.getCpf();
        
        int codUsuario = uA.getCod();
        
        UsuarioAdmDao uD = new UsuarioAdmDao();
        
        if(u.getNome()!=null && u.getCpf()!=null && 
           u.getTelFixo()!=null && u.getTelCel()!=null &&
           u.getEmail()!=null && u.getSenha()!=null && senhaN!=null && redefinir!=null){
           
           u.setCod(codUsuario);
           u.setCpf(cpfAntigo);
           
           if(redefinir.equals("Sim")){
               byte[] senha = rq.getParameter("senha").getBytes(); 
           
               MessageDigest md = MessageDigest.getInstance("SHA-256");
               byte[] hashSenha = md.digest(senha);

               byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
               String valorSenha = new String(hashSenhaBase, "ISO-8859-1");

               u.setSenha(valorSenha);
           }else{
               u.setSenha(senhaAntiga);
           }
           
           try{
               boolean retorno = uD.alterarUsuarioAdm(u);
               
               if(retorno){                   
                   session.setAttribute("administrador", u);
                   
                   mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/gerenciamentoContaAdm");
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
}
