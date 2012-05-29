/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Wellington
 */
public class ConnectionFactory {
    
    public Connection getConnection(){
        System.out.println("Conectando ao banco");
        try{
            return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/fpz", "root", "");
        } catch(SQLException e){
            System.out.println("Não foi possível conectar ao banco!");
            throw new RuntimeException(e);
        }
    }
    
}
