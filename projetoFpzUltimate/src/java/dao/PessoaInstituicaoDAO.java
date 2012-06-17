package dao;

import classes.PessoaInstituicao;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Zanelli
 */
public class PessoaInstituicaoDAO extends DAO<PessoaInstituicao> {

    public PessoaInstituicaoDAO() throws SQLException {
        super();
    }

    @Override
    public void salvar(PessoaInstituicao obj) throws SQLException {
        String sql = "INSERT INTO pessoa_instituicao(es_cpf, es_cnpj) "
                + "VALUES( ?,? );";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setString(1, obj.getCpf());
        stmt.setString(2, obj.getCnpj());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void atualizar(PessoaInstituicao obj) throws SQLException {
    }

    @Override
    public void excluir(PessoaInstituicao obj) throws SQLException {
    }

    @Override
    public List<PessoaInstituicao> listarTodos() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public PessoaInstituicao obterPorId(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
