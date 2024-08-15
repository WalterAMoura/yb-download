
$(document).ready(function (){
    $('#cleanTheTime').on('click', function (){
        requestSessionClean().then(r => {})
    })
    $('#id_dadosSoundTeamLineup').on('click', function (){
        if(document.querySelector('.fc-next-button')){
            let btnNext = document.querySelector('.fc-next-button');
            let clickEvent = new Event('click');
            btnNext.dispatchEvent(clickEvent);
            let btnPrevious = document.querySelector('.fc-prev-button');
            btnPrevious.dispatchEvent(clickEvent);
        }

        // const btnPrevious = doc.querySelector('.fc-prev-button');
        // btnPrevious.click();
    })
})

async function requestSessionClean() {
    let req = await fetch('{{host}}/session/clean',{
        'method' : 'post',
        'headers' : {
            'Content-Type' : 'application/json',
            'Accept' : 'application/json'
        },
        body:JSON.stringify({
            token: '{{token}}',
            type: 'clean'
        })
    });
    let resp = await req.json();
}
