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

/**
 *
 * @author Alisson
 */
public class UsuarioOpDao {
    
    public boolean alterarUsuarioOperador(UsuarioOperador u, Estabelecimento est){
        boolean retorno = false;
        
        System.out.println("\nUsuarioAdmDao - Alterar usuário operador...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;
        
        try{
            c = ConectaBD.getConexao();
            String sql;
           
            sql = "UPDATE USUARIOOP SET nickname=?, senha=?, nome=?, telfixo=?, telcel=?"
                    + "WHERE COD=? AND CODESTABELECIMENTO=?;";
            
            stmt = c.prepareStatement(sql);
            stmt.setString(1, u.getNickname());
            stmt.setString(2, u.getSenha());
            stmt.setString(3, u.getNome());
            stmt.setString(4, u.getTelFixo());
            stmt.setString(5, u.getTelCel());
            stmt.setInt(6, u.getCod());
	    stmt.setInt(7, est.getCod());
            
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
}
