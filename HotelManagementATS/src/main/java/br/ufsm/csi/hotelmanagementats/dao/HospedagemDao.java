/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Gasto;
import br.ufsm.csi.hotelmanagementats.model.Hospedagem;
import br.ufsm.csi.hotelmanagementats.model.Hospede;
import br.ufsm.csi.hotelmanagementats.model.Quarto;
import br.ufsm.csi.hotelmanagementats.util.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Alisson
 */
public class HospedagemDao {
    
    public List<Hospedagem> getHospedagensCorrentes(Estabelecimento est){
			
        // System.out.println("\nHospedagemDao - Buscar hospedagens correntes do Estabelecimento...\n");

        List<Hospedagem> hospedagens = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT valorDiaria, numero, hospedagem.* FROM QUARTO, HOSPEDAGEM WHERE codEstabelecimento=? and "
                    + "quarto.cod=hospedagem.codquarto "
                    + "and quarto.estado=1 and hospedagem.estado=0 ORDER BY datafinal, horafinal ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Hospedagem h = new Hospedagem();
                Quarto qt = new Quarto();

                h.setCod(valor.getInt("cod"));
                h.setDataInicial(valor.getString("dataInicial"));
                h.setDataFinal(valor.getString("dataFinal"));
                h.setHoraInicial(valor.getString("horaInicial"));
                h.setHoraFinal(valor.getString("horaFinal"));
                h.setValorHospedagem(valor.getFloat("valorHospedagem"));
				
                qt.setNumero(valor.getInt("numero"));
                qt.setCod(valor.getInt("codQuarto"));
                qt.setValorDiaria(valor.getFloat("valorDiaria"));
				
                h.setQuarto(qt);
				
                hospedagens.add(h);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return hospedagens;
    }
    
    public List<Hospedagem> getHospedagensTermino(Estabelecimento est) throws ParseException{
			
        // System.out.println("\nHospedagemDao - Buscar hospedagens em término do Estabelecimento...\n");

        List<Hospedagem> hospedagens = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            DateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            Date data = Calendar.getInstance().getTime();
            String horaFormatada = sdf.format(data);

            java.sql.Time horaN = new java.sql.Time(sdf.parse(horaFormatada).getTime());
            
            sdf = new SimpleDateFormat("yyyy-MM-dd");

            String dataFormatada = sdf.format(data);
            
            java.sql.Date dataN = new java.sql.Date(sdf.parse(dataFormatada).getTime());
            
            // System.out.println("Data: "+dataN+", Hora: "+horaN);
            
            sql = "SELECT valorDiaria, numero, hospedagem.* FROM QUARTO, HOSPEDAGEM WHERE codEstabelecimento=? "
                    + "and quarto.cod=hospedagem.codquarto "
                    + "and quarto.estado=1 and hospedagem.estado=0 "
                    + "and dataFinal=? and horaFinal>=? "
                    + "ORDER BY datafinal, horafinal ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());
            stmt.setDate(2, dataN);
            stmt.setTime(3, horaN);
            
            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Hospedagem h = new Hospedagem();
                Quarto qt = new Quarto();

                h.setCod(valor.getInt("cod"));
                h.setDataInicial(valor.getString("dataInicial"));
                h.setDataFinal(valor.getString("dataFinal"));
                h.setHoraInicial(valor.getString("horaInicial"));
                h.setHoraFinal(valor.getString("horaFinal"));
                h.setValorHospedagem(valor.getFloat("valorHospedagem"));
				
                qt.setNumero(valor.getInt("numero"));
                qt.setCod(valor.getInt("codQuarto"));
                qt.setValorDiaria(valor.getFloat("valorDiaria"));
				
                h.setQuarto(qt);
				
                hospedagens.add(h);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return hospedagens;
    }
    
