<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/21/15
  Time: 12:18 PM
--%>

<!DOCTYPE html>
<!-- saved from url=(0059)http://webapplayers.com/inspinia_admin-v2.2/graph_flot.html -->
<>
<head>

    <meta name="layout" content="home"/>
    <title>Sentiment Analysis Charts</title>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1.1", {packages:["corechart","line","bar"]});
        google.setOnLoadCallback(draw3dPieChart);
        google.setOnLoadCallback(drawLineChart);
        google.setOnLoadCallback(drawColumnChart);

        function draw3dPieChart() {
            var data = google.visualization.arrayToDataTable([
                ['Sentiment', 'Percentage'],
                ['Postive', ${count[2]}],
                ['Neutral', ${count[1]}],
                ['Negative', ${count[0]}]
            ]);

            var options = {
                chart: {
                    title: 'Twitter Statistics in Pie Chart',
                    legend: { position: 'bottom' }

                },
                height: 400,
                is3D: true,
                colors: ['#08b637','#66b7f0','#f04151']
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }

        function drawCurveChart() {
            var data = google.visualization.arrayToDataTable([
                ['days', 'Positive', 'Neutral', 'Negative'],
                ['day1', ${map.get(1)[2]}, ${map.get(1)[1]}, ${map.get(1)[0]}],
                ['day2', ${map.get(2)[2]}, ${map.get(2)[1]}, ${map.get(2)[0]}],
                ['day3', ${map.get(3)[2]}, ${map.get(3)[1]}, ${map.get(3)[0]}],
                ['day4', ${map.get(4)[2]}, ${map.get(4)[1]}, ${map.get(4)[0]}],
                ['day5', ${map.get(5)[2]}, ${map.get(5)[1]}, ${map.get(5)[0]}],
                ['day6', ${map.get(6)[2]}, ${map.get(6)[1]}, ${map.get(6)[0]}],
                ['day7', ${map.get(7)[2]}, ${map.get(7)[1]}, ${map.get(7)[0]}]

            ]);

            var options = {
                chart: {
                    title: 'Twitter Statistics in Curve Chart',
                    legend: { position: 'bottom' }

                },
                curveType: 'function',
                height: 400,
                legend: {position: 'bottom'},
                colors: ['#08b637','#66b7f0','#f04151']
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }

        function drawLineChart() {

            var data = new google.visualization.DataTable();
            data.addColumn('number', 'Day');
            data.addColumn('number', 'positive');
            data.addColumn('number', 'neutral');
            data.addColumn('number', 'negative');

            <g:each in="${map}" var="m">
            data.addRow([${m.getKey()}, ${m.getValue()[2]}, ${m.getValue()[1]}, ${m.getValue()[0]}]);
            </g:each>

            var options = {
                chart: {
                    title: 'Twitter Statistics in Line Chart',
                    legend: { position: 'bottom' }

                },
                height: 400,
                colors: ['#08b637','#66b7f0','#f04151']

            };

            var chart = new google.charts.Line(document.getElementById('line_chart'));

            chart.draw(data, options);
        }

        function drawColumnChart() {

            var data = new google.visualization.DataTable();
            var column = ['day','positive','neutral','negative']
            for(var i=0; i<column.length; i++){
                data.addColumn('number',column[i])
            }

            <g:each in="${map}" var="m">
                data.addRow([${m.getKey()}, ${m.getValue()[2]}, ${m.getValue()[1]}, ${m.getValue()[0]}]);
            </g:each>

            console.log(data)

            var options = {
                height: 400,
                chart: {
                    title: 'Twitter Statistics in Column Chart',
                    legend: { position: 'bottom' }

                },
                colors: ['#08b637','#66b7f0','#f04151']
            };

            var chart = new google.charts.Bar(document.getElementById('column_chart'));

            chart.draw(data, options);
        }

    </script>

</head>


<body>
<div class="pace-done">

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-3">
                <h2>Sentiment Prediction Graphs of ${session.brand}</h2>
            </div>

            <div class="col-lg-9">
                <div style="margin-top: 20px;">
                    <g:form controller="graph" action="statistics" class="form-inline">
                        <label class="control-label">Select Brand</label>
                        <div class="form-group col-lg-2">
                            <select name="brandName" class="form-control">
                                <option>${session.brand}</option>
                                <g:each in="${brandList}" var="brand">
                                    <option value="${brand.brandName}">${brand.brandName}</option>
                                </g:each>
                            </select>
                        </div>

                        <label class="control-label">From</label>
                        <div class="form-group">
                            %{--<label for="exampleInputEmail2" class="sr-only">Email address</label>--}%
                            <input type="date" name="mydate1" value="${new Date()}" class="form-control" required="required" >
                        </div>
                        <label class="control-label">To</label>
                        <div class="form-group">
                            %{--<label for="exampleInputPassword2" class="sr-only">Password</label>--}%
                            <input type="date" name="mydate2" value="${new Date()}" class="form-control" required="required">
                        </div>
                        <g:submitButton class="btn btn-primary" name="submit" value="Go!"></g:submitButton>
                    </g:form>
                </div>
            </div>

        </div>

        <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Pie Chart</h5>
                        </div>

                        <div class="ibox-content">
                            <h5>from date : ${startDate}  to  ${endDate}</h5>
                            <div id="piechart_3d">

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Column Chart</h5>
                        </div>

                        <div class="ibox-content">
                            <h5>from date : ${startDate}  to  ${endDate}</h5>
                            <div id="column_chart">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Line Chart</h5>
                        </div>

                        <div class="ibox-content">
                            <h5>from date : ${startDate}  to  ${endDate}</h5>
                            <div id="line_chart">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
</div>
</body>
</html>