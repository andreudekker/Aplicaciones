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
    public partial class frmProveedores : Form
    {

        private CADUsuario usuarioLogueado;

        internal CADUsuario UsuarioLogueado
        {
            get { return usuarioLogueado; }
            set { usuarioLogueado = value; }
        }

        
        
        public frmProveedores()
        {
            InitializeComponent();
        }




        private void frmProveedores_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dSAplicacionComercial.TipoDocumento' table. You can move, or remove it, as needed.
            this.tipoDocumentoTableAdapter.Fill(this.dSAplicacionComercial.TipoDocumento);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Proveedor' table. You can move, or remove it, as needed.
            this.proveedorTableAdapter.Fill(this.dSAplicacionComercial.Proveedor);
            this.verificarPermisos();

        }

        private void verificarPermisos()
        {
            if (CADPermisoRol.PuedeModificar(usuarioLogueado.IDRol, this.Name))
            {
                bindingNavigatorAddNewItem.Enabled = true;
                bindingNavigatorEdit.Enabled = true;
            }
            else
            {
                bindingNavigatorAddNewItem.Enabled = false;
                bindingNavigatorEdit.Enabled = false;
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

        #region HabilitarBotones-Navegacion


       

        private void bindingNavigatorEdit_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
        }


        private void bindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            proveedorBindingSource.AddNew();
            iDTipoDocumentoComboBox.Focus();
        }

        private void bindingNavigatorDeleteItem_Click(object sender, EventArgs e)
        {
            DialogResult rta = MessageBox.Show("Esta Seguro de borrar el registro actual?", "Confirmacion",
                                                MessageBoxButtons.YesNo, MessageBoxIcon.Question,
                                                MessageBoxDefaultButton.Button2);
            if (rta == DialogResult.No) return;

            if (CADCompra.ProveedorTieneCompras(Convert.ToInt32(iDProveedorTextBox.Text)))
            {
                MessageBox.Show("No se puede Borrar proveedor por que ya tiene movimientos",
                                "Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                return;
            } 
         
                
                proveedorBindingSource.RemoveAt(proveedorBindingSource.Position);
                this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);
           
        }

             
        private void proveedorBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos()) return;
            this.Validate();
            this.proveedorBindingSource.EndEdit();


            #region validacion registro iguales en bd
            try
            {
                this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);
            }
            catch (Exception)
            {

                errorProvider1.SetError(documentoTextBox, "Ese numero de documento ya esta asignado ");
                documentoTextBox.Focus();
                return;
              
            }
            errorProvider1.Clear();

            #endregion
          
            DeshabilitarCampos();
            verificarPermisos();
        }

        
        
        private void bindingNavigatorCancel_Click(object sender, EventArgs e)
        {

            this.proveedorBindingSource.CancelEdit();
            DeshabilitarCampos();
            verificarPermisos();
        }


        private void bindingNavigatorEditSearch_Click(object sender, EventArgs e)
        {
            frnBusquedaProveedor miBusqueda = new frnBusquedaProveedor();
            miBusqueda.ShowDialog();

            #region trae la validacion del form en la busqueda de proveedor
            if (miBusqueda.IDProveedor == 0) return;    
            int position = proveedorBindingSource.Find("IDProveedor", miBusqueda.IDProveedor);
            proveedorBindingSource.Position = position;
            #endregion


        }

        
        
        
        #endregion



        #region <Funciones-Habilitarcampos-DeshabilitarCampos-ValidarCampos>
      
        
        private void HabilitarCampos()
        {
            bindingNavigatorAddNewItem.Enabled = false;
            bindingNavigatorCancel.Enabled = true;
            bindingNavigatorCountItem.Enabled = false;
            bindingNavigatorDeleteItem.Enabled = false;
            bindingNavigatorEdit.Enabled = false;
            bindingNavigatorMoveFirstItem.Enabled = false;
            bindingNavigatorMoveLastItem.Enabled = false;
            bindingNavigatorMoveNextItem.Enabled = false;
            bindingNavigatorMovePreviousItem.Enabled = false;
            bindingNavigatorPositionItem.Enabled = false;
            bindingNavigatorSearch.Enabled = false;

            proveedorBindingNavigatorSaveItem.Enabled = true;

            iDTipoDocumentoComboBox.Enabled = true;
            documentoTextBox.ReadOnly = false;
            nombresContactoTextBox.ReadOnly = false;
            apellidosContactoTextBox.ReadOnly = false;
            nombreTextBox.ReadOnly = false;
            nombresContactoTextBox.ReadOnly = false;
            direccionTextBox.ReadOnly = false;
            correoTextBox.ReadOnly = false;
            telefono1TextBox.ReadOnly = false;
            telefono2TextBox.ReadOnly = false;

        }

        private void DeshabilitarCampos()
        {
            bindingNavigatorAddNewItem.Enabled = true;
            bindingNavigatorCancel.Enabled = false;
            bindingNavigatorCountItem.Enabled = true;
            bindingNavigatorDeleteItem.Enabled = true;
            bindingNavigatorEdit.Enabled = true;
            bindingNavigatorMoveFirstItem.Enabled = true;
            bindingNavigatorMoveLastItem.Enabled = true;
            bindingNavigatorMoveNextItem.Enabled = true;
            bindingNavigatorMovePreviousItem.Enabled = true;
            bindingNavigatorPositionItem.Enabled = true;
            bindingNavigatorSearch.Enabled = true;
            proveedorBindingNavigatorSaveItem.Enabled = false;

            iDTipoDocumentoComboBox.Enabled = false;
            documentoTextBox.ReadOnly = true;
            nombresContactoTextBox.ReadOnly = true;
            apellidosContactoTextBox.ReadOnly = true;
            nombreTextBox.ReadOnly = true;
            nombresContactoTextBox.ReadOnly = true;
            direccionTextBox.ReadOnly = true;
            correoTextBox.ReadOnly = true;
            telefono1TextBox.ReadOnly = true;
            telefono2TextBox.ReadOnly = true;
        }


        private bool ValidarCampos()
        {

            if (iDTipoDocumentoComboBox.SelectedIndex== -1)  //validacion CBO
            {
                errorProvider1.SetError(iDTipoDocumentoComboBox, "Debe Ingresar un tipo de documento");
                iDTipoDocumentoComboBox.Focus();
                return false;
            }
            errorProvider1.Clear();
            
            if (documentoTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(documentoTextBox, "Debe Ingresar un numero de documento");
                documentoTextBox.Focus();
                return false;

            }
            errorProvider1.Clear();


            if (nombreTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(nombreTextBox, "Debe Ingresar un nombre de proveedor");
                nombreTextBox.Focus();
                return false;

            }
            errorProvider1.Clear();

          

            if (nombresContactoTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(nombresContactoTextBox, "Debe Ingresar un nombre de contacto");
                nombresContactoTextBox.Focus();
                return false;

            }
            errorProvider1.Clear();



            if (apellidosContactoTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(apellidosContactoTextBox, "Debe Ingresar un apellido de contacto");
                apellidosContactoTextBox.Focus();
                return false;

            }
            errorProvider1.Clear();


            if (nombreTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(nombreTextBox, "Debe Ingresar un nombre de proveedor");
                nombreTextBox.Focus();
                return false;

            }
            errorProvider1.Clear();



            if (correoTextBox.Text != "")
            {

                RegexUtilities regexUtilities = new RegexUtilities();
                if (!regexUtilities.IsValidEmail(correoTextBox.Text))
                {
                    errorProvider1.SetError(correoTextBox, "Si ingresa un correo, debe ser valido");
                    correoTextBox.Focus();
                    return false;
                }
                errorProvider1.Clear();
                DeshabilitarCampos();
                verificarPermisos();

            }
           
            
            return true;
           

        #endregion

        }


        #region AutoCompletadoCamposTexto
        
        private void nombresContactoTextBox_TextChanged(object sender, EventArgs e)
        {
            armaNombre();
        }

       
       private void apellidosContactoTextBox_TextChanged(object sender, EventArgs e)
        {
            armaNombre();
        }

        private void armaNombre()   
        {
            if (iDTipoDocumentoComboBox.SelectedIndex == 0)
            {
                nombreTextBox.Text = nombresContactoTextBox.Text + "" + apellidosContactoTextBox.Text;
            }
        }
        #endregion

      

    }

}

