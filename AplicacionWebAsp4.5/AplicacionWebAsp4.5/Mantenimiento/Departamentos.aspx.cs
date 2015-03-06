using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CADFac;

namespace AplicacionWebAsp4._5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            CadDepartamento.NewDepartamento(txtDepartamento.Text);
            txtDepartamento.Text = "";
            txtDepartamento.Focus();
            gvDepartamento.DataBind();
        }
    }
}