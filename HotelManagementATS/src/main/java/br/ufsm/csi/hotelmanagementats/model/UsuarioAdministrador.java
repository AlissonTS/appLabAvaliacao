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
public class UsuarioAdministrador extends Usuario{

    private String email;
    private String senha;
    private List<Estabelecimento> estabelecimentos;

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email.toUpperCase();
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
     * @return the estabelecimentos
     */
    public List<Estabelecimento> getEstabelecimentos() {
        return estabelecimentos;
    }

    /**
     * @param estabelecimentos the estabelecimentos to set
     */
    public void setEstabelecimentos(List<Estabelecimento> estabelecimentos) {
        this.estabelecimentos = estabelecimentos;
    }
   
}