    public List<Hospedagem> getHospedagensAtrasadas(Estabelecimento est) throws ParseException{
			
        // System.out.println("\nHospedagemDao - Buscar hospedagens atrasadas do Estabelecimento...\n");

        List<Hospedagem> hospedagens = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;
        
        try{
            c = ConectaBD.getConexao();
            String sql;

            DateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            Date data = Calendar.getInstance().getTime();
            String horaFormatada = sdf.format(data);

            java.sql.Time horaN = new java.sql.Time(sdf.parse(horaFormatada).getTime());
            
            sdf = new SimpleDateFormat("yyyy-MM-dd");

            String dataFormatada = sdf.format(data);
            
            java.sql.Date dataN = new java.sql.Date(sdf.parse(dataFormatada).getTime());
            
            // System.out.println("Data: "+dataN+", Hora: "+horaN);
            
            sql = "SELECT valorDiaria, numero, hospedagem.* FROM QUARTO, HOSPEDAGEM WHERE codEstabelecimento=? "
                    + "and quarto.cod=hospedagem.codquarto "
                    + "and quarto.estado=1 and hospedagem.estado=0 "
                    + "and ((dataFinal=? and horaFinal<?) or (dataFinal<?)) "
                    + "ORDER BY datafinal, horafinal ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());
            stmt.setDate(2, dataN);
            stmt.setTime(3, horaN);
            stmt.setDate(4, dataN);
            
            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Hospedagem h = new Hospedagem();
                Quarto qt = new Quarto();

                h.setCod(valor.getInt("cod"));
                h.setDataInicial(valor.getString("dataInicial"));
                h.setDataFinal(valor.getString("dataFinal"));
                h.setHoraInicial(valor.getString("horaInicial"));
                h.setHoraFinal(valor.getString("horaFinal"));
                h.setValorHospedagem(valor.getFloat("valorHospedagem"));
				
                qt.setNumero(valor.getInt("numero"));
                qt.setCod(valor.getInt("codQuarto"));
                qt.setValorDiaria(valor.getFloat("valorDiaria"));
				
                h.setQuarto(qt);
				
                hospedagens.add(h);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return hospedagens;
    }
    
    public List<Hospedagem> gerarRelatorioHospedagem(String data, Estabelecimento est) throws ParseException{
			
        // System.out.println("\nHospedagemDao - Buscar informações de relatório de hospedagem do Estabelecimento...\n");

        List<Hospedagem> relatorio = new ArrayList();
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date dataN = new java.sql.Date(fmt.parse(data).getTime());
            
            sql = "SELECT hospedagem.cod AS cod, quarto.numero, dataInicial, dataFinal, horaInicial, horaFinal, valorHospedagem "
                    + "FROM QUARTO, HOSPEDAGEM WHERE "
                    + "codEstabelecimento=? and quarto.cod=hospedagem.codquarto "
                    + "and dataInicial<=? and dataFinal>=? ORDER BY numero ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());
            stmt.setDate(2, dataN);
            stmt.setDate(3, dataN);

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Quarto qt = new Quarto();
                Hospedagem h = new Hospedagem();

                h.setCod(valor.getInt("cod"));
                h.setDataInicial(valor.getString("dataInicial"));
                h.setDataFinal(valor.getString("dataFinal"));
                h.setHoraInicial(valor.getString("horaInicial"));
                h.setHoraFinal(valor.getString("horaFinal"));
		h.setValorHospedagem(valor.getFloat("valorHospedagem"));
                
                qt.setNumero(valor.getInt("numero"));
				
                h.setQuarto(qt);
				
                relatorio.add(h);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return relatorio;
    }
    
    public Hospedagem getTotalGastos(Hospedagem h){
			
        // System.out.println("\nHospedagemDao - Buscar valor gasto de serviço de quarto da hospedagem no Estabelecimento...\n");

        Connection c = null;
        PreparedStatement stmt = null;
		
        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT sum(valor) as valor FROM GASTO, HOSPEDAGEM WHERE gasto.codHospedagem=hospedagem.cod and hospedagem.cod=?;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, h.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){		
                h.setValorGastos(valor.getFloat("valor"));
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return h;
    }
    
    public Hospedagem carregarGastosHospedagem(Hospedagem h){
			
        // System.out.println("\nHospedagemDao - Buscar gastos de serviço de quarto da hospedagem no Estabelecimento...\n");

        Connection c = null;
        PreparedStatement stmt = null;
		
        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM GASTO, HOSPEDAGEM WHERE gasto.codHospedagem=hospedagem.cod and hospedagem.cod=?";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, h.getCod());

            ResultSet valor = stmt.executeQuery();

            List<Gasto> gastos = new ArrayList();
            
            while(valor.next()){		
                Gasto g = new Gasto();
                g.setDescricao(valor.getString("descricao"));
                g.setValor(valor.getFloat("valor"));
                
                gastos.add(g);
            }

            if(gastos.size()>0){
                h.setGastos(gastos);
            }
            
            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return h;
    }
    
    public boolean inserirGastoHospedagem(Hospedagem h, Gasto g){
        boolean retorno = false;
        
        System.out.println("\nHospedagemDao - Cadastrar gasto de quarto do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "INSERT INTO GASTO (cod, descricao, valor, codHospedagem) "
                    + "values(DEFAULT, ?, ?, ?);";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, g.getDescricao());
            stmt.setFloat(2, g.getValor());
            stmt.setInt(3, h.getCod());
            
            stmt.execute();
            stmt.close();
            retorno = true;
            
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
            retorno = false;
        }
        
        return retorno;
    }
    
