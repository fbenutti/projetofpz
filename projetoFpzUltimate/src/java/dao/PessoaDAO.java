package dao;

import classes.Pessoa;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Paulo
 */
public class PessoaDAO extends DAO<Pessoa> {
        public PessoaDAO() throws SQLException {
        super();
    }

    @Override
    public void salvar(Pessoa obj) throws SQLException {
        String sql = "INSERT INTO Pessoa()";
    }

    @Override
    public void atualizar(Pessoa obj) throws SQLException {
       
    }

    @Override
    public void excluir(Pessoa obj) throws SQLException {
        
    }

    @Override
    public List<Pessoa> listarTodos() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Pessoa obterPorId(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
