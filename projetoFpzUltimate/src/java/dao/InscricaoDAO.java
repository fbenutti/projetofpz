/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Inscricao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Wellington
 */
public class InscricaoDAO extends DAO<Inscricao> {

    public InscricaoDAO() throws SQLException {
        super();
    }

    @Override
    public void salvar(Inscricao obj) throws SQLException {
        String sql = "INSERT INTO inscricao(es_cpf, es_atividade) "
                + "VALUES( ?,? );";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setString(1, obj.getCpf());
        stmt.setInt(2, obj.getCodAtividade());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void atualizar(Inscricao obj) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void excluir(Inscricao obj) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Inscricao> listarTodos() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public List<Inscricao> listarPorUsuario(String CPF) throws SQLException {

        List<Inscricao> lista = new ArrayList<Inscricao>();
        String sql = "SELECT * FROM inscricao WHERE es_cpf = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, CPF);

        ResultSet rs = stmt.executeQuery();
        
        
        while ( rs.next() ) {

            Inscricao i = new Inscricao();
            i.setCodAtividade( rs.getInt( "es_atividade" ) );
            i.setCpf( rs.getString( "es_cpf" ) );
            

            lista.add( i );

        }

        rs.close();
        stmt.close();

        return lista;
        
    }

    @Override
    public Inscricao obterPorId(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
