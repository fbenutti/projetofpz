/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Felipe
 */
public class Atividade {
    private int id;
    private String descricao;
    private int vagas;
    private int vagasRestantes;
    private String horario_inicio;
    private String horario_fim;

    public Atividade() {
    }

    public Atividade(int id, String descricao, int vagas,int vagasRestantes, String horario_inicio, String horario_fim) {
        this.id = id;
        this.descricao = descricao;
        this.vagas = vagas;
        this.vagasRestantes = vagasRestantes;
        this.horario_inicio = horario_inicio;
        this.horario_fim = horario_fim;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getHorario_fim() {
        return horario_fim;
    }

    public void setHorario_fim(String horario_fim) {
        this.horario_fim = horario_fim;
    }

    public String getHorario_inicio() {
        return horario_inicio;
    }

    public void setHorario_inicio(String horario_inicio) {
        this.horario_inicio = horario_inicio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVagas() {
        return vagas;
    }

    public void setVagas(int vagas) {
        this.vagas = vagas;
    }

    public int getVagasRestantes() {
        return vagasRestantes;
    }

    public void setVagasRestantes(int vagasRestantes) {
        this.vagasRestantes = vagasRestantes;
    }
    
}
