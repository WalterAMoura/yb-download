
function updateButton() {
    let selectElement = document.getElementById('who');
    let buttonElement = document.getElementById('btnUpdatedAskToChange');

    // Verifica se o valor selecionado contém "(Não permitido)"
    buttonElement.disabled = !!selectElement.value.includes('(Não permitido)');
}