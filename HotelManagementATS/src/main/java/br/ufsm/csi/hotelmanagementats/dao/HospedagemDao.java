/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.dao;

import br.ufsm.csi.hotelmanagementats.model.Estabelecimento;
import br.ufsm.csi.hotelmanagementats.model.Hospedagem;
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
public class HospedagemDao {
    
    public List<Hospedagem> getHospedagensCorrentes(Estabelecimento est){
			
        // System.out.println("\nHospedagemDao - Buscar hospedagens correntes do Estabelecimento...\n");

        List<Hospedagem> hospedagens = new ArrayList();

        Connection c = null;
        PreparedStatement stmt = null;

        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT valorDiaria, numero, hospedagem.* FROM QUARTO, HOSPEDAGEM WHERE codEstabelecimento=? and "
                    + "quarto.cod=hospedagem.codquarto "
                    + "and quarto.estado=1 and hospedagem.estado=0 ORDER BY datafinal, horafinal ASC;";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, est.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){
                Hospedagem h = new Hospedagem();
                Quarto qt = new Quarto();

                h.setCod(valor.getInt("cod"));
                h.setDataInicial(valor.getString("dataInicial"));
                h.setDataFinal(valor.getString("dataFinal"));
                h.setHoraInicial(valor.getString("horaInicial"));
                h.setHoraFinal(valor.getString("horaFinal"));
                h.setValorHospedagem(valor.getFloat("valorHospedagem"));
				
                qt.setNumero(valor.getInt("numero"));
                qt.setCod(valor.getInt("codQuarto"));
                qt.setValorDiaria(valor.getFloat("valorDiaria"));
				
                h.setQuarto(qt);
				
                hospedagens.add(h);
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return hospedagens;
    }
    
    public Hospedagem getTotalGastos(Hospedagem h){
			
        // System.out.println("\nHospedagemDao - Buscar valor gasto de serviço de quarto da hospedagem no Estabelecimento...\n");

        Connection c = null;
        PreparedStatement stmt = null;
		
        try{
            c = ConectaBD.getConexao();
            String sql;

            sql = "SELECT sum(valor) as valor FROM GASTO, HOSPEDAGEM WHERE gasto.codHospedagem=hospedagem.cod and hospedagem.cod=?";
            stmt = c.prepareStatement(sql);	
            stmt.setInt(1, h.getCod());

            ResultSet valor = stmt.executeQuery();

            while(valor.next()){		
                h.setValorGastos(valor.getFloat("valor"));
            }

            stmt.close();
        }catch(SQLException e){
            System.out.println("Exception SQL!");
            e.printStackTrace();
        }

        return h;
    }
}
