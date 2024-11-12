<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarFormularioMedicos.aspx.cs" Inherits="Vistas.EditarFormularioMedicos"  UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

    <style type="text/css">
        .auto-style1 {
            width: 298px;
        }
        .auto-style2 {
            width: 509px;
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

           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Provincia</label>
               <asp:DropDownList ID="ddlProvincias" runat="server"  class="form-control campo">
                </asp:DropDownList>
     <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>

            
</div>
         
         
           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Localidad</label>
               <asp:DropDownList ID="ddlLocalidad" runat="server"  class="form-control campo">
                </asp:DropDownList>
     <asp:RequiredFieldValidator ID="frvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>

            
</div>


         
           <div class="form-group px-0 d-flex justify-content-center align-items-center col-6" style="margin-bottom: 10px;">
      <label for="sexo" class="col-4 text-start" style="margin-right: 10px;">Especialidad</label>
               <asp:DropDownList ID="ddlEspecialidad" runat="server"  class="form-control campo">
                </asp:DropDownList>
     <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" InitialValue="Seleccionar">*</asp:RequiredFieldValidator>

            
</div>
             </div>


         <div  class="form-group px-0 d-flex justify-content-center align-items-center col-10" style="margin-bottom: 10px;margin-left: 123px;width: 120px;margin-bottom: 10px;">

             

        </div>
             <br />
    </div>

</div>
        </div>

        <table class="w-100">
            <tr>
                <td class="auto-style1">
             <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">

             <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" class="btn btn-secondary form-control" OnClick="btnAceptar_Click" Width="172px" />

             

                </td>
                <td>
                    <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" ValidationGroup="none" />
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
