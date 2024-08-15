

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