/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.controller;

import br.ufsm.csi.hotelmanagementats.dao.HospedagemDao;
import br.ufsm.csi.hotelmanagementats.dao.HospedeDao;
import br.ufsm.csi.hotelmanagementats.dao.QuartoDao;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Gasto;
import br.ufsm.csi.hotelmanagementats.model.Hospedagem;
import br.ufsm.csi.hotelmanagementats.model.Hospede;
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
    
    @RequestMapping(value = "cadastrarHospedagemForm.html", method = RequestMethod.POST)
    public ModelAndView cadastrarHospedagemForm(HttpServletRequest rq, HttpSession session){	
        
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha quarto desocupado para Cadastro de Hospedagem...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/quartosDesocupados");
        
        HospedagemDao hD = new HospedagemDao();
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null){
            int codQuarto = Integer.parseInt(rq.getParameter("cod"));
			
            Quarto q = new Quarto();
			
            q.setCod(codQuarto);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            q.setEstabelecimento(est);
			
            q = qD.carregarQuartoEscolhido(q);
            
            HospedeDao hp = new HospedeDao();
            List<Hospede> hospedes = new ArrayList();
			
            if(q!=null){
                hospedes = hp.carregarHospedesDesocupados(est);

                if(hospedes!=null){
                    mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/cadastrarHospedagem");
                    mv.addObject("hospedes", hospedes);
                    mv.addObject("quarto", q);
                    System.out.println("Quartos e hóspedes buscados para iniciar cadastro de hospedagem!");
                }else{
                    mv.addObject("mensagem", "<Strong> Aviso!</Strong> Estabelecimento não possui hóspedes que não estejam hospedados no momento!");
                    mv.addObject("tipo", "warning");
                }
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv; 
    }
    
    @RequestMapping(value = "cadastrarHospedagemForm.html", method = RequestMethod.GET)
    public String cadastrarHospedagemForm(){	
            return "forward:quartosDesocupados.html";
    }
    
    @RequestMapping(value = "cadastrarHospedagem.html", method = RequestMethod.POST)
    public ModelAndView cadastrarHospedagem(HttpServletRequest rq, HttpSession session){	
        System.out.println("-------------------------------");
        System.out.println("Submit Cadastro de Hospedagem...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/quartosDesocupados");
        
        HospedagemDao hD = new HospedagemDao();
        QuartoDao qD = new QuartoDao();
        
        String dataFinal = rq.getParameter("dataFinal");
        String valorHospedagem = rq.getParameter("valorHospedagem");
        String horaFinal = rq.getParameter("horaFinal");

        String[] hospedesCod = rq.getParameterValues("hospedes");

        if(rq.getParameter("cod")!=null && hospedesCod!=null && dataFinal!=null && valorHospedagem!=null && horaFinal!=null){
            String valorReplace = valorHospedagem.replaceAll(",", "");
            Float valorNovo = Float.parseFloat(valorReplace);
            
            horaFinal = horaFinal+":00";
            
            int codQuarto = Integer.parseInt(rq.getParameter("cod"));

            Quarto q = new Quarto();

            q.setCod(codQuarto);

            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            q.setEstabelecimento(est);

            q = qD.carregarQuartoEscolhido(q);
            
            List<Hospede> hospedes = new ArrayList();
            for(String hp : hospedesCod){
                int codHospede = Integer.parseInt(hp);
                Hospede hosp = new Hospede();
                hosp.setCod(codHospede);

                hospedes.add(hosp);
            }

            Hospedagem h = new Hospedagem();

            h.setHospedes(hospedes);
            h.setDataFinal(dataFinal);
            h.setValorHospedagem(valorNovo);
            h.setHoraFinal(horaFinal);
            h.setQuarto(q);
            
            /*
            for(int i=0; i<h.getHospedes().size(); i++){
                System.out.println("Hóspede: "+h.getHospedes().get(i).getCod());
            }
            System.out.println("Código Quarto: "+h.getQuarto().getCod());
            System.out.println("Data Final: "+h.getDataFinal());
            System.out.println("Hora Final: "+h.getHoraFinal());
            System.out.println("Valor Hospedagem: "+h.getValorHospedagem()); */
            
            if(q!=null){
                int retorno = hD.cadastrarHospedagem(h);

                if(retorno==1){
                    mv.addObject("mensagem", "<Strong> Sucesso!</Strong> Hospedagem cadastrada com sucesso!");
                    mv.addObject("tipo", "success");
                    System.out.println("Hospedagem cadastrada com sucesso!");
                }else{
                    mv.addObject("mensagem", "<Strong> Aviso!</Strong> Hospedagem não cadastrada!");
                    mv.addObject("tipo", "danger");
                }
            }   
        }
        
        return mv;
    }    
    
    @RequestMapping(value = "cadastrarHospedagem.html", method = RequestMethod.GET)
    public String cadastrarHospedagem(){	
            return "forward:quartosDesocupados.html";
    }
    
    @RequestMapping(value = "hospedesQuartoHospedagemAlterar.html", method = RequestMethod.POST)
    public ModelAndView hospedesQuartoHospedagemAlterar(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Hospedagem do Estabelecimento para mostrar Hóspedes - Alterar Hospedagem...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesAlterar");
        
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
            
                h = hD.carregarHospedesHospedagem(h);

                if(h!=null){
                    mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedesQuartoHospedagem");
                    mv.addObject("hospedagemEscolhida", h);
                    mv.addObject("verificador", 0);
                    System.out.println("Hóspedes pertencentes a hospedagem buscados!");
                }
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "hospedesQuartoHospedagemAlterar.html", method = RequestMethod.GET)
    public String hospedesQuartoHospedagemAlterar(){	
        return "forward:hospedagensCorrentesAlterar.html";
    }
    
    @RequestMapping(value = "hospedesQuartoHospedagemGasto.html", method = RequestMethod.POST)
    public ModelAndView hospedesQuartoHospedagemGasto(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Hospedagem do Estabelecimento para mostrar Hóspedes - Gerenciar gasto de Quarto...");
        
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
            
                h = hD.carregarHospedesHospedagem(h);

                if(h!=null){
                    mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedesQuartoHospedagem");
                    mv.addObject("hospedagemEscolhida", h);
                    mv.addObject("verificador", 1);
                    System.out.println("Hospedes pertencentes a hospedagem buscados!");
                }
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "hospedesQuartoHospedagemGasto.html", method = RequestMethod.GET)
    public String hospedesQuartoHospedagemGasto(){	
        return "forward:hospedagensCorrentesGasto.html";
    }
    
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
    
    @RequestMapping("hospedagensCorrentesAlterar.html")
    public String hospedagensCorrentesAlterar(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesAlterar";
    }
    
    @RequestMapping(value = "alterarHospedagemForm.html", method = RequestMethod.POST)
    public ModelAndView alterarHospedagemForm(HttpServletRequest rq, HttpSession session){	
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha hospedagem corrente para Alteração...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesAlterar");
        
        if(rq.getParameter("cod")!=null){
            int codHospedagem = Integer.parseInt(rq.getParameter("cod"));
			
            Quarto q = new Quarto();
			
            Hospedagem h = new Hospedagem();
            h.setCod(codHospedagem);
			
            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            q.setEstabelecimento(est);
            
            h.setQuarto(q);
            
            HospedagemDao hD = new HospedagemDao();

            h = hD.carregarHospedagemAlterar(h);

            if(h!=null){
                mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/alterarHospedagem");
                mv.addObject("hospedagem", h);
                System.out.println("Hospedagem encontrada para alteração!");
            }else{
                mv.addObject("mensagem", "<Strong> Erro!</Strong> Dados de hospedagem não encontrados!");
                mv.addObject("tipo", "danger");
            }
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv; 
    }
    
    @RequestMapping(value = "alterarHospedagemForm.html", method = RequestMethod.GET)
    public String alterarHospedagemForm(){	
            return "forward:hospedagensCorrentesAlterar.html";
    }
    
    @RequestMapping(value = "alterarHospedagem.html", method = RequestMethod.POST)
    public ModelAndView alterarHospedagem(HttpServletRequest rq, HttpSession session){	
        System.out.println("-------------------------------");
        System.out.println("Submit Alteração de Hospedagem...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensCorrentesAlterar");
        
        String dataFinal = rq.getParameter("dataFinal");
        String valorHospedagem = rq.getParameter("valorHospedagem");
        String horaFinal = rq.getParameter("horaFinal");

        if(rq.getParameter("cod")!=null && dataFinal!=null && valorHospedagem!=null && horaFinal!=null){
            String valorReplace = valorHospedagem.replaceAll(",", "");
            Float valorNovo = Float.parseFloat(valorReplace);
            
            horaFinal = horaFinal+":00";
            
            Hospedagem h = new Hospedagem();
            
            int codHospedagem = Integer.parseInt(rq.getParameter("cod"));
            h.setCod(codHospedagem);
            
            HospedagemDao hD = new HospedagemDao();
            QuartoDao qD = new QuartoDao();
            Quarto q = new Quarto();

            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");

            q = qD.carregarQuartoHospedagem(h, est);

            if(q!=null){
                q.setEstabelecimento(est);
				
                h.setDataFinal(dataFinal);
                h.setValorHospedagem(valorNovo);
                h.setHoraFinal(horaFinal);
                h.setQuarto(q);
				
                int retorno = hD.alterarHospedagem(h);

                if(retorno==1){
                    mv.addObject("mensagem", "<Strong> Sucesso!</Strong> Hospedagem alterada com sucesso!");
                    mv.addObject("tipo", "success");
                    System.out.println("Hospedagem alterada com sucesso!");
                }else{
                    mv.addObject("mensagem", "<Strong> Aviso!</Strong> Hospedagem não alterada!");
                    mv.addObject("tipo", "danger");
                }
            }   
        }
        
        return mv;
    }
    
    @RequestMapping(value = "alterarHospedagem.html", method = RequestMethod.GET)
    public String alterarHospedagem(){	
            return "forward:hospedagensCorrentesAlterar.html";
    }
    
    @RequestMapping("hospedagensTermino.html")
    public String hospedagensTermino(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensTermino";
    }
    
    @RequestMapping("hospedagensAtrasadas.html")
    public String hospedagensAtrasadas(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensAtrasadas";
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
    
    @RequestMapping(value = "mostrarHospedagemTermino.html", method = RequestMethod.POST)
    public ModelAndView mostrarHospedagemTermino(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Hospedagem em término do Estabelecimento para mostrar...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensTermino");
        
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
            
                h = hD.carregarDadosHospedagem(h);

                if(h!=null){
                    mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/mostrarHospedagem");
                    mv.addObject("hospedagemEscolhida", h);
                    mv.addObject("verificador", 0);
                    System.out.println("Hospedagem em término buscada para mostrar!");
                }
            }
           
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "mostrarHospedagemTermino.html", method = RequestMethod.GET)
    public String mostrarHospedagemTermino(){	
        return "forward:hospedagensTermino.html";
    }
    
    @RequestMapping(value = "mostrarHospedagemAtrasada.html", method = RequestMethod.POST)
    public ModelAndView mostrarHospedagemAtrasada(HttpServletRequest rq, HttpSession session){
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Hospedagem em término do Estabelecimento para mostrar...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensAtrasadas");
        
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
            
                h = hD.carregarDadosHospedagem(h);

                if(h!=null){
                    mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/mostrarHospedagem");
                    mv.addObject("hospedagemEscolhida", h);
                    mv.addObject("verificador", 1);
                    System.out.println("Hospedagem em término buscada para mostrar!");
                }
            }
           
        }
        
        System.out.println("\n-------------------------------\n");
        
        return mv;
    }
    
    @RequestMapping(value = "mostrarHospedagemAtrasada.html", method = RequestMethod.GET)
    public String mostrarHospedagemAtrasada(){	
        return "forward:hospedagensAtrasadas.html";
    }
    
    @RequestMapping(value = "finalizarHospedagemTermino.html", method = RequestMethod.POST)
    public ModelAndView finalizarHospedagemTermino(HttpServletRequest rq, HttpSession session) throws ParseException{	
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Hospedagem em término do Estabelecimento finalizar...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensTermino");
        
        HospedagemDao hD = new HospedagemDao();
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null){
            int codHospedagem = Integer.parseInt(rq.getParameter("cod"));
            
            Hospedagem h = new Hospedagem();
            h.setCod(codHospedagem);
			
            Quarto q = new Quarto();

            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");

            q = qD.carregarQuartoHospedagemTermino(h, est);
	    
            if(q!=null){
                q.setEstabelecimento(est);
                h.setQuarto(q);
				
                int carregarDados=0;
				
                try{
                    int retorno = hD.finalizarHospedagemTermino(h);
				
                    switch (retorno) {
                        case 1:
                            carregarDados=1; 
                            System.out.println("Hospedagem finalizada!");
                            break;
                        default:
                            mv.addObject("mensagem", "<Strong>Erro</Strong> Finalização de hospedagem não concluída!");
                            mv.addObject("tipo", "danger");
                            System.out.println("Erro ao finalizar hospedagem!");
                            break;
                    }     
                }catch(Exception e){
                    e.printStackTrace();
                    mv.addObject("mensagem", "<Strong>Erro</Strong> Dados de alteração já utilizados!");
                    mv.addObject("tipo", "danger");
                    System.out.println("Erro ao alterar!");
                }
				
                if(carregarDados==1){
                    h = hD.carregarDadosHospedagem(h);

                    if(h!=null){
                        mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagemFinalizada");
                        mv.addObject("mensagem", "<Strong>Sucesso</Strong> Hospedagem finalizada!");
                        mv.addObject("tipo", "success");
                        mv.addObject("hospedagemEscolhida", h);
                        mv.addObject("verificador", 0);
                        System.out.println("Hospedagem em término buscada para mostrar no recibo!");
                    }
                }
            }
        }
        return mv;	
    }
    
    @RequestMapping(value = "finalizarHospedagemTermino.html", method = RequestMethod.GET)
    public String finalizarHospedagemTermino(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensTermino";
    }
    
    @RequestMapping(value = "finalizarHospedagemAtrasada.html", method = RequestMethod.POST)
    public ModelAndView finalizarHospedagemAtrasada(HttpServletRequest rq, HttpSession session) throws ParseException{	
        System.out.println("-------------------------------");
        System.out.println("Submit Escolha Hospedagem em término do Estabelecimento finalizar...");
        
        ModelAndView mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensAtrasadas");
        
        HospedagemDao hD = new HospedagemDao();
        QuartoDao qD = new QuartoDao();
        
        if(rq.getParameter("cod")!=null){
            int codHospedagem = Integer.parseInt(rq.getParameter("cod"));
            
            Hospedagem h = new Hospedagem();
            h.setCod(codHospedagem);
			
            Quarto q = new Quarto();

            Estabelecimento est = (Estabelecimento) session.getAttribute("estabelecimentoEscolhido");
            
            q.setEstabelecimento(est);
            h.setQuarto(q);
            // Try catch    
            h = qD.carregarQuartoHospedagemAtrasada(h, est);
	    
            if(h!=null){		
                int carregarDados=0;
		
                System.out.println("Código: "+h.getCod());
                
                try{
                    int retorno = hD.finalizarHospedagemAtrasada(h);
				
                    switch (retorno) {
                        case 1:
                            carregarDados=1; 
                            System.out.println("Hospedagem finalizada!");
                            break;
                        default:
                            mv.addObject("mensagem", "<Strong>Erro</Strong> Finalização de hospedagem não concluída!");
                            mv.addObject("tipo", "danger");
                            System.out.println("Erro ao finalizar hospedagem!");
                            break;
                    }     
                }catch(Exception e){
                    e.printStackTrace();
                    mv.addObject("mensagem", "<Strong>Erro</Strong> Finalização de hospedagem não concluída!");
                    mv.addObject("tipo", "danger");
                    System.out.println("Erro ao alterar!");
                }
				
                if(carregarDados==1){
                    h = hD.carregarDadosHospedagem(h);

                    if(h!=null){
                        mv = new ModelAndView("/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagemFinalizada");
                        mv.addObject("mensagem", "<Strong>Sucesso</Strong> Hospedagem finalizada!");
                        mv.addObject("tipo", "success");
                        mv.addObject("hospedagemEscolhida", h);
                        mv.addObject("verificador", 0);
                        System.out.println("Hospedagem em término buscada para mostrar no recibo!");
                    }
                }
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "finalizarHospedagemAtrasada.html", method = RequestMethod.GET)
    public String finalizarHospedagemAtrasada(){	
            return "/WEB-INF/views/ambienteEstabelecimento/gerenciamentoHospedagens/hospedagensAtrasadas";
    }
}
