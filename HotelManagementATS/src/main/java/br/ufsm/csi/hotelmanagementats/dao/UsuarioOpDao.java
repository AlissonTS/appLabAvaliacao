/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.UsuarioOperador;
import br.ufsm.csi.hotelmanagementats.util.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Alisson
 */
public class UsuarioOpDao {
    
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
            
            // u = null;
            
            ResultSet valor = stmt.executeQuery();
            
            while(valor.next()){
                u.setCod(valor.getInt("cod"));
                u.setNickname(valor.getString("nickname"));
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
