<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Vistas.AltaPaciente" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Alta Paciente</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <style>
        .form-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
              margin-bottom: 2px;
        }

        .btn-custom {
            width: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1>Registro de Pacientes</h1>
            </div>
            <div class="d-flex justify-content-center align-items-center">
                <div class="form-container p-4 col-md-6">
                    <%-- Nombre --%>
                    <div class="form-group ">
                        <label for="txtNombre">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- Apellido --%>
                    <div class="form-group ">
                        <label for="txtApellido">Apellido</label>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- Sexo --%>
                    <div class="form-group ">
                        <label for="txtSexo">Sexo</label>
                        <asp:TextBox ID="txtSexo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="txtSexo" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- Nacionalidad --%>
                    <div class="form-group ">
                        <label for="txtNacionalidad">Nacionalidad</label>
                        <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- Dirección --%>
                    <div class="form-group ">
                        <label for="txtDireccion">Dirección</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- Correo Electrónico --%>
                    <div class="form-group ">
                        <label for="txtCorreo">Correo Electrónico</label>
                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- Teléfono --%>
                    <div class="form-group ">
                        <label for="txtTelefono">Teléfono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- DNI --%>
                    <div class="form-group ">
                        <label for="txtDni">DNI</label>
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%-- Fecha de Nacimiento --%>
                    <div class="form-group ">
                        <label for="txtFecNacimiento">Fecha de Nacimiento</label>
                        <asp:TextBox ID="txtFecNacimiento" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFecNacimiento" runat="server" ControlToValidate="txtFecNacimiento" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <%--Provincia--%>
                    <div class="form-group ">
                        <label for="ddlProvincias">Provincia</label>
                        <asp:DropDownList ID="ddlProvincias" runat="server" class="form-control" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                    </div>
                    <%--Localidad--%>
                    <div class="form-group ">
                        <label for="ddlLocalidad">Localidad</label>
                        <asp:DropDownList ID="ddlLocalidad" runat="server" class="form-control" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="frvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                    </div>
                    <%-- Botones --%>
                    <div class="text-center">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary btn-custom me-3" OnClick="btnAceptar_Click" />
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary btn-custom" OnClick="btnVolver_Click" />
                    </div>
                    <div class="text-center mt-3">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="text-success"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

