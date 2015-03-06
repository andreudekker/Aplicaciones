namespace Aplicacion_Comercial_v1._0
{
    partial class frmVentas
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
            this.BorrarTodoButton = new System.Windows.Forms.Button();
            this.BorrarLineabutton = new System.Windows.Forms.Button();
            this.Cancelarbutton = new System.Windows.Forms.Button();
            this.Grabarbutton = new System.Windows.Forms.Button();
            this.TotalNetotextBox = new System.Windows.Forms.TextBox();
            this.TotalDescuentotextBox = new System.Windows.Forms.TextBox();
            this.TotalIvaTextBox = new System.Windows.Forms.TextBox();
            this.TotalBrutotextBox = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.PorcentajeDescuentoTextBox = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.PreciotextBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.DetalledataGridView = new System.Windows.Forms.DataGridView();
            this.Agregarbutton = new System.Windows.Forms.Button();
            this.CantidadtextBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.ImagenpictureBox = new System.Windows.Forms.PictureBox();
            this.ProductoLabel = new System.Windows.Forms.Label();
            this.BuscarProductobutton = new System.Windows.Forms.Button();
            this.ProductoTextBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.BodegacomboBox = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.BuscarClientebutton = new System.Windows.Forms.Button();
            this.ClientecomboBox = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.FechadateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.DetalledataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImagenpictureBox)).BeginInit();
            this.SuspendLayout();
            // 
            // BorrarTodoButton
            // 
            this.BorrarTodoButton.Location = new System.Drawing.Point(599, 162);
            this.BorrarTodoButton.Name = "BorrarTodoButton";
            this.BorrarTodoButton.Size = new System.Drawing.Size(105, 25);
            this.BorrarTodoButton.TabIndex = 64;
            this.BorrarTodoButton.Text = "BorrarTodo";
            this.BorrarTodoButton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.BorrarTodoButton.UseVisualStyleBackColor = true;
            // 
            // BorrarLineabutton
            // 
            this.BorrarLineabutton.Location = new System.Drawing.Point(599, 138);
            this.BorrarLineabutton.Name = "BorrarLineabutton";
            this.BorrarLineabutton.Size = new System.Drawing.Size(105, 22);
            this.BorrarLineabutton.TabIndex = 63;
            this.BorrarLineabutton.Text = "BorrarLinea";
            this.BorrarLineabutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.BorrarLineabutton.UseVisualStyleBackColor = true;
            // 
            // Cancelarbutton
            // 
            this.Cancelarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Cancelar;
            this.Cancelarbutton.Location = new System.Drawing.Point(527, 135);
            this.Cancelarbutton.Name = "Cancelarbutton";
            this.Cancelarbutton.Size = new System.Drawing.Size(66, 55);
            this.Cancelarbutton.TabIndex = 62;
            this.Cancelarbutton.Text = "Cancelar";
            this.Cancelarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Cancelarbutton.UseVisualStyleBackColor = true;
            // 
            // Grabarbutton
            // 
            this.Grabarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Guardar;
            this.Grabarbutton.Location = new System.Drawing.Point(446, 132);
            this.Grabarbutton.Name = "Grabarbutton";
            this.Grabarbutton.Size = new System.Drawing.Size(66, 55);
            this.Grabarbutton.TabIndex = 61;
            this.Grabarbutton.Text = "Grabar";
            this.Grabarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Grabarbutton.UseVisualStyleBackColor = true;
            // 
            // TotalNetotextBox
            // 
            this.TotalNetotextBox.Location = new System.Drawing.Point(779, 427);
            this.TotalNetotextBox.Name = "TotalNetotextBox";
            this.TotalNetotextBox.ReadOnly = true;
            this.TotalNetotextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalNetotextBox.TabIndex = 60;
            this.TotalNetotextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // TotalDescuentotextBox
            // 
            this.TotalDescuentotextBox.Location = new System.Drawing.Point(653, 427);
            this.TotalDescuentotextBox.Name = "TotalDescuentotextBox";
            this.TotalDescuentotextBox.ReadOnly = true;
            this.TotalDescuentotextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalDescuentotextBox.TabIndex = 59;
            this.TotalDescuentotextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // TotalIvaTextBox
            // 
            this.TotalIvaTextBox.Location = new System.Drawing.Point(527, 427);
            this.TotalIvaTextBox.Name = "TotalIvaTextBox";
            this.TotalIvaTextBox.ReadOnly = true;
            this.TotalIvaTextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalIvaTextBox.TabIndex = 58;
            this.TotalIvaTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // TotalBrutotextBox
            // 
            this.TotalBrutotextBox.Location = new System.Drawing.Point(401, 427);
            this.TotalBrutotextBox.Name = "TotalBrutotextBox";
            this.TotalBrutotextBox.ReadOnly = true;
            this.TotalBrutotextBox.Size = new System.Drawing.Size(100, 20);
            this.TotalBrutotextBox.TabIndex = 57;
            this.TotalBrutotextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(341, 429);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(42, 13);
            this.label8.TabIndex = 56;
            this.label8.Text = "Totales";
            // 
            // PorcentajeDescuentoTextBox
            // 
            this.PorcentajeDescuentoTextBox.Location = new System.Drawing.Point(125, 198);
            this.PorcentajeDescuentoTextBox.Name = "PorcentajeDescuentoTextBox";
            this.PorcentajeDescuentoTextBox.Size = new System.Drawing.Size(233, 20);
            this.PorcentajeDescuentoTextBox.TabIndex = 53;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(44, 201);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(70, 13);
            this.label7.TabIndex = 52;
            this.label7.Text = "% Descuento";
            // 
            // PreciotextBox
            // 
            this.PreciotextBox.Location = new System.Drawing.Point(126, 165);
            this.PreciotextBox.Name = "PreciotextBox";
            this.PreciotextBox.ReadOnly = true;
            this.PreciotextBox.Size = new System.Drawing.Size(232, 20);
            this.PreciotextBox.TabIndex = 51;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(44, 170);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(37, 13);
            this.label6.TabIndex = 50;
            this.label6.Text = "Precio";
            // 
            // DetalledataGridView
            // 
            this.DetalledataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DetalledataGridView.Location = new System.Drawing.Point(54, 253);
            this.DetalledataGridView.Name = "DetalledataGridView";
            this.DetalledataGridView.Size = new System.Drawing.Size(872, 159);
            this.DetalledataGridView.TabIndex = 37;
            // 
            // Agregarbutton
            // 
            this.Agregarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.adicionar;
            this.Agregarbutton.Location = new System.Drawing.Point(364, 132);
            this.Agregarbutton.Name = "Agregarbutton";
            this.Agregarbutton.Size = new System.Drawing.Size(66, 55);
            this.Agregarbutton.TabIndex = 54;
            this.Agregarbutton.Text = "Agregar";
            this.Agregarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Agregarbutton.UseVisualStyleBackColor = true;
            // 
            // CantidadtextBox
            // 
            this.CantidadtextBox.Location = new System.Drawing.Point(125, 135);
            this.CantidadtextBox.Name = "CantidadtextBox";
            this.CantidadtextBox.Size = new System.Drawing.Size(233, 20);
            this.CantidadtextBox.TabIndex = 49;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(44, 138);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(49, 13);
            this.label5.TabIndex = 48;
            this.label5.Text = "Cantidad";
            // 
            // ImagenpictureBox
            // 
            this.ImagenpictureBox.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.ImagenpictureBox.Location = new System.Drawing.Point(737, 52);
            this.ImagenpictureBox.Name = "ImagenpictureBox";
            this.ImagenpictureBox.Size = new System.Drawing.Size(189, 197);
            this.ImagenpictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.ImagenpictureBox.TabIndex = 55;
            this.ImagenpictureBox.TabStop = false;
            // 
            // ProductoLabel
            // 
            this.ProductoLabel.AutoSize = true;
            this.ProductoLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ProductoLabel.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.ProductoLabel.Location = new System.Drawing.Point(432, 108);
            this.ProductoLabel.Name = "ProductoLabel";
            this.ProductoLabel.Size = new System.Drawing.Size(129, 13);
            this.ProductoLabel.TabIndex = 47;
            this.ProductoLabel.Text = "Descripcion Producto";
            // 
            // BuscarProductobutton
            // 
            this.BuscarProductobutton.Location = new System.Drawing.Point(376, 103);
            this.BuscarProductobutton.Name = "BuscarProductobutton";
            this.BuscarProductobutton.Size = new System.Drawing.Size(40, 23);
            this.BuscarProductobutton.TabIndex = 46;
            this.BuscarProductobutton.Text = ".....";
            this.BuscarProductobutton.UseVisualStyleBackColor = true;
            // 
            // ProductoTextBox
            // 
            this.ProductoTextBox.Location = new System.Drawing.Point(125, 105);
            this.ProductoTextBox.Name = "ProductoTextBox";
            this.ProductoTextBox.Size = new System.Drawing.Size(233, 20);
            this.ProductoTextBox.TabIndex = 45;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(44, 108);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(50, 13);
            this.label4.TabIndex = 44;
            this.label4.Text = "Producto";
            // 
            // BodegacomboBox
            // 
            this.BodegacomboBox.DisplayMember = "Descripcion";
            this.BodegacomboBox.FormattingEnabled = true;
            this.BodegacomboBox.Location = new System.Drawing.Point(125, 78);
            this.BodegacomboBox.Name = "BodegacomboBox";
            this.BodegacomboBox.Size = new System.Drawing.Size(498, 21);
            this.BodegacomboBox.TabIndex = 43;
            this.BodegacomboBox.ValueMember = "IDBodega";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(44, 81);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 13);
            this.label3.TabIndex = 42;
            this.label3.Text = "Bodega";
            // 
            // BuscarClientebutton
            // 
            this.BuscarClientebutton.Location = new System.Drawing.Point(641, 52);
            this.BuscarClientebutton.Name = "BuscarClientebutton";
            this.BuscarClientebutton.Size = new System.Drawing.Size(39, 23);
            this.BuscarClientebutton.TabIndex = 41;
            this.BuscarClientebutton.Text = "......";
            this.BuscarClientebutton.UseVisualStyleBackColor = true;
            // 
            // ClientecomboBox
            // 
            this.ClientecomboBox.DisplayMember = "Nombre";
            this.ClientecomboBox.FormattingEnabled = true;
            this.ClientecomboBox.Location = new System.Drawing.Point(125, 52);
            this.ClientecomboBox.Name = "ClientecomboBox";
            this.ClientecomboBox.Size = new System.Drawing.Size(498, 21);
            this.ClientecomboBox.TabIndex = 40;
            this.ClientecomboBox.ValueMember = "IDProveedor";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(44, 55);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 13);
            this.label2.TabIndex = 39;
            this.label2.Text = "Cliente";
            // 
            // FechadateTimePicker
            // 
            this.FechadateTimePicker.Location = new System.Drawing.Point(126, 25);
            this.FechadateTimePicker.Name = "FechadateTimePicker";
            this.FechadateTimePicker.Size = new System.Drawing.Size(200, 20);
            this.FechadateTimePicker.TabIndex = 38;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(44, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(37, 13);
            this.label1.TabIndex = 36;
            this.label1.Text = "Fecha";
            // 
            // frmVentas
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
            this.Controls.Add(this.PreciotextBox);
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
            this.Controls.Add(this.BuscarClientebutton);
            this.Controls.Add(this.ClientecomboBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.FechadateTimePicker);
            this.Controls.Add(this.label1);
            this.Name = "frmVentas";
            this.Text = "Ventas";
            ((System.ComponentModel.ISupportInitialize)(this.DetalledataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImagenpictureBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BorrarTodoButton;
        private System.Windows.Forms.Button BorrarLineabutton;
        private System.Windows.Forms.Button Cancelarbutton;
        private System.Windows.Forms.Button Grabarbutton;
        private System.Windows.Forms.TextBox TotalNetotextBox;
        private System.Windows.Forms.TextBox TotalDescuentotextBox;
        private System.Windows.Forms.TextBox TotalIvaTextBox;
        private System.Windows.Forms.TextBox TotalBrutotextBox;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox PorcentajeDescuentoTextBox;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox PreciotextBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DataGridView DetalledataGridView;
        private System.Windows.Forms.Button Agregarbutton;
        private System.Windows.Forms.TextBox CantidadtextBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.PictureBox ImagenpictureBox;
        private System.Windows.Forms.Label ProductoLabel;
        private System.Windows.Forms.Button BuscarProductobutton;
        private System.Windows.Forms.TextBox ProductoTextBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox BodegacomboBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button BuscarClientebutton;
        private System.Windows.Forms.ComboBox ClientecomboBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker FechadateTimePicker;
        private System.Windows.Forms.Label label1;
    }
}