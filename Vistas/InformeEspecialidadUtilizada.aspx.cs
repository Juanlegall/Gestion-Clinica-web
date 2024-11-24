using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class informeEspecialidadUtilizada : System.Web.UI.Page
    {
        NegocioTurnos negocioTurnos = new NegocioTurnos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int anioActual = DateTime.Now.Year;
                if (negocioTurnos.obtenerAniosCargados() != null)
                {
                    ddlCiclo.DataSource =negocioTurnos.obtenerAniosCargados();
                    ddlCiclo.DataTextField = "año";
                    ddlCiclo.DataValueField = "año";
                    ddlCiclo.DataBind();
                    ddlCiclo.Items.Insert(0, new ListItem("Seleccione un año", "0"));
                }

            }

        }
        protected string obtenerEspecialidadesMasUtilizadas()
        {
            int anio =int.Parse(ddlCiclo.SelectedValue);

            return negocioTurnos.obtenerDatosEspecialides(anio);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Informes.aspx");
        }

    }
}