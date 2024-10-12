<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%

List<Integer> esikaStock = new ArrayList<>();
List<Integer> lbelStock = new ArrayList<>();
List<Integer> cyzoneStock = new ArrayList<>();

for (Producto p: productos){
    if(p.getCategoria().equalsIgnoreCase("Alimentos")){
        esikaStock.add(p.getStock());
    } else if(p.getCategoria().equalsIgnoreCase("Cuidado del Hogar")){
        lbelStock.add(p.getStock());
    } else if(p.getCategoria().equalsIgnoreCase("Cuidado personal")){
        cyzoneStock.add(p.getStock());
    }
}

String esikaStockArray = esikaStock.toString();
String lbelStockArray = lbelStock.toString();
String cyzoneStockArray = cyzoneStock.toString();
%>       

<div class="container mt-5 d-flex justify-content-center">
        <div class="chart-container shadow">
            <h3>Gráfico 2</h3>
            <div id="echartsContainer" class="chart-canvas"></div>
        </div>
    </div>

<!-- Incluye las librerías Chart.js y ECharts -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>

<script>
    // Datos de JSP a JavaScript
    var esikaStock = <%= esikaStockArray %>;
    var lbelStock = <%= lbelStockArray %>;
    var cyzoneStock = <%= cyzoneStockArray %>;
    
    // Usando ECharts para crear un gráfico de líneas
    var chartDom = document.getElementById('echartsContainer');
    var myChart = echarts.init(chartDom);

    var option = {
        color: ['#80FFA5', '#00DDFF', '#37A2FF'],
        title: {
            text: 'TABLA DE STOCK CATEGORIA PRODUCTOS'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#6a7985'
                }
            }
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: ['Alimentos', 'Cuidado del Hogar', 'Cuidado personal']
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: 'Alimentos',
                type: 'line',
                stack: 'Total',
                smooth: true,
                lineStyle: {
                    width: 0
                },
                showSymbol: false,
                areaStyle: {
                    opacity: 0.8,
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                        {
                            offset: 0,
                            color: 'rgb(128, 255, 165)'
                        },
                        {
                            offset: 1,
                            color: 'rgb(1, 191, 236)'
                        }
                    ])
                },
                emphasis: {
                    focus: 'series'
                },
                data: esikaStock
            },
            {
                name: 'Cuidado del Hogar',
                type: 'line',
                stack: 'Total',
                smooth: true,
                lineStyle: {
                    width: 0
                },
                showSymbol: false,
                areaStyle: {
                    opacity: 0.8,
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                        {
                            offset: 0,
                            color: 'rgb(0, 221, 255)'
                        },
                        {
                            offset: 1,
                            color: 'rgb(77, 119, 255)'
                        }
                    ])
                },
                emphasis: {
                    focus: 'series'
                },
                data: lbelStock
            },
            {
                name: 'Cuidado personal',
                type: 'line',
                stack: 'Total',
                smooth: true,
                lineStyle: {
                    width: 0
                },
                showSymbol: false,
                areaStyle: {
                    opacity: 0.8,
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                        {
                            offset: 0,
                            color: 'rgb(55, 162, 255)'
                        },
                        {
                            offset: 1,
                            color: 'rgb(116, 21, 219)'
                        }
                    ])
                },
                emphasis: {
                    focus: 'series'
                },
                data: cyzoneStock
            }
        ]
    };

    myChart.setOption(option);
</script>
