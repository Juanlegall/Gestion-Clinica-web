using Entidades;
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
        protected int idMedico
        {
            get { return ViewState["id_medico"] != null ? (int)ViewState["id_medico"] : 0; }
            set { ViewState["id_medico"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProvincias();
                CargarEspecialidades();
                CargarSexo();
            }
            
        }

        //--Cargas de DDL--
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

        private void CargarSexo()
        {
            ddlSexo.Items.Clear();
            ddlSexo.Items.Insert(0, new ListItem("Seleccione un sexo", "0"));
            ddlSexo.Items.Insert(1, new ListItem("Masculino", "1"));
            ddlSexo.Items.Insert(2, new ListItem("Femenino", "2"));
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

        //--Botones--
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            NegocioUsuarios ngMedico = new NegocioUsuarios();
            NegocioHorariosMedicos negocioHorario = new NegocioHorariosMedicos();

            if (ddlProvincias.SelectedValue == "0" || ddlLocalidad.SelectedValue == "0")
            {
                lblMensaje.Text = "Seleccione una provincia y localidad.";
                return;
            }

            int idProvincia = int.Parse(ddlProvincias.SelectedValue);
            int idLocalidad = int.Parse(ddlLocalidad.SelectedValue);
            int idEspecialidad = int.Parse(ddlEspecialidad.SelectedValue);
            int idRol = 2; //Medico
            string dni = txtDni.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string sexo = ddlSexo.SelectedIndex.ToString();
            string nacionalidad = txtNacionalidad.Text;
            string direccion = txtDireccion.Text;
            string legajo = txtLegajo.Text;
            string correo = txtCorreo.Text;
            string telefono = txtTelefono.Text;
            string nombre_usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;

            //negocioHorario.AltaHorario(horario);


            idMedico = ngMedico.AltaMedicos(idProvincia, idLocalidad, idEspecialidad, idRol, dni, nombre, apellido, sexo, nacionalidad, direccion, legajo, correo, telefono, nombre_usuario, contraseña);


            if (idMedico != 0)
            {
                lblMensaje.Text = "Personal agregado con éxito";

                string script = "document.getElementById('btnHorarios').disabled = false;";
                ClientScript.RegisterStartupScript(this.GetType(), "habilitarBoton", script, true);

            }
            else
            {
                lblMensaje.Text = "Error al agregar al Personal";
            }
            LimpiarCampos();
        }
        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDireccion.Text = "";
            txtLegajo.Text = "";
            txtNacionalidad.Text = "";
            txtTelefono.Text = "";
            ddlEspecialidad.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincias.SelectedIndex = 0;
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Page.Validate("None");
            Response.Redirect("ABMLMedicos.aspx");
        }

        protected void btnCargarHorario_Click(object sender, EventArgs e)
        {

            List<HorariosMedicos> listaHorarios = new List<HorariosMedicos>();
            NegocioHorariosMedicos negocioHorario = new NegocioHorariosMedicos();

            //Asignacion de los horarios cargados
            if (chkLunes.Checked)
            {
                HorariosMedicos horario = new HorariosMedicos();
                horario.Dias = "Lunes";
                horario.HoraInicio = TimeSpan.Parse(txtEntradaLunes.Text);
                horario.HoraFin = TimeSpan.Parse(txtSalidaLunes.Text);
                listaHorarios.Add(horario);
            }
            if (chkMartes.Checked)
            {
                HorariosMedicos horario = new HorariosMedicos();
                horario.Dias = "Martes";
                horario.HoraInicio = TimeSpan.Parse(txtEntradaMartes.Text);
                horario.HoraFin = TimeSpan.Parse(txtSalidaMartes.Text);
                listaHorarios.Add(horario);
            }
            if (chkMiercoles.Checked)
            {
                HorariosMedicos horario = new HorariosMedicos();
                horario.Dias = "Miercoles";
                horario.HoraInicio = TimeSpan.Parse(txtEntradaMiercoles.Text);
                horario.HoraFin = TimeSpan.Parse(txtSalidaMiercoles.Text);
                listaHorarios.Add(horario);
            }
            if (chkJueves.Checked)
            {
                HorariosMedicos horario = new HorariosMedicos();
                horario.Dias = "Jueves";
                horario.HoraInicio = TimeSpan.Parse(txtEntradaJueves.Text);
                horario.HoraFin = TimeSpan.Parse(txtSalidaJueves.Text);
                listaHorarios.Add(horario);
            }
            if (chkViernes.Checked)
            {
                HorariosMedicos horario = new HorariosMedicos();
                horario.Dias = "Viernes";
                horario.HoraInicio = TimeSpan.Parse(txtEntradaViernes.Text);
                horario.HoraFin = TimeSpan.Parse(txtSalidaViernes.Text);
                listaHorarios.Add(horario);
            }
            if (chkSabado.Checked)
            {
                HorariosMedicos horario = new HorariosMedicos();
                horario.Dias = "Sabado";
                horario.HoraInicio = TimeSpan.Parse(txtEntradaSabado.Text);
                horario.HoraFin = TimeSpan.Parse(txtSalidaSabado.Text);
                listaHorarios.Add(horario);
            }
            if (chkDomingo.Checked)
            {
                HorariosMedicos horario = new HorariosMedicos();
                horario.Dias = "Domingo";
                horario.HoraInicio = TimeSpan.Parse(txtEntradaDomingo.Text);
                horario.HoraFin = TimeSpan.Parse(txtSalidaDomingo.Text);
                listaHorarios.Add(horario);
            }

            negocioHorario.AltaHorario(listaHorarios,idMedico);

        }


    }
}