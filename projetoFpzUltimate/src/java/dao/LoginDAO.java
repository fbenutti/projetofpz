/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Login;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Wellington
 */
public class LoginDAO extends DAO<Login> {
    
    public LoginDAO() throws SQLException {
        super();
    }

    @Override
    public void salvar( Login obj ) throws SQLException {

        String sql = "INSERT INTO login(user_name, senha, tipo) "
                + "VALUES( ?,?,? );";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, obj.getLogin() );
        stmt.setString( 2, obj.getSenha() );
        stmt.setString( 3, obj.getTipo() );
        
        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar(Login obj) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void excluir(Login obj) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Login> listarTodos() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Login obterLogin(String userName, String senha) throws SQLException {
        
        Login login = null;
        String sql = "SELECT * FROM login WHERE user_name = ? and senha = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, userName );
        stmt.setString( 2, senha );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            login = new Login();
            login.setLogin( rs.getString( "user_name" ) );
            login.setSenha( rs.getString( "senha" ) );
            login.setTipo( rs.getString( "tipo" ) );

        }

        rs.close();
        stmt.close();

        return login;
    }

    @Override
    public Login obterPorId(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }


}
