<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="Vistas.AltaMedico"  UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <%--Bootstrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function handleImageError(image) {
            image.onerror = null; // prevents looping
            image.src = 'https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg';
        }
        /*habilitar boton de carga de horario*/
        function habilitarBoton() {
            // Habilitar el botón
            document.getElementById('btnHorarios').disabled = false;
        }
        
    </script>


    <style type="text/css">
        /*.auto-style1 {
            width: 120px;
        }
        .auto-style2 {
            width: 552px;
        }
        .auto-style3 {
            width: 45px;
        }
        .auto-style4 {
            width: 46px;
        }
        .auto-style5 {
            width: 47px;
        }
        .auto-style11 {
            width: 99%;
        }*/
        </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

        <div class="container">
            <div class="row">
                <%--Titulo--%>
                <div class="text-center" >
                    <label class="h1">ALTA MEDICOS</label>
                    <br /><br /><br />  
                </div>
                <div>
                    <%--Nombre--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Apellido--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Apellido</label>
                        <asp:TextBox ID="txtApellido" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Sexo--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Sexo</label>
                        <asp:DropDownList ID="ddlSexo" runat="server" class="form-control campo"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" InitialValue="Seleccione un sexo">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Nacionalidad--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Nacionalidad</label>
                        <asp:TextBox ID="txtNacionalidad" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Domicilio--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Domicilio</label>
                        <asp:TextBox ID="txtDireccion" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Email--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Correo electronico</label>
                        <asp:TextBox ID="txtCorreo" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Telefono--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Telefono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Legajo--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Legajo</label>
                        <asp:TextBox ID="txtLegajo" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--DNI--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">DNI</label>
                        <asp:TextBox ID="txtDni" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Usuario--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Usuario</label>
                        <asp:TextBox ID="txtUsuario" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Contraseña--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Contraseña</label>
                        <asp:TextBox ID="txtContraseña" runat="server" class="form-control campo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Provincia--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Provincia</label>
                        <asp:DropDownList ID="ddlProvincias" runat="server" class="form-control campo" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Localidad--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Localidad</label>
                        <asp:DropDownList ID="ddlLocalidad" runat="server" class="form-control campo" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="frvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <%--Especialidad--%>
                    <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                        <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Especialidad</label>
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" class="form-control campo"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <br />
               
                <%--Botones del formulario--%>
                <table class="w-100">
                        <tr>
                            <td class="auto-style3">
                                <br /><br /><br />
                            </td>
                            <td class="auto-style4">
                                <asp:Button ID="btnAceptar" runat="server" Text="Cargar" class="btn btn-secondary form-control" OnClick="btnAceptar_Click" Width="141px" />
                            </td>
                            <td class="auto-style5">
                                <asp:Button ID="btnVolver" runat="server" class="btn btn-secondary form-control" OnClick="btnVolver_Click" Text="Cancelar" ValidationGroup="none" Width="141px"  />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Label ID="lblMensaje" runat="server"></asp:Label>

                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

                 <%--linea--%>
                <hr style="border: none;height: 2px; background-color: #4CAF50;"/>

                <div>
                    <div class="form-group px-0 d-flex justify-content-lg-start align-items-center col-6" style="margin-bottom: 10px ;">
                        <p class="text-body-secondary"> 
                            (El boton se habilitara una vez que la carga del medico se haya realizado efectivamente)
                        </p>
                    </div>
                </div>

                <div>
                    <%--Horarios de atencion--%>
                    <div class="form-group px-0 d-flex justify-content-lg-start align-items-center col-6" style="margin-bottom: 10px;">
                        <label class="col-4 text-start" style="margin-right: 10px;">Horarios de atención:&nbsp;&nbsp;&nbsp; </label>

                        <%--Cargar Horarios--%>
                        <button class="btn btn-primary" type="button" id="btnHorarios" disabled="disabled" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                            Cargar Horarios
                        </button>

                        <%--Offcanvas--%>
                        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                            <div class="offcanvas-header">
                                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Carga de horarios</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                            </div>
                            <div class="offcanvas-body">

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Dias</th>
                                            <th scope="col">Entrada</th>
                                            <th scope="col">Salida</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%--Lunes--%>
                                        <tr>
                                            <th scope="row">
                                                <asp:CheckBox ID="chkLunes" runat="server" />
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Lunes
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEntradaLunes" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revEntradaLunes"
                                                    runat="server"
                                                    ControlToValidate="txtEntradaLunes"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSalidaLunes" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revSalidaLunes"
                                                    runat="server"
                                                    ControlToValidate="txtSalidaLunes"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>

                                            </td>
                                        </tr>
                                        <%--Martes--%>
                                        <tr>
                                            <th scope="row">
                                                <asp:CheckBox ID="chkMartes" runat="server" />
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Martes
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEntradaMartes" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revEntradaMartes"
                                                    runat="server"
                                                    ControlToValidate="txtEntradaMartes"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSalidaMartes" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revSalidaMartes"
                                                    runat="server"
                                                    ControlToValidate="txtSalidaMartes"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <%--Miercoles--%>
                                        <tr>
                                            <th scope="row">
                                                <asp:CheckBox ID="chkMiercoles" runat="server" />
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Miercoles
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEntradaMiercoles" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revEntradaMiercoles"
                                                    runat="server"
                                                    ControlToValidate="txtEntradaMiercoles"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSalidaMiercoles" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revSalidaMiercoles"
                                                    runat="server"
                                                    ControlToValidate="txtSalidaMiercoles"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <%--Jueves--%>
                                        <tr>
                                            <th scope="row">
                                                <asp:CheckBox ID="chkJueves" runat="server" />
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Jueves
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEntradaJueves" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revEntradaJueves"
                                                    runat="server"
                                                    ControlToValidate="txtEntradaJueves"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSalidaJueves" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revSalidaJueves"
                                                    runat="server"
                                                    ControlToValidate="txtSalidaJueves"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <%--Viernes--%>
                                        <tr>
                                            <th scope="row">
                                                <asp:CheckBox ID="chkViernes" runat="server" />
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Viernes
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEntradaViernes" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revEntradaViernes"
                                                    runat="server"
                                                    ControlToValidate="txtEntradaViernes"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSalidaViernes" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revSalidaViernes"
                                                    runat="server"
                                                    ControlToValidate="txtSalidaViernes"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <%--Sabado--%>
                                        <tr>
                                            <th scope="row">
                                                <asp:CheckBox ID="chkSabado" runat="server" />
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Sabado
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEntradaSabado" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revEntradaSabado"
                                                    runat="server"
                                                    ControlToValidate="txtEntradaSabado"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSalidaSabado" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revSalidaSabado"
                                                    runat="server"
                                                    ControlToValidate="txtSalidaSabado"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <%--Domingo--%>
                                        <tr>
                                            <th scope="row">
                                                <asp:CheckBox ID="chkDomingo" runat="server" />
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Domingo
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEntradaDomingo" runat="server" Width="50px" />
                                                <asp:RegularExpressionValidator
                                                    ID="revEntradaDomingo"
                                                    runat="server"
                                                    ControlToValidate="txtEntradaDomingo"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSalidaDomingo" runat="server" Width="50px" /><asp:RegularExpressionValidator
                                                    ID="revSalidaDomingo"
                                                    runat="server"
                                                    ControlToValidate="txtSalidaDomingo"
                                                    ErrorMessage="Formato de hora no válido. Use HH:mm"
                                                    ValidationExpression="^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                                
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <asp:Button runat="server" ID="btnCargarHorario" OnClick="btnCargarHorario_Click" Text="Cargar" CssClass="btn btn-success"></asp:Button>

                                <button type="button" data-bs-dismiss="offcanvas" aria-label="Close" class="btn btn-danger" >Cancelar</button>
                            </div>

                        </div>
                        <br />
                    </div>



                </div>

                    <br /><br /><br />

                    
            </div>
        </div>
            
    </form>
</body>
</html>
