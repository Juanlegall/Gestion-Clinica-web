using Entidades;
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
            RecargarDatosGridView();
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
                Response.Redirect($"EditarFormularioPaciente.aspx?id={idSeleccionado}");

            }
            else if (e.CommandName == "Eliminar")
            {
                // Obtener el ID del paciente desde el CommandArgument
                int idPaciente = Convert.ToInt32(e.CommandArgument);

                // Crear una instancia de la capa de negocio para eliminar al paciente
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

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdministradores.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string dni = txtBuscarPaciente.Text.Trim();

            
            NegocioPacientes negocio = new NegocioPacientes();
            DataSet dsPacientes = negocio.ObtenerPacientesPorDni(dni);

            // Verificar si hay resultados y mostrar en el GridView
            if (dsPacientes.Tables[0].Rows.Count > 0)
            {
                grdVPacientes.DataSource = dsPacientes;
                grdVPacientes.DataBind();
                txtBuscarPaciente.Text = "";
                lblMensaje.Text = "";
            }
            else
            {
                lblMensaje.Text = "No se encontraron pacientes con ese DNI.";
                grdVPacientes.DataSource = null;
                grdVPacientes.DataBind();
                txtBuscarPaciente.Text = "";
            }
        }

        protected void btnMostrar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            RecargarDatosGridView();
        }

        protected void grdVPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdVPacientes.PageIndex = e.NewPageIndex;

            RecargarDatosGridView();
        }
    }
}