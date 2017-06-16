/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.HospedagemDao;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Quarto;
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
    public String relatoriosHospedagem(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/relatoriosHospedagem";
    }
    
    @RequestMapping(value = "gerarRelatorioHospedagem.html", method = RequestMethod.POST)
    public ModelAndView gerarRelatorioHospedagem(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Relatório de Hospedagem de Acordo com Data Informada...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/relatoriosHospedagem");
		
        HospedagemDao hD = new HospedagemDao();
        
        if(rq.getParameter("dataInicial")!=null){
            String data = rq.getParameter("dataInicial");
            
            mv.addObject("data", data);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
			
            List<Quarto> relatorio = new ArrayList();
			
            // relatorio = hD.gerarRelatorioHospedagem(data, est);
			
            if(relatorio!=null){
                // mv.addObject("hospede", hp);
                System.out.println("Hóspede buscado para alteração!");
            }else{
                // mv.addObject("hospede", hp);
                System.out.println("Hóspede buscado para alteração!");
	    }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
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
    
    @RequestMapping("gerenciarGastoQuarto.html")
    public String gerenciarGastoQuarto(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/gerenciarGastoQuarto";
    }
}
