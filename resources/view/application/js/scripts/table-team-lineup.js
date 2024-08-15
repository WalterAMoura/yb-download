

function sleepTeamLineup(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

let tableTeamLineup;

function loadTableListTeamLineup() {
    let container = document.getElementById('div-table-list-team-lineup');
    container.innerHTML = '<table id="tableTeamLineup" class="table table-striped-columns table-hover table-sm"><thead class="table-secondary"><tr><th style="width: 200px">Data</th><th style="width: 200px">Horário Sugerido</th><th style="width: 300px">Dia Da Semana</th><th style="width: 450px">Quem</th><th style="width: 450px">Onde</th><th style="width: 400px">Ações</th></tr></thead><tbody id="tBodyTeamLineup"></tbody></table>';

    $('#div-table-list-team-lineup').css("display", "none");
    $('#div-team-lineup-loading').css("display", "block");

    $.ajax({
        url: `scheduler-teams-lineup/items-teams-lineup`,
        type: 'GET',
        dataType: 'json',
        data: {},
        success: function(data) {
            if (data.eventos.length > 0) {
                for (let i = 0; i < data.eventos.length; i++) {
                    $('#tBodyTeamLineup').append('<tr data-id="'+data.eventos[i].id+'"><td>' + data.eventos[i].schedulerDate + '</td><td>' + data.eventos[i].suggestedTime + '</td><td>' + data.eventos[i].dayOfWeek + '</td><td>' + data.eventos[i].who + '</td><td>' + data.eventos[i].where+'<td><a href="'+data.eventos[i].urlEdit+'" class="'+data.eventos[i].disabledEdit+'"><i class="fas fa-edit '+data.eventos[i].disabledEdit+'" style="font-size: 24px;"></i></a>  <a href="'+data.eventos[i].urlDelete+'" class="'+data.eventos[i].disabledRemove+'"><i class="fas fa-trash-alt '+data.eventos[i].disabledRemove+'" style="font-size: 24px;"></i></a></td'+'</tr>');
                }
            }

            // Destruir a tabela existente
            if (typeof tableTeamLineup !== 'undefined' && $.fn.DataTable.isDataTable('#tableTeamLineup')) {
                tableTeamLineup.destroy();
            }

            // Recriar a tabela com os novos dados
            initializeTableTeamLineup();

            $('#div-team-lineup-loading').css("display", "none");
            $('#div-table-list-team-lineup').css("display", "block");
        },
        error: function(xhr, status, error) {
            console.error('Erro na requisição:', error);
        }
    });
}


function initializeTableTeamLineup() {
    table = $('#tableTeamLineup').DataTable({
        "destroy": true,
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": false,
        "autoWidth": true,
        "pageLength": 50,
        "language": {
            "emptyTable": "Sem escala cadastrada..."
        }
    });
}

async function preLoadTeamLineup() {
    $('#div-team-lineup-loading').css("display", "block");
    $('#div-table-list-team-lineup').css("display", "none");

    await sleepTeamLineup(3000); // Aguardar 3 segundos

    loadTableListTeamLineup();

    $("#div-team-lineup-loading").css("display", "none");
    $("#div-table-list-team-lineup").css("display", "block");
}

preLoadTeamLineup().then(r => {});

const btnNext = document.querySelector('.fc-next-button');
btnNext.addEventListener('click', preLoadTeamLineup);

const btnPrevious = document.querySelector('.fc-prev-button');
btnPrevious.addEventListener('click', preLoadTeamLineup);

const btnToday = document.querySelector('.fc-today-button');
btnToday.addEventListener('click', preLoadTeamLineup);
