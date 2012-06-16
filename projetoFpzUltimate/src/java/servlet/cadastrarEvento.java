/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Evento;
import classes.Responsavel;
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
public class cadastrarEvento extends HttpServlet {

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

        //Esse dado testa para ver se o criante realmente é administrador do sistema
        String usuario = ""; //Não vi necessidade de haver mais de um adm por isso o fiz fixo
        String senha = "";
        Evento e = new Evento();

        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (!isMultipart) {
                out.println("Arquivo não enviado");
                //JOptionPane.showMessageDialog(null, "Arquivo não enviado");
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                List items = upload.parseRequest(request);
                Iterator itr = items.iterator();

                while (itr.hasNext()) {
                    int i = 0;

                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        // é um item de formulário
                        String name = item.getFieldName();
                        String value = item.getString();

                        if (name.equals("usuario")) {
                            usuario = value;
                        } else if (name.equals("senha")) {
                            senha = value;
                        } else if (name.equals("evento")) {
                            e.setNome(value);
                        } else if (name.equals("dtInic")) {
                            e.setPeriodoInicial(value);
                        } else if (name.equals("dtFim")) {
                            e.setPeriodoFinal(value);
                        }

                        // aqui vc vai fazer os ifs testando os name                              
                    } else {
                        // aqui vem a sua imagem
                        InputStream imageStream = item.getInputStream();
                        BufferedImage imageBuffer = ImageIO.read(imageStream);
                        e.setFoto(imageBuffer);
                    }
                    i++;
                }

                //Testa se o usuario e senha estão corretos antes salvar o evento
                if (usuario.equalsIgnoreCase("adm") && senha.equals("123y4567")) {
                    new EventoDAO().salvar(e);
                    
                    //redirecionando pra index se exectar com sucesso
                    RequestDispatcher rd = request.getRequestDispatcher("adm.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("tipo", "Exception");
                    request.setAttribute("erro", "Usuario e Senha invalidos");
                    request.getRequestDispatcher("\\erros\\erro.jsp").forward(request, response);
                }


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
