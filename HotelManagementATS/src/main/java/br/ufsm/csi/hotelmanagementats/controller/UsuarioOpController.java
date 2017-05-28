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

/**
 *
 * @author Alisson
 */
@Controller
public class UsuarioOpController {
 
    @RequestMapping("alterarContaOp.html")
    public String alterarContaAdm(){	
            return "/WEB-INF/views/ambienteOperador/alterarContaOp";
    }
    
    @RequestMapping("alterarOperador.html")
    public ModelAndView alterarOperador(UsuarioOperador u, HttpServletRequest rq, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException{	
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Alteração de Operador..."); 

        UsuarioOperador uA = (UsuarioOperador) session.getAttribute("operador");
        Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimento");

        ModelAndView mv;

        String senhaAntiga="";
        int codUsuario=0;
        
        if(uA.getNome()==null){
            mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoOperadores/alterarExcluirOperador");
        }else{
            mv = new ModelAndView("/WEB-INF/views/ambienteOperador/alterarContaOp");

            senhaAntiga = uA.getSenha();
            codUsuario = uA.getCod();
        }
		
        String redefinir = rq.getParameter("redefinir");
        String senhaN = rq.getParameter("senhaN");
        
        UsuarioOpDao uD = new UsuarioOpDao();
        
        if(u.getNome()!=null && u.getCpf()!=null && 
           u.getTelFixo()!=null && u.getTelCel()!=null &&
           u.getNickname()!=null && u.getSenha()!=null && senhaN!=null && redefinir!=null){
           
           if(uA.getNome()==null){ 
               if(rq.getParameter("codUsuario")==null){
                    return mv; 
               }else{
                    u.setCod(Integer.parseInt(rq.getParameter("codUsuario")));
               }
           }else{
               u.setCod(codUsuario);
           }    

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
               boolean retorno = uD.alterarUsuarioOperador(u, est);
               
               if(retorno){
                   if(uA.getNome()!=null){	
                     session.setAttribute("operador", u);
                     mv = new ModelAndView("/WEB-INF/views/ambienteOperador/gerenciamentoContaOp");
                   } 
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
