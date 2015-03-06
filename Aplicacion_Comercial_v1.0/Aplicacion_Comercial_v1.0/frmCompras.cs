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
using System.IO;

namespace Aplicacion_Comercial_v1._0
{
    public partial class frmCompras : Form
    {

        List<DetalleCompra> misDetalles = new List<DetalleCompra>(); //delaclaseDetalleCompra-Temp-paraelDgv

        CADProducto ultimoProducto = null; //Validacion UltimoProducto 

        private decimal totalBruto = 0; //al txt de valores totales
        private decimal totalDescuento = 0;
        private decimal totalIva = 0;
        private decimal totalNeto = 0;

        #region Validacion Uservalidate
        private CADUsuario usuarioLogueado;

        internal CADUsuario UsuarioLogueado
        {
            get { return usuarioLogueado; }
            set { usuarioLogueado = value; }
        }
        #endregion



        public frmCompras()
        {
            InitializeComponent();
        }

        private void frmCompras_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Bodega' table. You can move, or remove it, as needed.
            this.bodegaTableAdapter.FillBy(this.dSAplicacionComercial.Bodega); //reemplazo de fillby en query al cbo
            // TODO: This line of code loads data into the 'dSAplicacionComercial.Proveedor' table. You can move, or remove it, as needed.
            this.proveedorTableAdapter.FillBy1(this.dSAplicacionComercial.Proveedor);


            FechadateTimePicker.Value = DateTime.Now;
            ProveedorcomboBox.SelectedIndex = -1; //no deja por defecto el primer proveedor
            BodegacomboBox.SelectedIndex = -1;
            ProductoLabel.Text = string.Empty;

            DetalledataGridView.DataSource = misDetalles;

        }

        private void BusquedaProveedoresbutton_Click(object sender, EventArgs e)
        {
            frnBusquedaProveedor miBusqueda = new frnBusquedaProveedor();
            miBusqueda.ShowDialog();
            if (miBusqueda.IDProveedor == 0) return;
            ProveedorcomboBox.SelectedValue = miBusqueda.IDProveedor;
            ProductoLabel.Text = String.Empty;

        }

        private void ProductoTextBox_Validating(object sender, CancelEventArgs e)
        {
            if (ProductoTextBox.Text == String.Empty)
            {
                errorProvider1.SetError(ProductoTextBox, "Debe Ingresar un id de producto o un codigo de barra");
                return;
            }
            errorProvider1.Clear();

            long producto;

            if (!long.TryParse(ProductoTextBox.Text, out producto))
            {
                errorProvider1.SetError(ProductoTextBox, "Debe Ingresar un valor numerico entero");
                return;
            }
            errorProvider1.Clear();

            if (producto <= 0)
            {
                errorProvider1.SetError(ProductoTextBox, "Debe Ingresar un valor numerico  mayor a 0");
                return;
            }


            CADProducto miproducto = CADProducto.GetProductoByIDPRoducto((int)producto); //codigo producto o codigo de barras
            if (miproducto == null)
            {
                miproducto = CADProducto.GetProductoByBarra(producto);
            }
            if (miproducto == null)
            {

                errorProvider1.SetError(ProductoTextBox, "Producto No existe");

                ProductoLabel.Text = String.Empty;
                ImagenpictureBox.Image = null;
                ultimoProducto = null;
            }
            else
            {
                ProductoLabel.Text = miproducto.Descripcion;
                ultimoProducto = miproducto;
                if (miproducto.Imagen != string.Empty)
                {
                    if (File.Exists(miproducto.Imagen))
                    {
                        ImagenpictureBox.Image = Image.FromFile(miproducto.Imagen);
                    }
                    else
                    {
                        ImagenpictureBox.Image = null;
                    }
                }
                else
                {
                    ImagenpictureBox.Image = null;
                }

            }


        }

        private void BuscarProductobutton_Click(object sender, EventArgs e)
        {
            frmBusquedaProducto miBusqueda = new frmBusquedaProducto();
            miBusqueda.ShowDialog();
            if (miBusqueda.IDProducto == 0) return;  //conocer si seleccionaron
            ProductoTextBox.Text = miBusqueda.IDProducto.ToString();
            ProductoLabel.Text = String.Empty;
            ProductoTextBox_Validating(sender, new CancelEventArgs()); //nuevoEvento cancelEventArgs
        }

