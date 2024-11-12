<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarFormularioPaciente.aspx.cs" Inherits="Vistas.EditarFormularioPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
               Fecha Nacimiento
      <asp:TextBox ID="txtFecha" runat="server" class="form-control campo"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha">*</asp:RequiredFieldValidator>

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

            
</div>
             </div>


         <div  class="form-group px-0 d-flex justify-content-center align-items-center col-10" style="margin-bottom: 10px;margin-left: 123px;width: 120px;margin-bottom: 10px;">

             <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" class="btn btn-secondary form-control" />

             <br />
             <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
