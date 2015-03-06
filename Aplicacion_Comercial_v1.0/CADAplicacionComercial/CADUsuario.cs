using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
    public class CADUsuario
    {

        public string IDUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Clave { get; set; }
        public int Fecha { get; set; }
        public DateTime FechaModificacionClave { get; set; }
        public int IDRol { get; set; }
        public string Correo { get; set; }
        
        
        private static UsuarioTableAdapter adapter = new UsuarioTableAdapter();

        public static bool ValidaUsuario( string IDUsuario, string Clave)
        {
            if (adapter.ValidaUsuario(IDUsuario, Clave) == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        #region validacion del usuario para frmUsuario
        
        
        public static bool ExisteUsuario( string IDUsuario)

        {
            if (adapter.ExisteUsuario(IDUsuario) == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
            #endregion  
  
        public static CADUsuario GetUsuario( string IDUsuario)
        {
            CADUsuario miUsuario = null;
            DSAplicacionComercial.UsuarioDataTable mitabla = adapter.GetUsuario(IDUsuario);
            if (mitabla.Rows.Count == 0) return miUsuario;
            DSAplicacionComercial.UsuarioRow miregistro = (DSAplicacionComercial.UsuarioRow)mitabla.Rows[0];
            miUsuario = new CADUsuario();  //mapeo de la bd
         
            miUsuario.Apellidos = miregistro.Apellidos;
            miUsuario.Clave = miregistro.Clave;
            miUsuario.Correo = miregistro.Correo;
            miUsuario.FechaModificacionClave = miregistro.FechaModificacionClave;
            miUsuario.IDRol = miregistro.IDRol;
            miUsuario.IDUsuario = miregistro.IDUsuario;
            miUsuario.Nombres = miregistro.Nombres;

            return miUsuario;

        
        }
        public static void CambioClave( string Clave, string IDUsuario)
        {
            adapter.CambioClave(Clave, DateTime.Now,IDUsuario);
        }
    
    
    }//f
}
