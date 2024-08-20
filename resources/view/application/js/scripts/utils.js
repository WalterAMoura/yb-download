function carregarLoading() {
    console.log("Clicou no botão.")
    let idDiv = document.getElementById('idDivLoading');
    if(idDiv.style.display === 'none'){
        idDiv.style.display = 'block'
    }
}


function startDownload(videoId, format, videoTitle) {
    const progressContainer = document.getElementById('progressContainer');
    const progressBar = document.getElementById('progressBar');
    progressContainer.style.display = 'block';
    progressBar.style.width = '0%';

    const xhr = new XMLHttpRequest();
    xhr.open('GET', `search/download?videoId=${encodeURIComponent(videoId)}&format=${encodeURIComponent(format)}`, true);
    xhr.responseType = 'blob';

    xhr.onprogress = function(event) {
        if (event.lengthComputable) {
            const percentComplete = (event.loaded / event.total) * 100;
            progressBar.style.width = percentComplete + '%';
        }
    };

    xhr.onload = function() {
        if (xhr.status === 200) {
            const blob = new Blob([xhr.response], { type: xhr.getResponseHeader('Content-Type') });
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = videoTitle+".mp4";
            document.body.appendChild(a);
            a.click();
            a.remove();
            window.URL.revokeObjectURL(url);
            progressBar.style.width = '100%'; // Complete
        } else {
            alert('Ocorreu um erro no download.');
        }
    };

    xhr.send();
}