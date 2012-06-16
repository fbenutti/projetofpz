<%-- 
    Document   : getImage
    Created on : 03/10/2011, 16:18:38
    Author     : paulo
--%>

<%@ page contentType="image/jpeg; chaoResult=iso-8859-1"
         language="java" import="java.sql.*,java.io.*,java.util.*"
         errorPage="" %>
<%

    Statement oStmt;
    ResultSet oResult;
    String strPhotoId;
    String strSql;

    try {
        strPhotoId = (String) request.getParameter("id");
        strSql = "select image from pictures" + ((strPhotoId == null) ? 
            " where id = '1'" : (" where id = '" + strPhotoId + "'"));


        Connection connection = null;
        String connectionURL = "jdbc:mysql://localhost:3306/imagem";
        PreparedStatement psmnt = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        connection = DriverManager.getConnection(connectionURL, "root", "root");
        response.setContentType("image/jpeg");

        oStmt = connection.createStatement();

        oResult = oStmt.executeQuery(strSql);
        oResult.next();

        byte[] bytearray = new byte[4096];
        int size = 0;
        InputStream sImage;
        sImage = oResult.getBinaryStream(1);
        
        /* monta  a resposta ao navegador com a imagem */
        
        response.reset();
            response.setContentType("image/jpeg");
            response.addHeader("Content-Disposition", "filename=getimage.jpeg");
            while ((size = sImage.read(bytearray)) != -1) {
%>
<%
    out.println("<html>\n<body>\n");
    out.println("<img src=");%>
            
<% response.getOutputStream().write(bytearray, 0, size);
    response.flushBuffer();
    sImage.close();
    connection.close();

%>
<%  out.println("</img>\n</body>\n");
    out.println("</html");%>

<%}


    } catch (SQLException ex) {
        ex.getMessage();
    }
%> 
