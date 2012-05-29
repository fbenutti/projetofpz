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
        
        //Instituicao inst = new Instituicao("Wellington", "zanellidrummer@gmail.com");
        
        Instituicao inst = new Instituicao();
        inst.setNome( "Wellington Institucional" );
        inst.setEmail( "zanellidrummer@gmail.com" );

        InstituicaoDAO dao = null;

        try {

            dao = new InstituicaoDAO();
            dao.salvar(inst);

        } catch (SQLException exc) {

            exc.printStackTrace();

        }
    }
}
