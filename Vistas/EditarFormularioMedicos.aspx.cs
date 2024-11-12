using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

namespace Vistas
{
    public partial class EditarFormularioMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                string id = Request.QueryString["id"];

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(id) && id != "0")
                {
                    // Llama a tu función para obtener los datos del usuario por ID
                    NegocioUsuarios ngs = new NegocioUsuarios();
                    NegocioEspecialidades ne = new NegocioEspecialidades();
                    NegocioProvincias np = new NegocioProvincias();
                    NegocioLocalidades nglocalidades = new NegocioLocalidades();
                    DataSet datosMedicos = ngs.obtenerDatosMedicos(id);
                    DataSet datosEspecialidades = ne.obtenerEspecialidades();
                    DataSet datosProvincias = np.obtenerProvincias();
                    DataSet datosLocalidades = nglocalidades.obtenerLocalidades();

                    // Carga los datos en los controles del formulario
                    txtNombre.Text = datosMedicos.Tables[0].Rows[0]["nombre"].ToString();
                    txtApellido.Text = datosMedicos.Tables[0].Rows[0]["apellido"].ToString();
                    txtSexo.Text = datosMedicos.Tables[0].Rows[0]["sexo"].ToString();
                    txtNacionalidad.Text = datosMedicos.Tables[0].Rows[0]["nacionalidad"].ToString();
                    txtDireccion.Text = datosMedicos.Tables[0].Rows[0]["direccion"].ToString();
                    txtCorreo.Text = datosMedicos.Tables[0].Rows[0]["correo_electronico"].ToString();
                    txtTelefono.Text = datosMedicos.Tables[0].Rows[0]["telefono"].ToString();
                    txtLegajo.Text = datosMedicos.Tables[0].Rows[0]["legajo"].ToString();
                    txtDni.Text = datosMedicos.Tables[0].Rows[0]["dni"].ToString();

                    ddlEspecialidad.DataSource = datosEspecialidades.Tables[0];
                    ddlEspecialidad.DataTextField = "especialidad"; 
                    ddlEspecialidad.DataValueField = "id_especialidad";
                    ddlEspecialidad.DataBind();
                    ddlEspecialidad.Items.Insert(0, new ListItem("Seleccionar", ""));

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


                    string idProvincia = datosMedicos.Tables[0].Rows[0]["idProvincia"].ToString();
                    ddlProvincias.SelectedValue = idProvincia;

                    string idLocalidad = datosMedicos.Tables[0].Rows[0]["idLocalidad"].ToString();
                    ddlLocalidad.SelectedValue = idLocalidad;

                    string idEspecialidad = datosMedicos.Tables[0].Rows[0]["idEspecialidad"].ToString();
                    ddlEspecialidad.SelectedValue = idEspecialidad;


                }
                else
                {

                }
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            string id = Request.QueryString["id"];
            NegocioUsuarios ngs = new NegocioUsuarios();
            string idEspecialidad = ddlEspecialidad.SelectedValue;
            string idProvincia = ddlProvincias.SelectedValue;
            string idLocalidad = ddlLocalidad.SelectedValue;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string sexo = txtSexo.Text;
            string nacionalidad = txtNacionalidad.Text;
            string direccion = txtDireccion.Text;
            string correo = txtCorreo.Text;
            string telefono = txtTelefono.Text;
            string legajo = txtLegajo.Text;
            string dni = txtDni.Text;




            Boolean insertado = ngs.medicoEditado(id, idEspecialidad, idProvincia, idLocalidad, nombre, apellido, sexo, nacionalidad, direccion, correo, telefono, legajo, dni);

            if(insertado == true)
            {
                lblMensaje.Text = "Medico modificado correctamente";
                limpiarCampos();
            }
            else
            {
                lblMensaje.Text = "Hubo un error al modificar el medico";
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
            txtLegajo.Text = "";
            txtDni.Text = "";
            ddlEspecialidad.ClearSelection();
            ddlEspecialidad.SelectedIndex = 0;
            ddlLocalidad.ClearSelection();
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincias.ClearSelection();
            ddlProvincias.SelectedIndex = 0;


        }




    }
}