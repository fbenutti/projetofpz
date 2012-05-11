<%-- 
    Document   : Contato
    Created on : 07/05/2012, 02:21:07
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contato</title>
        <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link href="../bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
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
            #titulo{
                margin-left: 30px;
            }
            #logado{
                display: none;
            }
        </style>
        <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="../jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-popover.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-transition.js"></script>
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
        <%@ include file="../cabecalho.jsp" %>
            <!-- Formulário para contato -->
            <div class="container">
                <div class="row">
                    <h3 id="titulo" >Digite os seus dados e sua mensagem de contato!</h3>
                    <div class="span6 well">
                        <form id="formularioContato" name="contato" action="" method="post">
                            <p><label>Nome: <input type="text" name="nome"></label></p>
                            <p><label>Email: <input type="text" name="email"></label></p>
                            <p><label>Mensagem: <textarea name="mensagem"></textarea></label></p>
                            <input id="EnviarTexto" class="btn btn-primary" type="button" 
                            value="Enviar" onclick="alert('Sua mensagem foi enviada com sucesso!')"/>
                        </form>
                    </div>
                </div>
            </div>
        <%@ include file="../rodape.jsp" %>
    </body>
</html>