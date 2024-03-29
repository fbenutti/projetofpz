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
    public void salvar(Atividade obj) throws SQLException {

        String sql = "INSERT INTO atividade ( descricao, vagas, vagas_restantes,"
                + " horario_inicio, horario_fim, es_evento, es_responsavel) VALUES( ?,?,?,?,?,?,? );";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setString( 1, obj.getDescricao() );
        stmt.setInt( 2, obj.getVagas() );
        stmt.setInt( 3, obj.getVagasRestantes() );
        stmt.setString( 4, obj.getHorario_inicio() );
        stmt.setString( 5, obj.getHorario_fim() );
        stmt.setInt( 6, obj.getCodEvento() );
        stmt.setInt( 7, obj.getCodResponsavel() );


        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar(Atividade obj) throws SQLException {

        String sql = "UPDATE pais "
                + "SET "
                + "    nome = ?, "
                + "    sigla = ? "
                + "WHERE"
                + "    id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        //stmt.setString( 1, obj.getNome() );
        stmt.setInt(3, obj.getId());

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir(Atividade obj) throws SQLException {

        String sql = "DELETE FROM pais WHERE id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, obj.getId());

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Atividade> listarTodos() throws SQLException {

        List<Atividade> lista = new ArrayList<Atividade>();
        String sql = "SELECT * FROM atividade;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();



        while (rs.next()) {

            Atividade ativ = new Atividade();
            ativ.setId(rs.getInt("id_atividade"));
            ativ.setDescricao(rs.getString("descricao"));
            ativ.setVagas(rs.getInt("vagas"));
            ativ.setHorario_inicio(rs.getString("horario_inicio"));
            ativ.setHorario_fim(rs.getString("horario_fim"));


            lista.add(ativ);

        }

        rs.close();
        stmt.close();

        return lista;

    }

    //Lista as atividades de um determinado evento
    public List<Atividade> listarPorEvento(int id) throws SQLException {

        List<Atividade> lista = new ArrayList<Atividade>();
        String sql = "SELECT * FROM atividade WHERE es_evento=? ;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();


        while (rs.next()) {

            Atividade ativ = new Atividade();
            ativ.setId(rs.getInt("id_atividade"));
            ativ.setDescricao(rs.getString("descricao"));
            ativ.setVagas(rs.getInt("vagas"));
            ativ.setHorario_inicio(rs.getString("horario_inicio"));
            ativ.setHorario_fim(rs.getString("horario_fim"));


            lista.add(ativ);

        }

        rs.close();
        stmt.close();

        return lista;
    }

    @Override
    public Atividade obterPorId(int id) throws SQLException {

        Atividade ativ = null;
        String sql = "SELECT * FROM atividade WHERE id_atividade = ?;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {

            ativ = new Atividade();
            ativ.setId(rs.getInt("id_atividade"));
            ativ.setDescricao(rs.getString("descricao"));
            ativ.setVagas(rs.getInt("vagas"));
            ativ.setHorario_inicio(rs.getString("horario_inicio"));
            ativ.setHorario_fim(rs.getString("horario_fim"));
            ativ.setCodEvento(rs.getInt("es_evento"));
        }

        rs.close();
        stmt.close();

        return ativ;

    }

    public boolean decrementeVagasRestantes(int id) throws SQLException {
        String sql = "SELECT vagas, vagas_restantes "
                + "FROM atividade "
                + "WHERE id_atividade=?;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, id);

        Atividade ativ = null;
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            ativ = new Atividade();
            ativ.setVagas(rs.getInt("vagas"));
            ativ.setVagasRestantes(rs.getInt("vagas_restantes"));
        }

        if (ativ.getVagasRestantes() > 0) {
            String sql2 = "UPDATE atividade "
                    + "SET vagas_restantes=? "
                    + "WHERE id_atividade=?;";

            PreparedStatement stmt2 = getConnection().prepareStatement(sql2);
            int a2 = ativ.getVagasRestantes() - 1;
            stmt2.setInt(1, a2);
            stmt2.setInt(2, id);
            stmt2.executeUpdate();
            return true;


        } else {
            return false;
        }
    }
    
    //Verifica se ainda existem vagas no evento
    public Boolean existeVagas(int id) throws SQLException {
        
        String sql = "SELECT vagas_restantes "+
                "FROM projetofpz.atividade "+
                "where id_atividade = ? ";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();
        
        if ( rs.next() ) {
            if (rs.getInt( "vagas_restantes" ) > 0){
                return true;
            }
        }
        return false;
    }
    
}
