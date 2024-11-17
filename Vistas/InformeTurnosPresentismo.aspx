<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeTurnosPresentismo.aspx.cs" Inherits="Vistas.InformeTurnosPresentismo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Informes Presentimo de Pacientes</title>

        <%--Google Charts--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable( <%=obtenerDatosTurnos() %>);

            var options = {
                title: 'Grafico de presentismo de pacientes por turnos'
            };

            var chart = new google.visualization.PieChart(document.getElementById('graficoPresentismo'));

            chart.draw(data, options);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div id="graficoPresentismo" style="width: 900px; height: 500px;"></div>
        </div>
    </form>
</body>
</html>
