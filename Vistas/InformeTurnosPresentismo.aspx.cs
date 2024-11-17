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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string obtenerDatosTurnos()
        {
            NegocioTurnos negocioTurnos = new NegocioTurnos();

            return negocioTurnos.obtenerDatosPresentismo();
        }
    }
}