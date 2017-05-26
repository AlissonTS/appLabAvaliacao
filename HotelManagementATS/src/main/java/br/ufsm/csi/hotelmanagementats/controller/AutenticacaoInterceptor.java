/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.model.UsuarioAdministrador;
import br.ufsm.csi.hotelmanagementats.model.UsuarioOperador;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Alisson
 */
public class AutenticacaoInterceptor extends HandlerInterceptorAdapter{
    
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception, IOException {
        
        UsuarioAdministrador uAdm = (UsuarioAdministrador) request.getSession().getAttribute("administrador");
        UsuarioOperador uOp = (UsuarioOperador) request.getSession().getAttribute("operador");
        
        String uri = request.getRequestURI();
        
        if(uAdm!=null && uOp==null){
            if(uri.endsWith("alterarContaOp.html") ||
               uri.endsWith("gerenciamentoContaOp.html") ||
               uri.endsWith("cadastroAdministrador.html ")     
            ){
                response.sendRedirect("principalPrincipalAdm.html");
                return false;
            }                 
        }else if(uAdm==null && uOp!=null){
            
        }else{
            
        }
            
        return true;
    }
    
}
