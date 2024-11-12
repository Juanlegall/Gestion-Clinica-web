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
    public partial class EditarFormularioPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(id) && id != "0")
                {
                    // Llama a tu función para obtener los datos del paciente por ID
                    NegocioPacientes ngs = new NegocioPacientes();
                    NegocioProvincias np = new NegocioProvincias();
                    NegocioLocalidades nglocalidades = new NegocioLocalidades();
                    DataSet datosPacientes = ngs.obtenerDatosPacientes(id);
                    DataSet datosProvincias = np.obtenerProvincias();
                    DataSet datosLocalidades = nglocalidades.obtenerLocalidades();

                    // Carga los datos en los controles del formulario
                    txtNombre.Text = datosPacientes.Tables[0].Rows[0]["nombre"].ToString();
                    txtApellido.Text = datosPacientes.Tables[0].Rows[0]["apellido"].ToString();
                    txtSexo.Text = datosPacientes.Tables[0].Rows[0]["sexo"].ToString();
                    txtNacionalidad.Text = datosPacientes.Tables[0].Rows[0]["nacionalidad"].ToString();
                    txtDireccion.Text = datosPacientes.Tables[0].Rows[0]["direccion"].ToString();
                    txtCorreo.Text = datosPacientes.Tables[0].Rows[0]["correo"].ToString();
                    txtTelefono.Text = datosPacientes.Tables[0].Rows[0]["telefono"].ToString();
                    txtDni.Text = datosPacientes.Tables[0].Rows[0]["dni"].ToString();
                    txtFecha.Text = datosPacientes.Tables[0].Rows[0]["fechaNacimiento"].ToString();
                    

                    ddlProvincias.DataSource = datosProvincias.Tables[0];
                    ddlProvincias.DataTextField = "provincia";
                    ddlProvincias.DataValueField = "id_provincia";
                    ddlProvincias.DataBind();
                    ddlProvincias.Items.Insert(0, new ListItem("Seleccionar", ""));


                    ddlLocalidad.DataSource = datosLocalidades.Tables[0];
                    ddlLocalidad.DataTextField = "localidad";
                    ddlLocalidad.DataValueField = "id_localidad";
                    ddlLocalidad.DataBind();
                    ddlLocalidad.Items.Insert(0, new ListItem("Seleccionar", ""));


                    string idProvincia = datosPacientes.Tables[0].Rows[0]["idProvincia"].ToString();
                    ddlProvincias.SelectedValue = idProvincia;

                    string idLocalidad = datosPacientes.Tables[0].Rows[0]["idLocalidad"].ToString();
                    ddlLocalidad.SelectedValue = idLocalidad;

                }
                else
                {

                }
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            string id = Request.QueryString["id"];
            NegocioPacientes ngs = new NegocioPacientes();
            string idProvincia = ddlProvincias.SelectedValue;
            string idLocalidad = ddlLocalidad.SelectedValue;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string sexo = txtSexo.Text;
            string nacionalidad = txtNacionalidad.Text;
            string direccion = txtDireccion.Text;
            string correo = txtCorreo.Text;
            string telefono = txtTelefono.Text;
            DateTime fecha;
            bool fechaValida = DateTime.TryParse(txtFecha.Text, out fecha);

            if (!fechaValida)
            {
                // Si la fecha no es válida, puedes manejar el error, por ejemplo:
                lblMensaje.Text = "La fecha ingresada no es válida.";
                return; // Detener la ejecución si la fecha no es válida
            }
            string dni = txtDni.Text;




            Boolean insertado = ngs.pacienteEditado( id, idProvincia, idLocalidad, nombre, apellido, sexo, nacionalidad, direccion, correo, telefono, fecha, dni);

            if (insertado == true)
            {
                lblMensaje.Text = "Paciente modificado correctamente";
                limpiarCampos();
            }
            else
            {
                lblMensaje.Text = "Hubo un error al modificar el paciente";
            }
        }



        protected void limpiarCampos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtSexo.Text = "";
            txtNacionalidad.Text = "";
            txtDireccion.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";
            txtFecha.Text = "";
            txtDni.Text = "";
            ddlLocalidad.ClearSelection();
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincias.ClearSelection();
            ddlProvincias.SelectedIndex = 0;


        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Page.Validate("None");
            Response.Redirect("ABMLPacientes.aspx");
        }
    }
}
