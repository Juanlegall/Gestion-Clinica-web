using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class InformeTurnosPresentismo : System.Web.UI.Page
    {
        NegocioTurnos negocioTurnos = new NegocioTurnos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int anioActual = DateTime.Now.Year;
                if (negocioTurnos.obtenerAniosCargados() != null)
                {
                    /* Cargar ddl Ciclo*/
                    ddlCiclo.DataSource = negocioTurnos.obtenerAniosCargados();
                    ddlCiclo.DataTextField = "año";
                    ddlCiclo.DataValueField = "año";
                    ddlCiclo.DataBind();
                    ddlCiclo.Items.Insert(0, new ListItem("Seleccione un año", "0"));

                }

            }
        }

        protected string obtenerDatosTurnos()
        {
            int anio = int.Parse(ddlCiclo.SelectedValue);
            return negocioTurnos.obtenerDatosPresentismo(anio);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Informes.aspx");
        }
    }
}