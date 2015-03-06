using CADFac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplicacionWebAsp4._5
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            CADProducto.NewProducto(txtIDdescripcion.Text,txtPrecio.Text,
                                   Convert.ToDecimal(txtPrecio.Text),
                                   Convert.ToDecimal(txtStock.Text),
                                   txtNotas.Text,
                                   Convert.ToInt32(DDLIva.SelectedValue),
                                   Convert.ToInt32(DDLDepartamento.SelectedValue));
            gvProductos.DataBind();
            txtIDdescripcion.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
            DDLIva.SelectedIndex = 0;
            DDLDepartamento.SelectedIndex = 0;
            txtIDdescripcion.Focus();
        }
    }
}