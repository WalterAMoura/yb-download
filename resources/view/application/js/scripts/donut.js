
//-------------
//- DONUT CHART -
//-------------
// Get context with jQuery - using jQuery's .get() method.

const id = '{{id}}';
let urlRedirect = '';
let donutChartCanvas = $(id).get(0).getContext('2d');
let donutData        = {
    labels: JSON.parse('{{labels}}'),
    datasets: [
        {
            data: JSON.parse('{{data}}'),
            backgroundColor: JSON.parse('{{backgroundColor}}'),
            ids: JSON.parse('{{ids}}')
        }
    ]
}

let donutOptions     = {
    maintainAspectRatio : false,
    responsive : true,
    onClick: function(evt, elements) {
        if (elements.length) {
            let dataset = donutData.datasets[elements[0]._datasetIndex];
            let index = elements[0]._index;
            urlRedirect = '{{url}}/application/dashboards/' + dataset.ids[index] + '/{{year}}/view/{{typeView}}';
            window.location.href = urlRedirect;
        }
    }
};

//Create pie or douhnut chart
// You can switch between pie and douhnut using the method below.
new Chart(donutChartCanvas, {
    type: 'doughnut',
    data: donutData,
    options: donutOptions,
})
