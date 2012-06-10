package classes;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Felipe
 */
public class Responsavel {
    private int id;
    private String nome;
    private String email;
    private String cidade;
    private String uf;

    public Responsavel() {
    }

    public Responsavel(int id, String nome, String email, String cidade, String uf) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cidade = cidade;
        this.uf = uf;
    }

    public Responsavel(String nome, String email, String cidade, String uf) {
        this.nome = nome;
        this.email = email;
        this.cidade = cidade;
        this.uf = uf;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getUF() {
        return uf;
    }

    public void setUF(String uf) {
        this.uf = uf;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
