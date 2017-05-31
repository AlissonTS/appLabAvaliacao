/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.UsuarioOperador;
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
public class UsuarioOpDao {
    
    public int cadastrarOperador(UsuarioOperador u){
        int retorno = 0;
        
        System.out.println("\nUsuarioOpDao - Cadastrar operador no Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT cpf FROM USUARIOOP WHERE EXISTS "
                    + "(SELECT usuarioop.cpf FROM USUARIOOP, ESTABELECIMENTO  "
                    + "WHERE usuarioop.codestabelecimento=estabelecimento.cod "
                    + "and cpf=? and estabelecimento.cod=?);";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, u.getCpf());
            stmt.setInt(2, u.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "INSERT INTO USUARIOOP (cod, nickname, nome, cpf, telFixo, telCel, senha, codEstabelecimento) "
                    + "values(DEFAULT, ?, ?, ?, ?, ?, ?, ?);";
                stmt = c.prepareStatement(sql);
                stmt.setString(1, u.getNickname());
                stmt.setString(2, u.getNome());
                stmt.setString(3, u.getCpf());
                stmt.setString(4, u.getTelFixo());
                stmt.setString(5, u.getTelCel());
                stmt.setString(6, u.getSenha());
                stmt.setInt(7, u.getEstabelecimento().getCod());

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
    
    public boolean alterarUsuarioOperador(UsuarioOperador u, boolean verificador){
        boolean retorno = false;
        
        System.out.println("\nUsuarioOpDao - Alterar usuário operador...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;
        
        try{
            c = ConectaBD.getConexao();
            String sql;
            
            if(verificador){
                sql = "UPDATE USUARIOOP SET nickname=?, senha=?, nome=?, telfixo=?, telcel=?"
                    + "WHERE COD=? AND CODESTABELECIMENTO=?;";
            
                stmt = c.prepareStatement(sql);
                stmt.setString(1, u.getNickname());
                stmt.setString(2, u.getSenha());
                stmt.setString(3, u.getNome());
                stmt.setString(4, u.getTelFixo());
                stmt.setString(5, u.getTelCel());
                stmt.setInt(6, u.getCod());
                stmt.setInt(7, u.getEstabelecimento().getCod());
            }else{
                sql = "UPDATE USUARIOOP SET nickname=?, nome=?, telfixo=?, telcel=?"
                    + "WHERE COD=? AND CODESTABELECIMENTO=?;";
            
                stmt = c.prepareStatement(sql);
                stmt.setString(1, u.getNickname());
                stmt.setString(2, u.getNome());
                stmt.setString(3, u.getTelFixo());
                stmt.setString(4, u.getTelCel());
                stmt.setInt(5, u.getCod());
                stmt.setInt(6, u.getEstabelecimento().getCod());
            }     
            
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
    
    public List<UsuarioOperador> getOperadoresEstabelecimento(Estabelecimento est){
			
        // System.out.println("\nUsuarioOpDao - Buscar operadores do Estabelecimento...\n");

        List<UsuarioOperador> operadores = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM USUARIOOP WHERE codEstabelecimento=? ORDER BY NOME ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                UsuarioOperador u = new UsuarioOperador();

                u.setCod(valor.getInt("cod"));
                u.setNickname(valor.getString("nickname"));
                u.setSenha(valor.getString("senha"));
                u.setNome(valor.getString("nome"));
                u.setCpf(valor.getString("cpf"));
                u.setTelCel(valor.getString("telcel"));
                u.setTelFixo(valor.getString("telfixo"));

                operadores.add(u);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return operadores;
    }
    
    public UsuarioOperador logar(UsuarioOperador u){
        Connection c = null;
        PreparedStatement stmt = null;
        
        System.out.println("\nUsuarioOpDao - Logar...\n");
        
        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT * FROM USUARIOOP WHERE NICKNAME=? AND SENHA=?;";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, u.getNickname());
            stmt.setString(2, u.getSenha());
            
            ResultSet valor = stmt.executeQuery();
            
            int estabelecimento=0;
            
            while(valor.next()){
                u.setCod(valor.getInt("cod"));
                u.setNickname(valor.getString("nickname"));
                u.setSenha(valor.getString("senha"));
                u.setNome(valor.getString("nome"));
                u.setCpf(valor.getString("cpf"));
                u.setTelFixo(valor.getString("telfixo"));
                u.setTelCel(valor.getString("telcel"));
                estabelecimento = valor.getInt("codEstabelecimento");
            }
            
            if(u.getNome()!=null){
                sql = "SELECT * FROM ESTABELECIMENTO WHERE COD=?;";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, estabelecimento);
                
                valor = stmt.executeQuery();
                
                Estabelecimento est = new Estabelecimento();
                
                while(valor.next()){
                    est.setCod(valor.getInt("cod"));
                    est.setCnpj(valor.getString("cnpj"));
                    est.setNome(valor.getString("nome"));
                    est.setTelFixo(valor.getString("telefone"));
                }
                u.setEstabelecimento(est);
            }
            
            if(u.getNome()==null){
                u = null;
            }
            
            stmt.close();
            
        }catch(SQLException e){
            e.printStackTrace();
            System.out.println("Exception SQL!");
            u = null;
        }
        
        return u;
    }
    
    public UsuarioOperador carregarOperadorEscolhido(UsuarioOperador u){
        
        System.out.println("\nUsuarioOpDao - Carregar operador do estabelecimento escolhido...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM USUARIOOP WHERE cod=? AND codEstabelecimento=?;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, u.getCod());
            stmt.setInt(2, u.getEstabelecimento().getCod());

            ResultSet valor = stmt.executeQuery();	

            while(valor.next()){
                u.setCod(valor.getInt("cod"));
                u.setNickname(valor.getString("nickname"));
                u.setNome(valor.getString("nome"));
                u.setCpf(valor.getString("cpf"));
                u.setTelCel(valor.getString("telcel"));
                u.setTelFixo(valor.getString("telfixo"));
            }

            if(u.getNome()==null){
                u = null;
            }

            stmt.close();

        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
            u = null;
        }

        return u;
    }
    
    public int excluirOperador(UsuarioOperador u){
        int retorno = 0;
        
        System.out.println("\nUsuarioOpDao - Excluir operador do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT * FROM USUARIOOP WHERE cod=? and codEstabelecimento=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, u.getCod());
            stmt.setInt(2, u.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(verificador){
                sql = "DELETE FROM USUARIOOP WHERE cod=? and codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, u.getCod());
                stmt.setInt(2, u.getEstabelecimento().getCod());

                stmt.execute();
  
                retorno = 1;
            }else{
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
