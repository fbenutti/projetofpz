<%-- 
    Document   : cadastroUser
    Created on : May 10, 2012, 11:49:48 PM
    Author     : Wellington
--%>
<script type="text/javascript" src="../js/functions.js"></script>
<script type="text/javascript" src="../jQueryUI/js/jquery.maskedinput-1.2.2.js"></script>
<script type="text/javascript" src="../jQueryUI/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    jQuery.validator.addMethod("cpf", function(value, element) {
        value = jQuery.trim(value);
	
        value = value.replace('.','');
        value = value.replace('.','');
        cpf = value.replace('-','');
        while(cpf.length < 11) cpf = "0"+ cpf;
        var expReg = /^0+$|^1+$|^2+$|^3+$|^4+$|^5+$|^6+$|^7+$|^8+$|^9+$/;
        var a = [];
        var b = new Number;
        var c = 11;
        for (i=0; i<11; i++){
            a[i] = cpf.charAt(i);
            if (i < 9) b += (a[i] * --c);
        }
        if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }
        b = 0;
        c = 11;
        for (y=0; y<10; y++) b += (a[y] * c--);
        if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }
	
        var retorno = true;
        if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10]) || cpf.match(expReg)) retorno = false;
	
        return this.optional(element) || retorno;

    }, "Informe um CPF válido."); // Mensagem padrão 
    
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
        $("#cpf").mask('999.999.999-99');
        $("#telefone").mask('(99) 9999-9999');
        $("#cep").mask('99999-999');
 
        // CONFIGURA A VALIDACAO DO FORMULARIO
        $("#cadastroUsuario").validate({
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
                confsenha: {required: true},
                cpf: {required: true, cpf: true},
                nome: {required: true, minlength: 4},
                email: {required: true, email: true},
                telefone: {required: true}
                //cep: {required: true},
                //numero: {required: true}
            },
            messages: {
                senha: {required: 'Informe a senha.', minlength: 'A senha deve ter pelo menos 6 caracteres.'},
                confsenha: {required: 'Informe a confirmação de senha.'},
                cpf: {required: 'Informe o CPF.', cpf: 'CPF inválido.'},
                nome: {required: 'Informe o nome.', minlength: 'O nome deve ter ao menos 4 letras.'},
                email: {required: 'Informe o e-mail.', email: 'E-mail inválido.'},
                telefone: {required: 'Informe o telefone.'}
                //cep: {required: 'Informe o CEP'},
                //numero: {required: 'O número deve ser preenchido.'}
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
    <h3>Cadastro de usuários:</h3>
</div>
<div id="cadastros" class="modal-body">
    <form id="cadastroUsuario" name="cadastro" action="CadastraPessoaInstituicao" method="post">
        <p style="margin-left: 40px;"><span class="label">O login será o CPF.</span></p>
        <div id="divsenha"><label>Senha: <input type="password" name="senha" id="senha" title="senha"></label></div>
        <div id="divconfsenha"><label>Confirmar Senha: <input type="password" name="confsenha" id="confsenha" title="confSenha"></label></div>
        <div id="divnome"><label>Nome: <input type="text" name="nome"></label></div>
        <div id="divcpf"><label>CPF: <input type="text" name="cpf" id="cpf"></label></div>
        <div id="divemail"><label>Email: <input type="text" name="email"></label></div>
        <div id="divtelefone"><label>Telefone: <input type="text" name="telefone" id="telefone"></label></div>
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
            <p><label>Estado: <input type="text" name="uf" id="estado" readonly="readonly" title="Estado"></label></p>
        </div>
        <input class="btn btn-primary" type="submit" value="Enviar"/>
    </form>
</div>
<div class="modal-footer left">
        <div class="erros alert alert-error left" style="display: none;"><span></span></div>
</div>