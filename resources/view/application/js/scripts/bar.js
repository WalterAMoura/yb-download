
//-------------
//- BAR CHART -
//-------------

const id_I = '{{id}}';
const barChartCanvas = $(id_I).get(0).getContext('2d')
const barChartData =  {
    labels: JSON.parse('{{labels}}'),
    datasets: [
        {
            label: '',
            data: JSON.parse('{{data}}'),
            backgroundColor     :  ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de','#d2d6ff', '#3c8cbd','#6d4fb7','#275814','#d2e7db','#1832c4','#86ae81','#4bc827','#a272d0','#6503df','#1c9dbc','#c837c5','#e2ad3e','#bb335f','#8fb3bd','#98dab8','#28a81a','#bb9904','#a688f8','#b35b48','#0ce6d9','#3a0593','#55f115','#a172de','#286a9a','#1ba85e','#82e84a','#6f9d28','#5cc346','#493085','#3d5ed5','#0f32c7','#293d0d','#aaae8c','#368adc','#fc24e9','#c2e150','#bd395d','#47ed10','#655420','#223d3d','#648acd','#2d8be6','#04ea7b','#1fbe2c','#bd3fa3','#9dc534','#486647','#78d8a8','#444e2d','#fbc18f','#85bf81','#7e53c1','#51b2a4','#273260','#a6be5c'],
            pointRadius         : false,
            pointColor          : '#3b8bba',
            pointStrokeColor    : 'rgba(60,141,188,1)',
            pointHighlightFill  : '#fff',
            pointHighlightStroke: 'rgba(60,141,188,1)',
            borderColor         : 'rgba(60,141,188,0.8)',
            ids: JSON.parse('{{ids}}')
        }
    ]
}

const barChartOptions = {
    responsive              : true,
    maintainAspectRatio     : false,
    datasetFill             : false,
    onClick: function (evt, item) {
        if (item.length) {
            let dataset = barChartData.datasets[item[0]._datasetIndex];
            let index = item[0]._index;
            let urlRedirect = '{{url}}/application/dashboards/' + dataset.ids[index] + '/{{year}}/view/{{typeView}}';
            window.location.href = urlRedirect;
        }
    }
}
const barChart = new Chart(barChartCanvas, {
    type: 'bar',
    data: barChartData,
    options: barChartOptions
})