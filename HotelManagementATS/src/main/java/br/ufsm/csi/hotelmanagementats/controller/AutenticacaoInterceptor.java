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
               uri.endsWith("alterarOperadorLogado.html") ||     
               uri.endsWith("cadastroAdministrador.html")     
            ){
                response.sendRedirect("paginaPrincipalAdm.html");
                return false;
            }
            if(est==null){
                if(uri.endsWith("paginaPrincipalEstabelecimento.html") ||     
                   uri.endsWith("gerenciamentoOperadores.html") ||
                   uri.endsWith("gerenciamentoQuartos.html") ||
                   uri.endsWith("gerenciamentoHospedagens.html") ||
                   uri.endsWith("relatoriosHospedagem.html") ||
                   uri.endsWith("quartosDesocupados.html") ||
                   uri.endsWith("cadastrarHospedagemForm.html") ||     
                   uri.endsWith("hospedagensCorrentesAlterar.html") ||
                   uri.endsWith("alterarHospedagemForm.html") ||     
                   uri.endsWith("hospedagensTermino.html") ||     
                   uri.endsWith("finalizarHospedagem.html") ||     
                   uri.endsWith("hospedagensCorrentesGasto.html") ||     
                   uri.endsWith("gerenciarGastoQuarto.html") ||
                   uri.endsWith("alterarOperadorEstabelecimento.html")     
                ){
                    response.sendRedirect("paginaPrincipalAdm.html");
                    return false;
                }
            }else if(est.getNome()!=null){
                if(uri.endsWith("cadastroAdministrador.html") ||
                   uri.endsWith("cadastrarAdministrador.html") ||      
                   uri.endsWith("gerenciamentoEstabelecimentosAdm.html") ||
                   uri.endsWith("gerenciamentoContaAdm.html") ||
                   uri.endsWith("alterarContaAdmForm.html") ||
                   uri.endsWith("alterarAdministrador.html") ||     
                   uri.endsWith("paginaPrincipalEstabelecimentoAdm.html") ||
                   uri.endsWith("cadastrarEstabelecimentoFormAdm.html")  ||
                   uri.endsWith("escolherEstabelecimentoAlterarAdm.html")  ||
                   uri.endsWith("alterarEstabelecimentoFormAdm.html")  ||     
                   uri.endsWith("alterarEstabelecimentoAdm.html")  ||
                   uri.endsWith("cadastrarEstabelecimentoAdm.html")  ||     
                   uri.endsWith("escolherEstabelecimentoExcluirAdm.html")  ||
                   uri.endsWith("excluirEstabelecimentoAdm.html")    
                ){
                    e = null;
                    request.getSession().setAttribute("estabelecimentoEscolhido", e);
                    response.sendRedirect("paginaInicial.html");
                    return false;
                }else if(uri.contains("paginaInicial.html") ||
                     uri.endsWith("paginaPrincipalAdm.html") ||   
                     uri.endsWith("sobreAplicacao.html")   
                ){
                    e = null;
                    request.getSession().setAttribute("estabelecimentoEscolhido", e);
                    return true;   
                }
            }
            
        }else if(uAdm==null && uOp!=null){
            if(uri.endsWith("relatoriosHospedagem.html") ||
               uri.endsWith("gerenciamentoQuartos.html") ||
               uri.endsWith("gerenciamentoOperadores.html") ||     
               uri.endsWith("cadastroAdministrador.html") ||
               uri.endsWith("paginaPrincipalAdm.html") ||
               uri.endsWith("gerenciamentoEstabelecimentosAdm.html") ||
               uri.endsWith("gerenciamentoContaAdm.html") ||
               uri.endsWith("alterarContaAdmForm.html") ||
               uri.endsWith("alterarAdministrador.html") ||      
               uri.endsWith("cadastrarEstabelecimentoFormAdm.html") ||
               uri.endsWith("cadastrarEstabelecimentoAdm.html") ||      
               uri.endsWith("escolherEstabelecimentoAlterarAdm.html") ||  
               uri.endsWith("escolherEstabelecimentoExcluirAdm.html") ||
               uri.endsWith("alterarEstabelecimentoFormAdm.html") ||
               uri.endsWith("alterarEstabelecimentoAdm.html") ||
               uri.endsWith("excluirEstabelecimentoAdm.html") ||
               uri.endsWith("paginaPrincipalEstabelecimentoAdm.html") ||
               uri.endsWith("alterarOperadorEstabelecimento.html") ||
               uri.endsWith("cadastrarOperador.html") || 
               uri.endsWith("alterarOperadorForm.html") ||
               uri.endsWith("alterarOperadorEstabelecimento.html") ||
               uri.endsWith("cadastrarQuarto.html") || 
               uri.endsWith("alterarQuartoForm.html") ||
               uri.endsWith("alterarQuarto.html") ||
               uri.endsWith("desabilitarQuarto.html") ||
               uri.endsWith("habilitarQuarto.html")     
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
