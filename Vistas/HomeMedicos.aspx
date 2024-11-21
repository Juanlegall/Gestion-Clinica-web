<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeMedicos.aspx.cs" Inherits="Vistas.HomeMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            <asp:Button ID="btnMostrarTodo" runat="server" OnClick="btnMostrarTodo_Click" Text="Mostrar Todo" />
            <br />
            <asp:Label ID="lblBuscar" runat="server" Text="Buscar por DNI del paciente"></asp:Label>
            <asp:TextBox ID="txtBuscarxDni" runat="server"></asp:TextBox>
            <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="FIltrar" />
        </div>
        <div>
         <asp:GridView ID="gvPacientesxMedicos" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hfIdPaciente" runat="server" Value='<%# Bind("idPaciente") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DNI">
                <ItemTemplate>
                    <asp:Label ID="lblDni" runat="server" Text='<%# Bind("dni") %>'></asp:Label>
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
            <asp:TemplateField HeaderText="Genero">
                <ItemTemplate>
                    <asp:Label ID="lblSexo" runat="server" Text='<%# Bind("sexo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nacionalidad">
                <ItemTemplate>
                    <asp:Label ID="lblNacionalidad" runat="server" Text='<%# Bind("nacionalidad") %>'></asp:Label>
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
            <asp:TemplateField HeaderText="Direccion">
                <ItemTemplate>
                    <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("direccion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha Nacimiento">
                <ItemTemplate>
                    <asp:Label ID="lblNacimiento" runat="server" Text='<%# Eval("fechaNacimiento", "{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Correo">
                <ItemTemplate>
                    <asp:Label ID="lblCorreo" runat="server" Text='<%# Bind("correo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono">
                <ItemTemplate>
                    <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("telefono") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Observaciones">
                <ItemTemplate>
                    <asp:Button ID="btnObservacion" runat="server" Text="Observacion" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Presente">
                <ItemTemplate>
                    <asp:CheckBox ID="chkPresente" runat="server" Checked='<%# Bind("realizado") %>' OnCheckedChanged="chkPresente_CheckedChanged" AutoPostBack="True" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

    </form>
</body>
</html>
