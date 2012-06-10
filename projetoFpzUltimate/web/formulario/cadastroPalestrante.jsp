<%-- 
    Document   : cadastroPalestrante
    Created on : 28/04/2012, 17:08:25
    Author     : Paulo
--%>
<script type="text/javascript" src="../js/functions.js"></script>
<div class="modal-header">
    <a class="close" data-dismiss="modal">&times;</a>
    <h3>Cadastro de palestrantes:</h3>
</div>
<div id="cadastros" class="modal-body">
    <div id="cadastroTex">
        <ul class="nav nav-tabs">
            <li><a id="cadastroUser" href="#">Usuário</a></li>
            <li><a id="cadastroInstituicao" href="#">Instituição</a></li>
            <li class="active"><a id="cadastroPalestrante" href="#">Palestrante</a></li>
        </ul>
        <form id="cadastroPalestranteDados" name="cadastro" action="CadastraResponsavel" method="post">
            <p><label>Nome: <input type="text" name="nome"></label></p>
            <p><label>Email: <input type="text" name="email"></label></p>
            <p><label>Estado: <input type="text" name="estado"></label></p>
            <p><label>Cidade: <input type="text" name="cidade"></label></p>
            <input id="EnviarTexto" class="btn btn-primary" type="submit" value="Enviar"/>
        </form>
    </div>
    <div id="cadastroFoto" >
        <form id="cadastroPalestranteFoto" name="cadastro" action="" method="post">
            <p><label>Foto: <input type="file" name="upFoto"></label></p>
            <p><label><input id="EnviarFoto" class="btn btn-primary" type="button" value="Upload"/></label></p>
        </form>
    </div>
</div>
<div class="modal-footer">
</div>