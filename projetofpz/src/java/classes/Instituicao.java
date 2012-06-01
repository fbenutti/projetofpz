/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.List;

/**
 *
 * @author Wellington
 */
public class Instituicao extends Inscritos {

    private int cnpj;
    private List<Pessoa> p;

    public Instituicao(int cnpj, List<Pessoa> p, String nome, String email,
            String cidade, int telefone, String uf, String rua, String bairro,
            int numero, String complemento) {
        this.cnpj = cnpj;
        this.p = p;
        super.setNome(nome);
        super.setEmail(email);
        super.setCidade(cidade);
        super.setTelefone(telefone);
        super.setUf(uf);
        super.setRua(rua);
        super.setBairro(bairro);
        super.setNumero(numero);
        super.setComplemento(complemento);
    }
    
    public Instituicao(String nome, String email){
        super.setNome(nome);
        super.setEmail(email);
    }

    public Instituicao() {
    }
    
    public int getCnpj() {
        return cnpj;
    }

    public void setCnpj(int cnpj) {
        this.cnpj = cnpj;
    }

    public List<Pessoa> getP() {
        return p;
    }

    public void setP(List<Pessoa> p) {
        this.p = p;
    }
    
    
}
