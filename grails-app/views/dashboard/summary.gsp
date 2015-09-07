<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/19/15
  Time: 3:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>

        <meta name="layout" content="home"/>

        <title>Social Media Listerning</title>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        %{--src="${resource(dir: 'javascript', file: 'drawChart.js')}--}%
        <script type="text/javascript">
            google.load("visualization", "1.1", {packages:["corechart","line"]});
            //        google.load('visualization', '1.1', {packages: ['line']});
            google.setOnLoadCallback(draw3dPieChart);
            google.setOnLoadCallback(drawLineChart);

            function draw3dPieChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Sentiment', 'Percentage'],
                    ['Postive', ${count[2]}],
                    ['Neutral', ${count[1]}],
                    ['Negative', ${count[0]}]
                ]);

                var options = {
                    chart: {
                        title: 'One Week Statistics Pie Chart',
                        legend: { position: 'bottom' }
                    },
                    is3D: true,
                    colors: ['#08b637', '#0b0cff','#f04151']
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }

            function drawLineChart() {
                var data = new google.visualization.DataTable();

                data.addColumn('number', 'Date');
                data.addColumn('number', 'positive');
                data.addColumn('number', 'negative');
                data.addColumn('number', 'neutral');

                console.log(data);

                <g:each in="${map}" var="m">
                    data.addRow([${m.getKey()}, ${m.getValue()[2]}, ${m.getValue()[1]}, ${m.getValue()[0]}]);
                </g:each>

                var options = {
                    chart: {
                        title: 'One Week Statistics in Line Chart',
                        legend: { position: 'bottom' }

                    },
                    colors: ['#30f0a0', '#66b7f0','#f04151']
                };

                var chart = new google.charts.Line(document.getElementById('line_chart'));

                chart.draw(data, options);
            }

        </script>

    </head>

<body>

    %{--<g:each in="${map}" var="m">--}%
        %{--<p>${m.getValue()[0]}</p>--}%
    %{--</g:each>--}%
    <div class="row wrapper border-bottom white-bg page-heading">

        <div class="col-lg-7">
        <h2>One Week Summary Of Brand ${brand}</h2>
    </div>

        <div class="col-lg-5">
        <div style="margin-top: 20px;">
            <g:form controller = "dashboard" action = "summary">
                <div class="input-group">
                    <g:textField name="name" class="form-control" placeholder="sentiment prediction of brand or product" />
                    %{--<input type="text" name="name" class="form-control" placeholder="sentiment prediction of brand or product"/>--}%
                    <span class="input-group-btn">
                        %{--<button type="button" class="btn btn-primary">Go!</button>--}%
                        <g:submitButton class="btn btn-primary" name="submitButton" value="Go!" />
                    </span>
                </div>
            </g:form>
        </div>
    </div>

    </div>

    <div class="wrapper wrapper-content animated fadeInRight">

        <div class="row">
            <div class="col-lg-3" style="padding:0;padding-left: 15px;">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Total Tweets</h5>
                                </div>
                                <div class="ibox-content">
                                    <h2>${total}</h2>
                                    <h3>100 %</h3>
                                </div>
                            </div>
                        </div>

            <div class="col-lg-3" style="padding:0">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Positive Tweets</h5>
                                </div>
                                <div class="ibox-content">
                                    <h2>${count[2]}</h2>
                                    <h3>${positive}%</h3>
                                </div>
                            </div>
                        </div>

            <div class="col-lg-3" style="padding:0">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Negative Tweets</h5>
                                </div>
                                <div class="ibox-content">
                                    <h2>${count[0]}</h2>
                                    <h3>${negative}%</h3>
                                </div>
                            </div>
                        </div>

            <div class="col-lg-3" style="padding:0;padding-right: 15px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Neutral Tweets</h5>
                                </div>
                                <div class="ibox-content">
                                    <h2>${count[1]}</h2>
                                    <h3>${neutral}%</h3>
                                </div>
                            </div>
                        </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Pie Chart
                            <small>With percentage</small>
                        </h5>
                        <div ibox-tools=""></div>
                    </div>
                    <div class="ibox-content">
                        <div id="piechart_3d">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Line Chart</h5>
                        <div ibox-tools=""></div>
                    </div>
                    <div class="ibox-content">
                        <div id="line_chart">
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">

            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h3>Positive</h3>
                    </div>

                    <div class="ibox-content no-padding">
                        <ol class="list-group">
                            <g:each in="${tweets[3]}" var="tweet">
                                <li class="list-group-item">
                                    <p>${tweet}</p>
                                </li>
                            </g:each>
                         </ol>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h3>Neutral</h3>
                    </div>

                    <div class="ibox-content no-padding">
                        <ol class="list-group">
                            <g:each in="${tweets[2]}" var="tweet">
                                <li class="list-group-item">
                                    <p>${tweet}</p>
                                </li>
                            </g:each>
                        </ol>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h3>Negative</h3>
                    </div>

                    <div class="ibox-content no-padding">
                        <ol class="list-group">
                            <g:each in="${tweets[1]}" var="tweet">
                                <li class="list-group-item">
                                    <p>${tweet}</p>
                                </li>
                            </g:each>
                        </ol>
                   </div>
            </div>
        </div>
        </div>

    </div>

</body>

</html>