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
    public partial class frmBusquedaProducto : Form
    {
        private int idProducto=0;

        public int IDProducto
        {
            get { return idProducto; }

        }

        
        


        private CADUsuario usuarioLogueado;

        internal CADUsuario UsuarioLogueado
        {
            get { return usuarioLogueado; }
            set { usuarioLogueado = value; }
        }
       
        public frmBusquedaProducto()
        {
            InitializeComponent();
        }
    }
}
