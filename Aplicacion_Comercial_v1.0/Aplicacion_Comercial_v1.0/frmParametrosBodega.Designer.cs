namespace Aplicacion_Comercial_v1._0
{
    partial class frmParametrosBodega
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
            this.BodegaComboBox = new System.Windows.Forms.ComboBox();
            this.dSAplicacionComercial = new Aplicacion_Comercial_v1._0.DSAplicacionComercial();
            this.bodegaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.bodegaTableAdapter = new Aplicacion_Comercial_v1._0.DSAplicacionComercialTableAdapters.BodegaTableAdapter();
            this.label2 = new System.Windows.Forms.Label();
            this.StocktextBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.MinimonumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.maximoNumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.DiasReposicionnumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.CantidadMinimanumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.AceptarParametrobutton = new System.Windows.Forms.Button();
            this.CancelarParametrosbutton = new System.Windows.Forms.Button();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dSAplicacionComercial)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bodegaBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.MinimonumericUpDown)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.maximoNumericUpDown)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.DiasReposicionnumericUpDown)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.CantidadMinimanumericUpDown)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Bodega";
            // 
            // BodegaComboBox
            // 
            this.BodegaComboBox.DataSource = this.bodegaBindingSource;
            this.BodegaComboBox.DisplayMember = "Descripcion";
            this.BodegaComboBox.FormattingEnabled = true;
            this.BodegaComboBox.Location = new System.Drawing.Point(107, 16);
            this.BodegaComboBox.Name = "BodegaComboBox";
            this.BodegaComboBox.Size = new System.Drawing.Size(131, 21);
            this.BodegaComboBox.TabIndex = 1;
            this.BodegaComboBox.ValueMember = "IDBodega";
            this.BodegaComboBox.SelectedIndexChanged += new System.EventHandler(this.BodegaComboBox_SelectedIndexChanged);
            // 
            // dSAplicacionComercial
            // 
            this.dSAplicacionComercial.DataSetName = "DSAplicacionComercial";
            this.dSAplicacionComercial.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // bodegaBindingSource
            // 
            this.bodegaBindingSource.DataMember = "Bodega";
            this.bodegaBindingSource.DataSource = this.dSAplicacionComercial;
            // 
            // bodegaTableAdapter
            // 
            this.bodegaTableAdapter.ClearBeforeFill = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(282, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Stock";
            // 
            // StocktextBox
            // 
            this.StocktextBox.Location = new System.Drawing.Point(358, 20);
            this.StocktextBox.Name = "StocktextBox";
            this.StocktextBox.ReadOnly = true;
            this.StocktextBox.Size = new System.Drawing.Size(113, 20);
            this.StocktextBox.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(7, 72);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(85, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Cantidad Minima";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(271, 70);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(88, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "Cantidad Maxima";
            // 
            // MinimonumericUpDown
            // 
            this.MinimonumericUpDown.Location = new System.Drawing.Point(108, 68);
            this.MinimonumericUpDown.Maximum = new decimal(new int[] {
            9999,
            0,
            0,
            0});
            this.MinimonumericUpDown.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.MinimonumericUpDown.Name = "MinimonumericUpDown";
            this.MinimonumericUpDown.Size = new System.Drawing.Size(68, 20);
            this.MinimonumericUpDown.TabIndex = 6;
            this.MinimonumericUpDown.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // maximoNumericUpDown
            // 
            this.maximoNumericUpDown.Location = new System.Drawing.Point(406, 70);
            this.maximoNumericUpDown.Maximum = new decimal(new int[] {
            9999,
            0,
            0,
            0});
            this.maximoNumericUpDown.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.maximoNumericUpDown.Name = "maximoNumericUpDown";
            this.maximoNumericUpDown.Size = new System.Drawing.Size(68, 20);
            this.maximoNumericUpDown.TabIndex = 7;
            this.maximoNumericUpDown.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // DiasReposicionnumericUpDown
            // 
            this.DiasReposicionnumericUpDown.Location = new System.Drawing.Point(107, 96);
            this.DiasReposicionnumericUpDown.Name = "DiasReposicionnumericUpDown";
            this.DiasReposicionnumericUpDown.Size = new System.Drawing.Size(68, 20);
            this.DiasReposicionnumericUpDown.TabIndex = 8;
            // 
            // CantidadMinimanumericUpDown
            // 
            this.CantidadMinimanumericUpDown.Location = new System.Drawing.Point(406, 102);
            this.CantidadMinimanumericUpDown.Name = "CantidadMinimanumericUpDown";
            this.CantidadMinimanumericUpDown.Size = new System.Drawing.Size(68, 20);
            this.CantidadMinimanumericUpDown.TabIndex = 9;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 96);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(94, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Dias de reposicion";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(250, 104);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(132, 13);
            this.label6.TabIndex = 11;
            this.label6.Text = "Cantidad minima a ordenar";
            // 
            // AceptarParametrobutton
            // 
            this.AceptarParametrobutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Aceptar2;
            this.AceptarParametrobutton.Location = new System.Drawing.Point(494, 35);
            this.AceptarParametrobutton.Name = "AceptarParametrobutton";
            this.AceptarParametrobutton.Size = new System.Drawing.Size(75, 70);
            this.AceptarParametrobutton.TabIndex = 12;
            this.AceptarParametrobutton.Text = "Aceptar";
            this.AceptarParametrobutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.AceptarParametrobutton.UseVisualStyleBackColor = true;
            this.AceptarParametrobutton.Click += new System.EventHandler(this.AceptarParametrobutton_Click);
            // 
            // CancelarParametrosbutton
            // 
            this.CancelarParametrosbutton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.CancelarParametrosbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Cancelar;
            this.CancelarParametrosbutton.Location = new System.Drawing.Point(575, 35);
            this.CancelarParametrosbutton.Name = "CancelarParametrosbutton";
            this.CancelarParametrosbutton.Size = new System.Drawing.Size(75, 70);
            this.CancelarParametrosbutton.TabIndex = 13;
            this.CancelarParametrosbutton.Text = "Cancelar";
            this.CancelarParametrosbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.CancelarParametrosbutton.UseVisualStyleBackColor = true;
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // frmParametrosBodega
            // 
            this.AcceptButton = this.AceptarParametrobutton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.CancelarParametrosbutton;
            this.ClientSize = new System.Drawing.Size(668, 123);
            this.Controls.Add(this.CancelarParametrosbutton);
            this.Controls.Add(this.AceptarParametrobutton);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.CantidadMinimanumericUpDown);
            this.Controls.Add(this.DiasReposicionnumericUpDown);
            this.Controls.Add(this.maximoNumericUpDown);
            this.Controls.Add(this.MinimonumericUpDown);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.StocktextBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.BodegaComboBox);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmParametrosBodega";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Parametros Bodega";
            this.Load += new System.EventHandler(this.frmParametrosBodega_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dSAplicacionComercial)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bodegaBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.MinimonumericUpDown)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.maximoNumericUpDown)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.DiasReposicionnumericUpDown)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.CantidadMinimanumericUpDown)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox BodegaComboBox;
        private DSAplicacionComercial dSAplicacionComercial;
        private System.Windows.Forms.BindingSource bodegaBindingSource;
        private DSAplicacionComercialTableAdapters.BodegaTableAdapter bodegaTableAdapter;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox StocktextBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown MinimonumericUpDown;
        private System.Windows.Forms.NumericUpDown maximoNumericUpDown;
        private System.Windows.Forms.NumericUpDown DiasReposicionnumericUpDown;
        private System.Windows.Forms.NumericUpDown CantidadMinimanumericUpDown;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button AceptarParametrobutton;
        private System.Windows.Forms.Button CancelarParametrosbutton;
        private System.Windows.Forms.ErrorProvider errorProvider1;
    }
}