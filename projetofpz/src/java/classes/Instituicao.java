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

    private String cnpj;
    private List<Pessoa> p;

    public Instituicao(String cnpj, List<Pessoa> p, String nome, String email,
            String cidade, String telefone, String uf, String rua, String bairro,
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
    
    public Instituicao() {
    }
    
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public List<Pessoa> getP() {
        return p;
    }

    public void setP(List<Pessoa> p) {
        this.p = p;
    }
    
    
}
