<%-- 
    Document   : topuser
    Created on : Mar 11, 2024, 10:58:58 PM
    Author     : hatrung
--%>

<html>
    <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['UserName', 'Quantity'],
                    ['${requestScope['name1']}', ${requestScope['value1']}],
                    ['${requestScope['name2']}', ${requestScope['value2']}],
                    ['${requestScope['name3']}', ${requestScope['value3']}]
                ]);

                var options = {
                    title: 'Top 3 customers buy the most'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <a href="detailaccount.jsp">Back To SamSung Store</a>
        <div id="piechart" style="width: 900px; height: 500px;"></div>
    </body>
</html>
