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
    
    public Estabelecimento carregarEstabelecimentoEscolhido(UsuarioAdministrador u, int codEstabelecimento){
        
        System.out.println("\nEstabelecimentoDao - Carregar estabelecimento escolhido...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        Estabelecimento est = new Estabelecimento();

        try{
                c = ConectaBD.getConexao();
                String sql;

                sql = "SELECT * FROM ESTABELECIMENTO WHERE cod=? AND codusuarioadm=?;";
                stmt = c.prepareStatement(sql);	
                stmt.setInt(1, codEstabelecimento);
                stmt.setInt(2, u.getCod());

                ResultSet valor = stmt.executeQuery();	

                while(valor.next()){
                    est.setCod(valor.getInt("cod"));
                    est.setCnpj(valor.getString("cnpj"));
                    est.setNome(valor.getString("nome"));
                    est.setTelFixo(valor.getString("telefone"));
                }

                if(est.getNome()==null){
                    est = null;
                }

                stmt.close();

        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
            est = null;
        }

        return est;
    }
    
    public int alterarEstabelecimento(Estabelecimento est){
        int retorno = 0;
        
        System.out.println("\nEstabelecimentoDao - Alterar estabelecimento ADM...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT nome FROM ESTABELECIMENTO WHERE EXISTS "
                    + "(SELECT estabelecimento.nome FROM ESTABELECIMENTO "
                    + "WHERE codusuarioadm=? and "
                    + "estabelecimento.codusuarioadm=codusuarioadm and nome=? and cnpj!=?);";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, est.getUsuarioAdm().getCod());
            stmt.setString(2, est.getNome());
            stmt.setString(3, est.getCnpj());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "UPDATE ESTABELECIMENTO SET nome=?, telefone=?"
                    + "WHERE codusuarioadm=? and cnpj=?;";
                stmt = c.prepareStatement(sql);
                stmt.setString(1, est.getNome());
				stmt.setString(2, est.getTelFixo());
                stmt.setInt(3, est.getUsuarioAdm().getCod());
				stmt.setString(4, est.getCnpj());

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
    
    public int excluirEstabelecimento(Estabelecimento est){
        int retorno = 0;
        
        System.out.println("\nEstabelecimentoDao - Excluir estabelecimento ADM...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "DELETE FROM ESTABELECIMENTO WHERE cod=? and codusuarioadm=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, est.getCod());
            stmt.setInt(2, est.getUsuarioAdm().getCod());

            stmt.execute();    
            stmt.close(); 
			
            retorno = 1;	
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
}
