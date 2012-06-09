<%-- 
    Document   : cadastroInstituicao
    Created on : 12/05/2012, 17:35:25
    Author     : Paulo
--%>
<script type="text/javascript" src="../js/functions.js"></script>
<div class="modal-header">
    <a class="close" data-dismiss="modal">&times;</a>
    <h3>Cadastro institucional:</h3>
</div>
<div id="cadastros" class="modal-body">
    <ul class="nav nav-tabs">
        <li><a id="cadastroUser" href="#">Usuário</a></li>
        <li class="active"><a id="cadastroInstituicao" href="#">Instituição</a></li>
        <li><a id="cadastroPalestrante" href="#">Palestrante</a></li>
    </ul>
    <form id="cadastroInstituição" name="cadastro" action="" method="post">
        <p><label>Nome: <input type="text" name="nome" /></label></p>
        <p><label>Email: <input type="text" name="email" /></label></p>
        <p><label>Estado: <input type="text" name="estado" /></label></p>
        <p><label>Cidade: <input type="text" name="cidade" /></label></p>
        <p><label>Telefone: <input type="text" name="telefone"/></label></p>
        <input id="EnviarTexto" class="btn btn-primary" type="button" value="Enviar"/>
    </form>
</div>
<div class="modal-footer">
</div>

