/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Wellington
 */
public class Pessoa extends Inscritos {
    
    private int cpf;
    private Inscritos i;

    //Início getters e setter
    public int getCpf() {
        return cpf;
    }

    public void setCpf(int cpf) {
        this.cpf = cpf;
    }

    public Inscritos getI() {
        return i;
    }

    public void setI(Inscritos i) {
        this.i = i;
    }
    //Fim getters e setter
    
}
