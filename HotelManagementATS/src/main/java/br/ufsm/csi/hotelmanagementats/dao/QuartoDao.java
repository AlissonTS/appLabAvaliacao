/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Quarto;
import br.ufsm.csi.hotelmanagementats.util.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alisson
 */
public class QuartoDao {
    
    public int cadastrarQuarto(Quarto q){
        int retorno = 0;
        
        System.out.println("\nQuartoDao - Cadastrar quarto no Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT numero FROM QUARTO WHERE EXISTS "
                    + "(SELECT quarto.numero FROM QUARTO, ESTABELECIMENTO  "
                    + "WHERE quarto.codestabelecimento=estabelecimento.cod "
                    + "and numero=? and estabelecimento.cod=?);";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, q.getNumero());
            stmt.setInt(2, q.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "INSERT INTO QUARTO (cod, numero, area, maxHosp, descricaoExtra, estado, valorDiaria, codEstabelecimento) "
                    + "values(DEFAULT, ?, ?, ?, ?, ?, ?, ?);";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, q.getNumero());
                stmt.setFloat(2, q.getArea());
                stmt.setInt(3, q.getMaxHosp());
                stmt.setString(4, q.getDescricaoExtra());
                stmt.setInt(5, q.getEstado());
                stmt.setFloat(6, q.getValorDiaria());
                stmt.setInt(7, q.getEstabelecimento().getCod());

                stmt.execute();
                retorno = 2;
            }
            else{
                retorno = 1;
            }
            
            stmt.close();            
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
    
    public List<Quarto> getQuartosEstabelecimento(Estabelecimento est){
			
        // System.out.println("\nQuartoDao - Buscar quartos do Estabelecimento...\n");

        List<Quarto> quartos = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM QUARTO WHERE codEstabelecimento=? ORDER BY NUMERO ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();
            
            while(valor.next()){
                Quarto qt = new Quarto();

                qt.setCod(valor.getInt("cod"));
                qt.setNumero(valor.getInt("numero"));
                qt.setArea(valor.getFloat("area"));
                qt.setMaxHosp(valor.getInt("maxHosp"));
                qt.setDescricaoExtra(valor.getString("descricaoExtra"));
                qt.setEstado(valor.getInt("estado"));
                qt.setValorDiaria(valor.getFloat("valorDiaria"));
				
                quartos.add(qt);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return quartos;
    }
    
     public int getQuartosQuantidade(Estabelecimento est){
			
        // System.out.println("\nQuartoDao - Buscar quantidade de quartos do Estabelecimento...\n");

        Connection c = null;
        PreparedStatement stmt = null;
        int quantidade =0; 
        
        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT COUNT(*) AS quantidade FROM QUARTO WHERE codEstabelecimento=?;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();
            
            while(valor.next()){
                quantidade = valor.getInt("quantidade");
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return quantidade;
    }
    
    public List<Quarto> getQuartosDesocupadosEstabelecimento(Estabelecimento est){
			
        // System.out.println("\nQuartoDao - Buscar quartos do Estabelecimento...\n");

        List<Quarto> quartos = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM QUARTO WHERE codEstabelecimento=? and estado=0 ORDER BY NUMERO ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Quarto qt = new Quarto();

                qt.setCod(valor.getInt("cod"));
                qt.setNumero(valor.getInt("numero"));
                qt.setArea(valor.getFloat("area"));
                qt.setMaxHosp(valor.getInt("maxHosp"));
                qt.setDescricaoExtra(valor.getString("descricaoExtra"));
                qt.setEstado(valor.getInt("estado"));
                qt.setValorDiaria(valor.getFloat("valorDiaria"));
				
                quartos.add(qt);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return quartos;
    }
    
    public Quarto carregarQuartoEscolhido(Quarto q){
        
        System.out.println("\nQuartoDao - Carregar quarto escolhido do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM QUARTO WHERE cod=? AND codEstabelecimento=? AND estado=0;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, q.getCod());
            stmt.setInt(2, q.getEstabelecimento().getCod());

            ResultSet valor = stmt.executeQuery();	

            while(valor.next()){
                q.setCod(valor.getInt("cod"));
                q.setNumero(valor.getInt("numero"));
                q.setArea(valor.getFloat("area"));
                q.setMaxHosp(valor.getInt("maxHosp"));
                q.setDescricaoExtra(valor.getString("descricaoExtra"));
                q.setEstado(valor.getInt("estado"));
                q.setValorDiaria(valor.getFloat("valorDiaria"));
            }

            if(q.getNumero()<0){
                q = null;
            }

            stmt.close();

        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
            q = null;
        }

        return q;
    }
    
    public int alterarQuarto(Quarto q){
        int retorno = 0;
        
        System.out.println("\nQuartoDao - Alterar quarto do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT numero FROM QUARTO WHERE EXISTS "
                    + "(SELECT quarto.numero FROM QUARTO, ESTABELECIMENTO  "
                    + "WHERE quarto.codestabelecimento=estabelecimento.cod "
                    + "and numero=? and estabelecimento.cod=?);";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, q.getNumero());
            stmt.setInt(2, q.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "UPDATE QUARTO SET numero=?, area=?, maxHosp=?, descricaoExtra=?, valorDiaria=? "
                    + "WHERE cod=? and codEstabelecimento=? and estado=0;";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, q.getNumero());
                stmt.setFloat(2, q.getArea());
                stmt.setInt(3, q.getMaxHosp());
                stmt.setString(4, q.getDescricaoExtra());
                stmt.setFloat(5, q.getValorDiaria());
                stmt.setInt(6, q.getCod());
                stmt.setInt(7, q.getEstabelecimento().getCod());

                stmt.execute();
                retorno = 2;
            }
            else{
                retorno = 1;
            }
            
            stmt.close();            
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
    
    public int abilitarDesabilitarQuarto(Quarto q, int escolha){
        int retorno = 0;
        
        System.out.println("\nQuartoDao - Habilitar/Desabilitar quarto do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql="";
            
            if(escolha==1){ // habilitar quarto
                sql = "SELECT numero FROM QUARTO WHERE cod=? AND codEstabelecimento=? and estado=2;";
            }else{ // desabilitar quarto
                sql = "SELECT numero FROM QUARTO WHERE cod=? AND codEstabelecimento=? and estado=0;";
            }
            
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, q.getCod());
            stmt.setInt(2, q.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(verificador){
                sql = "UPDATE QUARTO SET estado=? WHERE cod=? AND codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, q.getEstado());
                stmt.setInt(2, q.getCod());
                stmt.setInt(3, q.getEstabelecimento().getCod());

                stmt.execute();
                retorno = 1;
            }
            else{
                retorno = 0;
            }
            
            stmt.close();            
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
}
