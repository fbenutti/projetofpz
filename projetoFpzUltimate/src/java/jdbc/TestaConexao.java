package jdbc;

import java.sql.Connection;
import java.sql.SQLException;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Wellington
 */
public class TestaConexao {
    
    public static void main(String[] args) throws SQLException {
        
        Connection connection = new ConnectionFactory().getConnection();
        
        System.out.println("Conexão aberta!");
        
        connection.close();
    }
    
}
