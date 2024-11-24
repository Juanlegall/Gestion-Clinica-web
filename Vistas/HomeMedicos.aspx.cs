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
    public partial class HomeMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["NombreUsuario"] != null)
                {
                    NegocioPacientes neg_Pacientes = new NegocioPacientes();
                    string nombre = Session["NombreUsuario"].ToString();
                    lblMensaje.Text = "Bienvenido, " + nombre;
                    DataSet ds = new DataSet();
                    ds = neg_Pacientes.ObtenerPacientesxMedicos((int)Session["ID"]);
                    llenarGrilla(ds);

                    int idUsuario = (int)Session["ID"];
                    NegocioUsuarios neg_Usuarios = new NegocioUsuarios();
                    string especialidad = neg_Usuarios.ObtenerEspecialidadMedico(idUsuario);
                    lbl_especialidad.Text = "Especialidad: " + especialidad;

                }
                else
                {
                    // Si no hay sesión, redirigir al login
                    Response.Redirect("Login.aspx");
                }
            }
        }
        public void llenarGrilla(DataSet ds)
        {
            gvPacientesxMedicos.DataSource = ds;
            gvPacientesxMedicos.DataBind();
        }
        public void GrillaEscondia()// esta grilla no tiene databind para que no se muestre pero seria la grilla sin filtro para que cuando filtramos un pacientes podamos filtrar otro directamente desde ahi sin tener que poner el mostrar todos
        {
            NegocioPacientes neg_Pacientes = new NegocioPacientes();
            DataSet ds = new DataSet();
            ds = neg_Pacientes.ObtenerPacientesxMedicos((int)Session["ID"]);
            gvPacientesxMedicos.DataSource = ds;
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string dni = txtBuscarxDni.Text;
            DataSet ds = new DataSet();
            NegocioPacientes ng_Pacientes = new NegocioPacientes();
            ds = ng_Pacientes.ObtenerPacientesxMedicoxDni(dni, (int)Session["ID"]);
            llenarGrilla(ds);
            GrillaEscondia();

        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            NegocioPacientes neg_Pacientes = new NegocioPacientes();
            DataSet ds = new DataSet();
            ds = neg_Pacientes.ObtenerPacientesxMedicos((int)Session["ID"]);
            llenarGrilla(ds);

        }

        protected void chkPresente_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkPresente = (CheckBox)sender;
            GridViewRow fila = (GridViewRow)chkPresente.NamingContainer;
            int IdTurno = Convert.ToInt32(((HiddenField)fila.FindControl("hfIdTurno")).Value);
            //lblBuscar.Text = IdTurno.ToString();
            bool realizado = chkPresente.Checked;
            NegocioTurnos ng_Turnos = new NegocioTurnos();
            ng_Turnos.actualizarPresente(realizado, IdTurno);
        }

        protected void GuardarObservacion_Click(object sender, EventArgs e)
        {
            // Recupera los valores desde los controles
            int idTurno = int.Parse(hfSelectedId.Value); // Id del turno seleccionado
            string titulo = txtTitulo.Text.Trim(); // Observación

            // Llama al método de negocio para guardar la observación
            NegocioTurnos negocioTurnos = new NegocioTurnos();
            bool exito = negocioTurnos.GuardarObservacionTurno(idTurno, titulo);

            if (exito)
            {
                lbl_Observacion.Text = "Observación guardada con éxito.";
            }
            else
            {
                lbl_Observacion.Text = "Error al guardar la observación. Verifique los datos.";
            }

            // Limpiar campos si es necesario
            txtTitulo.Text = "";
        }

    }
}