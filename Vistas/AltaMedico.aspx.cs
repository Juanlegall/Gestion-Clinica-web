using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class AltaMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProvincias();
                CargarEspecialidades();
                CargarRoles();
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

        private void CargarEspecialidades()
        {
            NegocioEspecialidades ngcioEspecialiades = new NegocioEspecialidades();
            DataTable especialidades = ngcioEspecialiades.ObtenerEspecialidades();

            if (especialidades != null && especialidades.Rows.Count > 0)
            {
                ddlEspecialidad.DataSource = especialidades;
                ddlEspecialidad.DataTextField = "nombre_especialidad";
                ddlEspecialidad.DataValueField = "id_especialidad";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
            }
            else
            {
                lblMensaje.Text = "No se encontraron provincias.";
            }

        }

        private void CargarRoles()
        {
            NegocioUsuarios ngRoles = new NegocioUsuarios();
            DataTable roles = ngRoles.ObtenerRoles();

            if(roles != null && roles.Rows.Count > 0)
            {
                ddlRol.DataSource = roles;
                ddlRol.DataTextField = "nombre_rol";
                ddlRol.DataValueField = "id_rol";
                ddlRol.DataBind();
                ddlRol.Items.Insert(0, new ListItem("Seleccionar", "0"));
            }
            else
            {
                lblMensaje.Text = "No se encuentran roles";
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            NegocioUsuarios ngMedico = new NegocioUsuarios();

            if (ddlProvincias.SelectedValue == "0" || ddlLocalidad.SelectedValue == "0")
            {
                lblMensaje.Text = "Seleccione una provincia y localidad.";
                return;
            }

            int idProvincia = int.Parse(ddlProvincias.SelectedValue);
            int idLocalidad = int.Parse(ddlLocalidad.SelectedValue);
            int idEspecialidad = int.Parse(ddlEspecialidad.SelectedValue);
            int idRol = int.Parse(ddlRol.SelectedValue);
            string dni = txtDni.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string sexo = txtSexo.Text;
            string nacionalidad = txtNacionalidad.Text;
            string direccion = txtDireccion.Text;
            string legajo = txtLegajo.Text;
            string correo = txtCorreo.Text;
            string telefono = txtTelefono.Text;
            string nombre_usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;

           

            bool exito = ngMedico.AltaMedicos(idProvincia, idLocalidad, idEspecialidad, idRol, dni, nombre, apellido, sexo, nacionalidad, direccion, correo, telefono, legajo, nombre_usuario, contraseña);

            if (exito)
            {
                lblMensaje.Text = "Personal agregado con éxito";
            }
            else
            {
                lblMensaje.Text = "Error al agregar al Personal";
            }
        }
    }
}