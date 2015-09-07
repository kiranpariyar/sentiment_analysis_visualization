/**
 * Created by kiran on 8/14/15.
 */

$(document).ready(function(){
    var $positive = $("#positive").html
    var $neutral = $("#neutral").html
    var $negative = $("#negative").html

    $("#piechart").load("",function(){

        google.load("visualization", "1", {packages:["corechart"]});
        var data = google.visualization.arrayToDataTable([
            ['Sentiment', 'Percentage'],
            ['Postive', $positive],
            ['Neutral', $neutral],
            ['Negative', $negative]
        ]);

        var options = {
            title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
    });
});