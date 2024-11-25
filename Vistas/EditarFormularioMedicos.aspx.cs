using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using Negocio;

namespace Vistas
{
    public partial class EditarFormularioMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProvincias();
                CargarEspecialidades();

                // Verifica si estamos editando un médico existente
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id) && id != "0")
                {
                    CargarDatosMedico(id);
                }
            }
        }

        private void CargarProvincias()
        {
            NegocioPacientes np = new NegocioPacientes();
            DataTable provincias = np.ObtenerProvincias();

            if (provincias != null && provincias.Rows.Count > 0)
            {
                ddlProvincias.DataSource = provincias;
                ddlProvincias.DataTextField = "nombre_provincia"; // Campo que muestra el nombre
                ddlProvincias.DataValueField = "id_provincia"; // Campo con el ID
                ddlProvincias.DataBind();
                ddlProvincias.Items.Insert(0, new ListItem("Seleccione una provincia", "0"));
            }
            else
            {
                lblMensaje.Text = "No se encontraron provincias.";
            }
        }

        private void CargarLocalidades(int idProvincia)
        {
            NegocioPacientes nl = new NegocioPacientes();
            DataTable localidades = nl.ObtenerLocalidades(idProvincia);

            if (localidades != null && localidades.Rows.Count > 0)
            {
                ddlLocalidad.DataSource = localidades;
                ddlLocalidad.DataTextField = "nombre_localidad"; // Campo que muestra el nombre
                ddlLocalidad.DataValueField = "id_localidad"; // Campo con el ID
                ddlLocalidad.DataBind();
                ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad", "0"));
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("No hay localidades disponibles", "0"));
            }
        }

        private void CargarDatosMedico(string id)
        {
            NegocioUsuarios ngs = new NegocioUsuarios();
            DataSet datosMedicos = ngs.obtenerDatosMedicos(id);

            if (datosMedicos.Tables[0].Rows.Count > 0)
            {
                DataRow row = datosMedicos.Tables[0].Rows[0];

                txtNombre.Text = row["nombre"].ToString();
                txtApellido.Text = row["apellido"].ToString();
                txtSexo.Text = row["sexo"].ToString();
                txtNacionalidad.Text = row["nacionalidad"].ToString();
                txtDireccion.Text = row["direccion"].ToString();
                txtCorreo.Text = row["correo_electronico"].ToString();
                txtTelefono.Text = row["telefono"].ToString();
                txtLegajo.Text = row["legajo"].ToString();
                txtDni.Text = row["dni"].ToString();

                int idProvincia = int.Parse(row["idProvincia"].ToString());
                ddlProvincias.SelectedValue = idProvincia.ToString();

                // Cargar localidades según la provincia del médico
                CargarLocalidades(idProvincia);


                int idLocalidad = int.Parse(row["idLocalidad"].ToString());
                ddlLocalidad.SelectedValue = idLocalidad.ToString();
                
            }
        }


        private void CargarEspecialidades()
        {
            NegocioEspecialidades ngcioEspecialiades = new NegocioEspecialidades();
            DataSet especialidades = ngcioEspecialiades.obtenerEspecialidades();

            if (especialidades != null && especialidades.Tables[0].Rows.Count > 0)
            {
                ddlEspecialidad.DataSource = especialidades.Tables[0];
                ddlEspecialidad.DataTextField = "especialidad";
                ddlEspecialidad.DataValueField = "id_especialidad";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
            }
            else
            {
                lblMensaje.Text = "No se encontraron provincias.";
            }
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia = int.Parse(ddlProvincias.SelectedValue);

            if (idProvincia > 0)
            {
                CargarLocalidades(idProvincia);
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una provincia primero", "0"));
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            NegocioUsuarios ngs = new NegocioUsuarios();

            bool actualizado = ngs.medicoEditado(
                id,
                ddlEspecialidad.SelectedValue,
                ddlProvincias.SelectedValue,
                ddlLocalidad.SelectedValue,
                txtNombre.Text,
                txtApellido.Text,
                txtSexo.Text,
                txtNacionalidad.Text,
                txtDireccion.Text,
                txtCorreo.Text,
                txtTelefono.Text,
                txtLegajo.Text,
                txtDni.Text
            );

            lblMensaje.Text = actualizado ? "Médico modificado correctamente" : "Hubo un error al modificar el médico";
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMLMedicos.aspx");
        }

       
    }
}