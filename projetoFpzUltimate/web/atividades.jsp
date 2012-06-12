<%-- 
    Document   : index
    Created on : 11/06/2012, 20:46:23
    Author     : Wellington
--%>

<%@page import="classes.Atividade"%>
<%@page import="java.util.List"%>
<%@page import="dao.AtividadeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link href="bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link href="bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
        <link href="css/layout.css" type="text/css" rel="stylesheet"/>
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-transition.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-collapse.js"></script>
        <script type="text/javascript" src="js/functions.js"></script>
    </head>
    <body>
        <%-- Include do cabeçalho (menu superior) --%>
        <%@ include file="cabecalho.jsp" %>
        <div class="container">
            <%
                AtividadeDAO dao = new AtividadeDAO();
                List<Atividade> atividades = dao.listarTodos();
            %>
            <form method="post" action="InscreveUsuario">
            <table>
                <%
                    for (int c=0; c < atividades.size(); c++) {
                %>
                <tr> 
                    <td><input type="checkbox" name="atividade" id="atividade" value="<%=atividades.get(c).getId() %>"/></td>
                    <td><%=atividades.get(c).getDescricao() %></td> 
                    <td><%=atividades.get(c).getVagas() %></td> 
                    <td><%=atividades.get(c).getHorario_inicio() %></td> 
                    <td><%=atividades.get(c).getHorario_fim() %></td> 
                </tr> 
                <%                    }
                %>
            </table>
            <input type="hidden" name="cpf" id="cpf" value="${cpf}"/>
            <input type="submit" value="Enviar"/>
            </form>
        </div>
        <%@ include file="rodape.jsp" %>
    </body>
</html>
