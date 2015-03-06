using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
     public class CADProducto
    {
        
         public int IDProducto { get; set; }    //para crear un metod0 que  devuelve un objeto de la clase productos
         public string Descripcion { get; set; }
         public int IDDepartamento { get; set; }
         public int IDIVA { get; set; }
         public decimal Precio { get; set; }
         public string Notas { get; set; }
         public string Imagen { get; set; }
         public string IDMedida { get; set; }
         public float Medida { get; set; }

         
         private static ProductoTableAdapter adaptador = new ProductoTableAdapter();
         
         public static CADProducto GetProductoByIDPRoducto( int IDPRoducto)
         {
            CADProducto miProducto = null;
             DSAplicacionComercial.ProductoDataTable mitabla = adaptador.GetProductoByIDPRoducto(IDPRoducto);
            
             if (mitabla.Rows.Count==0)return miProducto; //verificar si el producto existe
             DSAplicacionComercial.ProductoRow miRegistro=(DSAplicacionComercial.ProductoRow )mitabla.Rows[0]; //Cast
             miProducto=new CADProducto();///objeto miproducto
             
             miProducto.Descripcion= miRegistro.Descripcion;
             miProducto.IDDepartamento= miRegistro.IDDepartamento;
             miProducto.IDIVA= miRegistro.IDIVA;
             miProducto.IDMedida = miRegistro.IDMedida;
             miProducto.IDProducto = miRegistro.IDProducto;
             miProducto.Imagen = miRegistro.Imagen;
             miProducto.Medida = (float)miRegistro.Medida;
             miProducto.Notas = miRegistro.Notas;
             miProducto.Precio= miRegistro.Precio;
        
       
            
             return miProducto;
              
	     
         }


         public static CADProducto GetProductoByBarra(long Barra) //verifica Barra
         {
            CADProducto miProducto = null;
             DSAplicacionComercial.ProductoDataTable mitabla = adaptador.GetProductoByBarra(Barra);
            
             if (mitabla.Rows.Count==0)return miProducto;
             DSAplicacionComercial.ProductoRow miRegistro=(DSAplicacionComercial.ProductoRow )mitabla.Rows[0];
             miProducto=new CADProducto();
             
             miProducto.Descripcion= miRegistro.Descripcion;
             miProducto.IDDepartamento= miRegistro.IDDepartamento;
             miProducto.IDIVA= miRegistro.IDIVA;
             miProducto.Precio= miRegistro.Precio;
             miProducto.Notas= miRegistro.Notas;
             miProducto.IDMedida= miRegistro.IDMedida;
             miProducto.Medida=(float)miRegistro.Medida;
             return miProducto;
              
	       
         }
            
     }
    
 }

