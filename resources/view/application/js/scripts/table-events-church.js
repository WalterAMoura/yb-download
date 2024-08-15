function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

let table;

function loadTableListEventsChurch() {
    let container = document.getElementById('div-table-list-events-church');
    container.innerHTML = '<table id="tableListEventsChurch" class="table table-striped-columns table-hover table-sm" style="font-size:12px"><thead class="table-secondary"><tr><th style="width: 50px">Data</th><th>Ancião Conselheiro</th><th>Responsável</th><th>Contato</th><th>Tema</th><th>Programação</th><th>Departamento</th><th>Observações</th><th>Status</th></tr></thead><tbody id="tBodyListEventsChurch"></tbody></table>';

    $('#div-table-list-events').css("display", "none");
    $('#div-loading').css("display", "block");

    $.ajax({
        url: `table-events-church`,
        type: 'GET',
        dataType: 'json',
        data: {},
        success: function(data) {
            if (data.eventos.length > 0) {
                let monthOfElder = document.getElementById('monthOfElder');
                monthOfElder.innerHTML = data.monthOfElder;
                for (let i = 0; i < data.eventos.length; i++) {
                    $('#tBodyListEventsChurch').append('<tr data-id="'+data.eventos[i].id+'"><td>' + data.eventos[i].start + '</td><td>'+ data.eventos[i].elder_complete_name + '</td><td>' + data.eventos[i].owner + '</td><td>' + data.eventos[i].contato + '</td><td>' + data.eventos[i].tema + '</td><td>'+ data.eventos[i].programa +'</td></td><td>' + data.eventos[i].departamento + '</td><td>' + data.eventos[i].observacoes + '</td><td><img width="10px" height="10px" src="' + data.eventos[i].url + '" alt="' + data.eventos[i].statusEvento + '" /> ' + data.eventos[i].statusEvento + '</td></tr>');
                }
            }else{
                let monthOfElder = document.getElementById('monthOfElder');
                monthOfElder.innerHTML = data.monthOfElder;
            }

            // Destruir a tabela existente
            if (typeof table !== 'undefined') {
                table.destroy();
            }

            // Recriar a tabela com os novos dados
            initializeTableEventsChurch();

            $('#div-loading-events-church').css("display", "none");
            $('#div-table-list-events-church').css("display", "block");
        },
        error: function(xhr, status, error) {
            console.error('Erro na requisição:', error);
        }
    });
}

function addClickEventsChurchToRows() {
    $('#tableListEventsChurch tbody').on('click', 'tr', function() {
        let rowData = table.row(this).data();
        let dataId = $(this).data('id'); // Obtém o valor do atributo data-id da linha clicada
        // console.log('Linha clicada:', rowData);
        // console.log('Valor do data-id:', dataId);

        // Remova a classe de seleção de todas as linhas
        $('#tableListEventsChurch tbody tr').removeClass('selecionado');

        // Adicione a classe de seleção à linha clicada
        $(this).addClass('selecionado');

        $('#modalViewEventsChurch').modal('show');
        $('[data-mask]').inputmask();
        modalViewEventsChurchIsOpen(dataId);
    });
}

function modalViewEventsChurchIsOpen(id) {
    $.ajax({
        url: `events-church/${id}/search`,
        type: 'GET',
        dataType: 'json',
        data: {},
        success: function(data) {
            if (data.eventos.length > 0) {
                let orador = data.eventos[0].owner;
                let telefone = data.eventos[0].contato;
                let tema = data.eventos[0].description;
                let status = data.eventos[0].status_id;
                let departamento = data.eventos[0].department_id;
                let program = data.eventos[0].program_id;
                let observacoes = data.eventos[0].observacoes;
                let horario = data.eventos[0].start;
                horario = horario.replace(" ", "T").replace("+03:00", "");
                let startDate = new  Date(moment(new Date(horario)).utcOffset('-06:00').format('lll'));
                let month = ((startDate.getMonth() + 1) <= 9) ? "0" + (startDate.getMonth() + 1) : (startDate.getMonth() + 1);
                let day = ((startDate.getDate()) <= 9) ? "0" + startDate.getDate() : startDate.getDate();
                let minutes = ((startDate.getMinutes()) <= 9) ? "0" + startDate.getMinutes() : startDate.getMinutes();
                let start = `${startDate.getFullYear()}-${month}-${day}`;
                let hour = ((startDate.getHours()) <= 9) ? "0" + startDate.getHours() : startDate.getHours();
                let time = `${hour}:${minutes}:00`;

                $('#modalViewEventsChurch').on('shown.bs.modal', function () {

                    let modal = $(this);
                    modal.find('#id').val(id);
                    modal.find('#date').val(start);
                    modal.find('#time').val(time);
                    modal.find('#orador').val(orador);
                    modal.find('#telefone').val(telefone);
                    modal.find('#tema').val(tema);
                    modal.find('#statusEvent').val(status);
                    modal.find('#departamentos').val(departamento);
                    modal.find('#programs').val(program);
                    modal.find('#observacoes').val(observacoes);
                });
            }
        },
        error: function(xhr, status, error) {
            console.error('Erro na requisição:', error);
        }
    });

}

function initializeTableEventsChurch() {
    table = $('#tableListEventsChurch').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": true,
        "ordering": true,
        "info": false,
        "autoWidth": true,
        "pageLength": 25,
        "language": {
            "emptyTable": "Sem agenda..."
        }
    });
    // Adicionar evento de clique às linhas
    addClickEventsChurchToRows();
}

async function preLoad() {
    $('#div-loading-events-church').css("display", "block");
    $('#div-table-list-events-church').css("display", "none");
    let monthOfElder = document.getElementById('monthOfElder');
    monthOfElder.innerHTML = '';

    await sleep(3000); // Aguardar 3 segundos

    loadTableListEventsChurch();

    $('#div-loading-events-church').css("display", "none");
    $('#div-table-list-events-church').css("display", "block");
}

preLoad().then(r => {});

const btnNext = document.querySelector('.fc-next-button');
btnNext.addEventListener('click', preLoad);

const btnPrevious = document.querySelector('.fc-prev-button');
btnPrevious.addEventListener('click', preLoad);

const btnToday = document.querySelector('.fc-today-button');
btnToday.addEventListener('click', preLoad);
