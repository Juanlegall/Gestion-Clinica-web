using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ABMLPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NegocioPacientes ngsP = new NegocioPacientes();
                DataSet dset = new DataSet();
                dset = ngsP.ObtenerTablaPacientes();
                grdVPacientes.DataSource = dset;
                grdVPacientes.DataBind();

            }
        }

        protected void btn_AltaPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaPaciente.aspx");
        }
    }
}