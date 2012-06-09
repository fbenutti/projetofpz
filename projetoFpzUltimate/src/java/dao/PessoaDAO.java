package dao;

import classes.Pessoa;
import java.sql.PreparedStatement;
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
        String sql = "INSERT INTO pessoa(cpf, nome, email, cep, bairro, cidade,"
                + "complemento, numero, rua, telefone) "
                + "VALUES( ?,?,?,?,?,?,?,?,?,? );";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setString(1, obj.getCpf());
        stmt.setString(2, obj.getNome());
        stmt.setString(3, obj.getEmail());
        stmt.setString(4, obj.getCep());
        stmt.setString(5, obj.getBairro());
        stmt.setString(6, obj.getCidade());
        stmt.setString(7, obj.getComplemento());
        stmt.setInt(8, obj.getNumero());
        stmt.setString(9, obj.getRua());
        stmt.setString(10, obj.getTelefone());


        stmt.executeUpdate();
        stmt.close();
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
