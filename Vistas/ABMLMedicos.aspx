<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABMLMedicos.aspx.cs" Inherits="Vistas.AdministracionMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Administración Médicos</title>
    <!-- Incluir Bootstrap para usar sus estilos -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <!-- Título -->
            <h1 class="text-center mb-4">Administración Médicos</h1>

            <!-- Panel de búsqueda -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:TextBox ID="txtLegajo" runat="server" CssClass="form-control" placeholder="Legajo"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlEspecialidades" runat="server" CssClass="form-select" InitialValue="Seleccionar"></asp:DropDownList>
                </div>
                <div class="col-md-3 d-flex">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary me-2" Text="Buscar" OnClick="btnBuscar_Click" />
                    <asp:Button ID="btnMostrar" runat="server" CssClass="btn btn-secondary" Text="Mostrar Todo" OnClick="btnMostrarTodos_Click" />
                </div>
            </div>

            <!-- Mensaje -->
            <div class="mb-3">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <!-- GridView -->
            <div class="table-responsive">
                <asp:GridView ID="grdAdministracionMedicos" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-bordered table-striped" DataKeyNames="idMedico"
                    OnRowCommand="grdAdministracionMedicos_RowCommand" OnRowDataBound="grdAdministracionMedicos_RowDataBound" AllowPaging="True" OnPageIndexChanging="grdAdministracionMedicos_PageIndexChanging" PageSize="5">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HiddenField ID="hfMedicoId" runat="server" Value='<%# Bind("idMedico") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Legajo">
                            <ItemTemplate>
                                <asp:Label ID="lblLegajo" runat="server" Text='<%# Bind("legajo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Provincia">
                            <ItemTemplate>
                                <asp:Label ID="lblProvincia" runat="server" Text='<%# Bind("provincia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <ItemTemplate>
                                <asp:Label ID="lblLocalidad" runat="server" Text='<%# Bind("localidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Especialidad">
                            <ItemTemplate>
                                <asp:Label ID="lblEspecialidad" runat="server" Text='<%# Bind("especialidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Días y Horarios">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlHorariosMedicos" runat="server" CssClass="form-select"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-warning btn-sm me-2" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("idMedico") %>' />
                                <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-danger btn-sm" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("idMedico") %>' OnClientClick="return confirm('¿Estás seguro que deseas eliminar este médico?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Botones de acción -->
            <div class="d-flex justify-content-between mt-4">
                <asp:Button ID="btn_AltaMedicos" runat="server" CssClass="btn btn-success" OnClick="btn_AltaMedicos_Click" Text="ALTA MEDICOS" />
                <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-secondary" OnClick="btnVolver_Click" Text="VOLVER" />
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

