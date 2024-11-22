using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;


namespace Vistas
{
    public partial class AsignacionTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        
        

        {

            if (!IsPostBack)
            {
            selectPacientes();
            selectEspecialidades();
            ddlEspecialista.Items.Insert(0, new ListItem("Seleccionar", ""));
            ddlPacientes.Items.Insert(0, new ListItem("Seleccionar", ""));
            


            }


        }



        protected void selectPacientes()
        {

            NegocioPacientes ngp = new NegocioPacientes();
            DataSet ds = ngp.ObtenerTablaPacientes();
            ddlPacientes.DataSource = ds;
            ddlPacientes.DataTextField = "nombre";
            ddlPacientes.DataValueField = "idPaciente";
            ddlPacientes.DataBind();


        }


        protected void selectEspecialidades()
        {

            NegocioEspecialidades nge = new NegocioEspecialidades();
            DataSet ds = nge.obtenerEspecialidades();
            ddlEspecialidad.DataSource = ds;
            ddlEspecialidad.DataTextField = "especialidad";
            ddlEspecialidad.DataValueField = "id_especialidad";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("Seleccionar", ""));


            string idEspecialidad = ddlEspecialidad.SelectedValue.ToString();



        }


        protected void cargarMedicosPorEspecialidad(string idEspecialidad)
        {

            NegocioUsuarios ngm = new NegocioUsuarios();
            DataSet ds = ngm.selectMedicosPorEspecialidad(idEspecialidad);

            if ( ds.Tables.Count > 0)
            {
                ddlEspecialista.DataSource = ds;
                ddlEspecialista.DataTextField = "medico"; // Nombre de la columna en tu DataSet
                ddlEspecialista.DataValueField = "idMedico"; // Nombre de la columna en tu DataSet
                ddlEspecialista.DataBind();
                ddlEspecialista.Items.Insert(0, new ListItem("Seleccionar", ""));
            }
            




        }



        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idEspecialidad = ddlEspecialidad.SelectedValue;
            if (!string.IsNullOrEmpty(idEspecialidad))
            {
                cargarMedicosPorEspecialidad(idEspecialidad);
            }
            else
            {
                // Si no se selecciona ninguna especialidad, limpia el DropDownList de médicos
                ddlEspecialista.Items.Insert(0, new ListItem("Seleccionar", ""));
            }
        }



        protected void calendario_SelectionChanged(object sender, EventArgs e)
        {
            // Obtén la fecha seleccionada
            NegocioHorariosMedicos nghm = new NegocioHorariosMedicos();
            DateTime fechaSeleccionada = Calendario.SelectedDate;
            string idMedico = ddlEspecialista.SelectedValue;

            // Ejemplo: Mostrar la fecha seleccionada en un Label
             string fecha_seleccionada = fechaSeleccionada.ToString("yyyy-MM-dd");

            CultureInfo culturaEspañol = new CultureInfo("es-ES");

            string[] diasSemanaEnEspañol = new string[]
    {
                "domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"
            };

            // Obtener el índice del día de la semana
            int diaSemanaIndex = (int)fechaSeleccionada.DayOfWeek;

            // Obtener el nombre del día en español
            string diaSemanaNombre = diasSemanaEnEspañol[diaSemanaIndex];
            DataSet ds = nghm.traerHorariosPorDia(diaSemanaNombre, idMedico, fecha_seleccionada);


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlHorarios.DataSource = ds;
                ddlHorarios.DataTextField = "horario_libre";
                ddlHorarios.DataValueField = "horario_libre";
                ddlHorarios.DataBind();

            }
            else
            {
                // No hay horarios disponibles: agregar un mensaje por defecto
                ddlHorarios.Items.Clear();
                ddlHorarios.Items.Add(new ListItem("No hay horarios disponibles", ""));
            }






        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            NegocioTurnos ngt = new NegocioTurnos();

            DateTime fechaSeleccionada = Calendario.SelectedDate;
            string idPaciente = ddlPacientes.SelectedValue;
            string idMedico = ddlEspecialista.SelectedValue;
            string horaSeleccionada = ddlHorarios.SelectedItem.Text;

            // Ejemplo: Mostrar la fecha seleccionada en un Label

            int filasAfectadas= ngt.agregarTurno(idPaciente, idMedico, fechaSeleccionada.ToString("yyyy-MM-dd"), horaSeleccionada, "");

            if (filasAfectadas > 0)
            {
                lblMensaje.Text = "Turno asignado correctamente";
                limpiarCampos();
            }
            else
            {
                lblMensaje.Text = "Hubo un error al agregar el turno";

            }



        }


        protected void limpiarCampos()
        {
            selectPacientes();
            ddlPacientes.SelectedIndex = 0; // Seleccionar la primera opción ("Seleccionar")

            // Restablecer el DropDownList de especialidades
            selectEspecialidades();
            ddlEspecialidad.SelectedIndex = 0;

            // Limpiar y restablecer el DropDownList de médicos
            ddlEspecialista.Items.Clear();
            ddlEspecialista.Items.Insert(0, new ListItem("Seleccionar", ""));

            // Limpiar el DropDownList de horarios
            ddlHorarios.Items.Clear();
            ddlHorarios.Items.Insert(0, new ListItem("Seleccionar", ""));

            lblMensaje.Text = "";


        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdministradores.aspx");
        }
    }
}