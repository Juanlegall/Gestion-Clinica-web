using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Vistas
{
    public partial class AdministracionMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
            NegocioUsuarios ngs = new NegocioUsuarios();
            DataSet dset = new DataSet();
            dset = ngs.obtenerTablaMedicos();
            grdAdministracionMedicos.DataSource = dset;
            grdAdministracionMedicos.DataBind();

            }

        }

        protected void grdAdministracionMedicos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int legajo = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "legajo"));

                // Obtener el DropDownList del horario en esta fila
                DropDownList ddlHorarios = (DropDownList)e.Row.FindControl("ddlHorariosMedicos");
                HiddenField hfMedicoId = (HiddenField)e.Row.FindControl("hfMedicoId");
                int medicoId = Convert.ToInt32(hfMedicoId.Value);

                // Llamar a una función que obtenga los horarios del médico
                NegocioUsuarios ngs = new NegocioUsuarios();

                DataSet ds = ngs.traerDiasHorarios(medicoId);
                ddlHorarios.DataSource = ds.Tables[0];
                ddlHorarios.DataTextField = "DiasHorarios"; // Texto a mostrar en el DropDownList
                ddlHorarios.DataBind();

            }
        }

        protected void grdAdministracionMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                // Obtener el ID de la fila seleccionada
                string idSeleccionado = e.CommandArgument.ToString();

                // Redirigir al formulario de edición con el ID como parámetro
                Response.Redirect($"EditarFormularioMedicos.aspx?id={idSeleccionado}");

            }
        }
    }
}