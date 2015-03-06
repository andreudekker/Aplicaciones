using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplicacionWebAsp4._5
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            CADFac.CadIva.NewIva(txtDescripcion.Text, Convert.ToDecimal(txtTarifa.Text));
            txtDescripcion.Text = "";
            txtTarifa.Text = "";
            txtDescripcion.Focus();
            gvIva.DataBind();

        }
    }
}