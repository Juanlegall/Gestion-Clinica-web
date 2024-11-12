<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABMLMedicos.aspx.cs" Inherits="Vistas.AdministracionMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 741px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Administracion Medicos"></asp:Label>

            <asp:Panel ID="Panel1" runat="server" Height="30px">
                Buscar :
                <asp:TextBox ID="txtLegajo" runat="server" placeholder="Legajo" style="height: 25px;"></asp:TextBox>
                <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido" style="height: 25px;"></asp:TextBox>
                <asp:DropDownList ID="ddlEspecialidades" runat="server" InitialValue="Seleccionar" style="height: 31px;">
                </asp:DropDownList>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" style="height: 31px;"/>

                <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" style="height: 31px;" />

            </asp:Panel>



            <br />
            <br />
                        <asp:GridView ID="grdAdministracionMedicos" runat="server" AutoGenerateColumns="False" 
              OnRowCommand="grdAdministracionMedicos_RowCommand" OnRowDataBound="grdAdministracionMedicos_RowDataBound"
              DataKeyNames="idMedico">
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
        <asp:TemplateField HeaderText="Dias_Horarios">
            <ItemTemplate>
                <asp:DropDownList ID="ddlHorariosMedicos" runat="server">
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("idMedico") %>' />
                &nbsp;  <!-- Espacio entre los botones -->
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("idMedico") %>' OnClientClick="return confirm('¿Estás seguro que deseas eliminar este médico?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
            <br />
            <br />
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
            <asp:Button ID="btn_AltaMedicos" runat="server" OnClick="btn_AltaMedicos_Click" Text="ALTA MEDICOS" />
                </td>
                <td>
                    <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
