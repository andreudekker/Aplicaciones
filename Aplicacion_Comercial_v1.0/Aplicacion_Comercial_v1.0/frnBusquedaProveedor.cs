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
    public partial class frnBusquedaProveedor : Form
    {


        #region propiedad temp para validar Datos
        private int idProveedor;

        public int IDProveedor
        {
            get { return idProveedor; }

        }
        #endregion


        public frnBusquedaProveedor()
        {
            InitializeComponent();
        }

        private void frnBusquedaProveedor_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dSAplicacionComercial.TipoDocumento' table. You can move, or remove it, as needed.
            this.tipoDocumentoTableAdapter.Fill(this.dSAplicacionComercial.TipoDocumento);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Proveedor' table. You can move, or remove it, as needed.
            this.proveedorTableAdapter.Fill(this.dSAplicacionComercial.Proveedor);

        }


        #region a partir del fillby y consultando el dgv se valida con una consulta sql like
        private void fillByToolStripButton_Click(object sender, EventArgs e)
        {

            string documento, nombre, nombresContacto, apellidosContacto;
            if (ContengaRadioButton.Checked == true)
            {
                documento = "%" + documentoToolStripTextBox.Text + "%";
                nombre = "%" + nombreToolStripTextBox.Text + "%";
                nombresContacto = "%" + nombresContactoToolStripTextBox.Text + "%";
                apellidosContacto = "%" + apellidosContactoToolStripTextBox.Text + "%";
            }
            else if (EmpiecePorradioButton.Checked == true)
            {
                documento = documentoToolStripTextBox.Text + "%";
                nombre = nombreToolStripTextBox.Text + "%";
                nombresContacto = nombresContactoToolStripTextBox.Text + "%";
                apellidosContacto = apellidosContactoToolStripTextBox.Text + "%";
            }
            else if (TermineRadioButton.Checked == true)
            {
                documento = "%" + documentoToolStripTextBox.Text;
                nombre = "%" + nombreToolStripTextBox.Text;
                nombresContacto = "%" + nombresContactoToolStripTextBox.Text;
                apellidosContacto = "%" + apellidosContactoToolStripTextBox.Text;
            }
            else
            {
                documento = documentoToolStripTextBox.Text;
                nombre = nombreToolStripTextBox.Text;
                nombresContacto = nombresContactoToolStripTextBox.Text;
                apellidosContacto = apellidosContactoToolStripTextBox.Text;
            }


            try
            {
                this.proveedorTableAdapter.FillBy(this.dSAplicacionComercial.Proveedor,
                                                        documento,
                                                        nombre,
                                                        nombresContacto,
                                                        apellidosContacto);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        #endregion

        #region QuitarFiltros
        private void btnQuitarFiltros_Click_1(object sender, EventArgs e)
        {
            documentoToolStripTextBox.Text = "";
            nombreToolStripTextBox.Text = "";
            nombreToolStripTextBox.Text = "";
            apellidosContactoToolStripTextBox.Text = "";
            fillByToolStripButton_Click(sender, e);
        }
        #endregion

        #region btnCancelar
        private void btnCancelar_Click(object sender, EventArgs e)
        {
            idProveedor=0;
            this.Close();

        }
        #endregion

        #region se busca position en dgv para consultar
        private void btnAceptar_Click(object sender, EventArgs e)
        {
            if (BusquedaDataGridView.Rows.Count == 0) 
            {
                idProveedor = 0;
            }
            else if (BusquedaDataGridView.SelectedRows.Count != 0)
            {
                idProveedor = (int)BusquedaDataGridView.SelectedRows[0].Cells[0].Value;
            }
            else
            {
                idProveedor = (int)BusquedaDataGridView.Rows[0].Cells[0].Value;
            }
             this.Close();

        }
        #endregion

    }//fin
}    

