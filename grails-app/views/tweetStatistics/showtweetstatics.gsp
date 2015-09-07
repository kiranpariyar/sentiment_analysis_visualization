<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/11/15
  Time: 8:15 PM
--%>
<html>
    <meta name="layout" content="main"/>
    <link href="${resource(dir: 'css', file: 'test.css')}" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    %{--src="${resource(dir: 'javascript', file: 'drawChart.js')}--}%
    <script type="text/javascript">
        google.load("visualization", "1.1", {packages:["corechart","line"]});
//        google.load('visualization', '1.1', {packages: ['line']});
        google.setOnLoadCallback(drawPieChart);
        google.setOnLoadCallback(drawCurveChart);
        google.setOnLoadCallback(drawLineChart);
        function drawPieChart() {

            var data = google.visualization.arrayToDataTable([
                ['Sentiment', 'Percentage'],
                ['Postive', ${count[2]}],
                ['Neutral', ${count[1]}],
                ['Negative', ${count[0]}]
            ]);

            var options = {
                title: 'Twitter Sentiment Statistics Pie Chart'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }

        function drawCurveChart() {
            var data = google.visualization.arrayToDataTable([
                ['days', 'Positive', 'Neutral', 'Negative'],
                ['day1',  ${map.get(1)[2]},  ${map.get(1)[1]},  ${map.get(1)[0]}],
                ['day2',  ${map.get(2)[2]},  ${map.get(2)[1]},  ${map.get(2)[0]}],
                ['day3',  ${map.get(3)[2]},  ${map.get(3)[1]},  ${map.get(3)[0]}],
                ['day4',  ${map.get(4)[2]},  ${map.get(4)[1]},  ${map.get(4)[0]}],
                ['day5',  ${map.get(5)[2]},  ${map.get(5)[1]},  ${map.get(5)[0]}],
                ['day6',  ${map.get(6)[2]},  ${map.get(6)[1]},  ${map.get(6)[0]}],
                ['day7',  ${map.get(7)[2]},  ${map.get(7)[1]},  ${map.get(7)[0]}]

            ]);

            var options = {
                title: 'Satatistics in curve line last week',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }

        function drawLineChart() {

            var data = new google.visualization.DataTable();
            data.addColumn('number', 'Day');
            data.addColumn('number', 'positive');
            data.addColumn('number', 'negative');
            data.addColumn('number', 'neutral');

            data.addRows([
                [1,  ${map.get(1)[2]},  ${map.get(1)[1]},  ${map.get(1)[0]}],
                [2,  ${map.get(2)[2]},  ${map.get(2)[1]},  ${map.get(2)[0]}],
                [3,  ${map.get(3)[2]},  ${map.get(3)[1]},  ${map.get(3)[0]}],
                [4,  ${map.get(4)[2]},  ${map.get(4)[1]},  ${map.get(4)[0]}],
                [5,  ${map.get(5)[2]},  ${map.get(5)[1]},  ${map.get(5)[0]}],
                [6,  ${map.get(6)[2]},  ${map.get(6)[1]},  ${map.get(6)[0]}],
                [7,  ${map.get(7)[2]},  ${map.get(7)[1]},  ${map.get(7)[0]}]
            ]);

            var options = {
                chart: {
                    title: 'Twitter Statistics in Line Chart',
                    subtitle: 'in no of positive negative and neutral tweets',
                    legend: { position: 'bottom' }
                }
            };

            var chart = new google.charts.Line(document.getElementById('linechart_material'));

            chart.draw(data, options);
        }



    </script>
</head>
<body>
<div id="piechart" style="width: 900px; height: 500px;"></div>

<div id="curve_chart" style="width: 900px; height: 500px"></div>

<div id="linechart_material" style="width: 900px; height: 500px"></div>

<div class="middle-box text-center loginscreen animated">
    <div>
        <div>

            <g:form class="m-t" url="[controller:'user',action:'loginHandle']">
                <div class="form-group">
                    <input type="name" class="form-control" placeholder="brand" required="" value="${value}">
                </div>
                <g:submitButton class="btn btn-primary block full-width m-b" name="submitButton" value="Add Brand" />
            </g:form>
        </div>
    </div>
</div>
</body>
</html>

