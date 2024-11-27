<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeMedicos.aspx.cs" Inherits="Vistas.HomeMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.8/jquery.inputmask.min.js"></script>
    <script>
        function showModal(id) {
            document.getElementById('<%= hfSelectedId.ClientID %>').value = id;
            var modal = new bootstrap.Modal(document.getElementById('observacionModal'));
       
            modal.show();
        }
    </script>
    <style>
    .custom-grid {
        width: 100%; /* Asegura que ocupe el ancho total */
        border-collapse: collapse; /* Quita el espacio entre las celdas */
    }
    .custom-grid th, .custom-grid td {
        text-align: center; /* Centra el texto horizontalmente */
        vertical-align: middle; /* Centra el texto verticalmente */
        padding: 8px; /* Espaciado interno uniforme */
        border: 1px solid #ddd; /* Línea de separación entre celdas */
    }
    .custom-grid th {
        background-color: #f5f5f5; /* Color de fondo para encabezados */
        font-weight: bold; /* Texto en negrita */
    }
    .hidden-column {
        display: none;
    }
    .CerrarSesion{
        position: absolute; 
        top: 10px; 
        right: 10px; 
        z-index: 1000; /* Asegura que el botón esté por encima de otros elementos*/
        border-radius: 15px;
        border: none;
        background-color: red;
        color: aliceblue;
    }
</style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <!-- Encabezado -->
            <asp:Button ID="btnCerrarsesion" runat="server" Text="CERRAR SESION" cssclass="CerrarSesion" OnClick="btnCerrarsesion_Click"/>           
            <div class="mb-4 text-center">
                <h2 class="text-center text-decoration-underline">Pacientes del Médico</h2>
                <asp:Label ID="lblBienvenido" runat="server" CssClass="d-block text-center mt-2 fs-4 fw-bold text-primary"></asp:Label>
               <asp:Label ID="lbl_especialidad" runat="server" CssClass="d-block text-center fs-5"></asp:Label>
            </div>
            <!-- Busqueda -->
            <div class="mb-4">
                <asp:Label ID="lblBuscar" runat="server" Text="Buscar por DNI del paciente"></asp:Label>
                <div class="input-group">
                    <asp:TextBox ID="txtBuscarxDni" runat="server" CssClass="form-control" placeholder="Ingrese DNI"></asp:TextBox>
                    <asp:TextBox ID="txtDesde" runat="server" CssClass="form-control" placeholder="Turnos desde"></asp:TextBox>
                    <script>
                        $(document).ready(function () {
                            $("#<%= txtDesde.ClientID %>").inputmask("9999/99/99", { placeholder: "YYYY/MM/DD" });
                        });
                    </script>
                    <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control" placeholder="Turnos Hasta"></asp:TextBox>
                    <script>
                        $(document).ready(function () {
                            $("#<%= txtHasta.ClientID %>").inputmask("9999/99/99", { placeholder: "YYYY/MM/DD" });
                        });
                    </script>
                    <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" CssClass="btn btn-primary" Text="Filtrar" />
                    <asp:Button ID="btnMostrar" runat="server" OnClick="btnMostrarTodo_Click" CssClass="btn btn-secondary" Text="Mostrar Todo" />
                    <br />
            </div>
                <div class="mb-3">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                </div>

            <!-- TABLA DE PACIENTES -->
            <div class="table-responsive">
    <asp:GridView ID="gvPacientesxMedicos" runat="server" AutoGenerateColumns="False" CssClass="custom-grid">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle CssClass="hidden-column" />
                <ItemStyle CssClass="hidden-column" />
                <ItemTemplate>
                    <asp:HiddenField ID="hfIdTurno" runat="server" Value='<%# Bind("idTurno") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderStyle CssClass="hidden-column" />
                <ItemStyle CssClass="hidden-column" />
                <ItemTemplate>
                    <asp:HiddenField ID="hfIdPaciente" runat="server" Value='<%# Bind("idPaciente") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DNI">
                <ItemTemplate>
                    <asp:Label ID="lblDni" runat="server" Text='<%# Bind("dni") %>' CssClass="label-cell"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Apellido">
                <ItemTemplate>
                    <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("apellido") %>' CssClass="label-cell"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Correo">
                <ItemTemplate>
                    <asp:Label ID="lblCorreo" runat="server" Text='<%# Bind("correo") %>' CssClass="label-cell"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha Turno">
                <ItemTemplate>
                    <asp:Label ID="lblFechaTurno" runat="server" CssClass="label-cell" Text='<%# Eval("FechaTurno", "{0:yyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hora Turno">
                <ItemTemplate>
                    <asp:Label ID="lblHoraConsulta" runat="server" Text='<%# Bind("HoraConsulta") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Observaciones">
                <ItemTemplate>
                    <asp:Button ID="btnObservacion" runat="server" Text="Observacion" OnClientClick='<%# "showModal(" + Eval("idTurno") + "); return false;" %>' />
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

            <!-- Modal de Bootstrap -->
            <div class="modal fade" id="observacionModal" tabindex="-1" aria-labelledby="observacionModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="observacionModalLabel">Agregar Observación</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <asp:HiddenField ID="hfSelectedId" runat="server" />
                            <div class="mb-3">
                                <label for="titulo" class="form-label">Título</label>
                                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="descripcion" class="form-label">Descripción</label>
                                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <asp:Button ID="btnGuardarObservacion" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="GuardarObservacion_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <asp:Label ID="lbl_Observacion" runat="server"></asp:Label>

        </div>
    </form>
</body>
</html>
