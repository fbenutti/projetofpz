<%-- 
    Document   : minhasInscricoes
    Created on : 17/06/2012, 17:13:13
    Author     : Wellington
--%>

<%@page import="classes.Atividade"%>
<%@page import="dao.AtividadeDAO"%>
<%@page import="classes.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="dao.InscricaoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas inscrições</title>
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
        <script type="text/javascript" src="bootstrap/js/bootstrap-button.js"></script>
        <script type="text/javascript" src="js/functions.js"></script>
    </head>
    <body>
        <%-- Include do cabeçalho (menu superior) --%>
        <%@ include file="cabecalho.jsp" %>
        <div class="container">
            <%
                InscricaoDAO dao = new InscricaoDAO();
                Login l = (Login) session.getAttribute("usuario");
                List<Inscricao> insc = dao.listarPorUsuario(l.getLogin());
            %>
            <table class="table">
                <tr>
                    <td>Atividade:</td>
                    <td>Hora de início:</td>
                    <td>Hora de término:</td>
                </tr>
                <%
                    for (int c = 0; c < insc.size(); c++) {
                        AtividadeDAO ativDao = new AtividadeDAO();
                        Atividade ativ = ativDao.obterPorId(insc.get(c).getCodAtividade());
                %>
                <tr> 
                    <td><%=ativ.getDescricao()%></td> 
                    <td><%=ativ.getHorario_inicio()%></td> 
                    <td><%=ativ.getHorario_fim()%></td> 
                </tr> 
                <%                    }
                %>
            </table>
        </div>
        <%@ include file="rodape.jsp" %>
    </body>
</html>
