using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplicacion_Comercial_v1._0
{
    class DetalleCompra
    {
        //atributosTemporalesEnLaCompra tableCompraDetalle

        public int IDProducto { get; set; }
        public string Descripcion { get; set; }
        public decimal Costo { get; set; }
        public float Cantidad { get; set; }
        public float PorcentajeIVA { get; set; }
        public float PorcentajeDescuento { get; set; }

        public decimal valorBruto { get { return Costo * (decimal)Cantidad/(1+(decimal)PorcentajeIVA); } } //va al dgv
        public decimal valorIVA { get { return Costo * (decimal)Cantidad - valorBruto; } }
        public decimal valorDescuento { get { return valorBruto * (decimal)PorcentajeDescuento; } }
        public decimal valorNeto { get { return Costo * (decimal)Cantidad - valorDescuento; } }






    }
}
