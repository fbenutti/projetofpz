/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Instituicao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Wellington
 */
public class InstituicaoDAO extends DAO<Instituicao> {
    
    public InstituicaoDAO() throws SQLException {
        super();
    }

    @Override
    public void salvar( Instituicao obj ) throws SQLException {

        String sql = "INSERT INTO instituicao(nome, email, cep, bairro, cidade,"
                +"cnpj, complemento, numero, rua, telefone) "
                + "VALUES( ?,?,?,?,?,?,?,?,?,? );";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, obj.getNome() );
        stmt.setString( 2, obj.getEmail() );
        stmt.setString( 3, obj.getCep() );
        stmt.setString( 4, obj.getBairro() );
        stmt.setString( 5, obj.getCidade() );
        stmt.setString( 6, obj.getCnpj() );
        stmt.setString( 7, obj.getComplemento() );
        stmt.setInt( 8, obj.getNumero() );
        stmt.setString( 9, obj.getRua() );
        stmt.setString( 10, obj.getTelefone() );
        

        stmt.executeUpdate();
        stmt.close();

    }

    
    
    @Override
    public void atualizar( Instituicao obj ) throws SQLException {

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
    public void excluir( Instituicao obj ) throws SQLException {

        String sql = "DELETE FROM pais WHERE id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Instituicao> listarTodos() throws SQLException {

        List<Instituicao> lista = new ArrayList<Instituicao>();
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
    public Instituicao obterPorId( int id ) throws SQLException {

        Instituicao pais = null;
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
