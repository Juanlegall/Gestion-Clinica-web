<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeTurnosPresentismo.aspx.cs" Inherits="Vistas.InformeTurnosPresentismo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Informes Presentimo de Pacientes</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />


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
    <style>
        body{
            display:flex;
            flex-direction:column;
            align-items:center;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label>Ciclo: </label>
            <asp:DropDownList runat="server" ID="ddlCiclo" AutoPostBack="true" CssClass="btn btn-primary dropdown-toggle"> </asp:DropDownList>
        </div>

        <div>
            <div id="graficoPresentismo" style="width: 900px; height: 500px;"></div>
        </div>


        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Volver" CssClass="btn btn-secondary" />
    </form>
</body>
</html>
