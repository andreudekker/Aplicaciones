using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
  public  class CADCompraDetalle
    {

        private static CompraDetalleTableAdapter adaptador = new CompraDetalleTableAdapter();
       
        public static void InsertCompraDetalle(int IDCompra, int IDProducto, string Descripcion,  decimal Costo, 
                                               float Cantidad,int  IDKardex,  float PorcentajeIVA, float PorcentajeDescuento)
        {
            adaptador.InsertCompraDetalle(IDCompra, IDProducto, Descripcion, Costo, Cantidad, IDKardex, PorcentajeIVA, PorcentajeDescuento);
        }

    }
}
