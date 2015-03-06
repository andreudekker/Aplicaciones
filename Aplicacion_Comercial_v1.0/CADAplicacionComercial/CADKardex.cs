using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
     public class CADKardex
    {
         private static KardexTableAdapter adaptador = new KardexTableAdapter();

         public int IDKardex { get; set; }
         public int IDBodega { get; set; }
         public int IDProducto { get; set; }
         public DateTime Fecha { get; set; }
         public string Documento { get; set; }
         public float Entrada { get; set; }
         public float Salida { get; set; }
         public float Saldo { get; set; }
         public decimal UltimoCosto { get; set; }
         public decimal CostoPromedio { get; set; }
         
         public static CADKardex UltimoKardex( int IDBodega, int IDProducto)
         {
             CADKardex miKardex = null;
             DSAplicacionComercial.KardexDataTable mitabla = adaptador.UltimoKardex(IDBodega, IDProducto);
             if (mitabla.Rows.Count == 0) return miKardex;
             DSAplicacionComercial.KardexRow miRegistro = (DSAplicacionComercial.KardexRow)mitabla.Rows[0];
             
             
             miKardex.CostoPromedio = miRegistro.CostoPromedio;
             miKardex.Documento = miRegistro.Documento;
             miKardex.Entrada = (float)miRegistro.Entrada;
             miKardex.Fecha = miRegistro.Fecha;
             miKardex.IDBodega = miRegistro.IDBodega;
             miKardex.IDKardex = miRegistro.IDKardex;
             miKardex.IDProducto = miRegistro.IDProducto;
             miKardex.Saldo = (float)miRegistro.Saldo;
             miKardex.Salida = (float)miRegistro.Salida;
             miKardex.UltimoCosto = miRegistro.UltimoCosto;
            
             return miKardex;
         }
             public static  int InsertKardex( int IDBodega, int IDProducto,DateTime Fecha, string Documento,
                                              float Entrada, float Salida,float Saldo,decimal UltimoCosto,
                                               decimal CostoPromedio)
             {
                return (int)adaptador.InsertKardex(IDBodega,IDProducto,Fecha,Documento,Entrada,Salida,Saldo,UltimoCosto,CostoPromedio);
             }



             public static bool KardexTieneMovimientoByIdBodega(int IDBodega)
             {
                 if (adaptador.KardexTieneMovimientoByIdBodega(IDBodega) == null)
                 {
                     return false;
                 }
                 return true;
             }

             public static bool KardexTieneMovimientoByIdProducto(int IDProducto)
             {
                 if (adaptador.KardexTieneMovimientoPorIDProducto(IDProducto) == null)
                 {
                     return false;
                 }
                 return true;
             }



        }//f
    }

