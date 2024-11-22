<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionTurnos.aspx.cs" Inherits="Vistas.AsignacionTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

    <style type="text/css">
        .auto-style1 {
            width: 298px;
        }
        .auto-style2 {
            width: 509px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
<div class="col-12 row">

    <div class="col-1">

    </div>

<div class="col-8" style="margin-top:35px;">

<div style="margin-top: 60px;">

    <div>

        <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
            <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Paciente</label>
                <asp:DropDownList ID="ddlPacientes" runat="server"  class="form-control campo">
                </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvPacientes" runat="server" ControlToValidate="ddlPacientes" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>  
        </div>
         
         
           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
              <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Especialidad</label>
                       <asp:DropDownList ID="ddlEspecialidad" runat="server"  class="form-control campo" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                        </asp:DropDownList>
             <asp:RequiredFieldValidator ID="frvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
            </div>


         
           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
              <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Especialista</label>
                       <asp:DropDownList ID="ddlEspecialista" runat="server"  class="form-control campo">
                        </asp:DropDownList>
             <asp:RequiredFieldValidator ID="rfvEspecialista" runat="server" ControlToValidate="ddlEspecialista" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>     
            </div>

              <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Fecha</label>
           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;margin-left: 75px">
                                   <asp:Calendar ID="Calendario" runat="server" OnSelectionChanged="calendario_SelectionChanged"></asp:Calendar>
            </div>

            <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                  <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Horario</label>
                           <asp:DropDownList ID="ddlHorarios" runat="server"  class="form-control campo">
                            </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="rfvHorarios" runat="server" ControlToValidate="ddlHorarios" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
            </div>


    </div>


        <div  class="form-group px-0 d-flex justify-content-center align-items-center col-10" style="margin-bottom: 10px;margin-left: 123px;width: 120px;margin-bottom: 10px;">

             

       </div>

    </div>

</div>
        </div>

        <table class="w-100">
            <tr>
                <td class="auto-style1">
             <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">

             <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" class="btn btn-secondary form-control" Width="172px" OnClick="btnAceptar_Click" />

             

                </td>
                <td>
                    <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
