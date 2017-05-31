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
			
        System.out.println("\nQuartoDao - Buscar quartos do Estabelecimento...\n");

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
    
}
