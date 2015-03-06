using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CADFac.DsFacturacionTableAdapters;

namespace CADFac
{
     public class CADProducto
    {
         private static ProductoTableAdapter adaptador = new ProductoTableAdapter();
         public static void NewProducto(string Descripcion, decimal Precio, int Stock, string Notas, int IDIVA, int IDDepartamento)
         {
             adaptador.NewProducto(Descripcion, Precio, Stock, Notas, IDIVA, IDDepartamento);
         }
    }
}
