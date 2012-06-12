<%-- 
    Document   : cadastroPalestrante
    Created on : 28/04/2012, 17:08:25
    Author     : Paulo
--%>
<script type="text/javascript" src="../js/functions.js"></script>
<script type="text/javascript" src="../jQueryUI/js/jquery.maskedinput-1.2.2.js"></script>
<script type="text/javascript" src="../jQueryUI/js/jquery.validate.min.js"></script>
<script type="text/javascript">
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
        
        // CONFIGURA A VALIDACAO DO FORMULARIO
        $("#cadastroPalestranteDados").validate({
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
                nome: {required: true, minlength: 4},
                email: {required: true, email: true},
                estado: {required: true, maxlength: 2},
                cidade: {required: true}
            },
            messages: {
                nome: {required: 'Informe o nome.', minlength: 'O nome deve ter ao menos 4 letras.'},
                email: {required: 'Informe o e-mail.', email: 'E-mail inválido.'},
                estado: {required: 'O estado deve ser preenchido.', maxlength: 'O estado deve ter duas letras. Ex: "SP"'},
                cidade: {required: 'Informe a cidade.'}
            }
            //,submitHandler:function(form) {
            // alert('ok');
            //}
        });
    });
</script>
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
        <form id="cadastroPalestranteDados" action="../CadastraFoto" method="post" enctype="multipart/form-data">
            <div id="divnome"><label>Nome: <input type="text" name="nome"></label></div>
            <div id="divemail"><label>Email: <input type="text" name="email"></label></div>
            <div id="divestado"><label>Estado: <input type="text" name="estado"></label></div>
            <div id="divcidade"><label>Cidade: <input type="text" name="cidade"></label></div>
            <p><label>Foto: <input type="file" name="file"></label></p>
            <input id="EnviarTexto" class="btn btn-primary" type="submit" value="Enviar"/>
        </form>
    </div>
    <!--<div id="cadastroFoto" >
        <form id="cadastroPalestranteFoto" name="cadastro" action="" method="post" enctype="multipart/form-data">
            <p><label>Foto: <input type="file" name="upFoto"></label></p>
            <p><label><input id="EnviarFoto" class="btn btn-primary" type="button" value="Upload"/></label></p>
        </form>
    </div>-->
</div>
<div class="modal-footer left">
    <div class="erros alert alert-error left" style="display: none;"><span></span></div>
</div>