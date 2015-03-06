using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
    public class CADBodegaProducto
    {

        public int IDBodega { get; set; }
        public int IDProducto { get; set; }
        public float Stock { get; set; }
        public float Minimo { get; set; }
        public float Maximo { get; set; }
        public int DiasReposicion { get; set; }
        public float CantidadMinima { get; set; }

        private static BodegaProductoTableAdapter adapter = new BodegaProductoTableAdapter();

        public static CADBodegaProducto GetBodegaProductoByIDBodegaAndIDProducto(int IDBodega, int IDProducto)
        {
            CADBodegaProducto miBodegaProducto = null;
            DSAplicacionComercial.BodegaProductoDataTable mitabla = adapter.GetBodegaProductoByIDBodegaAndIDProducto(IDBodega, IDProducto);

            if (mitabla.Rows.Count == 0) return miBodegaProducto;
            DSAplicacionComercial.BodegaProductoRow miregistro = (DSAplicacionComercial.BodegaProductoRow)mitabla.Rows[0];  // hay un cast con DSAplicacionComercial.BodegaProductoRow
            miBodegaProducto = new CADBodegaProducto();


            miBodegaProducto.CantidadMinima = (float)miregistro.CantidadMinima;
            miBodegaProducto.DiasReposicion = miregistro.DiasReposicion;
            miBodegaProducto.IDBodega = miregistro.IDBodega;
            miBodegaProducto.IDProducto = miregistro.IDProducto;
            miBodegaProducto.Maximo = (float)miregistro.Maximo;
            miBodegaProducto.Minimo = (float)miregistro.Minimo;
            miBodegaProducto.Stock = (float)miregistro.Stock;




            return miBodegaProducto;
        }


        public static void updateBodegaProducto(int IDBodega, int IDProducto, double Minimo, double Maximo,
                                           int DiasReposicion, double CantidadMinima)
        {
            
            try
            {
                adapter.InsertBodegaProducto(IDBodega, IDProducto, Minimo, Maximo, DiasReposicion, CantidadMinima);
            }
            
            catch (Exception)
            {

                adapter.UpdateBodegaProducto(Minimo, Maximo, DiasReposicion, CantidadMinima, IDBodega, IDProducto);
            }


        }

        public static void AumentarStock( double Cantidad, int IDBodega,int  IDProducto)
        {
             adapter.AumentarStock(Cantidad, IDBodega, IDProducto);
        }

       
        public static void DeleteBodegaProductoByIdProducto(int IDProducto)
        {
            adapter.DeleteBodegaProductoByIdProducto(IDProducto);
        }


    }//fin


}

