/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paulo
 */
public class CadastraFoto extends HttpServlet {

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
//        Connection con = null;
//        ResultSet rs = null;
//        PreparedStatement psmt = null;
//        FileInputStream fis;


            String contentType = request.getContentType();


            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {


                /*
                 * recupera o fluxo de bytes enviados nos pacotes http
                 */
                DataInputStream in = new DataInputStream(request.getInputStream());

                /*
                 * detecta a quantidade de bytes recebidas na solicitação
                 */
                int formDataLength = request.getContentLength();

                /*
                 * cria um array de bytes com os dados recebidos no servidor
                 */
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;

                /**
                 * Realiza a leitura do fluxo de bytes e armazena os bytes da
                 * imagem e os códigos de controle na variável dataBytes *
                 */
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }


                /*
                 * atribui a variável file o conteúdo recebido através do upload
                 * da imagem
                 */
                String file = new String(dataBytes);

                /*
                 * extrai do controle de dados o nome do arquivo
                 */
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));

                /*
                 * extrai o código de marcação de final de arquivo
                 */
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                int pos;

                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;


                int boundaryLocation = file.indexOf(boundary, pos);

                /*
                 * detecta a posição inicial onde inicia a imagem e o final da
                 * imagem
                 */
                int startPos = ((file.substring(0, pos))).length();
                int endPos = totalBytesRead - (boundary.length() - 8);

                /*
                 * escreve no servidor o arquivo que foi feito upload
                 */
                FileOutputStream fileOut = new FileOutputStream(saveFile);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
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
