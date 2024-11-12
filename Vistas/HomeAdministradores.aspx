<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeAdministradores.aspx.cs" Inherits="Vistas.HomeAdministradores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <style>
            .Menu-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
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
 }
                </style>
      <div class="Menu-container">
          <div class="Menu-box text-center">
            <asp:Label ID="lblMensaje" font-bold="true" Font-Size="25px" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblMenu" runat="server"  Font-Size="12px" Text="Menu"></asp:Label>
            <br />
            <br />
            <div class="form-group mb-3">
            <asp:Button ID="btnAbmlMedicos" runat="server" Text="ABML MEDICOS" cssclass="rounded-button" Width="351px" CommandArgument="ABMLMedicos.aspx" CommandName="cmdRedireccion"  OnCommand="cmdRedireccion" OnClick="btnAbmlMedicos_Click"  />
            <br />
            <br />
            <asp:Button ID="btnAbmlPacientes" runat="server" Text="ABML PACIENTES" cssclass="rounded-button" Width="351px" CommandArgument="ABMLPacientes.aspx" CommandName="cmdRedireccion"  OnCommand="cmdRedireccion"  />
            <br />
            <br />
            <asp:Button ID="btnInformes" runat="server" Text="INFORMES" cssclass="rounded-button" Width="351px" CommandArgument="Informes.aspx" CommandName="cmdRedireccion"  OnCommand="cmdRedireccion" />
            <br />
            <br />
            <asp:Button ID="btnTurnos" runat="server" Text="ASIGNACION DE TURNOS" cssclass="rounded-button" Width="351px" CommandArgument="AsignascionTurnos.aspx" CommandName="cmdRedireccion"  OnCommand="cmdRedireccion" />
          </div>
        </div>
    </div>
</div>
</form>
</body>
</html>

