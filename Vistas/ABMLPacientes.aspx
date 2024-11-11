<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABMLPacientes.aspx.cs" Inherits="Vistas.ABMLPacientes" %>

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
            width: 847px;
        }
        .auto-style3 {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>PACIENTES </h1>
            <h4>Buscar por DNI:&nbsp;
                <asp:TextBox ID="txtBuscarPaciente" runat="server" Width="504px"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp; 
                <asp:Label ID="lblMensaje" runat="server" CssClass="auto-style3"></asp:Label>
                <asp:Button ID="btnMostrar" runat="server" OnClick="btnMostrar_Click" Text="Mostrar Todo" />
            </h4>
            <p>
                <asp:GridView ID="grdVPacientes" runat="server" AutoGenerateColumns="False" OnRowCommand="grdVPacientes_RowCommand" DataKeyNames="idPaciente" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1019px"> 

                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="DNI">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Dni" runat="server" Text='<%# Bind("dni") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Apellido" runat="server" Text='<%# Bind("apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sexo">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Sexo" runat="server" Text='<%# Bind("sexo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nacionalidad">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Nacionalidad" runat="server" Text='<%# Bind ("nacionalidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Localidad" runat="server" Text='<%# Bind("Localidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Direccion">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Direccion" runat="server" Text='<%# Bind("direccion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Correo">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Correo" runat="server" Text='<%# Bind("correo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Telefono" runat="server" Text='<%# Bind("telefono") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fec Nacimiento">
                             <ItemTemplate>
                                 <asp:Label ID="lbl_fecNacimiento" runat="server" Text='<%# Bind ("fechaNacimiento") %>'></asp:Label>
 </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" CommandArgument='<%# Eval("idPaciente") %>' CommandName="Editar" Text="Editar" />
                                &nbsp;
                                <!-- Espacio entre los botones -->
                                <asp:Button ID="btnEliminar" runat="server" CommandArgument='<%# Eval("idPaciente") %>' CommandName="Eliminar" OnClientClick="return confirm('¿Estás seguro que deseas eliminar este paciente?');" Text="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </p>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
        <asp:Button ID="btn_AltaPaciente" runat="server" OnClick="btn_AltaPaciente_Click" Text="ALTA " />
                </td>
                <td>
                    <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="VOLVER" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
