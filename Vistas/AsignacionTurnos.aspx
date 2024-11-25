<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionTurnos.aspx.cs" Inherits="Vistas.AsignacionTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

    <style type="text/css">
        .form-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

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
        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1>Asignacion de Turnos Medicos</h1>
            </div>

            <div class="d-flex justify-content-center align-items-center">
                <div class="form-container p4 col-md-6">


                    <div>
                        <%-- DDLPACIENTES --%>
                        <div class="form-group ">
                            <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Paciente</label>
                            <asp:DropDownList ID="ddlPacientes" runat="server" class="form-control campo">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPacientes" runat="server" ControlToValidate="ddlPacientes" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                        </div>
                        <%-- DDLESPECIALIDAD --%>
                        <div class="form-group ">
                            <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Especialidad</label>
                            <asp:DropDownList ID="ddlEspecialidad" runat="server" class="form-control campo" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="frvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                        </div>
                        <%-- DDLESPECIALISTA --%>
                        <div class="form-group ">
                            <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Especialista</label>
                            <asp:DropDownList ID="ddlEspecialista" runat="server" class="form-control campo">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEspecialista" runat="server" ControlToValidate="ddlEspecialista" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                        </div>
                        <%-- FECHA --%>
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Fecha</label>
                        <div class="form-group ">
                            <asp:Calendar ID="Calendario" runat="server" OnSelectionChanged="calendario_SelectionChanged"></asp:Calendar>
                        </div>
                        <%-- HORARIOS --%>
                        <div class="form-group ">
                            <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Horario</label>
                            <asp:DropDownList ID="ddlHorarios" runat="server" class="form-control campo">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvHorarios" runat="server" ControlToValidate="ddlHorarios" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                        </div>
                        <%-- Botones --%>
                        <div class="text-center">
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary btn-custom me-3" Width="172px" OnClick="btnAceptar_Click" />
                            <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary btn-custom" />
                        </div>
                        <div class="text-center mt-3">
                            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
