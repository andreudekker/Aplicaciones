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
    public partial class frmUsuarios : Form
    {
        private bool nuevo=false;
        
        public frmUsuarios()
        {
            InitializeComponent();
        }

        private void usuarioBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            if (!validarCampos()) return;
            this.Validate();
            this.usuarioBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);
            DeshabilitarCampos();

        }

        private bool validarCampos()
        {
            if (nuevo)
            {
                if (iDUsuarioTextBox.Text==String.Empty)
                {
                    errorProvider1.SetError(iDUsuarioTextBox, "Debe ingresar un id de usuario");
                    iDUsuarioTextBox.Focus();
                    return false;
                }
                errorProvider1.Clear();
                
                if (CADUsuario.ExisteUsuario(iDUsuarioTextBox.Text))
                {
                    errorProvider1.SetError(iDUsuarioTextBox, "ID de usuario, ya esta siendo utilizado por otro usuario");
                    iDUsuarioTextBox.Focus();
                    return false;
                
                }
                errorProvider1.Clear();
            }

            if (iDRolComboBox.SelectedIndex==-1)
            {
                     errorProvider1.SetError(iDRolComboBox, "Debe seleccionar un ROL de usuario");
                     iDRolComboBox.Focus();
                    return false;
            }
                  errorProvider1.Clear();
            
            
            if (nombresTextBox.Text==String.Empty)
            {
                     errorProvider1.SetError(nombresTextBox, "Debe Ingresar al menos un nombre de usuario");
                     nombresTextBox.Focus();
                    return false;
            }
                  errorProvider1.Clear();


            if (apellidosTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(apellidosTextBox, "Debe Ingresar al menos un nombre de usuario");
                apellidosTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (apellidosTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(apellidosTextBox, "Debe Ingresar al menos un nombre de usuario");
                apellidosTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (claveTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(claveTextBox, "Debe Ingresar una clave de usuario");
                claveTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (ConfirmaciontextBox.Text == String.Empty)
            {
                errorProvider1.SetError(ConfirmaciontextBox, "Debe Ingresar una clave de usuario");
                ConfirmaciontextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (claveTextBox.Text != ConfirmaciontextBox.Text )
            {
                errorProvider1.SetError(claveTextBox, "Debe Ingresar una clave y confirmacion no coinciden");
                errorProvider1.SetError(ConfirmaciontextBox, "Debe Ingresar una clave y confirmacion no coinciden");
                claveTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (correoTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(correoTextBox, "Debe Ingresar una direccion de correo");
                correoTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();
            
            RegexUtilities mivalidador = new RegexUtilities();
            if (!mivalidador.IsValidEmail(correoTextBox.Text))
            {
                errorProvider1.SetError(correoTextBox, "Debe Ingresar una direccion de correo valida");
                correoTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            return true;
        }

        private void frmUsuarios_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Rol' table. You can move, or remove it, as needed.
            this.rolTableAdapter.Fill(this.dSAplicacionComercial.Rol);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Usuario' table. You can move, or remove it, as needed.
            this.usuarioTableAdapter.Fill(this.dSAplicacionComercial.Usuario);
            ConfirmaciontextBox.Text = claveTextBox.Text;

        }

        private void bindingNavigatorMoveFirstItem_Click(object sender, EventArgs e)
        {
            ConfirmaciontextBox.Text = claveTextBox.Text;
        }

        private void bindingNavigatorMovePreviousItem_Click(object sender, EventArgs e)
        {
            ConfirmaciontextBox.Text = claveTextBox.Text;
        }

        private void bindingNavigatorMoveNextItem_Click(object sender, EventArgs e)
        {
            ConfirmaciontextBox.Text = claveTextBox.Text;
        }

        private void bindingNavigatorMoveLastItem_Click(object sender, EventArgs e)
        {
            ConfirmaciontextBox.Text = claveTextBox.Text;
        }

        private void bindingNavigatorPositionItem_TextChanged(object sender, EventArgs e)
        {
            ConfirmaciontextBox.Text = claveTextBox.Text;
        }

        private void bindingNavigatorEdit_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            nuevo = false;
        }

        private void HabilitarCampos()
        {
            bindingNavigatorAddNewItem.Enabled = false;
            bindingNavigatorCancel.Enabled = true;
            bindingNavigatorCountItem.Enabled = false;
            bindingNavigatorDeleteItem.Enabled = false;
            bindingNavigatorEditItem.Enabled = false;
            bindingNavigatorMoveFirstItem.Enabled = false;
            bindingNavigatorMoveLastItem.Enabled = false;
            bindingNavigatorMoveNextItem.Enabled = false;
            bindingNavigatorMovePreviousItem.Enabled = false;
            bindingNavigatorPositionItem.Enabled = false;
            BindingNavigatorSave.Enabled = true;
            bindingNavigatorSearch.Enabled = false;


            iDRolComboBox.Enabled = true;
            nombresTextBox.ReadOnly = false;
            apellidosTextBox.ReadOnly = false;
            nombresTextBox.ReadOnly = false;
            claveTextBox.ReadOnly = false;
            ConfirmaciontextBox.ReadOnly = false;
            correoTextBox.ReadOnly = false;

            iDRolComboBox.Focus();


        }


        private void DeshabilitarCampos()
        {
            bindingNavigatorAddNewItem.Enabled = true;
            bindingNavigatorCancel.Enabled = false;
            bindingNavigatorCountItem.Enabled = true;
            bindingNavigatorDeleteItem.Enabled = true;
            bindingNavigatorEditItem.Enabled = true;
            bindingNavigatorMoveFirstItem.Enabled = true;
            bindingNavigatorMoveLastItem.Enabled = true;
            bindingNavigatorMoveNextItem.Enabled = true;
            bindingNavigatorMovePreviousItem.Enabled = true;
            bindingNavigatorPositionItem.Enabled = true;
            BindingNavigatorSave.Enabled = false;
            bindingNavigatorSearch.Enabled = true;

            iDUsuarioTextBox.ReadOnly = true;
            iDRolComboBox.Enabled = false;
            nombresTextBox.ReadOnly = true;
            apellidosTextBox.ReadOnly = true;
            nombresTextBox.ReadOnly = true;
            claveTextBox.ReadOnly = true;
            ConfirmaciontextBox.ReadOnly = true;
            correoTextBox.ReadOnly = true;

            iDRolComboBox.Focus();

        }

        private void bindingNavigatorCancel_Click(object sender, EventArgs e)
        {

            DeshabilitarCampos();
            usuarioBindingSource.CancelEdit();
            ConfirmaciontextBox.Text = claveTextBox.Text;
        }

        private void bindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            usuarioBindingSource.AddNew();
            HabilitarCampos();
            iDUsuarioTextBox.ReadOnly = false;
            iDUsuarioTextBox.Focus();
            ConfirmaciontextBox.Clear();
            fechaModificacionClaveDateTimePicker.Value = DateTime.Now;
            nuevo = true;
        }

        private void bindingNavigatorDeleteItem_Click(object sender, EventArgs e)
        {
            DialogResult rta = MessageBox.Show("Esta Seguro de borrar el registro actual?", "Confirmacion",
                                               MessageBoxButtons.YesNo, MessageBoxIcon.Question,
                                               MessageBoxDefaultButton.Button2);
            if (rta == DialogResult.No) return;
            {
                usuarioBindingSource.RemoveAt(usuarioBindingSource.Position);
                this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);
            }
        }
       
    
    
    
    }//f
}
