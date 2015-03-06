using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
    public class CADIVA
    {
        public int IDIVA { get; set; }
        public string Descripcion { get; set; }
        public float Tarifa { get; set; }

        private  static IVATableAdapter adaptador = new IVATableAdapter();
        
        public static  CADIVA getIVA(int IDIVA)
        {
            CADIVA miIVA = null;//objetode la bd
            DSAplicacionComercial.IVADataTable mitabla = adaptador.GetIVA(IDIVA); //consulta a la db
            if (mitabla.Rows.Count == 0) return miIVA;//estructura de la tabla
            DSAplicacionComercial.IVARow Miregistro = (DSAplicacionComercial.IVARow)mitabla.Rows[0];

           
            miIVA = new CADIVA();//registro en objeto iva
            miIVA.Descripcion = Miregistro.Descripcion;
            miIVA.IDIVA = Miregistro.IDIVA;
            miIVA.Tarifa = (float)Miregistro.Tarifa;
           return miIVA;
        }

    }
}
