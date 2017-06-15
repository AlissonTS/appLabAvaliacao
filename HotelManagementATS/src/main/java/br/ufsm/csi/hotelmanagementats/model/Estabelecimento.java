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
public class Estabelecimento {
    
    private int cod;
    private String cnpj;
    private String nome;
    private String telFixo;
    private UsuarioAdministrador usuarioAdm;
    private List<UsuarioOperador> usuariosOp;
    private List<Hospede> hospedes;

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
     * @return the cnpj
     */
    public String getCnpj() {
        return cnpj;
    }

    /**
     * @param cnpj the cnpj to set
     */
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
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
        this.nome = nome.toUpperCase();
    }

    /**
     * @return the telFixo
     */
    public String getTelFixo() {
        return telFixo;
    }

    /**
     * @param telFixo the telefone to set
     */
    public void setTelFixo(String telFixo) {
        this.telFixo = telFixo;
    }

    /**
     * @return the usuarioAdm
     */
    public UsuarioAdministrador getUsuarioAdm() {
        return usuarioAdm;
    }

    /**
     * @param usuarioAdm the usuarioAdm to set
     */
    public void setUsuarioAdm(UsuarioAdministrador usuarioAdm) {
        this.usuarioAdm = usuarioAdm;
    }

    /**
     * @return the usuariosOp
     */
    public List<UsuarioOperador> getUsuariosOp() {
        return usuariosOp;
    }

    /**
     * @param usuariosOp the usuariosOp to set
     */
    public void setUsuariosOp(List<UsuarioOperador> usuariosOp) {
        this.usuariosOp = usuariosOp;
    }

    /**
     * @return the hospedes
     */
    public List<Hospede> getHospedes() {
        return hospedes;
    }

    /**
     * @param hospedes the hospedes to set
     */
    public void setHospedes(List<Hospede> hospedes) {
        this.hospedes = hospedes;
    }

}
