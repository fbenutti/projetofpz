/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
                
     //Carrega a página de cadastro de usuário
    $("#cadastroUser").click(function(){
        $('#conteudo').load('formulario/cadastroUser.jsp');
    });
    
    //Carrega a página de cadastro de palestrante
    $("#cadastroPalestrante").click(function(){
        $('#conteudo').load('formulario/cadastroPalestrante.jsp');
    });
    
    //Carrega a página de cadastro de instituição
    $("#cadastroInstituicao").click(function(){
        $('#conteudo').load('formulario/cadastroInstituicao.jsp');
    });
    
    //Carrega a página de tipos de cadastro
    $("#cadastro").click(function(){
        $('#resultado').modal({
            keyboard: true,
            show: false,
            backdrop: true
        });
        $('#resultado').load('tipoCadastro.jsp');
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
    $(".cep").blur(function(){
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
