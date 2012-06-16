package classes;

import java.awt.image.BufferedImage;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Felipe
 */
public class Evento {
    private int id;
    private String nome;
    private String periodoInicial;
    private String periodoFinal;
    private BufferedImage foto;

    
    //construtores
    public Evento() {
    }

    public Evento(int id, int vagas, int totalDeParticipantes, String descricao, String periodoInicial, String periodoFinal) {
        this.id = id;
        this.periodoInicial = periodoInicial;
        this.periodoFinal = periodoFinal;
    }
    //fim construtores
    
    //gets e sets
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPeriodoFinal() {
        return periodoFinal;
    }

    public void setPeriodoFinal(String periodoFinal) {
        this.periodoFinal = periodoFinal;
    }

    public String getPeriodoInicial() {
        return periodoInicial;
    }

    public void setPeriodoInicial(String periodoInicial) {
        this.periodoInicial = periodoInicial;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public BufferedImage getFoto() {
        return foto;
    }

    public void setFoto(BufferedImage foto) {
        this.foto = foto;
    }
    
    //fim gets e sets   
}
