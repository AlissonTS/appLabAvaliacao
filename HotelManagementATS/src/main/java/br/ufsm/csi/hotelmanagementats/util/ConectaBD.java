/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Alisson
 */
public class ConectaBD {
    
    public static void main(String args[]){
        ConectaBD.getConexao();
        System.out.println("Conexão estabelecida.");
    }
    
    public static Connection getConexao(){
        Connection c = null;
        
        try{
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/alissonLab-Hotel";
            String user ="postgres";
            String password="1234";
            
            c = DriverManager.getConnection(url, user, password);
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return c;
    }
    
}
