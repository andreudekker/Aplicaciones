using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
     public class CADCompra
    {
         private static CompraTableAdapter adaptador = new CompraTableAdapter();

         public static int InsertCompra(DateTime Fecha, int IDProveedor, int IDBodega)
         {
             return (int)adaptador.InsertCompra(Fecha, IDProveedor,IDBodega);
         }


         public static bool ProveedorTieneCompras( int IDPRoveedor)
         {
            if( adaptador.ProveedorTieneCompras(IDPRoveedor) == null)
             { 
                 return false;
             }
             return true;
         }

       





  
     
     }//f
}
