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
            if (Session["NombreUsuario"] != null)
            {
                NegocioPacientes neg_Pacientes = new NegocioPacientes();
                string nombre = Session["NombreUsuario"].ToString();
                lblMensaje.Text = "Bienvenido, " + nombre;
                DataSet ds = new DataSet();
                ds = neg_Pacientes.ObtenerPacientesxMedicos((int)Session["ID"]);
                llenarGrilla(ds);
            }
            else
            {
                // Si no hay sesión, redirigir al login
                Response.Redirect("Login.aspx");
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
            GridView fila = (GridView)chkPresente.NamingContainer;
            bool realizado = ((CheckBox)fila.FindControl("chkPresente")).Checked;
            NegocioTurnos ng_Turnos = new NegocioTurnos();
            ng_Turnos.actualizarPresente(realizado);
            lblBuscar.Text = realizado + " en la fila " + fila;
            if (realizado)
            {
                lblBuscar.Text = realizado + " en la fila " + fila;
            }
            else
            {
                lblBuscar.Text = "no " + realizado + " en la fila " + fila;
            }
        }
    }
}