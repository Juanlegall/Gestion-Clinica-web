using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;


namespace Vistas
{
    public partial class Informes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback)
            {
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("InformeTurnosPresentismo.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("InformeEspecialidadUtilizada.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdministradores.aspx");

        }
    }
}