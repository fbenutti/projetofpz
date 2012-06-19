/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Atividade;
import classes.Evento;
import classes.Responsavel;
import dao.AtividadeDAO;
import dao.EventoDAO;
import dao.ResponsavelDAO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Paulo
 */
public class cadastrarAtividade extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int vagas = 40;
        int vagasRestantes = 30;
        //Esse dado testa para ver se o criante realmente é administrador do sistema
        String usuario = request.getParameter("usuario"); //Não vi necessidade de haver mais de um adm por isso o fiz fixo
        String senha = request.getParameter("senha");
        String descricao = request.getParameter("descricao");
        String vagasS = request.getParameter("vagas");
        String vagasRestantesS = request.getParameter("vagas_restantes");
        String horarioInicio = request.getParameter("horario_inicio");
        String horarioFim = request.getParameter("horario_fim");
        int idPalestrante = Integer.parseInt(request.getParameter("palestrante"));
        int idEvento = Integer.parseInt(request.getParameter("evento"));
        
        Atividade atv = new Atividade(descricao, vagas, vagasRestantes, horarioInicio,
                horarioFim, idEvento, idPalestrante);

        AtividadeDAO dao = null;
        try {
            
            dao = new AtividadeDAO();

            //Testa se o usuario e senha estão corretos antes salvar o evento
            if (usuario.equalsIgnoreCase("adm") && senha.equals("123y4567")) {
                dao.salvar(atv);

                //redirecionando pra index se exectar com sucesso
                RequestDispatcher rd = request.getRequestDispatcher("adm.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("tipo", "Exception");
                request.setAttribute("erro", "Usuario e Senha invalidos");
                request.getRequestDispatcher("\\erros\\erro.jsp").forward(request, response);
            }


        } catch (SQLException ex) {
            //redirecionando pra erro se executar erroneamente
            request.setAttribute("tipo", "SQLException");
            request.setAttribute("erro", ex);
            request.getRequestDispatcher("\\erros\\erro.jsp").forward(request, response);
        } catch (Exception ex) {
            //redirecionando pra erro se executar erroneamente
            request.setAttribute("tipo", "Exception");
            request.setAttribute("erro", ex);
            request.getRequestDispatcher("\\erros\\erro.jsp").forward(request, response);

        } finally {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
