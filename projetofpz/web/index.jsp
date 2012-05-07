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
        <style>
            body {
                padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
            }
            #cadastroModal{
                display: none;
            }
            #centralEsquerda{
                width: 49%;
                float: left;
                border-right: solid #666666 thin;
                margin-right: 3px;
                /*border: solid #121212 medium;*/
            }
            #centralDireita{
                width: 49%;
                float: left;
                border-left: solid #666666 thin;
                margin-left: 3px;
                /*border: solid #121212 medium;*/
            }
            .noticia{
                margin-left: 10px;
                text-align: justify;
                text-indent: 24px;
            }
            #loading, #erro{
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
        <script type="text/javascript">
            $(document).ready(function(){
                $('#cadastroModal').modal({
                    keyboard: true,
                    show: false,
                    backdrop: true
                });
                
                //Consulta do CEP
                //Preenche os campos na ação "Blur" (mudar de campo)
                $("#cep").blur(function(){
                    $("#loading").fadeIn("fast");
                    
                    /*$("#endereco").attr("class", "fade in")
                    $("#rua").val("Aguarde...");
                    $("#bairro").val("...");
                    $("#cidade").val("...");
                    $("#uf").val("...");*/

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
        <div id="site" style="min-width: 1000px ; margin: 0 auto" >
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                        <a class="brand" href="#">fpzCongressos</a>
                        <div class="nav-collapse">
                            <ul class="nav">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="formulario/cadastroPalestrante.jsp">Cadastro de Palestrante</a></li>
                                <li><a href="#about">Sobre</a></li>
                                <li><a href="#contact">Contato</a></li>
                            </ul>
                            <div class="btn-group pull-right">
                                <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> Wellington</a>
                                <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="modal" href="#cadastroModal"><i class="icon-pencil"></i> Editar</a></li>
                                    <li><a href="#"><i class="icon-trash"></i> Delete</a></li>
                                    <li><a href="#"><i class="icon-ban-circle"></i> Ban</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="i"></i> Make admin</a></li>
                                </ul>
                            </div>
                        </div><!--/.nav-collapse -->
                        <!--<p class="navbar-text pull-right">Autenticado como <a data-toggle="modal" href="#cadastroModal">Wellington</a></p>-->
                    </div>
                </div>
            </div>
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
                        <a href="#">
                            <img src="imagens/banners/bannerIVEngMec.png" />
                        </a>
                        <br /><br /><br />
                        <img src="imagens/banners/bannerPalestraMonografia.png" />
                    </div>
                    <div class="span6 well">
                        <h3 style="text-align: center;">I SIMPÓSIO DE MEDICINA DA UNIVERSIDADE FEDERAL DE SÃO PAULO FOI UM SUCESSO</h3>
                        <br />
                        <p class="noticia"><img src="imagens/fotos/medico.jpg" style="float: left;margin-right: 5px;">
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
            <div id="rodape">
                | Desevolvido por FPZ Software Solutions &COPY; Todos os direitos reservados |
            </div>
        </div>
    </body>
</html>