/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.QuartoDao;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Quarto;
import br.ufsm.csi.hotelmanagementats.model.UsuarioAdministrador;
import br.ufsm.csi.hotelmanagementats.model.UsuarioOperador;
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
public class QuartoController {
    
    @RequestMapping(value = "mostrarQuartoDesocupado.html", method = RequestMethod.POST)
    public ModelAndView mostrarQuartoDesocupado(HttpServletRequest rq, HttpSession session){	
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Quarto desocupado do Estabelecimento para Mostrar...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/quartosDesocupados");
        
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null){
            int codQuarto= Integer.parseInt(rq.getParameter("cod"));
            
            Quarto q = new Quarto();
            q.setCod(codQuarto);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            q.setEstabelecimento(est);
			
            q = qD.carregarQuartoEscolhido(q);
            
            if(q!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/mostrarQuarto");
                mv.addObject("quartoEscolhido", q);
                System.out.println("Quarto buscado para ser mostrado!");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "mostrarQuartoDesocupado.html", method = RequestMethod.GET)
    public String mostrarQuartoDesocupado(){	
            return "forward:quartosDesocupados.html";
    }
    
    @RequestMapping(value = "mostrarQuarto.html", method = RequestMethod.POST)
    public ModelAndView mostrarQuarto(HttpServletRequest rq, HttpSession session){	
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Quarto do Estabelecimento para Mostrar...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/paginaPrincipalEstabelecimento");
        
        QuartoDao qD = new QuartoDao();
        
        String cod = rq.getParameter("cod");
        System.out.println("Código: "+cod);
        
        if(rq.getParameter("cod")!=null){
            int codQuarto= Integer.parseInt(rq.getParameter("cod"));
            
            UsuarioOperador uOp = (UsuarioOperador) session.getAttribute("operador");
            UsuarioAdministrador uAdm = (UsuarioAdministrador) session.getAttribute("administrador");
            
            if(uOp!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteOperador/quartosEstabelecimento");
            }else if(uAdm!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/quartosCadastrados");
            }
            
            Quarto q = new Quarto();
            q.setCod(codQuarto);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            q.setEstabelecimento(est);
			
            q = qD.carregarQuartoMostrar(q);
            
            if(q!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/mostrarQuarto");
                mv.addObject("quartoEscolhido", q);
                
                if(uOp!=null){
                    mv.addObject("verificador", 1);
                }else if(uAdm!=null){
                    mv.addObject("verificador", 0);
                }
                
                System.out.println("Quarto buscado para ser mostrado!");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "mostrarQuarto.html", method = RequestMethod.GET)
    public String mostrarQuarto(HttpSession session){
        UsuarioOperador uOp = (UsuarioOperador) session.getAttribute("operador");
        UsuarioAdministrador uAdm = (UsuarioAdministrador) session.getAttribute("administrador");
        
        String retorno = "paginaInicial.html";
        
        if(uOp!=null){
            retorno = "forward:quartosEstabelecimento.html";
        }else if(uAdm!=null){
            retorno = "forward:quartosCadastrados.html";
        }
        return retorno;
    }
    
    @RequestMapping("cadastrarQuartoForm.html")
    public String cadastrarQuartoForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/cadastrarQuarto";
    }
    
    /* Cadastrar Quarto */
    @RequestMapping(value = "cadastrarQuarto.html", method = RequestMethod.POST)
    public ModelAndView cadastrarQuarto(Quarto q, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Cadastro de Quarto no Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/cadastrarQuarto");
        
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("numero")!=null && rq.getParameter("maxHosp")!=null 
           && rq.getParameter("area")!=null && rq.getParameter("descricaoExtra")!=null
           && rq.getParameter("valorDiaria")!=null){
           
            if(rq.getParameter("numero").length()>0 && rq.getParameter("maxHosp").length()>0 
                && rq.getParameter("area").length()>0 && rq.getParameter("valorDiaria").length()>0){
                
                if(q.getNumero()>0 && q.getMaxHosp()>0 && q.getArea()>0 && q.getValorDiaria()>0){
                    q.setEstado(0); // Quarto desocupado

                    q.setEstabelecimento((Estabelecimento) session.getAttribute("estabelecimentoEscolhido"));

                    try{
                        int retorno = qD.cadastrarQuarto(q);

                        switch (retorno) {
                            case 2:
                                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/quartosCadastrados");
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
            }
        }

        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "cadastrarQuarto.html", method = RequestMethod.GET)
    public String cadastrarQuartoGET(){	
        return "forward:cadastrarQuartoForm.html";
    }
    
    @RequestMapping(value = "alterarQuartoForm.html", method = RequestMethod.POST)
    public ModelAndView alterarQuartoForm(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Quarto do Estabelecimento para Alteração...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/quartosCadastrados");
        
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null){
            int codQuarto= Integer.parseInt(rq.getParameter("cod"));
            
            Quarto q = new Quarto();
            q.setCod(codQuarto);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            q.setEstabelecimento(est);
			
            q = qD.carregarQuartoEscolhido(q);
            
            if(q!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/alterarQuarto");
                mv.addObject("quartoEscolhido", q);
                System.out.println("Quarto buscado para alteração!");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "alterarQuartoForm.html", method = RequestMethod.GET)
    public String alterarQuartoFormGET(){	
        return "forward:quartosCadastrados.html";
    }
    
    /* Alterar Quarto */
    @RequestMapping(value = "alterarQuarto.html", method = RequestMethod.POST)
    public ModelAndView alterarQuarto(Quarto q, HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de Alteração de Quarto do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/quartosCadastrados");
        
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null && rq.getParameter("numero")!=null 
           && rq.getParameter("maxHosp")!=null && rq.getParameter("area")!=null 
	   && rq.getParameter("descricaoExtra")!=null && rq.getParameter("valorDiaria")!=null){
           
           if(rq.getParameter("numero").length()>0 && rq.getParameter("maxHosp").length()>0 
                && rq.getParameter("area").length()>0 && rq.getParameter("valorDiaria").length()>0){
               
                if(q.getNumero()>0 && q.getMaxHosp()>0 && q.getArea()>0 && q.getValorDiaria()>0){
                    int codQuarto = Integer.parseInt(rq.getParameter("cod"));
                    q.setCod(codQuarto);

                    // q.setEstado(0); // Quarto desocupado

                    Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");

                    q.setEstabelecimento(est);

                    try{
                        int retorno = qD.alterarQuarto(q);

                        switch (retorno) {
                            case 2:
                                mv.addObject("mensagem", "<Strong>Sucesso</Strong> Alteração feita com sucesso!");
                                mv.addObject("tipo", "success");
                                System.out.println("Alteração Concluída!");
                                break;
                            case 1:
                                mv.addObject("mensagem", "<Strong>Erro</Strong> Você possui um outro quarto com mesmo número de identificação!");
                                mv.addObject("tipo", "danger");
                                System.out.println("Erro ao alterar!");
                                break;
                            default:
                                mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de alteração já utilizados!");
                                mv.addObject("tipo", "danger");
                                System.out.println("Erro ao alterar!");
                                break;
                        }     
                    }catch(Exception e){
                        e.printStackTrace();
                        mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de alteração já utilizados!");
                        mv.addObject("tipo", "danger");
                        System.out.println("Erro ao alterar!");
                    }
                }
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "alterarQuarto.html", method = RequestMethod.GET)
    public String alterarQuartoGET(){	
        return "forward:quartosCadastrados.html";
    }
    
    @RequestMapping("quartosCadastrados.html")
    public String quartosCadastrados(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/quartosCadastrados";
    }
    
    @RequestMapping("quartosEstabelecimento.html")
    public String quartosEstabelecimento(){	
            return "/WEB-INF/views/ambienteOperador/quartosEstabelecimento";
    }
    
    /* Desabilitar Quarto */
    @RequestMapping(value = "desabilitarQuarto.html", method = RequestMethod.POST)
    public ModelAndView desabilitarQuarto(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de desabilitação de quarto do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/quartosCadastrados");
        
        QuartoDao qD = new QuartoDao();

        if(rq.getParameter("cod")!=null){
           int codQuarto = Integer.parseInt(rq.getParameter("cod"));
            
           Quarto q = new Quarto();
           q.setCod(codQuarto);
			
           Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
           q.setEstabelecimento(est);
           q.setEstado(2);
		   
           int escolha = 2; // 1 - habilitar, 2 - Desabilitar
		   
           try{
               int retorno = qD.habilitarDesabilitarQuarto(q, escolha);
               
               switch (retorno) {
                   case 1:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Desabilitação feita com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Desabilitação Concluída!");
                       break;
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Desabilitação do quarto não efetuada!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao desabilitar!");
                       break;
               } 
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Desabilitação do quarto não efetuada!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao desabilitar!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "desabilitarQuarto.html", method = RequestMethod.GET)
    public String desabilitarQuartoGET(){	
        return "forward:quartosCadastrados.html";
    }
    
    /* Habilitar Quarto */
    @RequestMapping(value = "habilitarQuarto.html", method = RequestMethod.POST)
    public ModelAndView habilitarQuarto(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário de habilitação de quarto do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoQuartos/quartosCadastrados");
        
        QuartoDao qD = new QuartoDao();

        if(rq.getParameter("cod")!=null){
           int codQuarto = Integer.parseInt(rq.getParameter("cod"));
            
           Quarto q = new Quarto();
           q.setCod(codQuarto);
			
           Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
           q.setEstabelecimento(est);
           q.setEstado(0);
		   
           int escolha = 1; // 1 - habilitar, 2 - Desabilitar
		   
           try{
               int retorno = qD.habilitarDesabilitarQuarto(q, escolha);
               
               switch (retorno) {
                   case 1:
                       mv.addObject("mensagem", "<Strong>Sucesso</Strong> Habilitação feita com sucesso!");
                       mv.addObject("tipo", "success");
                       System.out.println("Habilitação Concluída!");
                       break;   
                   default:
                       mv.addObject("mensagem", "<Strong>Erro</Strong> Habilitação do quarto não efetuada!");
                       mv.addObject("tipo", "danger");
                       System.out.println("Erro ao habilitar!");
                       break;
               } 
           }catch(Exception e){
               e.printStackTrace();
               mv.addObject("mensagem", "<Strong>Erro</Strong> Habilitação do quarto não efetuada!");
               mv.addObject("tipo", "danger");
               System.out.println("Erro ao habilitar!");
           }            
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "habilitarQuarto.html", method = RequestMethod.GET)
    public String habilitarQuartoGET(){	
        return "forward:quartosCadastrados.html";
    }
}
