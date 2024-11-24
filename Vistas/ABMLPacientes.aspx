<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABMLPacientes.aspx.cs" Inherits="Vistas.ABMLPacientes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Pacientes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h1 class="text-center mb-4"> Administracion Pacientes</h1>

            <!-- Buscador -->
            <div class="row mb-3">
                <div class="col-md-8">
                    <asp:TextBox ID="txtBuscarPaciente" runat="server" CssClass="form-control" placeholder="Buscar por DNI"></asp:TextBox>
                </div>
                <div class="col-md-4 d-flex">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary me-2" Text="Buscar" OnClick="btnBuscar_Click" />
                    <asp:Button ID="btnMostrar" runat="server" CssClass="btn btn-secondary" Text="Mostrar Todo" OnClick="btnMostrar_Click" />
                </div>
            </div>

            <!-- Mensaje -->
            <div class="mb-3">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <!-- GridView -->
            <asp:GridView ID="grdVPacientes" runat="server" AutoGenerateColumns="False"
                CssClass="table table-bordered table-striped" DataKeyNames="idPaciente"
                OnRowCommand="grdVPacientes_RowCommand">
                <Columns>
                    <asp:BoundField DataField="dni" HeaderText="DNI" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="sexo" HeaderText="Sexo" />
                    <asp:BoundField DataField="nacionalidad" HeaderText="Nacionalidad" />
                    <asp:BoundField DataField="localidad" HeaderText="Localidad" />
                    <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="correo" HeaderText="Correo" />
                    <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                    <asp:BoundField DataField="fechaNacimiento" HeaderText="Fec. Nacimiento" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="d-inline-flex align-items-center">
                                <!-- Botón Editar -->
                                <asp:Button
                                    ID="btnEditar"
                                    runat="server"
                                    CssClass="btn btn-primary btn-sm me-2"
                                    CommandArgument='<%# Eval("idPaciente") %>'
                                    CommandName="Editar"
                                    Text="Editar" />

                                <!-- Botón Eliminar -->
                                <asp:Button
                                    ID="btnEliminar"
                                    runat="server"
                                    CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("idPaciente") %>'
                                    CommandName="Eliminar"
                                    OnClientClick="return confirm('¿Estás seguro que deseas eliminar este paciente?');"
                                    Text="Eliminar" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Botones de acción -->
            <div class="d-flex justify-content-between mt-4">
                <asp:Button ID="btn_AltaPaciente" runat="server" CssClass="btn btn-success" OnClick="btn_AltaPaciente_Click" Text="ALTA PACIENTES" />
                <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-secondary" OnClick="btnVolver_Click" Text="VOLVER" />
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
