using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;

            NegocioUsuarios ng_usuarios = new NegocioUsuarios();
            if (ng_usuarios.verificarUsuario(usuario) == true)
            {
                bool resultado = ng_usuarios.verificarContraseña(usuario, contraseña);
                if (resultado == true)
                {
                    lblMensaje.Text = "Usuario ingresado con exito";
                    (string nombre, int id) =  ng_usuarios.traerNombre_Rol(usuario, contraseña);

                    Session["NombreUsuario"] = nombre;

                    if(id == 2)
                    {
                    Response.Redirect("HomeMedicos.aspx");
                    }
                    else
                    {
                    Response.Redirect("HomeAdministradores.aspx");

                    }


                }
                else
                {
                    lblMensaje.Text = "Contraseña incorrecta";

                }
            }
            else
            {
                lblMensaje.Text = "Usuario incorrecto";

            }


          

        }
    }
}