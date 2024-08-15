function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

let table;

function loadTableListEvents() {
    let container = document.getElementById('div-table-list-events');
    container.innerHTML = '<table id="tableListEvents" class="table table-striped-columns table-hover table-sm" style="font-size:12px"><thead class="table-secondary"><tr><th style="width: 50px">Data</th><th>Orador</th><th>Contato</th><th>Tema</th><th>Hino Inicial</th><th>Hino Final</th><th>Programa</th><th>Departamento</th><th>Status</th></tr></thead><tbody id="tBodyListEvents"></tbody></table>';

    $('#div-table-list-events').css("display", "none");
    $('#div-loading').css("display", "block");

    $.ajax({
        url: `table-events`,
        type: 'GET',
        dataType: 'json',
        data: {},
        success: function(data) {
            if (data.eventos.length > 0) {
                let monthOfElder = document.getElementById('monthOfElder');
                monthOfElder.innerHTML = data.monthOfElder;
                for (let i = 0; i < data.eventos.length; i++) {
                    $('#tBodyListEvents').append('<tr data-id="'+data.eventos[i].id+'"><td>' + data.eventos[i].start + '</td><td>' + data.eventos[i].orador + '</td><td>' + data.eventos[i].contato + '</td><td>' + data.eventos[i].tema + '</td><td>' + data.eventos[i].hinoInicial + '</td><td>' + data.eventos[i].hinoFinal + '</td><td>' + data.eventos[i].programa + '</td><td>' + data.eventos[i].departamento + '</td><td><img width="10px" height="10px" src="' + data.eventos[i].url + '" alt="' + data.eventos[i].statusEvento + '" /> ' + data.eventos[i].statusEvento + '</td></tr>');
                }
            }

            // Destruir a tabela existente
            if (typeof table !== 'undefined') {
                table.destroy();
            }

            // Recriar a tabela com os novos dados
            initializeTable();

            $('#div-loading').css("display", "none");
            $('#div-table-list-events').css("display", "block");
        },
        error: function(xhr, status, error) {
            console.error('Erro na requisição:', error);
        }
    });
}

function addClickEventToRows() {
    $('#tableListEvents tbody').on('click', 'tr', function() {
        let rowData = table.row(this).data();
        let dataId = $(this).data('id'); // Obtém o valor do atributo data-id da linha clicada
        // console.log('Linha clicada:', rowData);
        // console.log('Valor do data-id:', dataId);

        // Remova a classe de seleção de todas as linhas
        $('#tableListEvents tbody tr').removeClass('selecionado');

        // Adicione a classe de seleção à linha clicada
        $(this).addClass('selecionado');

        $('#modalViewEvent').modal('show');
        $('[data-mask]').inputmask();
        modalViewIsOpen(dataId);
    });
}

function modalViewIsOpen(id) {
    $.ajax({
        url: `event/${id}/search`,
        type: 'GET',
        dataType: 'json',
        data: {},
        success: function(data) {
            if (data.eventos.length > 0) {
                let orador = data.eventos[0].orador;
                let telefone = data.eventos[0].contato;
                let primeiroHino = data.eventos[0].hino_inicial;
                let hinoFinal =  data.eventos[0].hino_final;
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

                $('#modalViewEvent').on('shown.bs.modal', function () {

                    let modal = $(this);
                    modal.find('#id').val(id);
                    modal.find('#date').val(start);
                    modal.find('#time').val(time);
                    modal.find('#orador').val(orador);
                    modal.find('#telefone').val(telefone);
                    modal.find('#primeiroHino').val(primeiroHino);
                    modal.find('#hinoFinal').val(hinoFinal);
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

function initializeTable() {
    table = $('#tableListEvents').DataTable({
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
    addClickEventToRows();
}

async function preLoad() {
    $('#div-loading').css("display", "block");
    $('#div-table-list-events').css("display", "none");
    let monthOfElder = document.getElementById('monthOfElder');
    monthOfElder.innerHTML = '';

    await sleep(3000); // Aguardar 3 segundos

    loadTableListEvents();

    $('#div-loading').css("display", "none");
    $('#div-table-list-events').css("display", "block");
}

preLoad().then(r => {});

const btnNext = document.querySelector('.fc-next-button');
btnNext.addEventListener('click', preLoad);

const btnPrevious = document.querySelector('.fc-prev-button');
btnPrevious.addEventListener('click', preLoad);

const btnToday = document.querySelector('.fc-today-button');
btnToday.addEventListener('click', preLoad);
