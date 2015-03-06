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
    public partial class frmParametrosBodega : Form
    {
        private int idProducto; // propiedad
        
      public int IdProducto
        {
          get { return idProducto; }
          set { idProducto = value; }  
         }       


   public frmParametrosBodega()
        {
            InitializeComponent();
        }

        private void frmParametrosBodega_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Bodega' table. You can move, or remove it, as needed.
            this.bodegaTableAdapter.Fill(this.dSAplicacionComercial.Bodega);
            BodegaComboBox.SelectedIndex = -1;


        }

        private void BodegaComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (BodegaComboBox.SelectedIndex == -1) return;
            {
                
            }
            
            CADBodegaProducto miBodegaProducto = CADBodegaProducto.GetBodegaProductoByIDBodegaAndIDProducto(
                                                                                                            (int)BodegaComboBox.SelectedValue,IdProducto); 
            if ( miBodegaProducto==null)
	            {
		          StocktextBox.Text = string.Empty;
                  MinimonumericUpDown.Value=1;  
                  maximoNumericUpDown.Value=1;
                  DiasReposicionnumericUpDown.Value=1;
                  CantidadMinimanumericUpDown.Value=1;
	            }
            else
	        {
                  StocktextBox.Text =miBodegaProducto.Stock.ToString();
                  MinimonumericUpDown.Value= (decimal)miBodegaProducto.Minimo;  
                  maximoNumericUpDown.Value=(decimal)miBodegaProducto.Maximo;
                  DiasReposicionnumericUpDown.Value=(decimal)miBodegaProducto.DiasReposicion;
                  CantidadMinimanumericUpDown.Value=(decimal)miBodegaProducto.CantidadMinima;

	        }
        }

        private void AceptarParametrobutton_Click(object sender, EventArgs e)
        {
            if (BodegaComboBox.SelectedIndex==-1)
            {
                errorProvider1.SetError(BodegaComboBox, "Debe seleccionar una bodega");
                BodegaComboBox.Focus();
                return;
            }
            errorProvider1.Clear();
            
            
            CADBodegaProducto.updateBodegaProducto((int)BodegaComboBox.SelectedValue, 
                                                    idProducto,
                                                    (double)MinimonumericUpDown.Value,
                                                    (double)maximoNumericUpDown.Value,
                                                    (int)DiasReposicionnumericUpDown.Value,
                                                    (double)CantidadMinimanumericUpDown.Value);

            this.Close();



        }
    }
}
