/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Responsavel;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

/**
 *
 * @author Felipe
 */
public class ResponsavelDAO extends DAO<Responsavel> {
    
    public ResponsavelDAO() throws SQLException {
        super();
    }
    
    
    private String getArquivoPorBufferI(BufferedImage b, String tipo){
        File f;
        try {
            f = File.createTempFile("foto", tipo);
            ImageIO.write(b, tipo, f);
            return f.getAbsolutePath();
        } catch (IOException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
        
    }
    @Override
    public void salvar( Responsavel obj ) throws SQLException {

        String sql = "INSERT INTO responsavel(nome, email, cidade, uf, foto ) "
                + "VALUES( ?,?,?,?,Load_File(?));";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, obj.getNome() );
        stmt.setString( 2, obj.getEmail() );
        stmt.setString( 3, obj.getCidade() );
        stmt.setString( 4, obj.getUF() );
        stmt.setString( 5, getArquivoPorBufferI(obj.getFoto(), "jpg"));
        
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
        String sql = "SELECT * FROM responsavel;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Responsavel resp = new Responsavel();
            resp.setId( rs.getInt( "id_responsavel" ) );
            resp.setNome( rs.getString( "nome" ) );
            resp.setEmail(rs.getString("email"));
            resp.setCidade(rs.getString("cidade"));
            resp.setUF(rs.getString("uf"));
            try {
                resp.setFoto(RetornaLogo(resp.getId()));
            } catch (IOException ex) {
                Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

            lista.add( resp );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Responsavel obterPorId( int id ) throws SQLException {

        Responsavel resp = null;
        String sql = "SELECT * FROM responsavel WHERE id_responsavel = ?;";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            resp = new Responsavel();
            resp.setId( rs.getInt( "id_responsavel" ) );
            resp.setNome( rs.getString( "nome" ) );
            resp.setEmail(rs.getString("email"));
            resp.setCidade(rs.getString("cidade"));
            resp.setUF(rs.getString("uf"));
            try {
                resp.setFoto(RetornaLogo(resp.getId()));
            } catch (IOException ex) {
                Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        rs.close();
        stmt.close();

        return resp;

    }
    public int obterIdPorDados( String nome, String email, String cidade, String uf ) throws SQLException {

        int id;
        String sql = "SELECT id_responsavel FROM responsavel WHERE nome = '?'"
                + " and email = '?' and cidade = '?' and uf = '?';";

        PreparedStatement stmt = getConnection().prepareStatement( sql );
        stmt.setString( 1, nome );
        stmt.setString( 2, email );
        stmt.setString( 3, cidade );
        stmt.setString( 4, uf );
        ResultSet rs = stmt.executeQuery();
        
        id = rs.getInt( "id_responsavel" );

        rs.close();
        stmt.close();
        
        return id;

    }

    public BufferedImage RetornaLogo(int id) throws IOException, SQLException {
        //BufferedImage logo;
        File f;
        f = File.createTempFile("foto", "jpg");

        String sql = "SELECT foto INTO DUMPFILE ? FROM responsavel WHERE id_responsavel = ?";
        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setString(1, f.getAbsolutePath());
        stmt.setInt(2,id);
        f.delete();
        stmt.executeQuery(); 
       
        
        BufferedImage bi = ImageIO.read(f);
        
        stmt.close();
        f.delete();

        return bi;
    }
    
}

