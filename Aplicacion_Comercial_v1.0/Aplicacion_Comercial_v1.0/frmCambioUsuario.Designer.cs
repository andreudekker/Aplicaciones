namespace Aplicacion_Comercial_v1._0
{
    partial class frmCambioUsuario
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
            this.label2 = new System.Windows.Forms.Label();
            this.UsuariotextBox = new System.Windows.Forms.TextBox();
            this.ClaveTextBox = new System.Windows.Forms.TextBox();
            this.btnCambioCancelar = new System.Windows.Forms.Button();
            this.BtnCambioUsuario = new System.Windows.Forms.Button();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(43, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Usuario";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 62);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(34, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Clave";
            // 
            // UsuariotextBox
            // 
            this.UsuariotextBox.Location = new System.Drawing.Point(88, 22);
            this.UsuariotextBox.Name = "UsuariotextBox";
            this.UsuariotextBox.Size = new System.Drawing.Size(100, 20);
            this.UsuariotextBox.TabIndex = 2;
            // 
            // ClaveTextBox
            // 
            this.ClaveTextBox.Location = new System.Drawing.Point(88, 59);
            this.ClaveTextBox.Name = "ClaveTextBox";
            this.ClaveTextBox.Size = new System.Drawing.Size(100, 20);
            this.ClaveTextBox.TabIndex = 3;
            // 
            // btnCambioCancelar
            // 
            this.btnCambioCancelar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCambioCancelar.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Cancelar;
            this.btnCambioCancelar.Location = new System.Drawing.Point(130, 95);
            this.btnCambioCancelar.Name = "btnCambioCancelar";
            this.btnCambioCancelar.Size = new System.Drawing.Size(75, 62);
            this.btnCambioCancelar.TabIndex = 5;
            this.btnCambioCancelar.Text = "Cancelar";
            this.btnCambioCancelar.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnCambioCancelar.UseVisualStyleBackColor = true;
            this.btnCambioCancelar.Click += new System.EventHandler(this.btnCambioCancelar_Click);
            // 
            // BtnCambioUsuario
            // 
            this.BtnCambioUsuario.Image = global::Aplicacion_Comercial_v1._0.Properties.Resources.Aceptar2;
            this.BtnCambioUsuario.Location = new System.Drawing.Point(24, 95);
            this.BtnCambioUsuario.Name = "BtnCambioUsuario";
            this.BtnCambioUsuario.Size = new System.Drawing.Size(75, 62);
            this.BtnCambioUsuario.TabIndex = 4;
            this.BtnCambioUsuario.Text = "Aceptar";
            this.BtnCambioUsuario.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.BtnCambioUsuario.UseVisualStyleBackColor = true;
            this.BtnCambioUsuario.Click += new System.EventHandler(this.BtnCambioUsuario_Click);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // frmCambioUsuario
            // 
            this.AcceptButton = this.BtnCambioUsuario;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCambioCancelar;
            this.ClientSize = new System.Drawing.Size(222, 180);
            this.Controls.Add(this.btnCambioCancelar);
            this.Controls.Add(this.BtnCambioUsuario);
            this.Controls.Add(this.ClaveTextBox);
            this.Controls.Add(this.UsuariotextBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmCambioUsuario";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cambio Usuario";
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox UsuariotextBox;
        private System.Windows.Forms.TextBox ClaveTextBox;
        private System.Windows.Forms.Button BtnCambioUsuario;
        private System.Windows.Forms.Button btnCambioCancelar;
        private System.Windows.Forms.ErrorProvider errorProvider1;
    }
}