

function requestSessionCheck() {
    $.ajax({
        url: '{{host}}/session/check',
        type: 'POST',
        dataType: 'json',
        data: {
            token: '{{token}}',
            type: 'update'
        },
        success: function(data) {
            if(!data.success){
                location.href=data.path;
            }
        }
    })
}
setInterval(requestSessionCheck, parseInt('{{timeout}}'));