using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Vistas
{
    public partial class EditarFormularioMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    // Llama a tu función para obtener los datos del usuario por ID
                    NegocioUsuarios ngs = new NegocioUsuarios();
                    DataSet datos = ngs.obtenerDatosMedicos(id);

                    // Carga los datos en los controles del formulario
                    txtNombre.Text = datos.Tables[0].Rows[0]["nombre"].ToString();
                    txtApellido.Text = datos.Tables[0].Rows[0]["apellido"].ToString();
                    txtSexo.Text = datos.Tables[0].Rows[0]["sexo"].ToString();
                    txtNacionalidad.Text = datos.Tables[0].Rows[0]["nacionalidad"].ToString();
                    txtDireccion.Text = datos.Tables[0].Rows[0]["direccion"].ToString();
                    txtCorreo.Text = datos.Tables[0].Rows[0]["correo_electronico"].ToString();
                    txtTelefono.Text = datos.Tables[0].Rows[0]["telefono"].ToString();
                    txtLegajo.Text = datos.Tables[0].Rows[0]["legajo"].ToString();
                    txtDni.Text = datos.Tables[0].Rows[0]["dni"].ToString();

                    ddlEspecialidad.DataSource = datos.Tables[0];
                    ddlEspecialidad.DataTextField = "especialidad"; 
                    ddlEspecialidad.DataValueField = "idEspecialidad";
                    ddlEspecialidad.DataBind();
                    ddlEspecialidad.Items.Insert(0, new ListItem("Seleccionar", ""));

                    ddlProvincias.DataSource = datos.Tables[0];
                    ddlProvincias.DataTextField = "provincia"; 
                    ddlProvincias.DataValueField = "idProvincia";
                    ddlProvincias.DataBind();
                    ddlProvincias.Items.Insert(0, new ListItem("Seleccionar", ""));


                    ddlLocalidad.DataSource = datos.Tables[0];
                    ddlLocalidad.DataTextField = "localidad"; 
                    ddlLocalidad.DataValueField = "idLocalidad";
                    ddlLocalidad.DataBind();
                    ddlLocalidad.Items.Insert(0, new ListItem("Seleccionar", ""));


                    string idProvincia = datos.Tables[0].Rows[0]["idProvincia"].ToString();
                    ddlProvincias.SelectedValue = idProvincia;

                    string idLocalidad = datos.Tables[0].Rows[0]["idLocalidad"].ToString();
                    ddlLocalidad.SelectedValue = idLocalidad;

                    string idEspecialidad = datos.Tables[0].Rows[0]["idEspecialidad"].ToString();
                    ddlEspecialidad.SelectedValue = idEspecialidad;


                }
            }

        }

    }
}