        private void Agregarbutton_Click(object sender, EventArgs e)
        {
            if (ultimoProducto == null)
            {
                errorProvider1.SetError(ProductoTextBox, "Debe Ingresar un producto");
                ProductoTextBox.Focus();
                return;
            }
            errorProvider1.Clear();

            if (CantidadtextBox.Text == String.Empty)
            {
                errorProvider1.SetError(CantidadtextBox, "Debe Ingresar una cantidad");
                return;
            }
            errorProvider1.Clear();

            float Cantidad;

            if (!float.TryParse(CantidadtextBox.Text, out Cantidad))
            {
                errorProvider1.SetError(CantidadtextBox, "Debe Ingresar un valor numerico en cantidad");
                return;
            }
            errorProvider1.Clear();

            if (Cantidad <= 0)
            {
                errorProvider1.SetError(ProductoTextBox, "Debe Ingresar un valor   mayor a 0");
                return;
            }

            #region costo
            if (CostotextBox.Text == String.Empty)
            {
                errorProvider1.SetError(CostotextBox, "Debe Ingresar un costo");
                return;
            }
            errorProvider1.Clear();

            decimal Costo;

            if (!Decimal.TryParse(CostotextBox.Text, out Costo))
            {
                errorProvider1.SetError(CostotextBox, "Debe Ingresar un valor numerico en costo");
                return;
            }
            errorProvider1.Clear();

            if (Cantidad <= 0)
            {
                errorProvider1.SetError(CostotextBox, "Debe Ingresar un valor mayor a 0");
                return;
            }

            #endregion

            #region PorcentajeDescuento

            float PorcentajeDescuento = 0;
            if (PorcentajeDescuentoTextBox.Text != String.Empty)
            {

                if (!float.TryParse(PorcentajeDescuentoTextBox.Text, out PorcentajeDescuento))
                {
                    errorProvider1.SetError(PorcentajeDescuentoTextBox, "Debe Ingresar un valor numerico en costo");
                    return;
                }
                errorProvider1.Clear();

                if (PorcentajeDescuento <= 0 && PorcentajeDescuento > 100)
                {
                    errorProvider1.SetError(PorcentajeDescuentoTextBox, "Debe Ingresar un valor mayor a 0" +
                                                                         "y menor o igual a 100");
                    return;
                }
                errorProvider1.Clear();
                PorcentajeDescuento /= 100;
            }

            #endregion

            CADIVA miiva = CADIVA.getIVA(ultimoProducto.IDIVA);

            DetalleCompra miDetalle = new DetalleCompra();
            miDetalle.Cantidad = Cantidad;
            miDetalle.Costo = Costo;
            miDetalle.Descripcion = ultimoProducto.Descripcion;
            miDetalle.IDProducto = ultimoProducto.IDProducto;
            miDetalle.PorcentajeDescuento = PorcentajeDescuento;
            miDetalle.PorcentajeIVA = miiva.Tarifa / 100;

            

            misDetalles.Add(miDetalle);//toma de la list<>
            refrescaGrid();

            ultimoProducto = null;

            #region limpiarcamposTexto

            ProductoTextBox.Text = string.Empty;
            ProductoLabel.Text = string.Empty;
            CantidadtextBox.Text = string.Empty;
            CostotextBox.Text = string.Empty;
            PorcentajeDescuentoTextBox.Text = string.Empty;

            ProductoTextBox.Focus();

            #endregion

        }
        private void refrescaGrid()
        {
            DetalledataGridView.DataSource = null;
            DetalledataGridView.DataSource = misDetalles;

            totalBruto = 0; //al txt de valores totales
            totalDescuento = 0;
            totalIva = 0;
            totalNeto = 0;

            foreach (DetalleCompra miDetalle in misDetalles)
            {
               totalBruto += miDetalle.valorBruto; ///calcular las operaciones de DetallesCompra
               totalDescuento += miDetalle.valorDescuento;
               totalIva += miDetalle.valorIVA;
               totalNeto += miDetalle.valorNeto; 
            }

            TotalBrutotextBox.Text = string.Format("{0:C2}", totalBruto); //modificacion textbox totales
            TotalIvaTextBox.Text = string.Format("{0:C2}", totalIva);  //textalign click en right
            TotalDescuentotextBox.Text = string.Format("{0:C2}", totalDescuento);
            TotalNetotextBox.Text = string.Format("{0:C2}", totalNeto);

            personalizaGrid();
        }

