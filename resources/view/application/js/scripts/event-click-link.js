

function evtCLickResetPass(idElemento){
    // document.getElementById("linkResetPass").addEventListener("click", function (e){
    //     //console.log("Entrou aqui...");
    //     alert("Entrou aqui...");
    //     e.preventDefault();
    //
    //     let url = this.getAttribute("href");
    //     let form = document.createElement("form");
    //     form.setAttribute("method", "POST");
    //     form.setAttribute("action", url);
    //     document.body.appendChild(form);
    //
    //     form.submit();
    // });

    //alert("Entrou aqui...");
    console.log("Entrou aqui...");

    event.preventDefault();
    let url = document.getElementById(idElemento).getAttribute("href");
    let form = document.createElement("form");
    form.setAttribute("method", "POST");
    form.setAttribute("action", url);
    document.body.appendChild(form);

    form.submit();
}
