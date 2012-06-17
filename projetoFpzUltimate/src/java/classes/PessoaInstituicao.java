/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Wellington
 */
public class PessoaInstituicao {
    
    String cpf;
    String cnpj;

    
    public PessoaInstituicao() {
    }

    public PessoaInstituicao(String cpf, String cnpj) {
        this.cpf = cpf;
        this.cnpj = cnpj;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    
    
}
