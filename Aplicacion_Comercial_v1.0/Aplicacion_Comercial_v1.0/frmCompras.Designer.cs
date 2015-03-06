namespace Aplicacion_Comercial_v1._0
{
    partial class frmCompras
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.FechadateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.ProveedorcomboBox = new System.Windows.Forms.ComboBox();
            this.proveedorBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dSAplicacionComercial = new Aplicacion_Comercial_v1._0.DSAplicacionComercial();
            this.BusquedaProveedoresbutton = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.BodegacomboBox = new System.Windows.Forms.ComboBox();
            this.bodegaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.proveedorTableAdapter = new Aplicacion_Comercial_v1._0.DSAplicacionComercialTableAdapters.ProveedorTableAdapter();
            this.bodegaTableAdapter = new Aplicacion_Comercial_v1._0.DSAplicacionComercialTableAdapters.BodegaTableAdapter();
            this.label4 = new System.Windows.Forms.Label();
            this.ProductoTextBox = new System.Windows.Forms.TextBox();
            this.BuscarProductobutton = new System.Windows.Forms.Button();
            this.ProductoLabel = new System.Windows.Forms.Label();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.ImagenpictureBox = new System.Windows.Forms.PictureBox();
            this.label5 = new System.Windows.Forms.Label();
            this.CantidadtextBox = new System.Windows.Forms.TextBox();
            this.Agregarbutton = new System.Windows.Forms.Button();
            this.DetalledataGridView = new System.Windows.Forms.DataGridView();
            this.label6 = new System.Windows.Forms.Label();
            this.CostotextBox = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.PorcentajeDescuentoTextBox = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.TotalBrutotextBox = new System.Windows.Forms.TextBox();
            this.TotalIvaTextBox = new System.Windows.Forms.TextBox();
            this.TotalDescuentotextBox = new System.Windows.Forms.TextBox();
            this.TotalNetotextBox = new System.Windows.Forms.TextBox();
            this.Grabarbutton = new System.Windows.Forms.Button();
            this.Cancelarbutton = new System.Windows.Forms.Button();
            this.BorrarTodoButton = new System.Windows.Forms.Button();
            this.BorrarLineabutton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.proveedorBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSAplicacionComercial)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bodegaBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImagenpictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.DetalledataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(37, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Fecha";
            // 
            // FechadateTimePicker
            // 
            this.FechadateTimePicker.Location = new System.Drawing.Point(94, 20);
            this.FechadateTimePicker.Name = "FechadateTimePicker";
            this.FechadateTimePicker.Size = new System.Drawing.Size(200, 20);
            this.FechadateTimePicker.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(56, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Proveedor";
            // 
            // ProveedorcomboBox
            // 
            this.ProveedorcomboBox.DataSource = this.proveedorBindingSource;
            this.ProveedorcomboBox.DisplayMember = "Nombre";
            this.ProveedorcomboBox.FormattingEnabled = true;
            this.ProveedorcomboBox.Location = new System.Drawing.Point(93, 47);
            this.ProveedorcomboBox.Name = "ProveedorcomboBox";
            this.ProveedorcomboBox.Size = new System.Drawing.Size(498, 21);
            this.ProveedorcomboBox.TabIndex = 3;
            this.ProveedorcomboBox.ValueMember = "IDProveedor";
            // 
            // proveedorBindingSource
            // 
            this.proveedorBindingSource.DataMember = "Proveedor";
            this.proveedorBindingSource.DataSource = this.dSAplicacionComercial;
            // 
            // dSAplicacionComercial
            // 
            this.dSAplicacionComercial.DataSetName = "DSAplicacionComercial";
            this.dSAplicacionComercial.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // BusquedaProveedoresbutton
            // 
            this.BusquedaProveedoresbutton.Location = new System.Drawing.Point(609, 47);
            this.BusquedaProveedoresbutton.Name = "BusquedaProveedoresbutton";
            this.BusquedaProveedoresbutton.Size = new System.Drawing.Size(39, 23);
            this.BusquedaProveedoresbutton.TabIndex = 4;
            this.BusquedaProveedoresbutton.Text = "......";
            this.BusquedaProveedoresbutton.UseVisualStyleBackColor = true;
            this.BusquedaProveedoresbutton.Click += new System.EventHandler(this.BusquedaProveedoresbutton_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 76);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Bodega";
            // 
            // BodegacomboBox
            // 
            this.BodegacomboBox.DataSource = this.bodegaBindingSource;
            this.BodegacomboBox.DisplayMember = "Descripcion";
            this.BodegacomboBox.FormattingEnabled = true;
            this.BodegacomboBox.Location = new System.Drawing.Point(93, 73);
            this.BodegacomboBox.Name = "BodegacomboBox";
            this.BodegacomboBox.Size = new System.Drawing.Size(498, 21);
            this.BodegacomboBox.TabIndex = 6;
            this.BodegacomboBox.ValueMember = "IDBodega";
            // 
            // bodegaBindingSource
            // 
            this.bodegaBindingSource.DataMember = "Bodega";
            this.bodegaBindingSource.DataSource = this.dSAplicacionComercial;
            // 
            // proveedorTableAdapter
            // 
            this.proveedorTableAdapter.ClearBeforeFill = true;
            // 
            // bodegaTableAdapter
            // 
            this.bodegaTableAdapter.ClearBeforeFill = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 103);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(50, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Producto";
            // 
            // ProductoTextBox
            // 
            this.ProductoTextBox.Location = new System.Drawing.Point(93, 100);
            this.ProductoTextBox.Name = "ProductoTextBox";
            this.ProductoTextBox.Size = new System.Drawing.Size(233, 20);
            this.ProductoTextBox.TabIndex = 8;
            this.ProductoTextBox.Validating += new System.ComponentModel.CancelEventHandler(this.ProductoTextBox_Validating);
            // 
            // BuscarProductobutton
            // 
            this.BuscarProductobutton.Location = new System.Drawing.Point(344, 98);
            this.BuscarProductobutton.Name = "BuscarProductobutton";
            this.BuscarProductobutton.Size = new System.Drawing.Size(40, 23);
            this.BuscarProductobutton.TabIndex = 9;
            this.BuscarProductobutton.Text = ".....";
            this.BuscarProductobutton.UseVisualStyleBackColor = true;
            this.BuscarProductobutton.Click += new System.EventHandler(this.BuscarProductobutton_Click);
            // 
            // ProductoLabel
            // 
            this.ProductoLabel.AutoSize = true;
            this.ProductoLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ProductoLabel.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.ProductoLabel.Location = new System.Drawing.Point(400, 103);
            this.ProductoLabel.Name = "ProductoLabel";
            this.ProductoLabel.Size = new System.Drawing.Size(129, 13);
            this.ProductoLabel.TabIndex = 10;
            this.ProductoLabel.Text = "Descripcion Producto";
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // ImagenpictureBox
            // 
            this.ImagenpictureBox.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.ImagenpictureBox.Location = new System.Drawing.Point(705, 47);
            this.ImagenpictureBox.Name = "ImagenpictureBox";
            this.ImagenpictureBox.Size = new System.Drawing.Size(189, 197);
            this.ImagenpictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.ImagenpictureBox.TabIndex = 26;
            this.ImagenpictureBox.TabStop = false;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 133);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(49, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "Cantidad";
            // 
            // CantidadtextBox
            // 
            this.CantidadtextBox.Location = new System.Drawing.Point(93, 130);
            this.CantidadtextBox.Name = "CantidadtextBox";
            this.CantidadtextBox.Size = new System.Drawing.Size(233, 20);
            this.CantidadtextBox.TabIndex = 12;
            // 
            // Agregarbutton
            // 
            this.Agregarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.adicionar;
            this.Agregarbutton.Location = new System.Drawing.Point(332, 127);
            this.Agregarbutton.Name = "Agregarbutton";
            this.Agregarbutton.Size = new System.Drawing.Size(66, 55);
            this.Agregarbutton.TabIndex = 18;
            this.Agregarbutton.Text = "Agregar";
            this.Agregarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Agregarbutton.UseVisualStyleBackColor = true;
            this.Agregarbutton.Click += new System.EventHandler(this.Agregarbutton_Click);
            // 
            // DetalledataGridView
            // 
            this.DetalledataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DetalledataGridView.Location = new System.Drawing.Point(22, 248);
            this.DetalledataGridView.Name = "DetalledataGridView";
            this.DetalledataGridView.Size = new System.Drawing.Size(872, 159);
            this.DetalledataGridView.TabIndex = 0;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(12, 165);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(34, 13);
            this.label6.TabIndex = 13;
            this.label6.Text = "Costo";
            // 
            // CostotextBox
            // 
            this.CostotextBox.Location = new System.Drawing.Point(94, 160);
            this.CostotextBox.Name = "CostotextBox";
            this.CostotextBox.Size = new System.Drawing.Size(232, 20);
            this.CostotextBox.TabIndex = 14;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(12, 196);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(70, 13);
            this.label7.TabIndex = 15;
            this.label7.Text = "% Descuento";
            // 
            // PorcentajeDescuentoTextBox
            // 
            this.PorcentajeDescuentoTextBox.Location = new System.Drawing.Point(93, 193);
            this.PorcentajeDescuentoTextBox.Name = "PorcentajeDescuentoTextBox";
            this.PorcentajeDescuentoTextBox.Size = new System.Drawing.Size(233, 20);
            this.PorcentajeDescuentoTextBox.TabIndex = 16;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(309, 424);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(42, 13);
            this.label8.TabIndex = 27;
            this.label8.Text = "Totales";
            // 
            // TotalBrutotextBox
            // 
            this.TotalBrutotextBox.Location = new System.Drawing.Point(369, 422);
            this.TotalBrutotextBox.Name = "TotalBrutotextBox";
            this.TotalBrutotextBox.ReadOnly = true;
            this.TotalBrutotextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalBrutotextBox.TabIndex = 28;
            this.TotalBrutotextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // TotalIvaTextBox
            // 
            this.TotalIvaTextBox.Location = new System.Drawing.Point(495, 422);
            this.TotalIvaTextBox.Name = "TotalIvaTextBox";
            this.TotalIvaTextBox.ReadOnly = true;
            this.TotalIvaTextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalIvaTextBox.TabIndex = 29;
            this.TotalIvaTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // TotalDescuentotextBox
            // 
            this.TotalDescuentotextBox.Location = new System.Drawing.Point(621, 422);
            this.TotalDescuentotextBox.Name = "TotalDescuentotextBox";
            this.TotalDescuentotextBox.ReadOnly = true;
            this.TotalDescuentotextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalDescuentotextBox.TabIndex = 30;
            this.TotalDescuentotextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // TotalNetotextBox
            // 
            this.TotalNetotextBox.Location = new System.Drawing.Point(747, 422);
            this.TotalNetotextBox.Name = "TotalNetotextBox";
            this.TotalNetotextBox.ReadOnly = true;
            this.TotalNetotextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalNetotextBox.TabIndex = 31;
            this.TotalNetotextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // Grabarbutton
            // 
            this.Grabarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Guardar;
            this.Grabarbutton.Location = new System.Drawing.Point(414, 127);
            this.Grabarbutton.Name = "Grabarbutton";
            this.Grabarbutton.Size = new System.Drawing.Size(66, 55);
            this.Grabarbutton.TabIndex = 32;
            this.Grabarbutton.Text = "Grabar";
            this.Grabarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Grabarbutton.UseVisualStyleBackColor = true;
            this.Grabarbutton.Click += new System.EventHandler(this.Grabarbutton_Click);
            // 
            // Cancelarbutton
            // 
            this.Cancelarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Cancelar;
            this.Cancelarbutton.Location = new System.Drawing.Point(495, 130);
            this.Cancelarbutton.Name = "Cancelarbutton";
            this.Cancelarbutton.Size = new System.Drawing.Size(66, 55);
            this.Cancelarbutton.TabIndex = 33;
            this.Cancelarbutton.Text = "Cancelar";
            this.Cancelarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Cancelarbutton.UseVisualStyleBackColor = true;
            this.Cancelarbutton.Click += new System.EventHandler(this.Cancelarbutton_Click);
            // 
            // BorrarTodoButton
            // 
            this.BorrarTodoButton.Location = new System.Drawing.Point(567, 157);
            this.BorrarTodoButton.Name = "BorrarTodoButton";
            this.BorrarTodoButton.Size = new System.Drawing.Size(105, 25);
            this.BorrarTodoButton.TabIndex = 35;
            this.BorrarTodoButton.Text = "BorrarTodo";
            this.BorrarTodoButton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.BorrarTodoButton.UseVisualStyleBackColor = true;
            this.BorrarTodoButton.Click += new System.EventHandler(this.BorrarTodoButton_Click);
            // 
            // BorrarLineabutton
            // 
            this.BorrarLineabutton.Location = new System.Drawing.Point(567, 133);
            this.BorrarLineabutton.Name = "BorrarLineabutton";
            this.BorrarLineabutton.Size = new System.Drawing.Size(105, 22);
            this.BorrarLineabutton.TabIndex = 34;
            this.BorrarLineabutton.Text = "BorrarLinea";
            this.BorrarLineabutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.BorrarLineabutton.UseVisualStyleBackColor = true;
            this.BorrarLineabutton.Click += new System.EventHandler(this.BorrarLineabutton_Click);
            // 
            // frmCompras
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(971, 473);
            this.Controls.Add(this.BorrarTodoButton);
            this.Controls.Add(this.BorrarLineabutton);
            this.Controls.Add(this.Cancelarbutton);
            this.Controls.Add(this.Grabarbutton);
            this.Controls.Add(this.TotalNetotextBox);
            this.Controls.Add(this.TotalDescuentotextBox);
            this.Controls.Add(this.TotalIvaTextBox);
            this.Controls.Add(this.TotalBrutotextBox);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.PorcentajeDescuentoTextBox);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.CostotextBox);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.DetalledataGridView);
            this.Controls.Add(this.Agregarbutton);
            this.Controls.Add(this.CantidadtextBox);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.ImagenpictureBox);
            this.Controls.Add(this.ProductoLabel);
            this.Controls.Add(this.BuscarProductobutton);
            this.Controls.Add(this.ProductoTextBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.BodegacomboBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.BusquedaProveedoresbutton);
            this.Controls.Add(this.ProveedorcomboBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.FechadateTimePicker);
            this.Controls.Add(this.label1);
            this.Name = "frmCompras";
            this.Text = "Compras";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmCompras_FormClosing);
            this.Load += new System.EventHandler(this.frmCompras_Load);
            ((System.ComponentModel.ISupportInitialize)(this.proveedorBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSAplicacionComercial)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bodegaBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImagenpictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.DetalledataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker FechadateTimePicker;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox ProveedorcomboBox;
        private System.Windows.Forms.Button BusquedaProveedoresbutton;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox BodegacomboBox;
        private DSAplicacionComercial dSAplicacionComercial;
        private System.Windows.Forms.BindingSource proveedorBindingSource;
        private DSAplicacionComercialTableAdapters.ProveedorTableAdapter proveedorTableAdapter;
        private System.Windows.Forms.BindingSource bodegaBindingSource;
        private DSAplicacionComercialTableAdapters.BodegaTableAdapter bodegaTableAdapter;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox ProductoTextBox;
        private System.Windows.Forms.Button BuscarProductobutton;
        private System.Windows.Forms.Label ProductoLabel;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.PictureBox ImagenpictureBox;
        private System.Windows.Forms.Button Agregarbutton;
        private System.Windows.Forms.TextBox CantidadtextBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DataGridView DetalledataGridView;
        private System.Windows.Forms.TextBox CostotextBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox PorcentajeDescuentoTextBox;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox TotalNetotextBox;
        private System.Windows.Forms.TextBox TotalDescuentotextBox;
        private System.Windows.Forms.TextBox TotalIvaTextBox;
        private System.Windows.Forms.TextBox TotalBrutotextBox;
        private System.Windows.Forms.Button Cancelarbutton;
        private System.Windows.Forms.Button Grabarbutton;
        private System.Windows.Forms.Button BorrarTodoButton;
        private System.Windows.Forms.Button BorrarLineabutton;
    }
}