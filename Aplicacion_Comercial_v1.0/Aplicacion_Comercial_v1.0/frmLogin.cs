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
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        
        
        
        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {

            #region <ValidacionDeUusarios>
            
            if (UsuariotextBox.Text==String.Empty)
            {
                errorProvider1.SetError(UsuariotextBox,"Debe ingresar un usuario");
                UsuariotextBox.Focus();
                return;
            }
             errorProvider1.Clear();
        
             if (ClaveTextBox.Text==String.Empty)
            {
                errorProvider1.SetError(ClaveTextBox,"Debe ingresar una clave");
                ClaveTextBox.Focus();
                return;
            }
            errorProvider1.Clear();
            #endregion
            
            #region <Validacion a BD>
            
            if(!CADUsuario.ValidaUsuario(UsuariotextBox.Text,ClaveTextBox.Text))
            {
               MessageBox.Show("Usuario o Clave no valido","Error",
                                MessageBoxButtons.OK,
                                MessageBoxIcon.Exclamation);

                UsuariotextBox.Text=String.Empty;
                ClaveTextBox.Text=String.Empty;
                UsuariotextBox.Focus();
                return; 
            }
             frmPrincipal miform = new frmPrincipal();
             miform.UsuarioLogueado = CADUsuario.GetUsuario(UsuariotextBox.Text); 
             miform.Show();
             this.Hide();

#endregion
            }
   
        
    }
}
