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
        
    /*
     * Este bloco estático será executado assim que esta classe for carregada,
     * sendo assim, será executado apenas uma vez.
     */
    static {
        try {
            /*
             * Carrega a classe com.mysql.jdbc.Driver, que é a implementação
             * do driver JDBC para o MySQL.
             */
            Class.forName( "com.mysql.jdbc.Driver" );

            // caso a classe não seja encontrada
        } catch ( ClassNotFoundException exc ) {

            /*
             * Como log usaremos o stacktrace das excessões.
             */
            exc.printStackTrace();

        }
    }
    
    public Connection getConnection(){
        System.out.println("Conectando ao banco");
        try{
            return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/projetofpz", "root", "1234");
        } catch(SQLException e){
            System.out.println("Não foi possível conectar ao banco!");
            throw new RuntimeException(e);
        }
    }
    
}
