using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using CADAplicacionComercial;

namespace Aplicacion_Comercial_v1._0
{
    public partial class frmProductos : Form
    {
        public frmProductos()
        {
            InitializeComponent();
        }

        private void productoBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos()) return;

            this.Validate();
            this.productoBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);
            DeshabilitarCampos();

        }

        private bool ValidarCampos()
        {
            if (descripcionTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(descripcionTextBox, "Debe Ingresar una descripcion para el producto");
                descripcionTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (iDDepartamentoComboBox.SelectedIndex == -1)
            {
                errorProvider1.SetError(iDDepartamentoComboBox, "Debe seleccionar un departamento");
                iDDepartamentoComboBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (iDDepartamentoComboBox.SelectedIndex == -1)
            {
                errorProvider1.SetError(iDDepartamentoComboBox, "Debe seleccionar un departamento");
                iDDepartamentoComboBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (iDIVAComboBox.SelectedIndex == -1)
            {
                errorProvider1.SetError(iDIVAComboBox, "Debe seleccionar un Iva");
                iDIVAComboBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (precioTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(precioTextBox, "Debe Ingresar un precio");
                precioTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            decimal precio;

            if (!decimal.TryParse(precioTextBox.Text, out precio))
            {
                errorProvider1.SetError(precioTextBox, "Debe Ingresar un valor numerico ");
                precioTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();


            if (precio <= 0)
            {
                errorProvider1.SetError(precioTextBox, "Debe Ingresar un valor numerico mayor a {0} en el precio del producto");
                precioTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();


            if (iDMedidaComboBox.SelectedIndex == -1)
            {
                errorProvider1.SetError(iDMedidaComboBox, "Debe seleccionar una unidad de medida");
                iDMedidaComboBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            #region validacion Medida

            if (medidaTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(medidaTextBox, "Debe Ingresar una medida del producto");
                medidaTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            float medida;

            if (!float.TryParse(medidaTextBox.Text, out medida))
            {
                errorProvider1.SetError(medidaTextBox, "Debe Ingresar un valor en la medida del producto ");
                medidaTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();


            if (medida <= 0)
            {
                errorProvider1.SetError(medidaTextBox, "Debe Ingresar una medida  mayor a {0} en la medida del producto");
                medidaTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();



            return true;
        }

            #endregion

        private void frmProductos_Load(object sender, EventArgs e)
        {

            // TODO: This line of code loads data into the 'dSAplicacionComercial.Bodega' table. You can move, or remove it, as needed.
            this.bodegaTableAdapter.Fill(this.dSAplicacionComercial.Bodega);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Medida' table. You can move, or remove it, as needed.
            this.medidaTableAdapter.Fill(this.dSAplicacionComercial.Medida);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.IVA' table. You can move, or remove it, as needed.
            this.iVATableAdapter.Fill(this.dSAplicacionComercial.IVA);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Departamento' table. You can move, or remove it, as needed.
            this.departamentoTableAdapter.Fill(this.dSAplicacionComercial.Departamento);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Producto' table. You can move, or remove it, as needed.
            this.productoTableAdapter.Fill(this.dSAplicacionComercial.Producto);
            llenargrillas();
            CargarImagen();
        }

        private void llenargrillas()
        {
            if (iDProductoTextBox.Text == string.Empty) return;
          
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Barra' table. You can move, or remove it, as needed.
            this.barraTableAdapter.FillBy(this.dSAplicacionComercial.Barra, Convert.ToInt32(iDProductoTextBox.Text));
            // TODO: This line of code loads data into the 'dSAplicacionComercial.BodegaProducto' table. You can move, or remove it, as needed.
            this.bodegaProductoTableAdapter.FillBy1(this.dSAplicacionComercial.BodegaProducto, Convert.ToInt32(iDProductoTextBox.Text));

        }


        #region MenuDeNavegacion



        private void bindingNavigatorMoveFirstItem_Click(object sender, EventArgs e)
        {
            //llenargrillas();
            //CargarImagen();

        }

        private void bindingNavigatorMovePreviousItem_Click(object sender, EventArgs e)
        {
            //llenargrillas();
            //CargarImagen();
        }

        private void bindingNavigatorMoveNextItem_Click(object sender, EventArgs e)
        {
            //llenargrillas();
            //CargarImagen();
        }

        private void bindingNavigatorMoveLastItem_Click(object sender, EventArgs e)
        {
            //llenargrillas();
            //CargarImagen();
        }

        private void bindingNavigatorEdit_Click(object sender, EventArgs e)
        {
            //HabilitarCampos();
            //CargarImagen();
        }
        #endregion



        #region Botones de menu

        private void bindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            productoBindingSource.AddNew();

        }


        private void bindingNavigatorCancel_Click(object sender, EventArgs e)
        {
            this.productoBindingSource.CancelEdit();
            DeshabilitarCampos();
        }


        private void bindingNavigatorDeleteItem_Click(object sender, EventArgs e)
        {
            DialogResult rta = MessageBox.Show("Esta Seguro de borrar el registro actual?", "Confirmacion",
                                                MessageBoxButtons.YesNo, MessageBoxIcon.Question,
                                                MessageBoxDefaultButton.Button2);
            if (rta == DialogResult.No) return;
            
           
            if (CADKardex.KardexTieneMovimientoByIdProducto(Convert.ToInt32(iDProductoTextBox.Text)))
            {
                MessageBox.Show("No se puede Borrar Producto, por que ya tiene movimientos",
                                "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

               CADBarra.DeleteBarraByIDProducto((Convert.ToInt32(iDProductoTextBox.Text)));
               CADBodegaProducto.DeleteBodegaProductoByIdProducto((Convert.ToInt32(iDProductoTextBox.Text)));
            
                productoBindingSource.RemoveAt(productoBindingSource.Position);
                this.tableAdapterManager.UpdateAll(this.dSAplicacionComercial);
                CargarImagen();
            
        }




        #endregion



        #region funciones Habilitar y deshabilitarCampos

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

            productoBindingNavigatorSaveItem.Enabled = true;


            descripcionTextBox.ReadOnly = false;
            iDDepartamentoComboBox.Enabled = true;
            iDIVAComboBox.Enabled = true;
            precioTextBox.ReadOnly = false;
            imagenTextBox.ReadOnly = false;
            BuscarImagenbutton.Enabled = true;

            iDMedidaComboBox.Enabled = true;
            medidaTextBox.ReadOnly = false;
            notasTextBox.ReadOnly = false;

            AgregarBarraButton.Enabled = true;
            EliminarBarrabutton.Enabled = true;
            BodegasAgregarbutton.Enabled = true;



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

            productoBindingNavigatorSaveItem.Enabled = false;


            descripcionTextBox.ReadOnly = true;
            iDDepartamentoComboBox.Enabled = false;
            iDIVAComboBox.Enabled = false;
            precioTextBox.ReadOnly = true;
            imagenTextBox.ReadOnly = true;
            BuscarImagenbutton.Enabled = false;

            iDMedidaComboBox.Enabled = false;
            medidaTextBox.ReadOnly = true;
            notasTextBox.ReadOnly = true;

            AgregarBarraButton.Enabled = false;
            EliminarBarrabutton.Enabled = false;
            BodegasAgregarbutton.Enabled = false;


        }

        #endregion


        #region BuscarImagen
        private void BuscarImagenbutton_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            imagenTextBox.Text = openFileDialog1.SafeFileName;
            CargarImagen();
            ImagenpictureBox.Load(imagenTextBox.Text);

        }

        private void CargarImagen()
        {
            if (imagenTextBox.Text == String.Empty)
            {
                ImagenpictureBox.Image = null;
            }
            else
            {
                if (File.Exists("Recursos\\"+imagenTextBox.Text))
                {
                    ImagenpictureBox.Load("Recursos\\"+imagenTextBox.Text);
                }
            }
        }
        #endregion

        private void AgregarBarraButton_Click(object sender, EventArgs e)
        {
            frmBarras miform = new frmBarras();
            miform.ShowDialog();

            if (miform.Barra == 0) return;
            CADBarra.InsertBarra(Convert.ToInt32(iDProductoTextBox.Text), miform.Barra);
            this.barraTableAdapter.FillBy(this.dSAplicacionComercial.Barra, Convert.ToInt32(iDProductoTextBox.Text));


        }

        private void EliminarBarrabutton_Click(object sender, EventArgs e)
        {
            DialogResult rta = MessageBox.Show("Esta Seguro de borrar Barra", "Confirmacion",
                                                           MessageBoxButtons.YesNo, MessageBoxIcon.Question,
                                                           MessageBoxDefaultButton.Button2);
            if (rta == DialogResult.No) return;
            long barra = (long)BarrasdataGridView.Rows[barraBindingSource.Position].Cells[1].Value;
            CADBarra.DeleteBarra(barra);
            this.barraTableAdapter.FillBy(this.dSAplicacionComercial.Barra, Convert.ToInt32(iDProductoTextBox.Text));
        }

        private void BodegasAgregarbutton_Click(object sender, EventArgs e)
        {
            frmParametrosBodega miform = new frmParametrosBodega();
            miform.IdProducto = Convert.ToInt32(iDProductoTextBox.Text);  //activar el id producto para el frmParametrosBodega
            miform.ShowDialog();
            this.bodegaProductoTableAdapter.FillBy1(this.dSAplicacionComercial.BodegaProducto, Convert.ToInt32(iDProductoTextBox.Text));
        }

        private void bindingNavigatorPositionItem_Click(object sender, EventArgs e)
        {

        }

        private void productoBindingSource_PositionChanged(object sender, EventArgs e)//hacer cambio de position en todo el formulario
        {
            CargarImagen();
            llenargrillas();
        }









    }//fin
}
