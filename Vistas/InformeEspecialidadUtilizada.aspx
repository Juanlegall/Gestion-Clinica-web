<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeEspecialidadUtilizada.aspx.cs" Inherits="Vistas.informeEspecialidadUtilizada" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Informes Espacialidades Mas Utilizadas</title>

    <%--Google Charts--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable( <%=obtenerEspecialidadesMasUtilizadas() %>);

            var options = {
                title: 'Grafico de especialidades mas utilizadas',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.PieChart(document.getElementById('graficoEspecialidades'));

            chart.draw(data, options);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Ciclo:&nbsp; <asp:DropDownList runat="server" ID="ddlCiclo" AutoPostBack="true"> </asp:DropDownList>
        </div>

        <div>

            <div id="graficoEspecialidades" style="width: 900px; height: 500px;"></div>

        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Volver" />
    </form>
</body>
</html>
