/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
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
        Estabelecimento est = (Estabelecimento) request.getSession().getAttribute("estabelecimentoEscolhido");
        
        Estabelecimento e;
        
        String uri = request.getRequestURI();
        
        if(uAdm!=null && uOp==null){
            if(uri.endsWith("alterarContaOp.html") ||
               uri.endsWith("gerenciamentoContaOp.html") ||
               uri.endsWith("alterarOpLogado.html") ||
               uri.endsWith("quartosEstabelecimento.html") ||        
               uri.endsWith("cadastroAdministrador.html")     
            ){
                response.sendRedirect("paginaPrincipalAdm.html");
                return false;
            }
            if(est==null){ // Ajeitar
                if(uri.endsWith("paginaPrincipalEstabelecimento.html") ||
                   uri.contains("operador") ||
                   uri.contains("Operador") ||
                   uri.contains("quarto") ||
                   uri.contains("Quarto") ||
                   uri.contains("hospede") ||
                   uri.contains("Hospede") ||
                   uri.contains("Hospedagem") ||
                   uri.contains("hospedagens") ||
                   uri.contains("Gasto") ||     
                   uri.contains("relatorio") ||
                   uri.contains("Relatorio") ||
                   uri.contains("dados"))     
                {
                    response.sendRedirect("paginaPrincipalAdm.html");
                    return false;
                }
            }else if(est.getNome()!=null){
                if(uri.contains("paginaInicial.html") ||
                     uri.endsWith("paginaPrincipalAdm.html") ||   
                     uri.endsWith("sobreAplicacao.html")   
                ){
                    e = null;
                    request.getSession().setAttribute("estabelecimentoEscolhido", e);
                    return true;   
                }
                else if(uri.contains("Adm")){
                    e = null;
                    request.getSession().setAttribute("estabelecimentoEscolhido", e);
                    response.sendRedirect("paginaInicial.html");
                    return false;
                } 
            }
            
        }else if(uAdm==null && uOp!=null){
            if(uri.contains("quartosDesocupados") ||
                uri.contains("quartosEstabelecimento") ||     
                uri.contains("cadastrarGastoQuarto") ||
                uri.contains("mostrarQuartoDesocupado") || 
                uri.contains("hospedesQuartoHospedagem") ||     
                uri.contains("gerenciarGastoQuarto") ||
                uri.contains("mostrarQuarto")    
            ){
                return true;
            }
            else if(uri.contains("Adm") ||
                uri.contains("operador") ||
                uri.contains("Operador") ||
                uri.contains("quarto") ||
                uri.contains("Quarto") ||
                uri.contains("relatorio") ||
                uri.contains("Relatorio")     
            ){
                response.sendRedirect("paginaPrincipalEstabelecimento.html");
                return false;
            }
            
        }else{
            if(uri.contains("paginaInicial.html") ||
               uri.endsWith("cadastroAdministrador.html") ||
               uri.endsWith("cadastrarAdministrador.html") ||
               uri.endsWith("sobreAplicacao.html") ||
               uri.endsWith("realizarLogin.html")    
            ){
                return true;
            }else{
                response.sendRedirect("paginaInicial.html");
                return false;
            }
        }

        return true;
    }
    
}
