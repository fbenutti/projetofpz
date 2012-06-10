<%-- 
    Document   : cadastroInstituicao
    Created on : 12/05/2012, 17:35:25
    Author     : Paulo
--%>
<script type="text/javascript" src="../js/functions.js"></script>
<script type="text/javascript" src="../jQueryUI/js/jquery.maskedinput-1.2.2.js"></script>
<script type="text/javascript" src="../jQueryUI/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    jQuery.validator.addMethod("cnpj", function(cnpj, element) {
        cnpj = jQuery.trim(cnpj);// retira espaços em branco
        // DEIXA APENAS OS NÚMEROS
        cnpj = cnpj.replace('/','');
        cnpj = cnpj.replace('.','');
        cnpj = cnpj.replace('.','');
        cnpj = cnpj.replace('-','');
 
        var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
        digitos_iguais = 1;
 
        if (cnpj.length < 14 && cnpj.length < 15){
            return false;
        }
        for (i = 0; i < cnpj.length - 1; i++){
            if (cnpj.charAt(i) != cnpj.charAt(i + 1)){
                digitos_iguais = 0;
                break;
            }
        }
 
        if (!digitos_iguais){
            tamanho = cnpj.length - 2
            numeros = cnpj.substring(0,tamanho);
            digitos = cnpj.substring(tamanho);
            soma = 0;
            pos = tamanho - 7;
 
            for (i = tamanho; i >= 1; i--){
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2){
                    pos = 9;
                }
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(0)){
                return false;
            }
            tamanho = tamanho + 1;
            numeros = cnpj.substring(0,tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--){
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2){
                    pos = 9;
                }
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(1)){
                return false;
            }
            return true;
        }else{
            return false;
        }
    }, "Informe um CNPJ válido."); // Mensagem padrão 
    
    $.validator.setDefaults({
        //submitHandler: function() { alert("submitted!"); },
        highlight: function(input) {
            $("#div"+input.name).addClass("control-group error");
        },
        unhighlight: function(input) {
            $("#div"+input.name).removeClass("control-group error");
        }
    });
 
 
 
    // Escopo para o conteúdo ser executado quando o documento estiver pronto
    $(document).ready(function(){
        
        //Máscaras
        $("#cnpj").mask('99.999.999/9999-99');
        $("#telefone").mask('(99) 9999-9999');
        $("#cep").mask('99999-999');
 
        // CONFIGURA A VALIDACAO DO FORMULARIO
        $("#cadastroInstituição").validate({
            invalidHandler: function(e, validator) {
                var errors = validator.numberOfInvalids();
                if (errors) {
                    var message = errors == 1
                        ? 'Você não preencheu corretamente 1 campo. Ele está destacado acima.'
                    : 'Você não preencheu corretamente ' + errors + ' campos.  Eles estão destacados acima.';
                    $("div.erros span").html(message);
                    $("div.erros").show();
                } else {
                    $("div.erros").hide();
                }
            },
            onkeyup: false,
            rules: {
                senha: {required: true, minlength: 6},
                //confsenha: {equalTo: "#senha"},
                cnpj: {required: true, cnpj: true},
                nome: {required: true, minlength: 4},
                email: {required: true, email: true},
                telefone: {required: true},
                cep: {required: true},
                numero: {required: true}
            },
            messages: {
                senha: {required: 'Informe a senha.', minlength: 'A senha deve ter pelo menos 6 caracteres.'},
                //confsenha: {equalTo: 'A confirmação de senha deve ser igual a senha.'},
                cnpj: {required: 'Informe o CNPJ.', cnpj: 'CNPJ inválido.'},
                nome: {required: 'Informe o nome.', minlength: 'O nome deve ter ao menos 4 letras.'},
                email: {required: 'Informe o e-mail.', email: 'E-mail inválido.'},
                telefone: {required: 'Informe o telefone.'},
                cep: {required: 'Informe o CEP'},
                numero: {required: 'O número deve ser preenchido.'}
            }
            //,submitHandler:function(form) {
            // alert('ok');
            //}
        });
 
        //$('#result').html('jQuery Validate com novos métodos: cpf, cnpj, dateBR e dateTimeBR');
    });

</script>
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
        <p style="margin-left: 40px;"><span class="label">Seu login será o CNPJ.</span></p>
        <div id="divsenha"><label>Senha: <input type="password" name="senha" id="senha" /></label></div>
        <div id="divconfsenha"><label>Confirmação de senha: <input type="password" name="confsenha" id="confsenha" /></label></div>
        <div id="divcnpj"><label>CNPJ: <input type="text" name="cnpj" id="cnpj"/></label></div>
        <div id="divnome"><label>Nome: <input type="text" name="nome" /></label></div>
        <div id="divemail"><label>Email: <input type="text" name="email" /></label></div>
        <div id="divtelefone"><label>Telefone: <input type="text" name="telefone" id="telefone"/></label></div>
        <div id="divcep">
            <label for="cep">CEP:  </label>
            <div class="input-append">
                <input name="cep" id="cep" type="text" class="input-medium cep"><button class="btn concatenado" type="button">Validar</button>
            </div>
        </div>
        <div id="loading"><img src="bootstrap/img/loader.gif"/></div>
        <div id="erro">Erro ao carregar os dados.</div>
        <div id="endereco" class="hidden">
            <p><label>Rua: <input type="text" name="rua" id="rua" readonly="readonly" title="Rua"></label></p>
            <div id="divnumero"><label>Número: <input type="text" name="numero" id="numero" title="Número"></label></div>
            <div id="divcomplemento"><label>Complemento: <input type="text" name="complemento" id="complemento" title="Complemento"></label></div>
            <p><label>Bairro: <input type="text" name="bairro" id="bairro" readonly="readonly" title="Bairro"></label></p>
            <p><label>Cidade: <input type="text" name="cidade" id="cidade" readonly="readonly" title="Cidade"></label></p>
            <p><label>Estado: <input type="text" name="estado" id="estado" readonly="readonly" title="Estado"></label></p>
        </div>
        <input id="EnviarTexto" class="btn btn-primary" type="submit" value="Enviar"/>
</div>
</form>
</div>
<div class="modal-footer left">
    <div class="erros alert alert-error left" style="display: none;"><span></span></div>
</div>

