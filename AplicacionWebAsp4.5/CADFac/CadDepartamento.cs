using CADFac.DsFacturacionTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADFac
{
    public class CadDepartamento
    {
        private static DepartamentoTableAdapter adaptador = new DepartamentoTableAdapter();
        
        public static void NewDepartamento(string Descripcion)
        {
            adaptador.NewDepartamento(Descripcion);
        }
    }
}
