using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class HomeAdministradores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] != null)
            {
                string nombre = Session["NombreUsuario"].ToString();
                lblMensaje.Text = "Bienvenido, " + nombre;
            }
            else
            {
                // Si no hay sesión, redirigir al login
                Response.Redirect("Login.aspx");
            }

        }
    }
}