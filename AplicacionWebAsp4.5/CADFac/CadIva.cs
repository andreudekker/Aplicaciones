using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CADFac.DsFacturacionTableAdapters;

namespace CADFac
{
     public class CadIva
    {
         private static IVATableAdapter adaptador = new IVATableAdapter();
         public static void NewIva( string Descripcion, decimal Tarifa)
         {
             adaptador.NewIva(Descripcion,Tarifa);
         }
    }
}
