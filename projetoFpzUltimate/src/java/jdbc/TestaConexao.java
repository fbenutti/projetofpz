package jdbc;

import java.sql.Connection;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Wellington
 */
public class TestaConexao {
    
    public static void main(String[] args) {
        Connection connection = new ConnectionFactory().getConnection();
    }
    
}
