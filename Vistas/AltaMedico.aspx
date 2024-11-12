<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="Vistas.AltaMedico"  UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

    <style type="text/css">
        .auto-style1 {
            width: 120px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="col-12 row">

     <div class="col-1">

     </div>

<div class="col-8" style="margin-top:35px;">

     <div style="margin-top: 60px;">

           <div>


         <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
            <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Nombre</label>
            <asp:TextBox ID="txtNombre" runat="server" class="form-control campo"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre">*</asp:RequiredFieldValidator>
        </div>

          <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
            <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Apellido</label>
            <asp:TextBox ID="txtApellido" runat="server" class="form-control campo"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido">*</asp:RequiredFieldValidator>
        </div>

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Sexo</label>
                 <asp:TextBox ID="txtSexo" runat="server" class="form-control campo"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="txtSexo" >*</asp:RequiredFieldValidator>
           </div>

          <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
              <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Nacionalidad</label>
              <asp:TextBox ID="txtNacionalidad" runat="server" class="form-control campo"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad">*</asp:RequiredFieldValidator>

        </div>

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Direccion</label>
      <asp:TextBox ID="txtDireccion" runat="server" class="form-control campo"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion">*</asp:RequiredFieldValidator>

</div>

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Correo electronico</label>
      <asp:TextBox ID="txtCorreo" runat="server" class="form-control campo"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo">*</asp:RequiredFieldValidator>

</div>
         </div>


         <div>

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Telefono</label>
      <asp:TextBox ID="txtTelefono" runat="server" class="form-control campo"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono">*</asp:RequiredFieldValidator>

</div>

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Legajo</label>
      <asp:TextBox ID="txtLegajo" runat="server" class="form-control campo"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo">*</asp:RequiredFieldValidator>

</div>

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Dni</label>
      <asp:TextBox ID="txtDni" runat="server" class="form-control campo"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni">*</asp:RequiredFieldValidator>

            
</div>
             <div  class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                 <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Usuario</label>
                  <asp:TextBox ID="txtUsuario" runat="server" class="form-control campo"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario">*</asp:RequiredFieldValidator>

             </div>

             <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Contraseña</label>
                 <asp:TextBox ID="txtContraseña" runat="server" class="form-control campo"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña">*</asp:RequiredFieldValidator>
            </div>

             <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
                 <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Rol</label>
                 <asp:DropDownList ID="ddlRol" runat="server"  class="form-control campo"> </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="rfvRol" runat="server" ControlToValidate="ddlProvincias" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>


             </div>

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Provincia</label>
               <asp:DropDownList ID="ddlProvincias" runat="server"  class="form-control campo" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
                </asp:DropDownList>
     <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>

            
</div>
         
         
           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Localidad</label>
               <asp:DropDownList ID="ddlLocalidad" runat="server"  class="form-control campo" AutoPostBack="True">
                </asp:DropDownList>
     <asp:RequiredFieldValidator ID="frvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>

            
</div>


         
           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Especialidad</label>
               <asp:DropDownList ID="ddlEspecialidad" runat="server"  class="form-control campo">
                </asp:DropDownList>
     <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>
               </div>
                              <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Dia</label>
               <asp:TextBox ID="txtdias" runat="server"  class="form-control campo">
                </asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvDias" runat="server" ControlToValidate="txtdias" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>

            
</div>
             <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
   <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Desde</label>
    <asp:TextBox ID="txtDesde" runat="server" class="form-control campo"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvDesde" runat="server" ControlToValidate="txtDesde">*</asp:RequiredFieldValidator>
             </div>
                       <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
<label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Hasta</label>
 <asp:TextBox ID="txtHasta" runat="server" class="form-control campo"></asp:TextBox>
 <asp:RequiredFieldValidator ID="rfvHasta" runat="server" ControlToValidate="txtHasta">*</asp:RequiredFieldValidator>
          </div>      
</div>
             </div>


       
    </div>


</div>
        </div>

        <table class="w-100">
    <tr>
        <td class="auto-style3"></td>
        <td class="auto-style4">

     <asp:Button ID="Button1" runat="server" Text="Aceptar" class="btn btn-secondary form-control" OnClick="btnAceptar_Click" Width="141px" />

        </td>
        <td class="auto-style5">
            <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" ValidationGroup="none" />
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

    </form>
</body>
</html>
