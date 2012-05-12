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
        <link href="bootstrap/css/docs.css" type="text/css" rel="stylesheet" />
        <style>
            body {
                padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
            }
            #loading, #erro, #cadastroModal, #logado{
                display: none;
            }
        </style>
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-popover.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-transition.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-collapse.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#cadastroModal').modal({
                    keyboard: true,
                    show: false,
                    backdrop: true
                });

                //Login fake
                $('#logar').click(function(){
                    $('#deslogado').hide();
                    $('#logado').fadeIn("slow");
                });
                $('#deslogar').click(function(){
                    $('#logado').hide();
                    $('#deslogado').fadeIn("slow");
                });

                //Consulta do CEP
                //Preenche os campos na ação "Blur" (mudar de campo)
                $("#cep").blur(function(){
                    $("#loading").fadeIn("fast");

                    // seta a variavel requisitada no campo cep
                    consulta = $("#cep").val();

                    //Realiza a consulta
                    $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+consulta, function(){

                        //unescape - Decodifica uma string codificada com o método escape.
                        rua=unescape(resultadoCEP.tipo_logradouro) +" "+ unescape(resultadoCEP.logradouro);
                        bairro=unescape(resultadoCEP.bairro);
                        cidade=unescape(resultadoCEP.cidade);
                        uf=unescape(resultadoCEP.uf);
                        resultado=unescape(resultadoCEP.resultado);

                        // preenche os campos
                        if (resultado == 1){
                            $("#erro").fadeOut("fast");
                            $("#rua").val(rua);
                            $("#bairro").val(bairro);
                            $("#cidade").val(cidade);
                            $("#estado").val(uf);
                            $("#loading").fadeOut("fast");
                            $("#endereco").attr("class", "fade in");
                            $("#endereco").fadeIn("fast");
                            $("#numero").focus();
                        } else{
                            $("#endereco").fadeOut("fast");
                            $("#loading").fadeOut("fast");
                            $("#erro").fadeIn("fast");
                            $("#cep").val('');
                        }

                    });
                });
            });
        </script>
    </head>
    <body>
        <%-- Include do cabeçalho (menu superior) --%>
        <%@ include file="cabecalho.jsp" %>
        <div class="modal hide fade in" id="cadastroModal">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">&times;</a>
                <h3>Atualização cadastral</h3>
            </div>
            <div class="modal-body">
                <form id="cadastroUsuario" name="cadastro" action="" method="post">
                    <p><label>Nome: <input type="text" name="nome"></label></p>
                    <p><label>CPF: <input type="text" name="cpf"></label></p>
                    <p><label>Email: <input type="text" name="email"></label></p>
                    <label>CEP:  </label>
                    <p class="input-append">
                        <input name="cep" id="cep" size="10" type="text" class="input-medium span2"><button class="btn" type="button">Validar</button>
                    </p>
                    <div id="loading"><img src="bootstrap/img/loader.gif"/></div>
                    <div id="erro">Erro ao carregar os dados.</div>
                    <div id="endereco" class="hidden">
                        <p><label>Rua: <input type="text" name="rua" id="rua" disabled="" title="Rua"></label></p>
                        <p><label>Número: <input type="text" name="numero" id="numero" title="Número"></label></p>
                        <p><label>Bairro: <input type="text" name="bairro" id="bairro" disabled="" title="Bairro"></label></p>
                        <p><label>Cidade: <input type="text" name="cidade" id="cidade" disabled="" title="Cidade"></label></p>
                        <p><label>Estado: <input type="text" name="estado" id="estado" disabled="" title="Estado"></label></p>
                    </div>

                    <input class="btn btn-primary" type="button" value="Enviar"/>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
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