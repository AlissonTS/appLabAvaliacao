/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.UsuarioAdministrador;
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
public class EstabelecimentoDao {
    
    public int cadastrarEstabelecimento(Estabelecimento est){
        int retorno = 0;
        
        System.out.println("\nEstabelecimentoDao - Cadastrar estabelecimento ADM...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT nome FROM ESTABELECIMENTO WHERE EXISTS "
                    + "(SELECT estabelecimento.nome FROM ESTABELECIMENTO "
                    + "WHERE codusuarioadm=? and "
                    + "estabelecimento.codusuarioadm=codusuarioadm and nome=?);";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, est.getUsuarioAdm().getCod());
            stmt.setString(2, est.getNome());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "INSERT INTO ESTABELECIMENTO (cod, nome, cnpj, telefone, codusuarioadm) "
                    + "values(DEFAULT, ?, ?, ?, ?);";
                stmt = c.prepareStatement(sql);
                stmt.setString(1, est.getNome());
                stmt.setString(2, est.getCnpj());
                stmt.setString(3, est.getTelFixo());
                stmt.setInt(4, est.getUsuarioAdm().getCod());

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
    
    public List<Estabelecimento> getEstabelecimentosAdm(UsuarioAdministrador u){
			
        System.out.println("\nEstabelecimentoDao - Buscar estabelecimentos do ADM...\n");

        List<Estabelecimento> estabelecimentos = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM ESTABELECIMENTO WHERE codusuarioadm=? ORDER BY NOME ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, u.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Estabelecimento est = new Estabelecimento();

                est.setCod(valor.getInt("cod"));
                est.setCnpj(valor.getString("cnpj"));
                est.setNome(valor.getString("nome"));

                estabelecimentos.add(est);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return estabelecimentos;
    }
    
    public List<Estabelecimento> getEstabelecimentosExcluirAdm(UsuarioAdministrador u){
			
        System.out.println("\nEstabelecimentoDao - Buscar estabelecimentos do ADM possíveis de exclusão...\n");

        List<Estabelecimento> estabelecimentos = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM ESTABELECIMENTO WHERE NOT EXISTS "
                    + "(SELECT * FROM QUARTO, ESTABELECIMENTO WHERE "
                    + "quarto.codestabelecimento=estabelecimento.cod "
                    + "and estabelecimento.codusuarioadm=?) ORDER BY NOME ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, u.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Estabelecimento est = new Estabelecimento();

                est.setCod(valor.getInt("cod"));
                est.setCnpj(valor.getString("cnpj"));
                est.setNome(valor.getString("nome"));

                estabelecimentos.add(est);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return estabelecimentos;
    }
    
    
}
