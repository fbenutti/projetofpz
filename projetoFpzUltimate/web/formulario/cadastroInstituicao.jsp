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
    <form id="cadastroInstituição" name="cadastro" action="CadastraInstituicao" method="post">
        <p><label>CNPJ: <input type="text" name="cnpj" /></label></p>
        <p><label>Nome: <input type="text" name="nome" /></label></p>
        <p><label>Email: <input type="text" name="email" /></label></p>
        <p><label>Telefone: <input type="text" name="telefone" /></label></p>
        <label for="cep">CEP:  </label>
        <div class="input-append">
            <input name="cep" id="cep" type="text" class="input-medium cep"><button class="btn concatenado" type="button">Validar</button>
        </div>
        <div id="loading"><img src="bootstrap/img/loader.gif"/></div>
        <div id="erro">Erro ao carregar os dados.</div>
        <div id="endereco" class="hidden">
            <p><label>Rua: <input type="text" name="rua" id="rua" readonly="readonly" title="Rua"></label></p>
            <p><label>Número: <input type="text" name="numero" id="numero" title="Número"></label></p>
            <p><label>Complemento: <input type="text" name="complamento" id="complemento" title="Complemento"></label></p>
            <p><label>Bairro: <input type="text" name="bairro" id="bairro" readonly="readonly" title="Bairro"></label></p>
            <p><label>Cidade: <input type="text" name="cidade" id="cidade" readonly="readonly" title="Cidade"></label></p>
            <p><label>Estado: <input type="text" name="estado" id="estado" readonly="readonly" title="Estado"></label></p>
        </div>
        <input id="EnviarTexto" class="btn btn-primary" type="submit" value="Enviar"/>
    </form>
</div>
<div class="modal-footer">
</div>

