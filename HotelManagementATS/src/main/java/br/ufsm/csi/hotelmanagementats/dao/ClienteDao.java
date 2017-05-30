/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.Cliente;
import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
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
public class ClienteDao {
    
    public int cadastrarCliente(Cliente ct){
        int retorno = 0;
        
        System.out.println("\nClienteDao - Cadastrar cliente no Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT cpf FROM CLIENTE WHERE EXISTS "
                    + "(SELECT cliente.cpf FROM CLIENTE, ESTABELECIMENTO  "
                    + "WHERE cliente.codestabelecimento=estabelecimento.cod "
                    + "and cpf=? and estabelecimento.cod=?);";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, ct.getCpf());
            stmt.setInt(2, ct.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "INSERT INTO CLIENTE (cod, email, nome, cpf, telCel, codEstabelecimento) "
                    + "values(DEFAULT, ?, ?, ?, ?, ?);";
                stmt = c.prepareStatement(sql);
                stmt.setString(1, ct.getEmail());
                stmt.setString(2, ct.getNome());
                stmt.setString(3, ct.getCpf());
		stmt.setString(4, ct.getTelCel());
                stmt.setInt(5, ct.getEstabelecimento().getCod());

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
    
    public List<Cliente> getClientesEstabelecimento(Estabelecimento est){
			
        System.out.println("\nClienteDao - Buscar clientes do Estabelecimento...\n");

        List<Cliente> clientes = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM CLIENTE WHERE codEstabelecimento=? ORDER BY NOME ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Cliente ct = new Cliente();

                ct.setCod(valor.getInt("cod"));
                ct.setEmail(valor.getString("email"));
                ct.setNome(valor.getString("nome"));
				ct.setCpf(valor.getString("cpf"));
				ct.setTelCel(valor.getString("telcel"));

                clientes.add(ct);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return clientes;
    }
    
    public Cliente carregarClienteEscolhido(Cliente ct){
        
        System.out.println("\nClienteDao - Carregar cliente escolhido...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
                c = ConectaBD.getConexao();
                String sql;

                sql = "SELECT * FROM CLIENTE WHERE cod=? AND codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);	
                stmt.setInt(1, ct.getCod());
                stmt.setInt(2, ct.getEstabelecimento().getCod());

                ResultSet valor = stmt.executeQuery();	

                while(valor.next()){
                    ct.setCod(valor.getInt("cod"));
                    ct.setCpf(valor.getString("cpf"));
                    ct.setNome(valor.getString("nome"));
                    ct.setTelCel(valor.getString("telcel"));
		    ct.setEmail(valor.getString("email"));
                }

                if(ct.getNome()==null){
                    ct = null;
                }

                stmt.close();

        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
            ct = null;
        }

        return ct;
    }
    
    public int alterarCliente(Cliente ct){
        int retorno = 0;
        
        System.out.println("\nClienteDao - Alterar cliente do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT cpf FROM CLIENTE WHERE EXISTS "
                    + "(SELECT cliente.cpf FROM CLIENTE "
                    + "WHERE codEstabelecimento=? and cpf=?"
                    + "and cod!=?);";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, ct.getEstabelecimento().getCod());
            stmt.setString(2, ct.getCpf());
            stmt.setInt(3, ct.getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "UPDATE CLIENTE SET nome=?, telCel=?, cpf=?, email=?"
                    + "WHERE cod=? and codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);
                stmt.setString(1, ct.getNome());
                stmt.setString(2, ct.getTelCel());
                stmt.setString(3, ct.getCpf());
                stmt.setString(4, ct.getEmail());
                stmt.setInt(5, ct.getCod());
                stmt.setInt(6, ct.getEstabelecimento().getCod());

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
    
    public int excluirCliente(Cliente ct){
        int retorno = 0;
        
        System.out.println("\nClienteDao - Excluir cliente do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT * FROM CLIENTE WHERE cod=? and codEstabelecimento=?;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, ct.getCod());
            stmt.setInt(2, ct.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(verificador){
                sql = "DELETE FROM CLIENTE WHERE cod=? and codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, ct.getCod());
                stmt.setInt(2, ct.getEstabelecimento().getCod());

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
