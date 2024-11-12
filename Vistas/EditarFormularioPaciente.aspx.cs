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
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    // Llama a tu función para obtener los datos del usuario por ID
                    NegocioPacientes ngs = new NegocioPacientes();
                    DataSet datos = ngs.obtenerDatosPacientes(id);

                    // Carga los datos en los controles del formulario
                    txtNombre.Text = datos.Tables[0].Rows[0]["nombre"].ToString();
                    txtApellido.Text = datos.Tables[0].Rows[0]["apellido"].ToString();
                    txtSexo.Text = datos.Tables[0].Rows[0]["sexo"].ToString();
                    txtNacionalidad.Text = datos.Tables[0].Rows[0]["nacionalidad"].ToString();
                    txtDireccion.Text = datos.Tables[0].Rows[0]["direccion"].ToString();
                    txtCorreo.Text = datos.Tables[0].Rows[0]["correo_electronico"].ToString();
                    txtTelefono.Text = datos.Tables[0].Rows[0]["telefono"].ToString();
                    txtFecha.Text = datos.Tables[0].Rows[0]["FechaNacimiento"].ToString();
                    txtDni.Text = datos.Tables[0].Rows[0]["dni"].ToString();


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

                    


                }
            }
        }
    }
}