using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CADAplicacionComercial;

namespace Aplicacion_Comercial_v1._0
{
    public partial class frmBarras : Form
    {


        private long barra=0;

        public long Barra
        {
            get { return barra; }

        }

        public frmBarras()
        {
            InitializeComponent();
        }

        private void frmBarras_Load(object sender, EventArgs e)
        {

        }

        #region Botones


        private void AceptarBarrabutton_Click(object sender, EventArgs e)
        {


            if (BarratextBox.Text == String.Empty)
            {
                errorProvider1.SetError(BarratextBox, "Debe ingresar un numero de codigo de barra valido");
                BarratextBox.Focus();
                return;
            }
            errorProvider1.Clear();

            if (!long.TryParse(BarratextBox.Text, out barra))
            {
                errorProvider1.SetError(BarratextBox, "Debe ingresar un numero Entero");
                BarratextBox.Focus();
                return;
            }
            errorProvider1.Clear();

            if (barra < 1000000)
            {
                errorProvider1.SetError(BarratextBox, "el numero no corresponde a un codigo de barras");
                BarratextBox.Focus();
                return;
            }
            errorProvider1.Clear();

            if (CADBarra.ExisteBarra(barra))
            {
                errorProvider1.SetError(BarratextBox, "El numero de barras ya esta asignado a otro producto");
                BarratextBox.Focus();
                return;
            }
            errorProvider1.Clear();
            this.Close();

        }

        private void CancelarBarrabutton_Click(object sender, EventArgs e)
        {
            barra = 0;
            this.Close();
        }
        #endregion
            }
       }       

