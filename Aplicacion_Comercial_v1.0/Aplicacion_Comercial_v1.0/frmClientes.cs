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
    public partial class frmClientes : Form
    {
        private int i = 0;  //deplazar dentro del registro
        private bool nuevo; // verifica el estado nuevo o editar

        public frmClientes()
        {
            InitializeComponent();
        }

        private void frmClientes_Load(object sender, EventArgs e)
        {
            //// TODO: This line of code loads data into the 'dSAplicacionComercial.Cliente' table. You can move, or remove it, as needed.
            //this.clienteTableAdapter.Fill(this.dSAplicacionComercial.Cliente);
            // TODO: This line of code loads data into the 'dSAplicacionComercial.TipoDocumento' table. You can move, or remove it, as needed.
            this.tipoDocumentoTableAdapter.Fill(this.dSAplicacionComercial.TipoDocumento);

            DatodataGridView.DataSource = CADCliente.GetData(); //MuestraDgv-Completo
            MostrarRegistro();

        }


        #region <Metodo llena los txt con los datos en bd>
        /// <summary>
        /// LLena los registros en los campos de la bd,traidos del CADCliente
        /// </summary>
        private void MostrarRegistro()
        {

            if (DatodataGridView.Rows.Count == 0) return; //cuando la bd es vacia-evita error en bd
        
            IDClienteTextBox.Text = DatodataGridView.Rows[i].Cells["IDCliente"].Value.ToString();
            DocumentoTextBox.Text = DatodataGridView.Rows[i].Cells["Documento"].Value.ToString();
            NombreContactoTextBox.Text = DatodataGridView.Rows[i].Cells["NombresContacto"].Value.ToString();
            ApellidosContactoTextBox.Text = DatodataGridView.Rows[i].Cells["ApellidosContacto"].Value.ToString();
            NombreComercialTextBox.Text = DatodataGridView.Rows[i].Cells["NombreComercial"].Value.ToString();
            DirecciontextBox.Text = DatodataGridView.Rows[i].Cells["Direccion"].Value.ToString();
            Telefono1TextBox.Text = DatodataGridView.Rows[i].Cells["Telefono1"].Value.ToString();
            Telefono2TextBox.Text = DatodataGridView.Rows[i].Cells["Telefono2"].Value.ToString();
            CorreoTextBox.Text = DatodataGridView.Rows[i].Cells["Correo"].Value.ToString();
            NotasTextBox.Text = DatodataGridView.Rows[i].Cells["Notas"].Value.ToString();
            IDtipoDocumentoComboBox.SelectedValue = DatodataGridView.Rows[i].Cells["IDTipoDocumento"].Value;

            try
            {
                AniversariodateTimePicker.Value = Convert.ToDateTime(DatodataGridView.Rows[i].Cells["Aniversario"].Value);
            }
            catch (Exception)
            {
                AniversariodateTimePicker.Value = DateTime.Now;
                
            }
          
        }
        #endregion

        #region  moverse entre registros
        private void tsbPrimero_Click(object sender, EventArgs e)
        {
            i = 0;
            MostrarRegistro();
        }

        private void tsbAnterior_Click(object sender, EventArgs e)
        {
            if (i ==0) return;
            i--;
            MostrarRegistro();
        }

        private void tsbSiguiente_Click(object sender, EventArgs e)
        {
            if (i >= DatodataGridView.Rows.Count -1) return;
            i++;
            MostrarRegistro();
        }

        private void tsbUltimo_Click(object sender, EventArgs e)
        {
            i = DatodataGridView.Rows.Count-1;
            MostrarRegistro();
            
        }
        #endregion

        #region <Botones de Crud principal>

        private void tsbNuevo_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            limpiarCampos();
            nuevo = true;
        }

        

        private void tsbModificar_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            nuevo = false;
           
        }

     
        private void tsbCancelar_Click(object sender, EventArgs e)
        {
            DeshabilitarCampos();
            MostrarRegistro();
        }
        private void tsbGuardar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos()) return;
            if (nuevo)
            {
                CADCliente.InsertCliente((int)IDtipoDocumentoComboBox.SelectedValue,
                                           DocumentoTextBox.Text,
                                           NombreComercialTextBox.Text,
                                           NombreContactoTextBox.Text,
                                           ApellidosContactoTextBox.Text,
                                           DirecciontextBox.Text,
                                           Telefono1TextBox.Text,
                                           Telefono2TextBox.Text,
                                           CorreoTextBox.Text,
                                           NotasTextBox.Text,
                                           AniversariodateTimePicker.Value);
            }
            else
            {
                CADCliente.UpdateCliente((int)IDtipoDocumentoComboBox.SelectedValue,
                                           DocumentoTextBox.Text,
                                           NombreComercialTextBox.Text,
                                           NombreContactoTextBox.Text,
                                           ApellidosContactoTextBox.Text,
                                           DirecciontextBox.Text,
                                           Telefono1TextBox.Text,
                                           Telefono2TextBox.Text,
                                           CorreoTextBox.Text,
                                           NotasTextBox.Text,
                                           AniversariodateTimePicker.Value,
                                           Convert.ToInt32(IDClienteTextBox.Text));
            }

            DeshabilitarCampos();
            DatodataGridView.DataSource = null;
            DatodataGridView.DataSource = CADCliente.GetData();
            if (nuevo) tsbUltimo_Click(sender, e);
           
            MostrarRegistro();
        }


        private void tsbBorrar_Click(object sender, EventArgs e)
        {
            DialogResult rta = MessageBox.Show("Estas Seguro de borrar el Registro Actual",
                                                "Confirmacion", MessageBoxButtons.YesNo, MessageBoxIcon.Question,
                                                 MessageBoxDefaultButton.Button2);
            if (rta == DialogResult.No) return;
            CADCliente.DeleteCliente(Convert.ToInt32(IDClienteTextBox.Text));

            DatodataGridView.DataSource = null; //refrescar grilla
            DatodataGridView.DataSource = CADCliente.GetData();
            if (nuevo) tsbUltimo_Click(sender, e);
            if (i != 0) i--;  //regresar en el registro la i == a registro

            MostrarRegistro();

        }
        #endregion
       
        #region <funciones Habilitar - DeshabilitarCampos -limpiarCampos -ValidaCampos> 
        private void HabilitarCampos()
        {
            tsbPrimero.Enabled = false;
            tsbAnterior.Enabled = false;
            tsbSiguiente.Enabled = false;
            tsbUltimo.Enabled = false;

            tsbNuevo.Enabled = false;
            tsbModificar.Enabled = false;
            tsbGuardar.Enabled = true;
            tsbCancelar.Enabled = true;
            tsbBorrar.Enabled = false;
            tsbBuscar.Enabled = false;

            DocumentoTextBox.ReadOnly = false;
            NombreContactoTextBox.ReadOnly = false;
            ApellidosContactoTextBox.ReadOnly = false;
            NombreComercialTextBox.ReadOnly = false;
            DirecciontextBox.ReadOnly = false;
            Telefono1TextBox.ReadOnly = false;
            Telefono2TextBox.ReadOnly = false;
            CorreoTextBox.ReadOnly = false;
            NotasTextBox.ReadOnly = false;

            IDtipoDocumentoComboBox.Enabled = true;
            AniversariodateTimePicker.Enabled = true;

            IDtipoDocumentoComboBox.Focus();


        }

      
        private void DeshabilitarCampos()
        {
            tsbPrimero.Enabled = true;
            tsbAnterior.Enabled = true;
            tsbSiguiente.Enabled = true;
            tsbUltimo.Enabled = true;

            tsbNuevo.Enabled = true;
            tsbModificar.Enabled = true;
            tsbGuardar.Enabled = false;
            tsbCancelar.Enabled = false;
            tsbBorrar.Enabled = true;
            tsbBuscar.Enabled = true;

            DocumentoTextBox.ReadOnly = true;
            NombreContactoTextBox.ReadOnly = true;
            ApellidosContactoTextBox.ReadOnly = true;
            NombreComercialTextBox.ReadOnly = true;
            DirecciontextBox.ReadOnly = true;
            Telefono1TextBox.ReadOnly = true;
            Telefono2TextBox.ReadOnly = true;
            CorreoTextBox.ReadOnly = true;
            NotasTextBox.ReadOnly = true;

            IDtipoDocumentoComboBox.Enabled = false;
            AniversariodateTimePicker.Enabled = false;

            IDtipoDocumentoComboBox.Focus();
        }



        private void limpiarCampos()
        {
            IDClienteTextBox.Text = "";
            DocumentoTextBox.Text = "";
            NombreContactoTextBox.Text = "";
            ApellidosContactoTextBox.Text = "";
            NombreComercialTextBox.Text = "";
            DirecciontextBox.Text = "";
            Telefono1TextBox.Text = "";
            Telefono2TextBox.Text = "";
            CorreoTextBox.Text = "";
            NotasTextBox.Text = "";

            IDtipoDocumentoComboBox.SelectedIndex = -1;
            AniversariodateTimePicker.Value = DateTime.Now;
        }



        private bool ValidarCampos()
        {
            if (IDtipoDocumentoComboBox.SelectedIndex == -1)
            {
                errorProvider1.SetError(IDtipoDocumentoComboBox, "Debe Seleccionar un tipo de Documentos");
                IDtipoDocumentoComboBox.Focus();
                return false;
            }
            errorProvider1.Clear();


            if (DocumentoTextBox.Text == string.Empty)
            {
                errorProvider1.SetError(DocumentoTextBox, "Debe ingresar un Documento");
                DocumentoTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (NombreContactoTextBox.Text == string.Empty)
            {
                errorProvider1.SetError(NombreContactoTextBox, "Debe ingresar un Nombre");
                NombreContactoTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (ApellidosContactoTextBox.Text == string.Empty)
            {
                errorProvider1.SetError(ApellidosContactoTextBox, "Debe ingresar un apellido");
                ApellidosContactoTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            if (NombreComercialTextBox.Text == string.Empty)
            {
                errorProvider1.SetError(NombreComercialTextBox, "Debe ingresar un nombre comercial");
                NombreComercialTextBox.Focus();
                return false;
            }
            errorProvider1.Clear();

            return true;


        }



        #endregion

        
        
    }
}
