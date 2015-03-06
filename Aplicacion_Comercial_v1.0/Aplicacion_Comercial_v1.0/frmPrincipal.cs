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
    public partial class frmPrincipal : Form
    {

        private CADUsuario usuarioLogueado;

        internal CADUsuario UsuarioLogueado
        {
            get { return usuarioLogueado; }
            set { usuarioLogueado = value; }
        }

        public frmPrincipal()
        {
            InitializeComponent();
        }


        #region <salirdelapp>
        private void frmPrincipal_FormClosing(object sender, FormClosingEventArgs e) //close application :D
        {
            Application.Exit();
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        #endregion

        private void clientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmClientes miForm = new frmClientes();
            miForm.MdiParent = this;
            miForm.Show();
        }

        private void proveedoresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmProveedores miForm = new frmProveedores();
            miForm.MdiParent = this;
            miForm.UsuarioLogueado = usuarioLogueado;
            miForm.Show();
        }

        private void bodegasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmBodega miForm = new frmBodega();
            miForm.MdiParent = this;
            miForm.UsuarioLogueado = usuarioLogueado;
            miForm.Show();
        }

        private void productosToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmProductos miForm = new frmProductos();
            miForm.MdiParent = this;
            miForm.Show();
        }

        private void UsuariostoolStripButton_Click(object sender, EventArgs e)
        {
            clientesToolStripMenuItem_Click(sender, e);
        }

        private void ProveedortoolStripButton_Click(object sender, EventArgs e)
        {
            proveedoresToolStripMenuItem_Click(sender, e);
        }

        private void ProductostoolStripButton3_Click(object sender, EventArgs e)
        {
            productosToolStripMenuItem1_Click(sender, e);
        }

        private void usuariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmUsuarios miForm = new frmUsuarios();
            miForm.MdiParent = this;
            miForm.Show();
        }

        private void frmPrincipal_Load(object sender, EventArgs e)
        {
            NombresUsuarioToolStripStatusLabel.Text = "Usuario:" + " " + usuarioLogueado.Nombres + " " + " " + usuarioLogueado.Apellidos;
            VerificaCambioClave(sender, e);
            VerificarPermisos();

        }

        
        
        private void VerificarPermisos()
        {
            if (CADPermisoRol.PuedeVer(usuarioLogueado.IDRol, "frmProveedores"))
            {
                proveedoresToolStripMenuItem.Visible = true;
            }
            else
            {
                proveedoresToolStripMenuItem.Visible = false;
            }

            if (CADPermisoRol.PuedeVer(usuarioLogueado.IDRol, "frmBodegas"))
            {
                bodegasToolStripMenuItem.Visible = true;
            }
            else
            {
                bodegasToolStripMenuItem.Visible = false;
            }

            if (CADPermisoRol.PuedeVer(usuarioLogueado.IDRol, "frmCompras"))
            {
                comprasToolStripMenuItem.Visible = true;
            }
            else
            {
                comprasToolStripMenuItem.Visible = false;
            }



        }

        private void VerificaCambioClave(object sender, EventArgs e)
        {
            if (usuarioLogueado.FechaModificacionClave.AddMonths(1) < DateTime.Now)
            {
                cAmbioDeClaveToolStripMenuItem_Click(sender, e);
            }
        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void cAmbioDeClaveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmCambioClave miForm = new frmCambioClave();
            miForm.UsuarioLogueado = this.usuarioLogueado;
            miForm.ShowDialog();
            miForm.Show();
        }

        private void cambioDeUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmCambioUsuario miform = new frmCambioUsuario();
            miform.ShowDialog();
            if (miform.UsuarioLogueado != null)
            {
                this.usuarioLogueado = miform.UsuarioLogueado;
                NombresUsuarioToolStripStatusLabel.Text = "Usuario:" + " " + usuarioLogueado.Nombres + " " + " " + usuarioLogueado.Apellidos;
                VerificarPermisos();

            }

        }

        private void comprasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmCompras miform = new frmCompras();
            miform.MdiParent = this;
            miform.UsuarioLogueado = usuarioLogueado;
            miform.Show();
        }

        private void ventasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmVentas miform = new frmVentas();
            miform.MdiParent = this;
            miform.UsuarioLogueado = usuarioLogueado;
            miform.Show();
        }

        private void ComprastoolStripButton_Click(object sender, EventArgs e)
        {
            comprasToolStripMenuItem_Click(sender, e);
        }

        private void VentastoolStripButton_Click(object sender, EventArgs e)
        {
            ventasToolStripMenuItem_Click(sender, e);
        }


    



    }//cierra clase
}
