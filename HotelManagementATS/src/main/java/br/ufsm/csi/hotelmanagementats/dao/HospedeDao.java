/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.Hospede;
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
public class HospedeDao {
    
    public int cadastrarHospede(Hospede hp){
        int retorno = 0;
        
        System.out.println("\nHospedeDao - Cadastrar hóspede no Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT cpf FROM HOSPEDE WHERE EXISTS "
                    + "(SELECT hospede.cpf FROM HOSPEDE, ESTABELECIMENTO  "
                    + "WHERE hospede.codestabelecimento=estabelecimento.cod "
                    + "and cpf=? and estabelecimento.cod=?);";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, hp.getCpf());
            stmt.setInt(2, hp.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "INSERT INTO HOSPEDE (cod, email, nome, cpf, telCel, estado, codEstabelecimento) "
                    + "values(DEFAULT, ?, ?, ?, ?, ?, ?);";
                stmt = c.prepareStatement(sql);
                stmt.setString(1, hp.getEmail());
                stmt.setString(2, hp.getNome());
                stmt.setString(3, hp.getCpf());
		stmt.setString(4, hp.getTelCel());
                stmt.setInt(5, hp.getEstado());
                stmt.setInt(6, hp.getEstabelecimento().getCod());

                stmt.execute();
                retorno = 2;
            }
            else{
                retorno = 1;
            }
            
            stmt.close();
            c.close();
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
    
    public List<Hospede> getHospedesEstabelecimento(Estabelecimento est){
			
        // System.out.println("\nClienteDao - Buscar clientes do Estabelecimento...\n");

        List<Hospede> hospedes = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT * FROM HOSPEDE WHERE codEstabelecimento=? ORDER BY NOME ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Hospede hp = new Hospede();

                hp.setCod(valor.getInt("cod"));
                hp.setEmail(valor.getString("email"));
                hp.setNome(valor.getString("nome"));
                hp.setCpf(valor.getString("cpf"));
                hp.setTelCel(valor.getString("telcel"));
                hp.setEstado(valor.getInt("estado"));

                hospedes.add(hp);
            }

            stmt.close();
            c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return hospedes;
    }
    
    public Hospede carregarHospedeEscolhido(Hospede hp){
        
        System.out.println("\nHospedeDao - Carregar hospede escolhido...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
                c = ConectaBD.getConexao();
                String sql;

                sql = "SELECT * FROM HOSPEDE WHERE cod=? AND estado=0 AND codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);	
                stmt.setInt(1, hp.getCod());
                stmt.setInt(2, hp.getEstabelecimento().getCod());

                ResultSet valor = stmt.executeQuery();	

                while(valor.next()){
                    hp.setCod(valor.getInt("cod"));
                    hp.setCpf(valor.getString("cpf"));
                    hp.setNome(valor.getString("nome"));
                    hp.setTelCel(valor.getString("telcel"));
		    hp.setEmail(valor.getString("email"));
                    hp.setEstado(valor.getInt("estado"));
                }

                if(hp.getNome()==null){
                    hp = null;
                }

                stmt.close();
                c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
            hp = null;
        }

        return hp;
    }
    
    public int alterarHospede(Hospede hp){
        int retorno = 0;
        
        System.out.println("\nHospedeDao - Alterar hóspede do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT cpf FROM HOSPEDE WHERE EXISTS "
                    + "(SELECT hospede.cpf FROM HOSPEDE "
                    + "WHERE codEstabelecimento=? and cpf=?"
                    + "and cod!=?);";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, hp.getEstabelecimento().getCod());
            stmt.setString(2, hp.getCpf());
            stmt.setInt(3, hp.getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(!verificador){
                sql = "UPDATE HOSPEDE SET nome=?, telCel=?, cpf=?, email=?"
                    + "WHERE cod=? and codEstabelecimento=? and estado=0;";
                stmt = c.prepareStatement(sql);
                stmt.setString(1, hp.getNome());
                stmt.setString(2, hp.getTelCel());
                stmt.setString(3, hp.getCpf());
                stmt.setString(4, hp.getEmail());
                stmt.setInt(5, hp.getCod());
                stmt.setInt(6, hp.getEstabelecimento().getCod());

                stmt.execute();
                retorno = 2;
            }
            else{
                retorno = 1;
            }
            
            stmt.close(); 
            c.close();
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
    
    public int excluirHospede(Hospede hp){
        int retorno = 0;
        
        System.out.println("\nHospedeDao - Excluir hospede do Estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;
            
            sql = "SELECT * FROM HOSPEDE WHERE cod=? and codEstabelecimento=? and estado=0;";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, hp.getCod());
            stmt.setInt(2, hp.getEstabelecimento().getCod());
            
            ResultSet valor = stmt.executeQuery();
            boolean verificador = valor.next();
            
            if(verificador){
                sql = "DELETE FROM HOSPEDE WHERE cod=? and codEstabelecimento=? and estado=0;";
                stmt = c.prepareStatement(sql);
                stmt.setInt(1, hp.getCod());
                stmt.setInt(2, hp.getEstabelecimento().getCod());

                stmt.execute();
  
                retorno = 1;
            }else{
                retorno = 0;
            }
  
            stmt.close();
            c.close();
        }catch(SQLException e){
            retorno = 0;
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }
        
        return retorno;
    }
    
    public List<Hospede> carregarHospedesDesocupados(Estabelecimento est){
        
        System.out.println("\nHospedeDao - Carregar hóspedes que não estejam ocupados no momento no estabelecimento...\n");
        
        Connection c = null;
        PreparedStatement stmt = null;
        
        List<Hospede> hospedes = new ArrayList();
        
        try{
                c = ConectaBD.getConexao();
                String sql;

                sql = "SELECT * FROM HOSPEDE WHERE estado=0 AND codEstabelecimento=?;";
                stmt = c.prepareStatement(sql);	
                stmt.setInt(1, est.getCod());

                ResultSet valor = stmt.executeQuery();	

                while(valor.next()){
                    Hospede hp = new Hospede();
                    
                    hp.setCod(valor.getInt("cod"));
                    hp.setCpf(valor.getString("cpf"));
                    hp.setNome(valor.getString("nome"));
                    
                    hospedes.add(hp);
                }
                if(hospedes.isEmpty()){
                    hospedes=null;
                }
                
                stmt.close();
                c.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
            hospedes = null;
        }

        return hospedes;
    }
}
