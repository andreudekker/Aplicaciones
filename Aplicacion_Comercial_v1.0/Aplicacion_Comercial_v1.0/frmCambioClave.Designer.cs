namespace Aplicacion_Comercial_v1._0
{
    partial class frmCambioClave
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
            this.ClaveAnteriortextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.NuevaClavetextBox = new System.Windows.Forms.TextBox();
            this.ConfirmaciontextBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.Cancelarbutton = new System.Windows.Forms.Button();
            this.Aceptarbutton = new System.Windows.Forms.Button();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Clave Anterior";
            // 
            // ClaveAnteriortextBox
            // 
            this.ClaveAnteriortextBox.Location = new System.Drawing.Point(104, 15);
            this.ClaveAnteriortextBox.Name = "ClaveAnteriortextBox";
            this.ClaveAnteriortextBox.PasswordChar = '*';
            this.ClaveAnteriortextBox.Size = new System.Drawing.Size(124, 20);
            this.ClaveAnteriortextBox.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 46);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(68, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Nueva clave";
            // 
            // NuevaClavetextBox
            // 
            this.NuevaClavetextBox.Location = new System.Drawing.Point(104, 43);
            this.NuevaClavetextBox.Name = "NuevaClavetextBox";
            this.NuevaClavetextBox.PasswordChar = '*';
            this.NuevaClavetextBox.Size = new System.Drawing.Size(124, 20);
            this.NuevaClavetextBox.TabIndex = 3;
            // 
            // ConfirmaciontextBox
            // 
            this.ConfirmaciontextBox.Location = new System.Drawing.Point(104, 72);
            this.ConfirmaciontextBox.Name = "ConfirmaciontextBox";
            this.ConfirmaciontextBox.PasswordChar = '*';
            this.ConfirmaciontextBox.Size = new System.Drawing.Size(124, 20);
            this.ConfirmaciontextBox.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(68, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Confirmacion";
            // 
            // Cancelarbutton
            // 
            this.Cancelarbutton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.Cancelarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Cancelar;
            this.Cancelarbutton.Location = new System.Drawing.Point(132, 112);
            this.Cancelarbutton.Name = "Cancelarbutton";
            this.Cancelarbutton.Size = new System.Drawing.Size(75, 57);
            this.Cancelarbutton.TabIndex = 7;
            this.Cancelarbutton.Text = "Cancelar";
            this.Cancelarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Cancelarbutton.UseVisualStyleBackColor = true;
  
            // 
            // Aceptarbutton
            // 
            this.Aceptarbutton.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Aceptar2;
            this.Aceptarbutton.Location = new System.Drawing.Point(34, 112);
            this.Aceptarbutton.Name = "Aceptarbutton";
            this.Aceptarbutton.Size = new System.Drawing.Size(75, 57);
            this.Aceptarbutton.TabIndex = 6;
            this.Aceptarbutton.Text = "Aceptar";
            this.Aceptarbutton.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.Aceptarbutton.UseVisualStyleBackColor = true;
            this.Aceptarbutton.Click += new System.EventHandler(this.Aceptarbutton_Click);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // frmCambioClave
            // 
            this.AcceptButton = this.Aceptarbutton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.Cancelarbutton;
            this.ClientSize = new System.Drawing.Size(267, 169);
            this.Controls.Add(this.Cancelarbutton);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.ConfirmaciontextBox);
            this.Controls.Add(this.NuevaClavetextBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.ClaveAnteriortextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Aceptarbutton);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmCambioClave";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cambio de la Clave";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmCambioClave_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button Aceptarbutton;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox ClaveAnteriortextBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox NuevaClavetextBox;
        private System.Windows.Forms.TextBox ConfirmaciontextBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button Cancelarbutton;
        private System.Windows.Forms.ErrorProvider errorProvider1;
    }
}