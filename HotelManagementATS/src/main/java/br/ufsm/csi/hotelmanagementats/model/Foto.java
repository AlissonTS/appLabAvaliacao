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
public class Foto {
    
    private int cod;
    private byte[] foto;
    private int codQuarto;

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
     * @return the foto
     */
    public byte[] getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    /**
     * @return the codQuarto
     */
    public int getCodQuarto() {
        return codQuarto;
    }

    /**
     * @param codQuarto the codQuarto to set
     */
    public void setCodQuarto(int codQuarto) {
        this.codQuarto = codQuarto;
    }
    
}
