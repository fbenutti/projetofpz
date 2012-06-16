/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Inscricao;
import classes.Login;
import dao.InscricaoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Wellington
 */
@WebServlet(name = "InscrevePessoa", urlPatterns = {"/InscrevePessoa"})
public class InscrevePessoa extends HttpServlet {

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
        InscricaoDAO dao = null;
        try {
            HttpSession sessao = request.getSession();
            Login l = (Login) sessao.getAttribute("usuario");

            Inscricao i = new Inscricao();
            i.setCpf(l.getLogin());
            i.setCodAtividade(Integer.parseInt(request.getParameter("atividade")));

            try {
                dao = new InscricaoDAO();
                dao.salvar(i);

            } catch (SQLException ex) {
                //redirecionando pra erro se executar erroneamente
                request.setAttribute("tipo", "SQLException");
                request.setAttribute("erro", ex);
                request.getRequestDispatcher("\\erros\\erro.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            //redirecionando pra erro se executar erroneamente
            request.setAttribute("tipo", "Exception");
            request.setAttribute("erro", ex);
            request.getRequestDispatcher("\\erros\\erro.jsp").forward(request, response);
        } finally {
            if (dao != null) {

                try {
                    dao.fecharConexao();
                } catch (SQLException exc) {
                    System.err.println("Erro ao fechar a conexão!");
                    exc.printStackTrace();
                }

            }
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
