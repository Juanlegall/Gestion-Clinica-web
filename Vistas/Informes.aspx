<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Vistas.Informes" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Informes</title>

    <style>
        .Menu-container {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            min-height: 60vh;
            max-width:100vw;
        }

        .Menu-box {
            width: 400px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: white;
        }


        .rounded-button {
            border-radius: 15px;
            border: none;
            Width:100%;
            Height:auto;
            Font-Size:25px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server" aria-atomic="False">

            <div class="Menu-container">
               <div class="Menu-box">
                    <asp:Label ID="lblMenu" runat="server" Font-Size="50px" Text="INFORMES" Font-Bold="true"></asp:Label>
                    <br />
                    <br />
                   <br />
                    <br />
                    <div class="form-group mb-3">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" cssclass="rounded-button" Text="Informe presentismo de pacientes" />
                        <br />
                        <br />
                         <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" cssclass="rounded-button" Text="Informe especialidades medico" />
                        <br />
                        <br />
                        <br />
                    <br />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" cssclass="rounded-button" Text="Volver" />
                    </div>
                </div>
            </div>
        
    </form>
</body>
</html>
