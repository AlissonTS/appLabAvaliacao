/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.model;

/**
 *
 * @author Alisson
 */
public class Gasto {
    
    private int cod;
    private String descricao;
    private float valor;
    private int codHospedagem;

    /**
     * @return the cod
     */
    public int getCod() {
        return cod;
    }

    /**
     * @param cod the cod to set
     */
    public void setCod(int cod) {
        this.cod = cod;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the valor
     */
    public float getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(float valor) {
        this.valor = valor;
    }

    /**
     * @return the codHospedagem
     */
    public int getCodHospedagem() {
        return codHospedagem;
    }

    /**
     * @param codHospedagem the codHospedagem to set
     */
    public void setCodHospedagem(int codHospedagem) {
        this.codHospedagem = codHospedagem;
    }
    
    
}
