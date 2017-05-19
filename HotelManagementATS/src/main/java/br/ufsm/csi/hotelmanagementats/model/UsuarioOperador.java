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
public class UsuarioOperador {
    
    private int cod;
    private String nickname;
    private byte[] senha;
    private String nome;
    private String cpf;
    private String telFixo;
    private String telCel;
    private int codEstabelecimento;
    
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
     * @return the email
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @param nickname the nickname to set
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * @return the senha
     */
    public byte[] getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(byte[] senha) {
        this.senha = senha;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the telFixo
     */
    public String getTelFixo() {
        return telFixo;
    }

    /**
     * @param telFixo the telFixo to set
     */
    public void setTelFixo(String telFixo) {
        this.telFixo = telFixo;
    }

    /**
     * @return the telCel
     */
    public String getTelCel() {
        return telCel;
    }

    /**
     * @param telCel the telCel to set
     */
    public void setTelCel(String telCel) {
        this.telCel = telCel;
    }

    /**
     * @return the codEstabelecimento
     */
    public int getCodEstabelecimento() {
        return codEstabelecimento;
    }

    /**
     * @param codEstabelecimento the codEstabelecimento to set
     */
    public void setCodEstabelecimento(int codEstabelecimento) {
        this.codEstabelecimento = codEstabelecimento;
    }
    
}
