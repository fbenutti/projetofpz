/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Wellington
 */
public class Inscricao {
    
    private String cpf;
    private int codAtividade;

    
    
    public Inscricao() {
    }

    public Inscricao(String cpf, int codAtividade) {
        this.cpf = cpf;
        this.codAtividade = codAtividade;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getCodAtividade() {
        return codAtividade;
    }

    public void setCodAtividade(int codAtividade) {
        this.codAtividade = codAtividade;
    }
    
    
    
}
