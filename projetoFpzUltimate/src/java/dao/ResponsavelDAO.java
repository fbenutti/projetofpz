/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Responsavel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public class ResponsavelDAO extends DAO<Responsavel> {
    
    public ResponsavelDAO() throws SQLException {
        super();
    }

    @Override
    public void salvar( Responsavel obj ) throws SQLException {

        String sql = "INSERT INTO responsavel(nome, email, cidade, uf ) "
                + "VALUES( ?,?,?,? );";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, obj.getNome() );
        stmt.setString( 2, obj.getEmail() );
        stmt.setString( 3, obj.getCidade() );
        stmt.setString( 4, obj.getUF() );
        
        stmt.executeUpdate();
        stmt.close();

    }

    
    
    @Override
    public void atualizar( Responsavel obj ) throws SQLException {

        String sql = "UPDATE pais "
                + "SET "
                + "    nome = ?, "
                + "    sigla = ? "
                + "WHERE"
                + "    id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, obj.getNome() );
        stmt.setInt( 3, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Responsavel obj ) throws SQLException {

        String sql = "DELETE FROM pais WHERE id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Responsavel> listarTodos() throws SQLException {

        List<Responsavel> lista = new ArrayList<Responsavel>();
        String sql = "SELECT * FROM pais;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

           /* Instituicao inst = new Instituicao();
            inst.setId( rs.getInt( "id" ) );
            inst.setNome( rs.getString( "nome" ) );
            

            lista.add( inst );*/

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Responsavel obterPorId( int id ) throws SQLException {

        Responsavel pais = null;
        String sql = "SELECT * FROM pais WHERE id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

           /* inst = new Instituicao();
            inst.setId( rs.getInt( "id" ) );
            inst.setNome( rs.getString( "nome" ) );
            inst.setSigla( rs.getString( "sigla" ) );*/

        }

        rs.close();
        stmt.close();

        return pais;

    }

    
}

