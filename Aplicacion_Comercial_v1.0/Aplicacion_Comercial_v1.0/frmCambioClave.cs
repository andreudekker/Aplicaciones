using CADAplicacionComercial;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Aplicacion_Comercial_v1._0
{
    public partial class frmCambioClave : Form
    {

        private CADUsuario usuarioLogueado;

        internal CADUsuario UsuarioLogueado
        {
            get { return usuarioLogueado; }
            set { usuarioLogueado = value; }
        }


        public frmCambioClave()
        {
            InitializeComponent();
        }

        private void Aceptarbutton_Click(object sender, EventArgs e)
        {
            if (ClaveAnteriortextBox.Text == string.Empty)
            {
                errorProvider1.SetError(ClaveAnteriortextBox, "Debe Ingresar la clave anterior");
                ClaveAnteriortextBox.Focus();
                return;
            }
            errorProvider1.Clear();

            if (ClaveAnteriortextBox.Text != usuarioLogueado.Clave)
            {
                errorProvider1.SetError(ClaveAnteriortextBox, "Clave incorrecta");
                ClaveAnteriortextBox.Focus();
                return;
            }
            errorProvider1.Clear();


            if (NuevaClavetextBox.Text == string.Empty)
            {
                errorProvider1.SetError(NuevaClavetextBox, "Debe Ingresar una nueva clave");
                NuevaClavetextBox.Focus();
                return;
            }
            errorProvider1.Clear();


            if (ConfirmaciontextBox.Text == string.Empty)
            {
                errorProvider1.SetError(ConfirmaciontextBox, "Debe Ingresar una confirmacion para la clave");
                ConfirmaciontextBox.Focus();
                return;
            }
            errorProvider1.Clear();

            if (NuevaClavetextBox.Text != ConfirmaciontextBox.Text)
            {
                errorProvider1.SetError(NuevaClavetextBox, "La clave y la confirmacion no son iguales");
                errorProvider1.SetError(ConfirmaciontextBox, "Debe Ingresar una confirmacion para la clave");
                ConfirmaciontextBox.Focus();
                return;
            }
            errorProvider1.Clear();

            CADUsuario.CambioClave(NuevaClavetextBox.Text, usuarioLogueado.IDUsuario);
            MessageBox.Show("Cambio de clave ,realizado con exito", "Confirmacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
            usuarioLogueado.Clave = NuevaClavetextBox.Text;
            usuarioLogueado.FechaModificacionClave = DateTime.Now;
            this.Close();

        }



        private void frmCambioClave_FormClosing(object sender, FormClosingEventArgs e) //evento formclosing para evitar el cancelar al momneto de salir
        {
            if (usuarioLogueado.FechaModificacionClave.AddMonths(1) < DateTime.Now) 
            {
                errorProvider1.SetError(NuevaClavetextBox, "Debe cambiar la clave");
                NuevaClavetextBox.Focus();
                e.Cancel = true;
                return;
            }
            errorProvider1.Clear();
        }
     }

  }


