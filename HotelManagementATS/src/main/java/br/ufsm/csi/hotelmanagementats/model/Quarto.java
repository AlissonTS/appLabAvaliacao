/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.csi.hotelmanagementats.model;

import java.util.List;

/**
 *
 * @author Alisson
 */
public class Quarto {
    
    private int cod;
    private int numero;
    private float area;
    private int maxHosp;
    private String descricaoExtra;
    private int estado; // 0 - Desocupado, 1 - Ocupado, 2 - Desabilitado
    private float valorDiaria;
    private Estabelecimento estabelecimento;
    private List<Hospedagem> hospedagens;

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
     * @return the numero
     */
    public int getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(int numero) {
        this.numero = numero;
    }

    /**
     * @return the area
     */
    public float getArea() {
        return area;
    }

    /**
     * @param area the area to set
     */
    public void setArea(float area) {
        this.area = area;
    }

    /**
     * @return the maxHosp
     */
    public int getMaxHosp() {
        return maxHosp;
    }

    /**
     * @param maxHosp the maxHosp to set
     */
    public void setMaxHosp(int maxHosp) {
        this.maxHosp = maxHosp;
    }

    /**
     * @return the descricaoExtra
     */
    public String getDescricaoExtra() {
        return descricaoExtra;
    }

    /**
     * @param descricaoExtra the descricaoExtra to set
     */
    public void setDescricaoExtra(String descricaoExtra) {
        this.descricaoExtra = descricaoExtra;
    }

    /**
     * @return the estado
     */
    public int getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(int estado) {
        this.estado = estado;
    }

    /**
     * @return the valorDiaria
     */
    public float getValorDiaria() {
        return valorDiaria;
    }

    /**
     * @param valorDiaria the valorDiaria to set
     */
    public void setValorDiaria(float valorDiaria) {
        this.valorDiaria = valorDiaria;
    }

    /**
     * @return the estabelecimento
     */
    public Estabelecimento getEstabelecimento() {
        return estabelecimento;
    }

    /**
     * @param estabelecimento the estabelecimento to set
     */
    public void setEstabelecimento(Estabelecimento estabelecimento) {
        this.estabelecimento = estabelecimento;
    }

    /**
     * @return the hospedagens
     */
    public List<Hospedagem> getHospedagens() {
        return hospedagens;
    }

    /**
     * @param hospedagens the hospedagens to set
     */
    public void setHospedagens(List<Hospedagem> hospedagens) {
        this.hospedagens = hospedagens;
    }
    
}
