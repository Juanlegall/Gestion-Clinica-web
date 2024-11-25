using Negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
                    NegocioUsuarios neg_Usuarios = new NegocioUsuarios();
                    string nombre = Session["NombreUsuario"].ToString();
                    int idUsuario = (int)Session["ID"];
                    string especialidad = neg_Usuarios.ObtenerEspecialidadMedico(idUsuario);
                    lblBienvenido.Text = "Bienvenido, " + nombre;
                    lbl_especialidad.Text = "Especialidad: " + especialidad;
                    GrillaCompleta();

                }
                else
                {
                    // Si no hay sesión, redirigir al login
                    Response.Redirect("Login.aspx");
                }
            }
        }
        public void GrillaCompleta()
        {
            NegocioPacientes neg_Pacientes = new NegocioPacientes();
            DataSet ds = new DataSet();
            ds = neg_Pacientes.ObtenerPacientesxMedicos((int)Session["ID"]);
            llenarGrilla(ds);
        }
        public void llenarGrilla(DataSet ds)
        {
            gvPacientesxMedicos.DataSource = ds;
            gvPacientesxMedicos.DataBind();
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string dni = txtBuscarxDni.Text;
            int idUsuario= (int)Session["ID"];
            DataSet ds = new DataSet();
            NegocioTurnos ng_Turnos = new NegocioTurnos();
            NegocioPacientes ng_Pacientes = new NegocioPacientes();
            string desde =txtDesde.Text;
            string hasta =txtHasta.Text;
                ds = ng_Pacientes.Filtros(dni, idUsuario, desde, hasta);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblMensaje.Text = "";
                    llenarGrilla(ds);
                }
                else
                {
                    lblMensaje.Text = "No se encontraron coincidencias.";
                    ds = null;
                    llenarGrilla(ds);
                }
            }
        

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            GrillaCompleta();
            lblMensaje.Text = "";
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