<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarFormularioPaciente.aspx.cs" Inherits="Vistas.EditarFormularioPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.8/jquery.inputmask.min.js"></script>
    <style type="text/css">
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
                <h1>Editar Formulario Pacientes</h1>
            </div>
            <div class="d-flex justify-content-center align-items-center">
                <div class="form-container p-4 col-md-6">
                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre">*</asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Apellido</label>
                        <asp:TextBox ID="txtApellido" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido">*</asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Sexo</label>
                        <asp:TextBox ID="txtSexo" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="txtSexo">*</asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Nacionalidad</label>
                        <asp:TextBox ID="txtNacionalidad" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad">*</asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Direccion</label>
                        <asp:TextBox ID="txtDireccion" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion">*</asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Correo electronico</label>
                        <asp:TextBox ID="txtCorreo" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo">*</asp:RequiredFieldValidator>

                    </div>



                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Telefono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono">*</asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group ">
                        Fecha Nacimiento
                        <asp:TextBox ID="txtFecha" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha">*</asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Dni</label>
                        <asp:TextBox ID="txtDni" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni">*</asp:RequiredFieldValidator>


                    </div>

                    <div class="form-group ">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Provincia</label>
                        <asp:DropDownList ID="ddlProvincias" runat="server" class="form-control campo">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>


                    </div>


                    <div class="form-group">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Localidad</label>
                        <asp:DropDownList ID="ddlLocalidad" runat="server" class="form-control campo">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="frvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                    </div>

                    <%-- Botones --%>
                    <div class="text-center">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary btn-custom me-3" OnClick="btnAceptar_Click" />
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary btn-custom" ValidationGroup="none" />
                    </div>
                    <div class="text-center mt-3">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
