/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Instituicao;
import java.sql.SQLException;

/**
 *
 * @author Wellington
 */
public class TestaInstituicao {

    public static void main(String[] args) {
        
        Instituicao inst = new Instituicao();
        inst.setNome( "Wellington Institucional" );
        inst.setEmail( "zanellidrummer@gmail.com" );
        inst.setCep("13.876-460");
        inst.setBairro("Jardim Magalhães");
        inst.setCidade("São João da Boa Vista");
        inst.setCnpj("25.707.439/0001-80");
        inst.setComplemento("Fundos");
        inst.setNumero(Integer.parseInt("467"));
        inst.setRua("Jarbas Amaral Carvalho");
        inst.setTelefone("9155-2985");
        inst.setUf("SP");

        InstituicaoDAO dao = null;

        try {

            dao = new InstituicaoDAO();
            dao.salvar(inst);

        } catch (SQLException exc) {

            exc.printStackTrace();

        }
    }
}
