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
    public partial class frmBodega : Form
    {

        private CADUsuario usuarioLogueado;

        internal CADUsuario UsuarioLogueado
        {
            get { return usuarioLogueado; }
            set { usuarioLogueado = value; }
        }

        
        
        public frmBodega()
        {
            InitializeComponent();
        }

        private void bodegaBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bodegaBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);

        }

        private void frmBodega_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Bodega' table. You can move, or remove it, as needed.
            this.bodegaTableAdapter.Fill(this.dSAplicacionComercial.Bodega);
            VerificaPermisos();
        }

        private void VerificaPermisos()
        {
            if (CADPermisoRol.PuedeModificar(usuarioLogueado.IDRol, this.Name))
            {
                bindingNavigatorAddNewItem.Enabled = true;
            }
            else
            {
                bindingNavigatorAddNewItem.Enabled = false;
               
            }

            if (CADPermisoRol.PuedeModificar(usuarioLogueado.IDRol, this.Name))
            {
                bindingNavigatorDeleteItem.Enabled = true;

            }
            else
            {
                bindingNavigatorDeleteItem.Enabled = false;
            }
            
        }

        private void bindingNavigatorDeleteItem_Click(object sender, EventArgs e)
        {
            //DialogResult rta = MessageBox.Show("Esta Seguro de borrar el registro actual?", "Confirmacion", //EN CONSTRUCCION DE MODULO
            //                                     MessageBoxButtons.YesNo, MessageBoxIcon.Question,
            //                                     MessageBoxDefaultButton.Button2);
            //if (rta == DialogResult.No) return;

            //if (CADKardex.KardexTieneMovimientoByIdBodega(Convert.ToInt32(iDBodega.Text)))
            //{
            //    MessageBox.Show("No se puede Borrar Bodega por que ya tiene movimientos",
            //                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    return;
            //} 

            {
                //BodegaBindingSource.RemoveAt(bodegaBindingSource.Position);
                //this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);
            }
        }
    }
}
