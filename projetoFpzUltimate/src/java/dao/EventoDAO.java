/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Evento;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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
public class EventoDAO extends DAO<Evento> {

    public EventoDAO() throws SQLException {
        super();
    }

    private String getArquivoPorBufferI(BufferedImage b, String tipo) {
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
    public void salvar(Evento obj) throws SQLException {
        String sql = "INSERT INTO evento(nome, dt_inicio, dt_fim, logo ) "
                + "VALUES( ?,?,?,Load_File(?));";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setString(1, obj.getNome());
        stmt.setString(2, obj.getPeriodoInicial());
        stmt.setString(3, obj.getPeriodoFinal());
        stmt.setString(4, getArquivoPorBufferI(obj.getFoto(), "jpg"));

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar(Evento obj) throws SQLException {

        String sql = "UPDATE pais "
                + "SET "
                + "    nome = ?, "
                + "    sigla = ? "
                + "WHERE"
                + "    id = ?;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setString(1, obj.getNome());
        stmt.setInt(3, obj.getId());

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir(Evento obj) throws SQLException {

        String sql = "DELETE FROM evento WHERE id_evento = ?;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, obj.getId());

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Evento> listarTodos() throws SQLException{

        List<Evento> lista = new ArrayList<Evento>();
        String sql = "SELECT * FROM evento;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {

            Evento ev = new Evento();
            ev.setId(rs.getInt("id_evento"));
            ev.setNome(rs.getString("nome"));
            ev.setPeriodoInicial(rs.getString("dt_inicio"));
            ev.setPeriodoFinal(rs.getString("dt_fim"));
            try {
                ev.setFoto(RetornaLogo(ev.getId()));
            } catch (IOException ex) {
                Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }


            lista.add(ev);

        }

        rs.close();
        stmt.close();

        return lista;

    }

    public BufferedImage RetornaLogo(int id) throws IOException, SQLException {
        BufferedImage logo;
        File f;
        f = File.createTempFile("foto", "jpg");

        String sql = "SELECT logo INTO DUMPFILE ? FROM evento WHERE id_evento = ?";
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

    @Override
    public Evento obterPorId(int id) throws SQLException {

        Evento e = null;
        String sql = "SELECT * FROM evento WHERE id_evento = ?;";

        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {

            
             e = new Evento();
             e.setId( rs.getInt( "id_evento" ) );
             e.setNome( rs.getString( "nome" ) );
             e.setPeriodoInicial("dt_inicio");
             e.setPeriodoFinal("dt_fim");
            try {
                e.setFoto(RetornaLogo(e.getId()));
            } catch (IOException ex) {
                Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
             
        }

        rs.close();
        stmt.close();

        return e;

    }
}
