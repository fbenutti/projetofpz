/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Instituicao;
import classes.Login;
import dao.InstituicaoDAO;
import dao.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Wellington
 */
@WebServlet(name = "CadastraInstituicao", urlPatterns = {"/CadastraInstituicao"})
public class CadastraInstituicao extends HttpServlet {

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
        try {
            Instituicao inst = new Instituicao();

            inst.setCnpj(request.getParameter("cnpj"));
            inst.setNome(request.getParameter("nome"));
            inst.setEmail(request.getParameter("email"));
            inst.setTelefone("telefone");
            inst.setCep("cep");
            inst.setRua(request.getParameter("rua"));
            inst.setNumero(Integer.parseInt(request.getParameter("numero")));
            inst.setComplemento(request.getParameter("complemento"));
            inst.setBairro("bairro");
            inst.setUf(request.getParameter("estado"));
            inst.setCidade(request.getParameter("cidade"));

            InstituicaoDAO instDao = null;

            try {
                instDao = new InstituicaoDAO();
                instDao.salvar(inst);
                out.println("Instituição cadastrada com sucesso!!");
            } catch (SQLException ex) {
                out.println(ex);
                Logger.getLogger(CadastraInstituicao.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            out.close();
        }

        try {
            Login login = new Login();

            login.setLogin(request.getParameter("cnpj"));
            login.setSenha(request.getParameter("senha"));
            login.setTipo("I");
            

            LoginDAO loginDao = null;

            try {
                loginDao = new LoginDAO();
                loginDao.salvar(login);
                out.println("Login cadastrado com sucesso!!");
            } catch (SQLException ex) {
                out.println(ex);
                Logger.getLogger(CadastraInstituicao.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            out.close();
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