    public Hospedagem carregarHospedesHospedagem(Hospedagem h){
			
        // System.out.println("\nHospedagemDao - Buscar hóspedes presentes na hospedagem no Estabelecimento...\n");

        Connection c = null;
        PreparedStatement stmt = null;
		
        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT hospede.cod AS cod, email, nome, cpf, telcel "
                    + "FROM HOSPEDE, HOSPEDAGEM, HOSP_HOSPEDE WHERE "
                    + "hospede.cod=hosp_hospede.codHospede and "
                    + "hospedagem.cod=hosp_hospede.codHospedagem and hospedagem.cod=?";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, h.getCod());

            ResultSet valor = stmt.executeQuery();

            List<Hospede> hospedes = new ArrayList();
            
            while(valor.next()){		
                Hospede hp = new Hospede();
				
                hp.setCod(valor.getInt("cod"));
                hp.setEmail(valor.getString("email"));
                hp.setNome(valor.getString("nome"));
                hp.setCpf(valor.getString("cpf"));
                hp.setTelCel(valor.getString("telcel"));

                hospedes.add(hp);
            }

            if(hospedes.size()>0){
                h.setHospedes(hospedes);
            }
            
            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return h;
    }
    
    public Hospedagem carregarDadosHospedagem(Hospedagem h){
        h = carregarHospedagem(h);
        h = carregarHospedesHospedagem(h);
        h = carregarGastosHospedagem(h);
        
        return h;
    }
    
    public Hospedagem carregarHospedagem(Hospedagem h){
			
        // System.out.println("\nHospedagemDao - Buscar dados da hospedagem...\n");

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT valorDiaria, numero, hospedagem.* FROM QUARTO, HOSPEDAGEM WHERE hospedagem.cod=? "
                    + "and quarto.cod=hospedagem.codquarto "
                    + "ORDER BY datafinal, horafinal ASC;";
            
            /* 
            sql = "SELECT valorDiaria, numero, hospedagem.* FROM QUARTO, HOSPEDAGEM WHERE hospedagem.cod=? "
                + "and quarto.cod=hospedagem.codquarto "
                + "and quarto.estado=1 ORDER BY datafinal, horafinal ASC;";
            */

            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, h.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Quarto qt = new Quarto();

                h.setCod(valor.getInt("cod"));
                h.setDataInicial(valor.getString("dataInicial"));
                h.setDataFinal(valor.getString("dataFinal"));
                h.setHoraInicial(valor.getString("horaInicial"));
                h.setHoraFinal(valor.getString("horaFinal"));
                h.setValorHospedagem(valor.getFloat("valorHospedagem"));
				
                qt.setNumero(valor.getInt("numero"));
                qt.setCod(valor.getInt("codQuarto"));
                qt.setValorDiaria(valor.getFloat("valorDiaria"));
				
                h.setQuarto(qt);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return h;
    }
    
    public int finalizarHospedagemTermino(Hospedagem h){
        int retorno = 0;
        
        System.out.println("\nHospedagemDao - Finalizar hospedagem em término do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql="";
            
            // Update Hóspedes
            sql = "UPDATE HOSPEDE SET estado=0 FROM HOSP_HOSPEDE "
                    + "WHERE hosp_hospede.codHospede=hospede.cod and hosp_hospede.codHospedagem=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, h.getCod());

            stmt.execute();
            
            // Update Quarto
            sql = "UPDATE QUARTO SET estado=0 WHERE cod=? AND codEstabelecimento=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, h.getQuarto().getCod());
            stmt.setInt(2, h.getQuarto().getEstabelecimento().getCod());

            stmt.execute();

            // Update Hospedagem
            sql = "UPDATE HOSPEDAGEM SET estado=1 WHERE cod=? AND codQuarto=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, h.getCod());
            stmt.setInt(2, h.getQuarto().getCod());

            stmt.execute();

            retorno = 1;
            
            stmt.close();            
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
    
    public int finalizarHospedagemAtrasada(Hospedagem h) throws ParseException{
        int retorno = 0;
        
        System.out.println("\nHospedagemDao - Finalizar hospedagem atrasada do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql="";
            
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date data = Calendar.getInstance().getTime();

            Date dataInicial = sdf.parse(h.getDataInicial());
            
            long dt = (data.getTime() - dataInicial.getTime()) + 3600000;      
            long dias = (dt / 86400000L);
            
            if(dias<0){
                dias = dias*-1;
            }
            else if(dias==0){
                dias = 1;
            }
            String dataFormatada = sdf.format(data);
            
            java.sql.Date dataN = new java.sql.Date(sdf.parse(dataFormatada).getTime());
            
            // System.out.println("Valor da Diária: "+h.getQuarto().getValorDiaria());
            float valorHospedagemNovo = h.getQuarto().getValorDiaria()*dias;
            
            // System.out.println("Dias: "+dias);
            // System.out.println("Valor Novo: "+valorHospedagemNovo);
            
            h.setValorHospedagem(valorHospedagemNovo);
            
            sdf = new SimpleDateFormat("HH:mm:ss");
            String horaFormatada = sdf.format(data);

            java.sql.Time horaN = new java.sql.Time(sdf.parse(horaFormatada).getTime());
            
            // Update Hóspedes
            sql = "UPDATE HOSPEDE SET estado=0 FROM HOSP_HOSPEDE "
                    + "WHERE hosp_hospede.codHospede=hospede.cod and hosp_hospede.codHospedagem=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, h.getCod());

            stmt.execute();
            
            // Update Quarto
            sql = "UPDATE QUARTO SET estado=0 WHERE cod=? AND codEstabelecimento=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, h.getQuarto().getCod());
            stmt.setInt(2, h.getQuarto().getEstabelecimento().getCod());

            stmt.execute();

            // Update Hospedagem
            sql = "UPDATE HOSPEDAGEM SET estado=1, valorHospedagem=?, dataFinal=?, horaFinal=? WHERE cod=? AND codQuarto=?;";
            stmt = c.prepareStatement(sql);
            stmt.setFloat(1, h.getValorHospedagem());
            stmt.setDate(2, dataN);
            stmt.setTime(3, horaN);
            stmt.setInt(4, h.getCod());
            stmt.setInt(5, h.getQuarto().getCod());
            
            stmt.execute();

            retorno = 1;
            
            stmt.close();            
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
}
