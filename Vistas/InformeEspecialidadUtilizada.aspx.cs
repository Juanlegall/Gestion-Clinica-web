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
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected string obtenerEspecialidadesMasUtilizadas()
        {
            NegocioTurnos negocioTurnos = new NegocioTurnos();

            return negocioTurnos.obtenerDatosEspecialides();
        }
    }
}