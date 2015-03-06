namespace Aplicacion_Comercial_v1._0
{
    partial class frmBarras
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
            this.BarratextBox = new System.Windows.Forms.TextBox();
            this.CancelarBarrabutton = new System.Windows.Forms.Button();
            this.AceptarBarrabutton = new System.Windows.Forms.Button();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(32, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Barra";
            // 
            // BarratextBox
            // 
            this.BarratextBox.Location = new System.Drawing.Point(73, 34);
            this.BarratextBox.Name = "BarratextBox";
            this.BarratextBox.Size = new System.Drawing.Size(238, 20);
            this.BarratextBox.TabIndex = 1;
            // 
            // CancelarBarrabutton
            // 
            this.CancelarBarrabutton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.CancelarBarrabutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Cancelar;
            this.CancelarBarrabutton.Location = new System.Drawing.Point(440, 12);
            this.CancelarBarrabutton.Name = "CancelarBarrabutton";
            this.CancelarBarrabutton.Size = new System.Drawing.Size(75, 64);
            this.CancelarBarrabutton.TabIndex = 3;
            this.CancelarBarrabutton.Text = "Cancelar";
            this.CancelarBarrabutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.CancelarBarrabutton.UseVisualStyleBackColor = true;
            this.CancelarBarrabutton.Click += new System.EventHandler(this.CancelarBarrabutton_Click);
            // 
            // AceptarBarrabutton
            // 
            this.AceptarBarrabutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Aceptar2;
            this.AceptarBarrabutton.Location = new System.Drawing.Point(359, 12);
            this.AceptarBarrabutton.Name = "AceptarBarrabutton";
            this.AceptarBarrabutton.Size = new System.Drawing.Size(75, 64);
            this.AceptarBarrabutton.TabIndex = 2;
            this.AceptarBarrabutton.Text = "Aceptar";
            this.AceptarBarrabutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.AceptarBarrabutton.UseVisualStyleBackColor = true;
            this.AceptarBarrabutton.Click += new System.EventHandler(this.AceptarBarrabutton_Click);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // frmBarras
            // 
            this.AcceptButton = this.AceptarBarrabutton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.CancelarBarrabutton;
            this.ClientSize = new System.Drawing.Size(515, 83);
            this.Controls.Add(this.CancelarBarrabutton);
            this.Controls.Add(this.AceptarBarrabutton);
            this.Controls.Add(this.BarratextBox);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmBarras";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Barras  de productos";
            this.Load += new System.EventHandler(this.frmBarras_Load);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox BarratextBox;
        private System.Windows.Forms.Button AceptarBarrabutton;
        private System.Windows.Forms.Button CancelarBarrabutton;
        private System.Windows.Forms.ErrorProvider errorProvider1;
    }
}