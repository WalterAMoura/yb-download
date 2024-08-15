
let table;

$(document).ready(function (){
    initializeTable();
})

function addClickEventToRows() {
    $('{{tableId}} tbody').on('click', 'tr', function() {
        let rowData = table.row(this).data();
        let dataId = $(this).data('id'); // Obtém o valor do atributo data-id da linha clicada
        // console.log('Linha clicada:', rowData);
        // console.log('Valor do data-id:', dataId);

        // Remova a classe de seleção de todas as linhas
        $('{{tableId}} tbody tr').removeClass('selecionado');

        // Adicione a classe de seleção à linha clicada
        $(this).addClass('selecionado');

        $('#modalViewEvent').modal('show');
        $('[data-mask]').inputmask();
        modalViewIsOpen(dataId);
    });
}

function initializeTable() {
    table = $('{{tableId}}').DataTable({
        "retrieve": true,
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": false,
        "info": false,
        "autoWidth": true,
        "pageLength": 10,
        "language": {
            "emptyTable": "Sem agenda..."
        }
    });
    // Adicionar evento de clique às linhas
    addClickEventToRows();
}

function modalViewIsOpen(id) {
    $.ajax({
        url: `{{urlRequest}}/${id}/search`,
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