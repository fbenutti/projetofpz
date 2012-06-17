<%-- 
    Document   : index
    Created on : 17/04/2012, 15:57:59
    Author     : Paulo
--%>

<%@page import="classes.Evento"%>
<%@page import="java.util.List"%>
<%@page import="dao.EventoDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
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
        <div class="row">
            <div class="span5">
                <h2 style="text-align: center">Eventos</h2><br /><br />
                <%
                    EventoDAO dao = new EventoDAO();
                    List<Evento> listaEventos = dao.listarTodos();
                %>
                <table class="table">
                    <%
                        for (int c = 0; c < listaEventos.size(); c++) {
                    %>
                    <tr> 
                        <td>
                            <img src="RenderizarImagem?id=<%=listaEventos.get(c).getId()%>" style="float: left;margin-right: 5px;" width="120" height="100"/>
                            <p style=""><%=listaEventos.get(c).getNome()%></p>
                            <a href="atividades.jsp?id=<%=listaEventos.get(c).getId()%>">Faça sua Inscrição</a>
                        </td>
                    </tr>
                    <%                    }
                    %>
                </table>
            </div>
            <div class="span6 well">
                <h3 style="text-align: center;">I SIMPÓSIO DE MEDICINA DA UNIVERSIDADE FEDERAL DE SÃO PAULO FOI UM SUCESSO</h3>
                <br />
                <p class="noticia"><img src="imagens/fotos/medico.jpg" width="220" height="231" style="float: left;margin-right: 5px;"/>
                    Primeiro simpósio de medicina da Universidade Federal de São
                    Paulo foi considerado um sucesso por Eduardo Ferreirado Mendes,
                    reitor da universidade.
                </p>

                <p class="noticia">
                    Com média de publico de 350 pessoas por dia, o evento realmente
                    deu novos ares para os estudantes e interessados na área.
                    Com duração de três dia o simpósio abordou no primeiro dia o
                    assunto da medicina emergêncial. No segundo e terceiro dia
                    foram abordados os assunto de medicina preventiva e da
                    importância de uma boa alimentação e exercícios regulares.
                </p>
                <p class="noticia">
                    O evento também contou com a presença do famoso cardiologista
                    Fernando Pessoa Pires e da Sexóloga Amanda Silveira de Carneiro
                    que compareçeram no ultimo dia do evento.
                </p>
                <hr />
                <h3 style="text-align: center;">CONGRESSO DA FACISC REÚNE EMPRESÁRIOS DE SANTA CATARINA</h3>
                <br />
                <p class="noticia"><img src="imagens/fotos/n2.jpg" width="250" height="230" style="float: left;margin-right: 5px;"/>
                    A Federação das Associações Empresariais de Santa Catarina (Facisc) 
                    promoveu nos dias 27 e 28 de outubro o Congresso Empresarial, 
                    evento que reuniu 15&ordm; encontro estadual de empreender, 17&ordm; 
                    encontro estadual da mulher empresária, 10&ordm; encontro 
                    catarinense do jovem empreendedor e o encontro de presidentes, 
                    diretores, secretários executivos e assessores de comunicação 
                    de ACIs. 
                </p>
                <p class="noticia">
                    A Associação Catarinense de Medicina (ACM) em 
                    Florianópolis recebeu nos dois dias cerca de 600 pessoas entre 
                    empresários e colaboradores das ACis de Santa Catarina, que 
                    debateram sobre temas relacionados ao desenvolvimento do Brasil, 
                    entre eles; Movimento Brasil Eficiente, prêmio de competitividade 
                    para micro e pequenas empresas (MPE Brasil), 
                    além de assuntos relacionados aos núcleos de jovens, 
                    redes sociais e sustentabilidade.
                </p>
            </div>
        </div>
    </div>
    <%@ include file="rodape.jsp" %>
</body>
</html>
