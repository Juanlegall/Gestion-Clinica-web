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
    public partial class AltaPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProvincias();
            }
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProvincias.SelectedValue != "0")
            {
                int idProvincia = int.Parse(ddlProvincias.SelectedValue);
                CargarLocalidades(idProvincia);
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad", "0"));
            }
        }

        private void CargarProvincias()
        {
            NegocioPacientes negocioPaciente = new NegocioPacientes();
            DataTable provincias = negocioPaciente.ObtenerProvincias();
            if (provincias != null && provincias.Rows.Count > 0)
            {
                ddlProvincias.DataSource = provincias;
                ddlProvincias.DataTextField = "nombre_provincia";
                ddlProvincias.DataValueField = "id_provincia";
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
            NegocioPacientes negocioPaciente = new NegocioPacientes();
            DataTable localidades = negocioPaciente.ObtenerLocalidades(idProvincia);
            if (localidades != null && localidades.Rows.Count > 0)
            {
                ddlLocalidad.DataSource = localidades;
                ddlLocalidad.DataTextField = "nombre_localidad";
                ddlLocalidad.DataValueField = "id_localidad";
                ddlLocalidad.DataBind();
                ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad", "0"));
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("No hay localidades disponibles", "0"));
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            NegocioPacientes ngPaciente = new NegocioPacientes();

            if (ddlProvincias.SelectedValue == "0" || ddlLocalidad.SelectedValue == "0")
            {
                lblMensaje.Text = "Seleccione una provincia y localidad.";
                return;
            }

            int idProvincia = int.Parse(ddlProvincias.SelectedValue);
            int idLocalidad = int.Parse(ddlLocalidad.SelectedValue);
            string dni = txtDni.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string sexo = txtSexo.Text;
            string nacionalidad = txtNacionalidad.Text;
            string direccion = txtDireccion.Text;
            string correo = txtCorreo.Text;
            string telefono = txtTelefono.Text;

            DateTime fechaNacimiento;
            if (!DateTime.TryParse(txtFecNacimiento.Text, out fechaNacimiento))
            {
                lblMensaje.Text = "Ingrese una fecha de nacimiento válida.";
                return;
            }

            bool exito = ngPaciente.AltaPaciente(idProvincia, idLocalidad, dni, nombre, apellido, sexo, nacionalidad, direccion, correo, telefono, fechaNacimiento);

            if (exito)
            {
                lblMensaje.Text = "Paciente agregado con éxito";
                LimpiarCampos();
            }
            else
            {
                lblMensaje.Text = "Error al agregar el paciente";
            }
            
        }
        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtSexo.Text = "";
            txtNacionalidad.Text = "";
            txtDireccion.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";
            txtDni.Text = "";
            txtFecNacimiento.Text = "";

            
            ddlProvincias.SelectedIndex = 0; 
            ddlLocalidad.SelectedIndex = 0; 

            lblMensaje.Text = "";
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Page.Validate("none");
            Response.Redirect("ABMLPacientes.aspx");
        }
    }


}