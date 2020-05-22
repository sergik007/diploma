/**
 * Created by sergey on 9.5.18.
 */
$(function () {
    $("#chart2").shieldChart({
        theme: "light",
        seriesSettings: {
            line: {
                dataPointText: {
                    enabled: true
                }
            }
        },
        chartLegend: {
            align: 'center',
            borderRadius: 2,
            borderWidth: 2,
            verticalAlign: 'top'
        },
        exportOptions: {
            image: true,
            print: true
        },
        axisX: {
            categoricalValues: ['2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018']
        },
        axisY: {
            title: {
                text: "Цена (€ за kWh)"
            }
        },
        primaryHeader: {
            text: "График изменения спроса"
        },
        dataSeries: [ {
            seriesType: 'line',
            collectionAlias: 'Спрос',
            data: [5310, 4725, 6955, 7956, 8075, 6858, 5728]
        }]
    });
});
$(function () {
    $("#chart").shieldChart({
        theme: "light",
        seriesSettings: {
            line: {
                dataPointText: {
                    enabled: true
                }
            }
        },
        chartLegend: {
            align: 'center',
            borderRadius: 2,
            borderWidth: 2,
            verticalAlign: 'top'
        },
        exportOptions: {
            image: true,
            print: true
        },
        axisX: {
            categoricalValues: ['2012', '2013', '2014', '2015', '2016', '2017', '2018']
        },
        axisY: {
            title: {
                text: "USD/m2"
            }
        },
        primaryHeader: {
            text: "График изменения средней цены"
        },
        dataSeries: [ {
            seriesType: 'line',
            collectionAlias: 'Средняя цена',
            data: [1325, 1688, 1750, 1469, 1199, 1159, 1301]
        }]
    });
});