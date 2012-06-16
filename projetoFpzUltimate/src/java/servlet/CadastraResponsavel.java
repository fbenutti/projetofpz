/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Responsavel;
import dao.ResponsavelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Felipe
 */
public class CadastraResponsavel extends HttpServlet {

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
        
        //pegando dados do /formulario/cadastroPalestrante
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("estado");


        Responsavel r = new Responsavel(nome, email, cidade, uf);
        ResponsavelDAO dao = null;


        try {

            dao = new ResponsavelDAO();
            dao.salvar(r);

            int id;
            id = dao.obterIdPorDados(nome, email, cidade, uf);
            JOptionPane.showMessageDialog(null, "id: " + id);
            out.println("id: " + id);
            
        } catch (SQLException exc) {

            exc.printStackTrace();

        } finally {
            
            if (dao != null) {

                try {
                    dao.fecharConexao();
                } catch (SQLException exc) {
                    System.err.println("Erro ao fechar a conexão!");
                    exc.printStackTrace();
                }

            }
        
        out.println("<script type=\"text/javascript\">alert(\"Cadastro Inserido com Sucesso!!\")</script>");
        request.setAttribute("id", r.getId());
        request.setAttribute("nome", r.getNome());
        request.setAttribute("obj", r);
        request.getRequestDispatcher("\\formulario\\cadastraFoto.jsp").forward(request, response);
        //response.sendRedirect("\\formulario\\cadastraFoto.jsp");
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
