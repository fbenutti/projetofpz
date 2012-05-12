<%-- 
    Document   : tipoCadastro
    Created on : May 10, 2012, 11:53:02 PM
    Author     : Wellington
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-transition.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                //Carrega a página de cadastro de usuário
                $("#cadastroUser").click(function(){
                    $('#conteudo').modal({
                        keyboard: true,
                        show: false,
                        backdrop: true
                    });
                    $('#conteudo').load('formulario/cadastroUser.jsp');
                });
            });
            
                       $(document).ready(function(){
                //Carrega a página de cadastro de usuário
                $("#cadastroPalestrante").click(function(){
                    $('#conteudo').modal({
                        keyboard: true,
                        show: false,
                        backdrop: true
                    });
                    $('#conteudo').load('formulario/cadastroPalestrante.jsp');
                });
            });
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="conteudo">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">&times;</a>
                <h3>Selecione o tipo de cadastro:</h3>
            </div>
            <div class="modal-body">
                <p><a data-toggle="modal" id="cadastroPalestrante" href="#cadastroPalestrante">Palestrante</a></p>
                <p><a href="#">Instituição</a></p>
                <p><a data-toggle="modal" id="cadastroUser" href="#cadastroUser">Usuário</a></p>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </body>
</html>
