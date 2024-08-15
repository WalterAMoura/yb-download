
async function requestSession() {
    let req = await fetch('{{host}}/session',{
        'method' : 'post',
        'headers' : {
            'Content-Type' : 'application/json',
            'Accept' : 'application/json'
        },
        body:JSON.stringify({
            token: '{{token}}'
        })
    });

    let resp = await req.json();
    $('#online').text(resp)
}
setInterval(requestSession, parseInt('{{timeout}}'));