        private void personalizaGrid()
        {
            DetalledataGridView.Columns["IDProducto"].HeaderText = "IDProducto";
            DetalledataGridView.Columns["IDProducto"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;// Alineacion Derecha
            DetalledataGridView.Columns["IDProducto"].Width = 80;

            DetalledataGridView.Columns["Descripcion"].HeaderText = "Descripcion";
            DetalledataGridView.Columns["Descripcion"].Width = 200;


            DetalledataGridView.Columns["IDProducto"].HeaderText = "IDProducto";
            DetalledataGridView.Columns["IDProducto"].Width = 80;

            DetalledataGridView.Columns["Descripcion"].HeaderText = "Descripcion";

            DetalledataGridView.Columns["Costo"].HeaderText = "Costo";
            DetalledataGridView.Columns["Costo"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["Costo"].DefaultCellStyle.Format = "C2"; //colocar con $Pesos 
            DetalledataGridView.Columns["Costo"].Width = 80;

            DetalledataGridView.Columns["Cantidad"].HeaderText = "Cantidad";
            DetalledataGridView.Columns["Cantidad"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["Cantidad"].DefaultCellStyle.Format = "N2";
            DetalledataGridView.Columns["Cantidad"].Width = 80;

            DetalledataGridView.Columns["PorcentajeIVA"].HeaderText = "Porcentaje IVA";
            DetalledataGridView.Columns["PorcentajeIVA"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["PorcentajeIVA"].DefaultCellStyle.Format = "P2"; // porcentaje con dos decimales
            DetalledataGridView.Columns["PorcentajeIVA"].Width = 80;

            DetalledataGridView.Columns["PorcentajeDescuento"].HeaderText = "Porcentaje Descuento";
            DetalledataGridView.Columns["PorcentajeDescuento"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["PorcentajeDescuento"].DefaultCellStyle.Format = "P2";
            DetalledataGridView.Columns["PorcentajeDescuento"].Width = 80;

            DetalledataGridView.Columns["valorBruto"].HeaderText = "valor Bruto";
            DetalledataGridView.Columns["valorBruto"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["valorBruto"].DefaultCellStyle.Format = "C2";
            DetalledataGridView.Columns["valorBruto"].Width = 80;

            DetalledataGridView.Columns["valorIVA"].HeaderText = "valor IVA";
            DetalledataGridView.Columns["valorIVA"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["valorIVA"].DefaultCellStyle.Format = "C2";
            DetalledataGridView.Columns["valorIVA"].Width = 80;

            DetalledataGridView.Columns["valorDescuento"].HeaderText = "valor Descuento";
            DetalledataGridView.Columns["valorDescuento"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["valorDescuento"].DefaultCellStyle.Format = "C2";
            DetalledataGridView.Columns["valorDescuento"].Width = 80;

            DetalledataGridView.Columns["valorNeto"].HeaderText = "valor Neto";
            DetalledataGridView.Columns["valorNeto"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            DetalledataGridView.Columns["valorNeto"].DefaultCellStyle.Format = "C2";
            DetalledataGridView.Columns["valorNeto"].Width = 80;

        }

        #region BotonesDeCompra

        private void Cancelarbutton_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Grabarbutton_Click(object sender, EventArgs e)
        {
            if (ProveedorcomboBox.SelectedIndex == -1)
            {
                errorProvider1.SetError(ProveedorcomboBox, "Debe Seleccionar un proveedor");
                ProveedorcomboBox.Focus();
                return;

            }
            errorProvider1.Clear();

            if (BodegacomboBox.SelectedIndex == -1)
            {
                errorProvider1.SetError(BodegacomboBox, "Debe Seleccionar una bodega");
                BodegacomboBox.Focus();
                return;

            }
            errorProvider1.Clear();

            if (misDetalles.Count == 0)
            {
                errorProvider1.SetError(ProductoTextBox, "Debe ingresar productos en la compra");
                ProductoTextBox.Focus();
                return;

            }
            errorProvider1.Clear();

            DialogResult rta = MessageBox.Show("Esta seguro de grabar la compra", "Confirmacion", MessageBoxButtons.YesNo,
                                                MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);

            if (rta == DialogResult.No) return; //Cancela el usuario



            //grabar compra en BD
            //encabezado de la compra

            int IDBodega = (int)BodegacomboBox.SelectedValue;  //cast
            int IDProveedor = (int)ProveedorcomboBox.SelectedValue;//cast

            int IDcompra = CADCompra.InsertCompra(FechadateTimePicker.Value,
                                                IDBodega,
                                                IDProveedor);

            DateTime fecha = FechadateTimePicker.Value;

            //Detalle en la compra
            foreach (DetalleCompra midetalle in misDetalles)
            {
                //ConsultarSaldoDeProductoEnLaBodega
                //actualiza bodega producto
                CADBodegaProducto miBodegaProducto = CADBodegaProducto.GetBodegaProductoByIDBodegaAndIDProducto(IDBodega, midetalle.IDProducto);

                if (miBodegaProducto == null) //encontro un registro
                {

                    CADBodegaProducto.updateBodegaProducto(IDBodega, midetalle.IDProducto, 1, 1, 1, 1);

                }

                CADBodegaProducto.AumentarStock(midetalle.Cantidad, IDBodega, midetalle.IDProducto);

                //actualizamos el Kardex
                CADKardex miKardex = CADKardex.UltimoKardex(IDBodega, midetalle.IDProducto);
                int IDkardex;

                float nuevoSaldo;
                decimal nuevoCostoPromedio;
                decimal nuevoUltimoCosto;
                if (miKardex == null) //sin compras
                {
                    nuevoSaldo = midetalle.Cantidad;
                    nuevoCostoPromedio = midetalle.valorNeto/(decimal)midetalle.Cantidad;
                    nuevoUltimoCosto = nuevoCostoPromedio;
                }
                else
                {
                    //calculo de inventario
                    nuevoSaldo = miKardex.Saldo + midetalle.Cantidad;
                    nuevoCostoPromedio =
                                               (miKardex.CostoPromedio * (decimal)miKardex.Saldo +
                                                midetalle.valorNeto/(decimal)nuevoSaldo)+
                                               (decimal)nuevoSaldo;
                                                nuevoUltimoCosto = midetalle.valorNeto / (decimal)midetalle.Cantidad;

                }
                IDkardex = CADKardex.InsertKardex(IDBodega, midetalle.IDProducto, fecha,
                                                     string.Format("CO-{0}", IDcompra), midetalle.Cantidad, 0, nuevoSaldo,
                                                     nuevoUltimoCosto, nuevoCostoPromedio);


                //actualizarTablaCompraDetalle
                CADCompraDetalle.InsertCompraDetalle(IDcompra,
                                                     midetalle.IDProducto,
                                                     midetalle.Descripcion,
                                                     midetalle.Costo,
                                                     midetalle.Cantidad,
                                                     IDkardex,
                                                     midetalle.PorcentajeIVA,
                                                     midetalle.PorcentajeDescuento);



               
            }

            MessageBox.Show(string.Format("Compra {0} Exitosa",IDcompra),"Confirmacion",
                             MessageBoxButtons.OK, MessageBoxIcon.Information);


             totalBruto = 0; //al txt de valores totales
             totalDescuento = 0;
             totalIva = 0;
             totalNeto = 0;
             
            //ImagenpictureBox.Image = null;//clearImagen

            ProveedorcomboBox.SelectedIndex = -1;
            BodegacomboBox.SelectedIndex = -1;
            misDetalles.Clear();
            refrescaGrid();
            ProveedorcomboBox.Focus();

        }
        #endregion

        private void BorrarTodoButton_Click(object sender, EventArgs e)
        {

            errorProvider1.Clear();
            if (misDetalles.Count == 0) return;
        
            DialogResult rta = MessageBox.Show("Esta seguro de borrar todas las lineas de la compra",
                                                "Confirmacion",MessageBoxButtons.YesNo,MessageBoxIcon.Question,
                                                MessageBoxDefaultButton.Button2);

            if (rta == DialogResult.No) return;

            
            misDetalles.Clear();
            errorProvider1.Clear();
            refrescaGrid();
            ImagenpictureBox.Image = null;


        }

        private void BorrarLineabutton_Click(object sender, EventArgs e)
        {
            errorProvider1.Clear();
            if (misDetalles.Count == 0) return;
            if (DetalledataGridView.SelectedRows.Count == 0)
            {
                misDetalles.RemoveAt(misDetalles.Count - 1);
                refrescaGrid();
            }

            DialogResult rta = MessageBox.Show("Esta seguro de borrar todas las lineas de la compra",
                                                "Confirmacion", MessageBoxButtons.YesNo, MessageBoxIcon.Question,
                                                MessageBoxDefaultButton.Button2);

            if (rta == DialogResult.No) return;
        }

        private void frmCompras_FormClosing(object sender, FormClosingEventArgs e) //si usuario cierra ventana
        {
            if (misDetalles.Count!=0)
            {
                DialogResult rta = MessageBox.Show("Esta seguro de cerrar el formulario de compra y perder los registros ingresados",
                                                "Confirmacion", MessageBoxButtons.YesNo, MessageBoxIcon.Question,
                                                MessageBoxDefaultButton.Button2);

                if (rta == DialogResult.No) return;

                {
                    e.Cancel = true;
                }
            }
        }

    }//f
}
