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
        private void RecargarDatosGridView()
        {
            // Instanciamos la capa de negocio
            NegocioPacientes np = new NegocioPacientes();

            // Obtenemos los datos actualizados
            DataSet dset = np.ObtenerTablaPacientes();

            // Asignamos los datos al GridView
            grdVPacientes.DataSource = dset;

            // Volvemos a hacer el binding de los datos
            grdVPacientes.DataBind();
        }
        

        protected void grdVPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                // Obtener el ID de la fila seleccionada
                string idSeleccionado = e.CommandArgument.ToString();

                // Redirigir al formulario de edición con el ID como parámetro
                Response.Redirect($"EditarFormularioMedico.aspx?id={idSeleccionado}");

            }
            else if (e.CommandName == "Eliminar")
            {
                // Obtener el ID del médico desde el CommandArgument
                int idPaciente = Convert.ToInt32(e.CommandArgument);

                // Crear una instancia de la capa de negocio para eliminar al médico
                NegocioPacientes np = new NegocioPacientes();
                bool eliminado = np.EliminarPaciente(idPaciente);

                if (eliminado)
                {
                    // Si la eliminación fue exitosa, recargar los datos en el GridView
                    RecargarDatosGridView();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Paciente eliminado correctamente.');", true);
                }
                else
                {
                    // Si no se pudo eliminar, mostrar un mensaje de error
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No se pudo eliminar el paciente.');", true);
                }
            }
        }
    }
}