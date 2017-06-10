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
public class UsuarioOperador extends Usuario{
    
    private String nickname;
    private String senha;
    private int estado; // 0 - desabilitado e 1 - habilitado
    private Estabelecimento estabelecimento;
    
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
        this.nickname = nickname.toUpperCase();
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
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
