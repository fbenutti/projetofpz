<%--
    Document   : index
    Created on : Apr 17, 2012, 6:21:47 PM
    Author     : Wellington
--%>

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
        <!-- Cadastro de palestrantes fornecido pelo Paulo -->
        <div class="container">
            <div class="row">
                <div class="span5">
                    <h2 style="text-align: center">Eventos</h2><br /><br />
                    <table class="table">
                        <tr>
                            <td>
                                <img src="imagens/banners/bannerIVEngMecMin.png" style="float: left;margin-right: 5px;" />
                                <p style="">IV Congresso dos Engenheiros Mecânicos</p>
                                <a href="#">Faça sua Inscrição</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="imagens/banners/bannerPalestraMonografiaMin.png" style="float: left;margin-right: 5px;" />
                                <p style="">Palestra: Técnicas Modernas para Desenvolvimento de
                                Monografias e Textos Científicos</p>
                                <a href="#">Faça sua Inscrição</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="span6 well">
                    <h3 style="text-align: center;">I SIMPÓSIO DE MEDICINA DA UNIVERSIDADE FEDERAL DE SÃO PAULO FOI UM SUCESSO</h3>
                    <br />
                    <p class="noticia"><img src="imagens/fotos/medico.jpg" style="float: left;margin-right: 5px;"/>
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
                        Fernando Pessoa Pires e da Sexóloga Amanda Silveira de Carneiro.
                    </p>
                </div>
            </div>
        </div>
        <%@ include file="rodape.jsp" %>
    </body>
</html>
