(function (win, doc){
    function check_passwd(passwd_new,passwd_check) {
        let msgpasswd = 'Senhas não conferem';
        let textpasswd = msgpasswd.bold();
        let passwd_1 = document.getElementById(passwd_check).value;
        let passwd_2 = document.getElementById(passwd_new).value;

        if(passwd_1 !== "" && passwd_2 !== "" && passwd_1 === passwd_2){
            document.getElementById(passwd_new).style.border = '1px solid green';
            document.getElementById('span-passwd').innerHTML = '';
        }else{
            document.getElementById('span-passwd').innerHTML = textpasswd;
            document.getElementById(passwd_new).style.border = '1px solid red';
            document.getElementById(passwd_new).focus();
        }
    }

    $('#show_password').click(function (e) {
        if($('#nova-senha').attr('type') === 'password'){
            $('#nova-senha').attr('type', 'text');
            $('#conf-senha').attr('type', 'text');
            $('#show_password').attr('class', 'fas fa-eye-slash');
        }else{
            $('#nova-senha').attr('type', 'password');
            $('#conf-senha').attr('type', 'password');
            $('#show_password').attr('class', 'fas fa-eye');
        }
    })

})(window, document)