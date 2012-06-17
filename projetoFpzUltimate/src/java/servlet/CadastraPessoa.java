/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Login;
import classes.Pessoa;
import dao.LoginDAO;
import dao.PessoaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Paulo
 */
public class CadastraPessoa extends HttpServlet {

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

        //pegando dados do /formulario/cadastroUser
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String cep = request.getParameter("cep");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String rua = request.getParameter("rua");
        String bairro = request.getParameter("bairro");
        int n = 0;//Integer.parseInt(request.getParameter("numero"));
        String complemento = request.getParameter("complemento");
        String senha = request.getParameter("senha");
        
        
        Login l = new Login(cpf, senha, "p");
        LoginDAO ldao = null;
        
        Pessoa p = new Pessoa(cpf, nome, email, telefone, cep, cidade, uf, rua, bairro, n, complemento);
        PessoaDAO dao = null;


        try {
            
            ldao = new LoginDAO();
            ldao.salvar(l);
            
            dao = new PessoaDAO();
            dao.salvar(p);

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

            if (dao != null) {

                try {
                    dao.fecharConexao();
                } catch (SQLException exc) {
                    System.err.println("Erro ao fechar a conexão!");
                    exc.printStackTrace();
                }

            }
            //request.setAttribute("cpf", p.getCpf());
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
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
