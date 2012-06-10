package classes;

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
    private String periodoInicial;
    private String periodoFinal;
    private String nome;

    public Evento() {
    }

    public Evento(int id, int vagas, int totalDeParticipantes, String descricao, String periodoInicial, String periodoFinal) {
        this.id = id;
        this.periodoInicial = periodoInicial;
        this.periodoFinal = periodoFinal;
    }

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
    
}
