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

    private String cpf;
    //private Inscritos i;

    //construtor
    public Pessoa(String cpf, String nome, String email, String telefone, String cep,
            String cidade, String uf,  String rua, String bairro,
            int numero, String complemento) {
        this.cpf = cpf;
        //this.i = i;
        super.setNome(nome);
        super.setEmail(email);
        super.setTelefone(telefone);
        super.setCep(cep);
        super.setCidade(cidade);
        super.setUf(uf);
        super.setRua(rua);
        super.setBairro(bairro);
        super.setNumero(numero);
        super.setComplemento(complemento);
    }

    public Pessoa() {
    }
    //fim construtor

    //Início getters e setter
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    //Fim getters e setter
}
