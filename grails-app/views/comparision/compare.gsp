<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 9/9/15
  Time: 1:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="home"/>
    <title>comparision</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1.1", {packages:["corechart","timeline"]});
        google.setOnLoadCallback(drawLineChart);

        function drawLineChart() {

            var current = new Date();
            var data = google.visualization.arrayToDataTable([
                    ['date','${brandName1}', '${brandName2}'],
                    [new Date(current.getYear(),current.getMonth(),current.getDate()-6), ${map1.get(1)[3]}, ${map2.get(1)[3]}],
                    [new Date(current.getYear(),current.getMonth(),current.getDate()-5), ${map1.get(2)[3]}, ${map2.get(2)[3]}],
                    [new Date(current.getYear(),current.getMonth(),current.getDate()-4), ${map1.get(3)[3]}, ${map2.get(3)[3]}],
                    [new Date(current.getYear(),current.getMonth(),current.getDate()-3), ${map1.get(4)[3]}, ${map2.get(4)[3]}],
                    [new Date(current.getYear(),current.getMonth(),current.getDate()-2), ${map1.get(5)[3]}, ${map2.get(5)[3]}],
                    [new Date(current.getYear(),current.getMonth(),current.getDate()-1), ${map1.get(6)[3]}, ${map2.get(6)[3]}],
                    [new Date(current.getYear(),current.getMonth(),current.getDate()), ${map1.get(7)[3]}, ${map2.get(7)[3]}]
            ]);

            var options = {
                hAxis: {
                    format: 'M/d/yy',
                    gridlines: {count: 15}
                },
                vAxis: {
                    gridlines: {color: 'none'},
                    minValue: 0
                },
                chart: {
                    title: 'With number of positive tweet by negative per day',
                    legend: { position: 'bottom' }

                },
                colors: ['#66b7f0','#f04151']
            };

            var chart = new google.visualization.LineChart(document.getElementById('line_chart'));

            chart.draw(data, options);
        }

    </script>

</head>

<body>


<div class="pace-done">

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-4">
            <h2>Compare Between Brands</h2>
        </div>

        <div class="col-lg-8">
            <div style="margin-top: 20px;">
                <g:form controller="comparision" action="compare" class="form-inline">
                    <div class="form-group col-lg-2">
                        <select name="brand1" title="select_brand1" class="form-control">
                            <g:each in="${brandList}" var="brand">
                                <option value="${brand.brandName}">${brand.brandName}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="form-group col-lg-2">
                        <select name="brand2" title="select_brand2" class="form-control">
                            <g:each in="${brandList}" var="brand">
                                <option value="${brand.brandName}">${brand.brandName}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="form-group col-lg-2">
                        <g:submitButton class="btn btn-primary" name="submit" value="compare">compare</g:submitButton>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">

        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Comparision between brand ${brandName1} and ${brandName2} in Time line Chart
                            %{--<small>With number of positive tweet by negative per day</small>--}%
                        </h5>
                        <div ibox-tools=""></div>
                    </div>
                    <div class="ibox-content">
                        <b>With ratio of number of positive tweet by negative tweet per day</b>
                        <div id="line_chart">

                        </div>
                    </div>
            </div>
        </div>
    </div>

</div>


    %{--<table class="table table-striped">
        <thead>
            <tr>
                <th>Brand/Sentiment</th>
                <th>Positive</th>
                <th>Neutral</th>
                <th>Negative</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${brandName1}</td>
                <td>${count1[2]}</td>
                <td>${count1[1]}</td>
                <td>${count1[0]}</td>
            </tr>
            <tr>
                <td>${brandName2}</td>
                <td>${count2[2]}</td>
                <td>${count2[1]}</td>
                <td>${count2[0]}</td>
            </tr>
        </tbody>
    </table>

    <p>Positive by Negative Ratio for Brand ${brandName1} : ${posByNeg1}</p>
    <p>Positive by Negative Ratio for Brand ${brandName2} : ${posByNeg2}</p>

    <p>${map1}</p>
    <p>${map2}</p>
    --}%

</body>
</html>