/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.UsuarioAdministrador;
import br.ufsm.csi.hotelmanagementats.util.ConectaBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alisson
 */
public class UsuarioAdmDao {
    
    public boolean cadastrarUsuarioAdm(UsuarioAdministrador u){
        boolean retorno = false;
        
        System.out.println("\nUsuarioAdmDao - Cadastrar usuário ADM...\n");
        
        Connection c = null;
	PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "INSERT INTO USUARIOADM (cod, email, senha, nome, cpf, telfixo, telcel) "
                    + "values(DEFAULT, ?, ?, ?, ?, ?, ?);";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getSenha());
            stmt.setString(3, u.getNome());
            stmt.setString(4, u.getCpf());
            stmt.setString(5, u.getTelFixo());
            stmt.setString(6, u.getTelCel());
            
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
    
    public boolean alterarUsuarioAdm(UsuarioAdministrador u){
        boolean retorno = false;
        
        System.out.println("\nUsuarioAdmDao - Alterar usuário ADM...\n");
        
        Connection c = null;
	PreparedStatement stmt = null;
        
        try{
            c = ConectaBD.getConexao();
            String sql;
           
            sql = "UPDATE USUARIOADM SET email=?, senha=?, nome=?, cpf=?, telfixo=?, telcel=?"
                    + "WHERE COD=?;";
            
            stmt = c.prepareStatement(sql);
            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getSenha());
            stmt.setString(3, u.getNome());
            stmt.setString(4, u.getCpf());
            stmt.setString(5, u.getTelFixo());
            stmt.setString(6, u.getTelCel());
            stmt.setInt(7, u.getCod());
            
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
    
    public UsuarioAdministrador logar(UsuarioAdministrador u){
        Connection c = null;
        PreparedStatement stmt = null;
        
        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT * FROM USUARIOADM WHERE EMAIL=? AND SENHA=?;";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getSenha());
            
            // u = null;
            
            ResultSet valor = stmt.executeQuery();
            
            while(valor.next()){
                u.setCod(valor.getInt("cod"));
                u.setEmail(valor.getString("email"));
                u.setSenha(valor.getString("senha"));
                u.setNome(valor.getString("nome"));
                u.setCpf(valor.getString("cpf"));
                u.setTelFixo(valor.getString("telfixo"));
                u.setTelCel(valor.getString("telcel"));
            }
            
            if(u.getNome()==null){
                u = null;
            }
            
            stmt.close();
            
        }catch(Exception e){
            e.printStackTrace();
            u = null;
        }
        
        return u;
    }
}
