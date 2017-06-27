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
import java.util.logging.Level;
import java.util.logging.Logger;


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
            c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return hospedagens;
    }
    
    public List<Hospedagem> getHospedagensTermino(Estabelecimento est){
			
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
            c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(HospedagemDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return hospedagens;
    }
    
    public List<Hospedagem> getHospedagensAtrasadas(Estabelecimento est){
			
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
            c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        } catch(ParseException ex){
            Logger.getLogger(HospedagemDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return hospedagens;
    }
    
    public List<Hospedagem> gerarRelatorioHospedagem(String data, Estabelecimento est){
			
        // System.out.println("\nHospedagemDao - Buscar informações de relatório de hospedagem do Estabelecimento...\n");

        List<Hospedagem> relatorio = new ArrayList();
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date dataN;
            
            dataN = new java.sql.Date(fmt.parse(data).getTime());

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
            c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }catch(ParseException ex){
            Logger.getLogger(HospedagemDao.class.getName()).log(Level.SEVERE, null, ex);
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
            c.close();
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
            c.close();
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
            c.close();
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
            c.close();
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
            c.close();
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
            
            DateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            Date data = Calendar.getInstance().getTime();
            String horaFormatada = sdf.format(data);

            java.sql.Time horaN = new java.sql.Time(sdf.parse(horaFormatada).getTime());

            c.setAutoCommit(false);
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
            sql = "UPDATE HOSPEDAGEM SET estado=1, horaFinal=? WHERE cod=? AND codQuarto=?;";
            stmt = c.prepareStatement(sql);
            stmt.setTime(1, horaN);
            stmt.setInt(2, h.getCod());
            stmt.setInt(3, h.getQuarto().getCod());
            
            stmt.execute();

            retorno = 1;

            stmt.close(); 
            c.commit();
            c.close();
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }catch (ParseException ex){
            retorno = 0;
            Logger.getLogger(HospedagemDao.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        return retorno;
    }
    
    public int finalizarHospedagemAtrasada(Hospedagem h){
        int retorno = 0;
        
        System.out.println("\nHospedagemDao - Finalizar hospedagem atrasada do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql="";
            
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date data = Calendar.getInstance().getTime();

            Date dataInicial;
            
            java.sql.Date dataN;
            java.sql.Time horaN;
            
            dataInicial = sdf.parse(h.getDataInicial());
            long dt = (data.getTime() - dataInicial.getTime()) + 3600000;      
            long dias = (dt / 86400000L);

            if(dias<0){
                dias = dias*-1;
            }
            else if(dias==0){
                dias = 1;
            }
            String dataFormatada = sdf.format(data);

            dataN = new java.sql.Date(sdf.parse(dataFormatada).getTime());

            // System.out.println("Valor da Diária: "+h.getQuarto().getValorDiaria());
            float valorHospedagemNovo = h.getQuarto().getValorDiaria()*dias;

            // System.out.println("Dias: "+dias);
            // System.out.println("Valor Novo: "+valorHospedagemNovo);

            h.setValorHospedagem(valorHospedagemNovo);

            sdf = new SimpleDateFormat("HH:mm:ss");
            String horaFormatada = sdf.format(data);

            horaN = new java.sql.Time(sdf.parse(horaFormatada).getTime());
            
            c.setAutoCommit(false);
            
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
            c.commit();
            c.close();
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }catch(ParseException ex) {
            retorno = 0;
            Logger.getLogger(HospedagemDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return retorno;
    }
    
    public int cadastrarHospedagem(Hospedagem h){
        int retorno = 0;
        
        System.out.println("\nHospedagemDao - Cadastrar hospedagem do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql="";
            
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date data = Calendar.getInstance().getTime();

            java.sql.Date dataDao;
            java.sql.Date dataPagina;
            java.sql.Time horaDao;
            java.sql.Time horaPagina;
            
            String dataFormatada = sdf.format(data);

            dataDao = new java.sql.Date(sdf.parse(dataFormatada).getTime());
            
            dataPagina = new java.sql.Date(sdf.parse(h.getDataFinal()).getTime());

            sdf = new SimpleDateFormat("HH:mm:ss");
            String horaDaoString = sdf.format(data);

            horaDao = new java.sql.Time(sdf.parse(horaDaoString).getTime());

            horaPagina = new java.sql.Time(sdf.parse(h.getHoraFinal()).getTime());

            if(dataDao.getTime()<=dataPagina.getTime()){
                c.setAutoCommit(false);
            
                // Insert Hospedagem
                sql = "INSERT INTO HOSPEDAGEM(cod, dataInicial, dataFinal, horaInicial, horaFinal, valorHospedagem, codQuarto, estado)"
                        + " values (DEFAULT, ?, ?, ?, ?, ?, ?, ?);";
                stmt = c.prepareStatement(sql);
                stmt.setDate(1, dataDao);
                stmt.setDate(2, dataPagina);
                stmt.setTime(3, horaDao);
                stmt.setTime(4, horaPagina);
                stmt.setFloat(5, h.getValorHospedagem());
                stmt.setInt(6, h.getQuarto().getCod());
                stmt.setInt(7, 0);
                
                System.out.println("Executou cadastro de hospedagem!");
                stmt.execute();
                
                // Update Hóspedes
                for(int i=0; i<h.getHospedes().size(); i++){
                    sql = "UPDATE HOSPEDE SET estado=1 where cod=?;";
                    stmt = c.prepareStatement(sql);
                    stmt.setInt(1, h.getHospedes().get(i).getCod());

                    stmt.execute();
                }
                
                System.out.println("Executou update de hospedes!");
                
                // Update Quarto
                sql = "UPDATE QUARTO SET estado=1 WHERE cod=? AND codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, h.getQuarto().getCod());
                stmt.setInt(2, h.getQuarto().getEstabelecimento().getCod());

                stmt.execute();
                
                System.out.println("Executou update de quarto!");
                
                sql = "SELECT cod FROM HOSPEDAGEM where codQuarto=? and estado=0;";
                stmt = c.prepareStatement(sql);	
                stmt.setInt(1, h.getQuarto().getCod());

                ResultSet valor = stmt.executeQuery();

                while(valor.next()){
                    h.setCod(valor.getInt("cod"));
                }
                
                // Update Hóspedes
                for(int i=0; i<h.getHospedes().size(); i++){
                    sql = "INSERT INTO HOSP_HOSPEDE(codHospede, codHospedagem) "
                        + "values (?, ?);";
                    stmt = c.prepareStatement(sql);
                    stmt.setInt(1, h.getHospedes().get(i).getCod());
                    stmt.setInt(2, h.getCod());
                    
                    stmt.execute();
                }
                System.out.println("Executou cadastro relação hospede e hospedagem!");
                
                retorno = 1;

                stmt.close();
                c.commit();
                c.close(); 
            }
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }catch(ParseException ex){
            retorno = 0;
            Logger.getLogger(HospedagemDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return retorno;
    }
    
    public Hospedagem carregarHospedagemInserida(Quarto q){
			
        // System.out.println("\nHospedagemDao - Buscar hospedagem inserida para atualização da tabela Hosp_Hospedagem ...\n");

        Connection c = null;
        PreparedStatement stmt = null;
	
        Hospedagem h = new Hospedagem();
        
        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT cod FROM HOSPEDAGEM where codQuarto=? and estado=0;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, q.getCod());

            ResultSet valor = stmt.executeQuery();
            
            while(valor.next()){
                h.setCod(valor.getInt("cod"));
            }
            
            stmt.close();
            c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return h;
    }
}
