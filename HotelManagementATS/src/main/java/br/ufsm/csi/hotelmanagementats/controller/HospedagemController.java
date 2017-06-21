/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.HospedagemDao;
import br.ufsm.csi.hotelmanagementats.dao.QuartoDao;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Gasto;
import br.ufsm.csi.hotelmanagementats.model.Hospedagem;
import br.ufsm.csi.hotelmanagementats.model.Quarto;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
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
public class HospedagemController {
    
    @RequestMapping("relatoriosHospedagem.html")
    public ModelAndView relatoriosHospedagem(){	
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/relatoriosHospedagem");
        mv.addObject("verificador", 0);
        
        return mv;
    }
    
    @RequestMapping(value = "gerarRelatorioHospedagem.html", method = RequestMethod.POST)
    public ModelAndView gerarRelatorioHospedagem(HttpServletRequest rq, HttpSession session) throws ParseException{
        System.out.println("-------------------------------");
        System.out.println("Submit Relatório de Hospedagem de Acordo com Data Informada...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/relatoriosHospedagem");
		
        HospedagemDao hD = new HospedagemDao();
        
        if(rq.getParameter("dataInicial")!=null){
            String data = rq.getParameter("dataInicial");
            
            mv.addObject("data", data);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
			
            List<Hospedagem> relatorio = new ArrayList();
			
            relatorio = hD.gerarRelatorioHospedagem(data, est);
            
            mv.addObject("verificador", 1);
            if(relatorio.size()>0){
                mv.addObject("relatorio", relatorio);  
                System.out.println("Relatório buscado com sucesso!");
            }else{
                mv.addObject("relatorio", relatorio);
                System.out.println("Relatório sem informações!");
	    }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "gerarRelatorioHospedagem.html", method = RequestMethod.GET)
    public String gerarRelatorioHospedagemGET(){	
        return "forward:relatoriosHospedagem.html";
    }
    
    @RequestMapping("quartosDesocupados.html")
    public String quartosDesocupados(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/quartosDesocupados";
    }
    
    @RequestMapping("cadastrarHospedagemForm.html")
    public String cadastrarHospedagemForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/cadastrarHospedagem";
    }
    
    @RequestMapping("hospedagensCorrentesAlterar.html")
    public String hospedagensCorrentesAlterar(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesAlterar";
    }
    
    @RequestMapping("alterarHospedagemForm.html")
    public String alterarHospedagemForm(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/alterarHospedagem";
    }
    
    @RequestMapping("hospedagensTermino.html")
    public String hospedagensTermino(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensTermino";
    }
    
    @RequestMapping("finalizarHospedagem.html")
    public String finalizarHospedagem(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/finalizarHospedagem";
    }
    
    @RequestMapping("hospedagensCorrentesGasto.html")
    public String hospedagensCorrentesGasto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesGasto";
    }
    
    @RequestMapping(value = "gerenciarGastoQuarto.html", method = RequestMethod.POST)
    public ModelAndView gerenciarGastoQuarto(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Quarto do Estabelecimento para Gerenciamento de Gasto de Quarto...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesGasto");
        
        HospedagemDao hD = new HospedagemDao();
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null){
            int codHospedagem = Integer.parseInt(rq.getParameter("cod"));
            
            Hospedagem h = new Hospedagem();
            h.setCod(codHospedagem);
			
            Quarto q = new Quarto();

            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");

            q = qD.carregarQuartoHospedagem(h, est);
	    
            if(q!=null){
                h.setQuarto(q);
            
                h = hD.carregarGastosHospedagem(h);

                if(h!=null){
                    mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/gerenciarGastoQuarto");
                    mv.addObject("hospedagemEscolhida", h);
                    System.out.println("Hospedagem buscada para gerenciamento de Gasto de Quarto!");
                }
            }
           
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "gerenciarGastoQuarto.html", method = RequestMethod.GET)
    public String gerenciarGastoQuartoGET(){	
        return "hospedagensCorrentesGasto.html";
    }
    
    @RequestMapping(value = "cadastrarGastoQuarto.html", method = RequestMethod.POST)
    public ModelAndView cadastrarGastoQuarto(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Formulário cadastro Gasto de Quarto da Hospedagem Escolhida do Estabelecimento...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesGasto");
        
        HospedagemDao hD = new HospedagemDao();
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null && rq.getParameter("descricaoGasto")!=null 
                && rq.getParameter("valorGasto")!=null){
            
            if(rq.getParameter("descricaoGasto").length()>0 && rq.getParameter("valorGasto").length()>0){
                int codHospedagem = Integer.parseInt(rq.getParameter("cod"));
                
                String descricao = rq.getParameter("descricaoGasto");
                float valor = Float.parseFloat(rq.getParameter("valorGasto"));

                Gasto g = new Gasto();
                g.setDescricao(descricao);
                g.setValor(valor);

                Hospedagem h = new Hospedagem();
                h.setCod(codHospedagem);

                Quarto q = new Quarto();

                Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");

                q = qD.carregarQuartoHospedagem(h, est);

                if(q!=null){
                    boolean verificador = false;
                    try{
                        verificador = hD.inserirGastoHospedagem(h, g);

                    }catch(Exception e){
                        e.printStackTrace();
                    }  

                    h.setQuarto(q);

                    h = hD.carregarGastosHospedagem(h);

                    if(h!=null && verificador){
                        mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/gerenciarGastoQuarto");
                        mv.addObject("hospedagemEscolhida", h);
                        if(verificador){
                            mv.addObject("mensagem", "<Strong> Sucesso</Strong> Gasto de quarto cadastrado!");
                            mv.addObject("tipo", "success");	
                        }else{
                            mv.addObject("mensagem", "<Strong> Erro</Strong> Gasto de quarto não cadastrado!");
                            mv.addObject("tipo", "danger");
                        }
                        System.out.println("Hospedagem atualizada com gastos de Hospedagem!");
                    }
                }
                
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "cadastrarGastoQuarto.html", method = RequestMethod.GET)
    public String cadastrarGastoQuartoGET(){	
        return "hospedagensCorrentesGasto.html";
    }
}
