/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Atividade;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public class AtividadeDAO extends DAO<Atividade> {
    
    public AtividadeDAO() throws SQLException {
        super();
    }

    @Override
    public void salvar( Atividade obj ) throws SQLException {

        String sql = "INSERT INTO evento() "
                + "VALUES( ?,?,?,?,?,?,?,?,?,?,? );";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        //stmt.setString( 2, obj.getNome() );
        
        
        stmt.executeUpdate();
        stmt.close();

    }

    
    
    @Override
    public void atualizar( Atividade obj ) throws SQLException {

        String sql = "UPDATE pais "
                + "SET "
                + "    nome = ?, "
                + "    sigla = ? "
                + "WHERE"
                + "    id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        //stmt.setString( 1, obj.getNome() );
        stmt.setInt( 3, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Atividade obj ) throws SQLException {

        String sql = "DELETE FROM pais WHERE id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Atividade> listarTodos() throws SQLException {

        List<Atividade> lista = new ArrayList<Atividade>();
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
    public Atividade obterPorId( int id ) throws SQLException {

        Atividade pais = null;
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

