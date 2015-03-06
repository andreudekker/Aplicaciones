using CADAplicacionComercial.DSAplicacionComercialTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CADAplicacionComercial
{
    public class CADCliente
    {
        private static ClienteTableAdapter adaptador = new ClienteTableAdapter();

        ///crud Clientes
        /// <summary>
        /// llenado de tabla del DS 
        /// </summary>
        /// <returns>datosdelcliente</returns>
        public static DSAplicacionComercial.ClienteDataTable GetData ()  //trae datos del cliente para cargar en gv
        {
            return adaptador.GetData();
        }

       
        
        
        /// <summary>
        /// Toma los valores en tabla Cliente se crea el USP para crear este metodo permite tomar los datos del user/ los datos al frmClientes y save en bd
        /// </summary>
        /// <param name="IDTipoDocumento"></param>
        /// <param name="Documento"></param>
        /// <param name="NombreComercial"></param>
        /// <param name="NombresContacto"></param>
        /// <param name="ApellidosContacto"></param>
        /// <param name="Direccion"></param>
        /// <param name="Telefono1"></param>
        /// <param name="Telefono2"></param>
        /// <param name="Correo"></param>
        /// <param name="Notas"></param>
        /// <param name="Aniversario"></param>
        
        public static void InsertCliente( int IDTipoDocumento, string Documento,string NombreComercial, string NombresContacto,
                                          string ApellidosContacto, string Direccion, string Telefono1,
                                          string Telefono2, string Correo, string Notas,DateTime Aniversario)
        { 
         adaptador.InsertCliente(IDTipoDocumento,Documento,NombreComercial,NombresContacto,ApellidosContacto,Direccion,Telefono1,
                                 Telefono2,Correo,Notas,Aniversario);
        }

       
       /// <summary>
       /// Toma Valores en DSAplicacionComercial- cliente
       /// </summary>
       /// <param name="IDTipoDocumento"></param>
       /// <param name="Documento"></param>
       /// <param name="NombreComercial"></param>
       /// <param name="NombresContacto"></param>
       /// <param name="ApellidosContacto"></param>
       /// <param name="Direccion"></param>
       /// <param name="Telefono1"></param>
       /// <param name="Telefono2"></param>
       /// <param name="Correo"></param>
       /// <param name="Notas"></param>
       /// <param name="Aniversario"></param>
       /// <param name="IDCliente"></param>
 
        public static void UpdateCliente(int IDTipoDocumento, string Documento,string NombreComercial, string NombresContacto,
                                          string ApellidosContacto, string Direccion, string Telefono1,
                                          string Telefono2, string Correo, string Notas,DateTime Aniversario, int IDCliente)
        
        { 
            adaptador.UpdateCliente(IDTipoDocumento,Documento,NombreComercial,NombresContacto,ApellidosContacto,Direccion,Telefono1,
                                 Telefono2,Correo,Notas,Aniversario,IDCliente);
        }


        /// <summary>
        /// Borrar los registros--extraido del DSAplicacionComercial
        /// </summary>
        /// <param name="IDCliente"></param>
       public static void DeleteCliente(int IDCliente)
        {
            adaptador.DeleteCliente(IDCliente);
        
        }
        
    }
}
