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
public class Hospedagem {
    
    private int cod;
    private String dataInicial;
    private String dataFinal;
    private String horaInicial;
    private String horaFinal;
    private float valorHospedagem;
    private float valorGastos;
    private float valorTotal;
    private int estado; // 0 - em andamento, 1 - finalizada
    private Quarto quarto;
    private List<Cliente> clientes;
    private List<Gasto> gastos;
    
    
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
     * @return the dataInicial
     */
    public String getDataInicial() {
        return dataInicial;
    }

    /**
     * @param dataInicial the dataInicial to set
     */
    public void setDataInicial(String dataInicial) {
        this.dataInicial = dataInicial;
    }

    /**
     * @return the dataFinal
     */
    public String getDataFinal() {
        return dataFinal;
    }

    /**
     * @param dataFinal the dataFinal to set
     */
    public void setDataFinal(String dataFinal) {
        this.dataFinal = dataFinal;
    }

    /**
     * @return the horaInicial
     */
    public String getHoraInicial() {
        return horaInicial;
    }

    /**
     * @param horaInicial the horaInicial to set
     */
    public void setHoraInicial(String horaInicial) {
        this.horaInicial = horaInicial;
    }

    /**
     * @return the horaFinal
     */
    public String getHoraFinal() {
        return horaFinal;
    }

    /**
     * @param horaFinal the horaFinal to set
     */
    public void setHoraFinal(String horaFinal) {
        this.horaFinal = horaFinal;
    }

    /**
     * @return the valorHospedagem
     */
    public float getValorHospedagem() {
        return valorHospedagem;
    }

    /**
     * @param valorHospedagem the valorHospedagem to set
     */
    public void setValorHospedagem(float valorHospedagem) {
        this.valorHospedagem = valorHospedagem;
    }

    /**
     * @return the valorGastos
     */
    public float getValorGastos() {
        return valorGastos;
    }

    /**
     * @param valorGastos the valorGastos to set
     */
    public void setValorGastos(float valorGastos) {
        this.valorGastos = valorGastos;
    }

    /**
     * @return the valorTotal
     */
    public float getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

    /**
     * @return the quarto
     */
    public Quarto getQuarto() {
        return quarto;
    }

    /**
     * @param quarto the quarto to set
     */
    public void setQuarto(Quarto quarto) {
        this.quarto = quarto;
    }

    /**
     * @return the clientes
     */
    public List<Cliente> getClientes() {
        return clientes;
    }

    /**
     * @param clientes the clientes to set
     */
    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    /**
     * @return the gastos
     */
    public List<Gasto> getGastos() {
        return gastos;
    }

    /**
     * @param gastos the gastos to set
     */
    public void setGastos(List<Gasto> gastos) {
        this.gastos = gastos;
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
}
