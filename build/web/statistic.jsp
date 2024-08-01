<%-- 
    Document   : topsellproduct
    Created on : Mar 11, 2024, 9:22:25 PM
    Author     : hatrung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Thêm thư viện Google Charts -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <!-- Khởi tạo thư viện Google Charts -->
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

           function drawChart() {
                // Tạo dữ liệu cho biểu đồ
                var data = google.visualization.arrayToDataTable([
                    ['Year', 'Monney $'],
                    ['2022', ${requestScope['2022']}],
                    ['2023', ${requestScope['2023']}],
                    ['2024', ${requestScope['2024']}],
                            // Thêm dữ liệu cột khác nếu cần
                ]);
                // Cấu hình biểu đồ
                var options = {
                    title: 'Revenue In 3 Years'
                };
                // Tạo một biểu đồ cột và vẽ nó lên thẻ có ID là 'column_chart'
                var chart = new google.visualization.ColumnChart(document.getElementById('column_chart'));
                chart.draw(data, options);
            }
        </script>

    </head>
    <body>
        <a href="detailaccount.jsp">Back To SamSung Store</a>
        <!-- Thẻ div để chứa biểu đồ cột -->
        <div id="column_chart" style="width: 100%; height: 400px;"></div>
    </body>
</html>
