/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.UsuarioAdmDao;
import br.ufsm.csi.hotelmanagementats.dao.UsuarioOpDao;
import br.ufsm.csi.hotelmanagementats.model.UsuarioAdministrador;
import br.ufsm.csi.hotelmanagementats.model.UsuarioOperador;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Alisson
 */
@Controller
public class AcessoController {
    
    @RequestMapping("realizarLogin.html")
    public ModelAndView realizarLogin(HttpServletRequest rq) throws NoSuchAlgorithmException, UnsupportedEncodingException{	
        System.out.println("-------------------------------");
	System.out.println("Submit Formulário de Login...");
        
        String login = rq.getParameter("login");
        String senha = rq.getParameter("senha");
        ModelAndView mv = new ModelAndView("/WEB-INF/views/paginaInicial");
        
        if(login!=null && senha!=null){
            int verificador = login.indexOf("@");
            
            byte[] senhaByte = senha.getBytes(); 
           
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashSenha = md.digest(senhaByte);

            byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
            String valorSenha = new String(hashSenhaBase, "ISO-8859-1");
            
            if(verificador!=-1){            
                UsuarioAdministrador u = new UsuarioAdministrador();
                u.setEmail(login);
           
                u.setSenha(valorSenha);
                
                UsuarioAdmDao uD = new UsuarioAdmDao();
                
                u = uD.logar(u);
                
                if(u==null){
                    mv.addObject("mensagem", "<Strong> Erro!</Strong> Dados inválidos!");
                    mv.addObject("tipo", "danger");
                    System.out.println("Erro de Login - Administrador!");
                }else{
                    mv = new ModelAndView("/WEB-INF/views/ambienteAdministrador/paginaPrincipalAdm");
                    mv.addObject("mensagem", "<Strong> Sucesso!</Strong> Dados válidos!");
                    mv.addObject("tipo", "success");
                    System.out.println("Login feito com sucesso - Administrador!");
                }
                
            }else{
                UsuarioOperador u = new UsuarioOperador();
                u.setNickname(login);
                u.setSenha(valorSenha);
                
                UsuarioOpDao uD = new UsuarioOpDao();
                
                u = uD.logar(u);
                
                if(u==null){
                    mv.addObject("mensagem", "<Strong> Erro!</Strong> Dados inválidos!");
                    mv.addObject("tipo", "danger");
                    System.out.println("Erro de Login - Operador!");
                }else{
                    mv = new ModelAndView("/WEB-INF/views/ambienteOperador/gerenciamentoContaOp");
                    mv.addObject("mensagem", "<Strong> Sucesso!</Strong> Dados válidos!");
                    mv.addObject("tipo", "success");
                    System.out.println("Login feito com sucesso - Operador!");
                }
            }
        }
        
        return mv;
    }
    
    @RequestMapping("realizarLogout.html")
    public String realizarLogout(){	
            return "/WEB-INF/views/paginaInicial";
    }
}
