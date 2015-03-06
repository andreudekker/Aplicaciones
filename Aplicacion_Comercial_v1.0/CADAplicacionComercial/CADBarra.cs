using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
    public class CADBarra
    {
        private static BarraTableAdapter adapter = new BarraTableAdapter();
        public static bool ExisteBarra( long barra)
        {
            if (adapter.ExisteBarra(barra)==null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public static void InsertBarra(  int Idproducto, long barra)
        {
            adapter.InsertBarra(Idproducto,barra);
        }


        public static void DeleteBarra(long Barra)
        {
            adapter.DeleteBarra(Barra);
        }


        public static void DeleteBarraByIDProducto( int IDProducto)
        {
            adapter.DeleteBarraByIDProducto(IDProducto);
        }
    
    }
}
