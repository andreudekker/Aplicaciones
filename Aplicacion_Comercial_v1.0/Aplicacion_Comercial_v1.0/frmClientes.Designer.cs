namespace Aplicacion_Comercial_v1._0
{
    partial class frmClientes
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmClientes));
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.tsbPrimero = new System.Windows.Forms.ToolStripButton();
            this.tsbAnterior = new System.Windows.Forms.ToolStripButton();
            this.tsbSiguiente = new System.Windows.Forms.ToolStripButton();
            this.tsbUltimo = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.tsbNuevo = new System.Windows.Forms.ToolStripButton();
            this.tsbModificar = new System.Windows.Forms.ToolStripButton();
            this.tsbGuardar = new System.Windows.Forms.ToolStripButton();
            this.tsbCancelar = new System.Windows.Forms.ToolStripButton();
            this.tsbBorrar = new System.Windows.Forms.ToolStripButton();
            this.tsbBuscar = new System.Windows.Forms.ToolStripButton();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.IDClienteTextBox = new System.Windows.Forms.TextBox();
            this.DatodataGridView = new System.Windows.Forms.DataGridView();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.IDtipoDocumentoComboBox = new System.Windows.Forms.ComboBox();
            this.DocumentoTextBox = new System.Windows.Forms.TextBox();
            this.NombreComercialTextBox = new System.Windows.Forms.TextBox();
            this.NombreContactoTextBox = new System.Windows.Forms.TextBox();
            this.ApellidosContactoTextBox = new System.Windows.Forms.TextBox();
            this.DirecciontextBox = new System.Windows.Forms.TextBox();
            this.Telefono1TextBox = new System.Windows.Forms.TextBox();
            this.Telefono2TextBox = new System.Windows.Forms.TextBox();
            this.CorreoTextBox = new System.Windows.Forms.TextBox();
            this.NotasTextBox = new System.Windows.Forms.TextBox();
            this.AniversariodateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.dSAplicacionComercial = new Aplicacion_Comercial_v1._0.DSAplicacionComercial();
            this.tipoDocumentoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tipoDocumentoTableAdapter = new Aplicacion_Comercial_v1._0.DSAplicacionComercialTableAdapters.TipoDocumentoTableAdapter();
            this.clienteBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.clienteTableAdapter = new Aplicacion_Comercial_v1._0.DSAplicacionComercialTableAdapters.ClienteTableAdapter();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DatodataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSAplicacionComercial)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tipoDocumentoBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.clienteBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsbPrimero,
            this.tsbAnterior,
            this.tsbSiguiente,
            this.tsbUltimo,
            this.toolStripSeparator1,
            this.tsbNuevo,
            this.tsbModificar,
            this.tsbGuardar,
            this.tsbCancelar,
            this.tsbBorrar,
            this.tsbBuscar});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(856, 25);
            this.toolStrip1.TabIndex = 0;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // tsbPrimero
            // 
            this.tsbPrimero.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbPrimero.Image = ((System.Drawing.Image)(resources.GetObject("tsbPrimero.Image")));
            this.tsbPrimero.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbPrimero.Name = "tsbPrimero";
            this.tsbPrimero.Size = new System.Drawing.Size(23, 22);
            this.tsbPrimero.Text = "toolStripButton1";
            this.tsbPrimero.ToolTipText = "Va al primer registro";
            this.tsbPrimero.Click += new System.EventHandler(this.tsbPrimero_Click);
            // 
            // tsbAnterior
            // 
            this.tsbAnterior.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbAnterior.Image = ((System.Drawing.Image)(resources.GetObject("tsbAnterior.Image")));
            this.tsbAnterior.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAnterior.Name = "tsbAnterior";
            this.tsbAnterior.Size = new System.Drawing.Size(23, 22);
            this.tsbAnterior.Text = "toolStripButton2";
            this.tsbAnterior.ToolTipText = "va al anterior registro";
            this.tsbAnterior.Click += new System.EventHandler(this.tsbAnterior_Click);
            // 
            // tsbSiguiente
            // 
            this.tsbSiguiente.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbSiguiente.Image = ((System.Drawing.Image)(resources.GetObject("tsbSiguiente.Image")));
            this.tsbSiguiente.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbSiguiente.Name = "tsbSiguiente";
            this.tsbSiguiente.Size = new System.Drawing.Size(23, 22);
            this.tsbSiguiente.Text = "toolStripButton3";
            this.tsbSiguiente.ToolTipText = "va al siguiente registro";
            this.tsbSiguiente.Click += new System.EventHandler(this.tsbSiguiente_Click);
            // 
            // tsbUltimo
            // 
            this.tsbUltimo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbUltimo.Image = ((System.Drawing.Image)(resources.GetObject("tsbUltimo.Image")));
            this.tsbUltimo.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbUltimo.Name = "tsbUltimo";
            this.tsbUltimo.Size = new System.Drawing.Size(23, 22);
            this.tsbUltimo.Text = "toolStripButton4";
            this.tsbUltimo.ToolTipText = "va al ultimo registro";
            this.tsbUltimo.Click += new System.EventHandler(this.tsbUltimo_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // tsbNuevo
            // 
            this.tsbNuevo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbNuevo.Image = ((System.Drawing.Image)(resources.GetObject("tsbNuevo.Image")));
            this.tsbNuevo.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbNuevo.Name = "tsbNuevo";
            this.tsbNuevo.Size = new System.Drawing.Size(23, 22);
            this.tsbNuevo.Text = "toolStripButton5";
            this.tsbNuevo.ToolTipText = "Nuevo";
            this.tsbNuevo.Click += new System.EventHandler(this.tsbNuevo_Click);
            // 
            // tsbModificar
            // 
            this.tsbModificar.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbModificar.Image = ((System.Drawing.Image)(resources.GetObject("tsbModificar.Image")));
            this.tsbModificar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbModificar.Name = "tsbModificar";
            this.tsbModificar.Size = new System.Drawing.Size(23, 22);
            this.tsbModificar.Text = "toolStripButton6";
            this.tsbModificar.ToolTipText = "Editar";
            this.tsbModificar.Click += new System.EventHandler(this.tsbModificar_Click);
            // 
            // tsbGuardar
            // 
            this.tsbGuardar.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbGuardar.Enabled = false;
            this.tsbGuardar.Image = ((System.Drawing.Image)(resources.GetObject("tsbGuardar.Image")));
            this.tsbGuardar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbGuardar.Name = "tsbGuardar";
            this.tsbGuardar.Size = new System.Drawing.Size(23, 22);
            this.tsbGuardar.Text = "toolStripButton7";
            this.tsbGuardar.ToolTipText = "Guardar";
            this.tsbGuardar.Click += new System.EventHandler(this.tsbGuardar_Click);
            // 
            // tsbCancelar
            // 
            this.tsbCancelar.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbCancelar.Enabled = false;
            this.tsbCancelar.Image = ((System.Drawing.Image)(resources.GetObject("tsbCancelar.Image")));
            this.tsbCancelar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbCancelar.Name = "tsbCancelar";
            this.tsbCancelar.Size = new System.Drawing.Size(23, 22);
            this.tsbCancelar.Text = "Cancelar";
            this.tsbCancelar.Click += new System.EventHandler(this.tsbCancelar_Click);
            // 
            // tsbBorrar
            // 
            this.tsbBorrar.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbBorrar.Image = ((System.Drawing.Image)(resources.GetObject("tsbBorrar.Image")));
            this.tsbBorrar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbBorrar.Name = "tsbBorrar";
            this.tsbBorrar.Size = new System.Drawing.Size(23, 22);
            this.tsbBorrar.Text = "Borrar";
            this.tsbBorrar.Click += new System.EventHandler(this.tsbBorrar_Click);
            // 
            // tsbBuscar
            // 
            this.tsbBuscar.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbBuscar.Image = ((System.Drawing.Image)(resources.GetObject("tsbBuscar.Image")));
            this.tsbBuscar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbBuscar.Name = "tsbBuscar";
            this.tsbBuscar.Size = new System.Drawing.Size(23, 22);
            this.tsbBuscar.Text = "Buscar";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "ID Cliente";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(277, 44);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(86, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Tipo Documento";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(579, 44);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Documento";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 74);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(93, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "Nombre Comercial";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 106);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(90, 13);
            this.label5.TabIndex = 5;
            this.label5.Text = "Nombre Contacto";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(432, 105);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(95, 13);
            this.label6.TabIndex = 6;
            this.label6.Text = "Apellidos Contacto";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(20, 136);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(52, 13);
            this.label7.TabIndex = 7;
            this.label7.Text = "Direccion";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(484, 136);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(55, 13);
            this.label8.TabIndex = 8;
            this.label8.Text = "Telefono1";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(665, 136);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(55, 13);
            this.label9.TabIndex = 9;
            this.label9.Text = "Telefono2";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(20, 170);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(38, 13);
            this.label10.TabIndex = 10;
            this.label10.Text = "Correo";
            // 
            // IDClienteTextBox
            // 
            this.IDClienteTextBox.Location = new System.Drawing.Point(126, 43);
            this.IDClienteTextBox.Name = "IDClienteTextBox";
            this.IDClienteTextBox.ReadOnly = true;
            this.IDClienteTextBox.Size = new System.Drawing.Size(137, 20);
            this.IDClienteTextBox.TabIndex = 11;
            // 
            // DatodataGridView
            // 
            this.DatodataGridView.AllowUserToAddRows = false;
            this.DatodataGridView.AllowUserToDeleteRows = false;
            this.DatodataGridView.AllowUserToOrderColumns = true;
            this.DatodataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.DatodataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DatodataGridView.Location = new System.Drawing.Point(0, 241);
            this.DatodataGridView.Name = "DatodataGridView";
            this.DatodataGridView.ReadOnly = true;
            this.DatodataGridView.Size = new System.Drawing.Size(856, 150);
            this.DatodataGridView.TabIndex = 12;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(20, 196);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(35, 13);
            this.label11.TabIndex = 13;
            this.label11.Text = "Notas";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(435, 170);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(59, 13);
            this.label12.TabIndex = 14;
            this.label12.Text = "Aniversario";
            // 
            // IDtipoDocumentoComboBox
            // 
            this.IDtipoDocumentoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.clienteBindingSource, "IDTipoDocumento", true));
            this.IDtipoDocumentoComboBox.DataSource = this.tipoDocumentoBindingSource;
            this.IDtipoDocumentoComboBox.DisplayMember = "Descripcion";
            this.IDtipoDocumentoComboBox.FormattingEnabled = true;
            this.IDtipoDocumentoComboBox.Location = new System.Drawing.Point(386, 41);
            this.IDtipoDocumentoComboBox.Name = "IDtipoDocumentoComboBox";
            this.IDtipoDocumentoComboBox.Size = new System.Drawing.Size(153, 21);
            this.IDtipoDocumentoComboBox.TabIndex = 15;
            this.IDtipoDocumentoComboBox.ValueMember = "IDTipoDocumento";
            // 
            // DocumentoTextBox
            // 
            this.DocumentoTextBox.Location = new System.Drawing.Point(664, 41);
            this.DocumentoTextBox.Name = "DocumentoTextBox";
            this.DocumentoTextBox.ReadOnly = true;
            this.DocumentoTextBox.Size = new System.Drawing.Size(161, 20);
            this.DocumentoTextBox.TabIndex = 16;
            // 
            // NombreComercialTextBox
            // 
            this.NombreComercialTextBox.Location = new System.Drawing.Point(126, 71);
            this.NombreComercialTextBox.Name = "NombreComercialTextBox";
            this.NombreComercialTextBox.ReadOnly = true;
            this.NombreComercialTextBox.Size = new System.Drawing.Size(699, 20);
            this.NombreComercialTextBox.TabIndex = 17;
            // 
            // NombreContactoTextBox
            // 
            this.NombreContactoTextBox.Location = new System.Drawing.Point(126, 103);
            this.NombreContactoTextBox.Name = "NombreContactoTextBox";
            this.NombreContactoTextBox.ReadOnly = true;
            this.NombreContactoTextBox.Size = new System.Drawing.Size(232, 20);
            this.NombreContactoTextBox.TabIndex = 18;
            // 
            // ApellidosContactoTextBox
            // 
            this.ApellidosContactoTextBox.Location = new System.Drawing.Point(549, 101);
            this.ApellidosContactoTextBox.Name = "ApellidosContactoTextBox";
            this.ApellidosContactoTextBox.ReadOnly = true;
            this.ApellidosContactoTextBox.Size = new System.Drawing.Size(276, 20);
            this.ApellidosContactoTextBox.TabIndex = 19;
            // 
            // DirecciontextBox
            // 
            this.DirecciontextBox.Location = new System.Drawing.Point(126, 133);
            this.DirecciontextBox.Name = "DirecciontextBox";
            this.DirecciontextBox.ReadOnly = true;
            this.DirecciontextBox.Size = new System.Drawing.Size(340, 20);
            this.DirecciontextBox.TabIndex = 20;
            // 
            // Telefono1TextBox
            // 
            this.Telefono1TextBox.Location = new System.Drawing.Point(555, 133);
            this.Telefono1TextBox.Name = "Telefono1TextBox";
            this.Telefono1TextBox.ReadOnly = true;
            this.Telefono1TextBox.Size = new System.Drawing.Size(100, 20);
            this.Telefono1TextBox.TabIndex = 21;
            // 
            // Telefono2TextBox
            // 
            this.Telefono2TextBox.Location = new System.Drawing.Point(727, 133);
            this.Telefono2TextBox.Name = "Telefono2TextBox";
            this.Telefono2TextBox.ReadOnly = true;
            this.Telefono2TextBox.Size = new System.Drawing.Size(99, 20);
            this.Telefono2TextBox.TabIndex = 22;
            // 
            // CorreoTextBox
            // 
            this.CorreoTextBox.Location = new System.Drawing.Point(126, 163);
            this.CorreoTextBox.Name = "CorreoTextBox";
            this.CorreoTextBox.ReadOnly = true;
            this.CorreoTextBox.Size = new System.Drawing.Size(232, 20);
            this.CorreoTextBox.TabIndex = 23;
            // 
            // NotasTextBox
            // 
            this.NotasTextBox.Location = new System.Drawing.Point(124, 190);
            this.NotasTextBox.Multiline = true;
            this.NotasTextBox.Name = "NotasTextBox";
            this.NotasTextBox.ReadOnly = true;
            this.NotasTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.NotasTextBox.Size = new System.Drawing.Size(703, 45);
            this.NotasTextBox.TabIndex = 24;
            // 
            // AniversariodateTimePicker
            // 
            this.AniversariodateTimePicker.Enabled = false;
            this.AniversariodateTimePicker.Location = new System.Drawing.Point(545, 167);
            this.AniversariodateTimePicker.Name = "AniversariodateTimePicker";
            this.AniversariodateTimePicker.Size = new System.Drawing.Size(282, 20);
            this.AniversariodateTimePicker.TabIndex = 25;
            // 
            // dSAplicacionComercial
            // 
            this.dSAplicacionComercial.DataSetName = "DSAplicacionComercial";
            this.dSAplicacionComercial.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // tipoDocumentoBindingSource
            // 
            this.tipoDocumentoBindingSource.DataMember = "TipoDocumento";
            this.tipoDocumentoBindingSource.DataSource = this.dSAplicacionComercial;
            // 
            // tipoDocumentoTableAdapter
            // 
            this.tipoDocumentoTableAdapter.ClearBeforeFill = true;
            // 
            // clienteBindingSource
            // 
            this.clienteBindingSource.DataMember = "Cliente";
            this.clienteBindingSource.DataSource = this.dSAplicacionComercial;
            // 
            // clienteTableAdapter
            // 
            this.clienteTableAdapter.ClearBeforeFill = true;
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // frmClientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(856, 398);
            this.Controls.Add(this.AniversariodateTimePicker);
            this.Controls.Add(this.NotasTextBox);
            this.Controls.Add(this.CorreoTextBox);
            this.Controls.Add(this.Telefono2TextBox);
            this.Controls.Add(this.Telefono1TextBox);
            this.Controls.Add(this.DirecciontextBox);
            this.Controls.Add(this.ApellidosContactoTextBox);
            this.Controls.Add(this.NombreContactoTextBox);
            this.Controls.Add(this.NombreComercialTextBox);
            this.Controls.Add(this.DocumentoTextBox);
            this.Controls.Add(this.IDtipoDocumentoComboBox);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.DatodataGridView);
            this.Controls.Add(this.IDClienteTextBox);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.toolStrip1);
            this.Name = "frmClientes";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Clientes";
            this.Load += new System.EventHandler(this.frmClientes_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DatodataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSAplicacionComercial)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tipoDocumentoBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.clienteBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton tsbPrimero;
        private System.Windows.Forms.ToolStripButton tsbAnterior;
        private System.Windows.Forms.ToolStripButton tsbSiguiente;
        private System.Windows.Forms.ToolStripButton tsbUltimo;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton tsbNuevo;
        private System.Windows.Forms.ToolStripButton tsbModificar;
        private System.Windows.Forms.ToolStripButton tsbGuardar;
        private System.Windows.Forms.ToolStripButton tsbCancelar;
        private System.Windows.Forms.ToolStripButton tsbBorrar;
        private System.Windows.Forms.ToolStripButton tsbBuscar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox IDClienteTextBox;
        private System.Windows.Forms.DataGridView DatodataGridView;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.ComboBox IDtipoDocumentoComboBox;
        private System.Windows.Forms.TextBox DocumentoTextBox;
        private System.Windows.Forms.TextBox NombreComercialTextBox;
        private System.Windows.Forms.TextBox NombreContactoTextBox;
        private System.Windows.Forms.TextBox ApellidosContactoTextBox;
        private System.Windows.Forms.TextBox DirecciontextBox;
        private System.Windows.Forms.TextBox Telefono1TextBox;
        private System.Windows.Forms.TextBox Telefono2TextBox;
        private System.Windows.Forms.TextBox CorreoTextBox;
        private System.Windows.Forms.TextBox NotasTextBox;
        private System.Windows.Forms.DateTimePicker AniversariodateTimePicker;
        private DSAplicacionComercial dSAplicacionComercial;
        private System.Windows.Forms.BindingSource tipoDocumentoBindingSource;
        private DSAplicacionComercialTableAdapters.TipoDocumentoTableAdapter tipoDocumentoTableAdapter;
        private System.Windows.Forms.BindingSource clienteBindingSource;
        private DSAplicacionComercialTableAdapters.ClienteTableAdapter clienteTableAdapter;
        private System.Windows.Forms.ErrorProvider errorProvider1;
    }
}