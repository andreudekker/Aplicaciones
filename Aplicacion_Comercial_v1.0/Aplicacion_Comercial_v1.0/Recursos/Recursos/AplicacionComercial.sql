USE [AplicacionComercial]
GO
/****** Object:  StoredProcedure [dbo].[MantenimientoTablas]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MantenimientoTablas] AS
DELETE FROM Producto WHERE IDProducto NOT IN (SELECT IDProducto FROM ProductoUnico)
DELETE FROM Cliente WHERE IDCliente NOT IN (SELECT IDCliente FROM ClienteUnico)
DELETE FROM Proveedor WHERE IDProveedor NOT IN (SELECT IDProveedor FROM ProveedorUnico)
UPDATE Producto SET 
	Descripcion = RTRIM(LTRIM(UPPER(Descripcion)))
UPDATE Cliente SET 
	NombreComercial = RTRIM(LTRIM(UPPER(NombreComercial))), 
	NombresContacto = RTRIM(LTRIM(UPPER(NombresContacto))), 
	ApellidosContacto = RTRIM(LTRIM(UPPER(ApellidosContacto)))
UPDATE Proveedor SET 
	Nombre = RTRIM(LTRIM(UPPER(Nombre))), 
	NombresContacto = RTRIM(LTRIM(UPPER(NombresContacto))), 
	ApellidosContacto = RTRIM(LTRIM(UPPER(ApellidosContacto)))

GO
/****** Object:  Table [dbo].[Barra]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barra](
	[IDProducto] [int] NOT NULL,
	[Barra] [bigint] NOT NULL,
 CONSTRAINT [PK_Barra] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC,
	[Barra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodega](
	[IDBodega] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Bodega] PRIMARY KEY CLUSTERED 
(
	[IDBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BodegaProducto]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodegaProducto](
	[IDBodega] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Stock] [float] NOT NULL,
	[Minimo] [float] NOT NULL,
	[Maximo] [float] NOT NULL,
	[DiasReposicion] [int] NOT NULL,
	[CantidadMinima] [float] NOT NULL,
 CONSTRAINT [PK_BodegaProducto] PRIMARY KEY CLUSTERED 
(
	[IDBodega] ASC,
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[IDTipoDocumento] [int] NOT NULL,
	[Documento] [nvarchar](20) NOT NULL,
	[NombreComercial] [nvarchar](max) NOT NULL,
	[NombresContacto] [nvarchar](max) NOT NULL,
	[ApellidosContacto] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono1] [nvarchar](max) NULL,
	[Telefono2] [nvarchar](max) NULL,
	[Correo] [nvarchar](max) NULL,
	[Notas] [text] NULL,
	[Aniversario] [date] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compra]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IDCompra] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[IDBodega] [int] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompraDetalle]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDCompra] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Costo] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_CompraDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[IDConcepto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[IDConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IDDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[IDDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionCliente]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionCliente](
	[IDDevolucionCliente] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDVenta] [int] NOT NULL,
 CONSTRAINT [PK_DevolucionCliente] PRIMARY KEY CLUSTERED 
(
	[IDDevolucionCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionClienteDetalle]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionClienteDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDDevolucionCliente] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_DevolucionClienteDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionProveedor]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionProveedor](
	[IDDevolucionProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDCompra] [int] NOT NULL,
 CONSTRAINT [PK_DevolucionProveedor] PRIMARY KEY CLUSTERED 
(
	[IDDevolucionProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionProveedorDetalle]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionProveedorDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDDevolucionProveedor] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_DevolucionProveedorDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IVA]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IVA](
	[IDIVA] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Tarifa] [float] NOT NULL,
 CONSTRAINT [PK_IVA] PRIMARY KEY CLUSTERED 
(
	[IDIVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kardex]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kardex](
	[IDKardex] [int] IDENTITY(1,1) NOT NULL,
	[IDBodega] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Documento] [nvarchar](20) NOT NULL,
	[Entrada] [float] NOT NULL,
	[Salida] [float] NOT NULL,
	[Saldo] [float] NOT NULL,
	[UltimoCosto] [money] NOT NULL,
	[CostoPromedio] [money] NOT NULL,
 CONSTRAINT [PK_Kardex] PRIMARY KEY CLUSTERED 
(
	[IDKardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medida]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medida](
	[IDMedida] [nvarchar](2) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Medida] PRIMARY KEY CLUSTERED 
(
	[IDMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[IDDepartamento] [int] NOT NULL,
	[IDIVA] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Notas] [text] NULL,
	[Imagen] [nvarchar](max) NULL,
	[IDMedida] [nvarchar](2) NOT NULL,
	[Medida] [float] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[IDTipoDocumento] [int] NOT NULL,
	[Documento] [nvarchar](20) NOT NULL,
	[NombresContacto] [nvarchar](max) NOT NULL,
	[ApellidosContacto] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono1] [nvarchar](max) NULL,
	[Telefono2] [nvarchar](max) NULL,
	[Correo] [nvarchar](max) NULL,
	[Notas] [text] NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IDRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IDRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salida]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salida](
	[IDSalida] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDConcepto] [int] NOT NULL,
	[IDBodega] [int] NOT NULL,
 CONSTRAINT [PK_Salida] PRIMARY KEY CLUSTERED 
(
	[IDSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalidaDetalle]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalidaDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDSalida] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
 CONSTRAINT [PK_SalidaDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[IDTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IDTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Traslado]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traslado](
	[IDTraslado] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDBodegaOrigen] [int] NOT NULL,
	[IDBodegaDestino] [int] NOT NULL,
 CONSTRAINT [PK_Traslado] PRIMARY KEY CLUSTERED 
(
	[IDTraslado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrasladoDetalle]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrasladoDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDTraslado] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[IDKardexOrigen] [int] NOT NULL,
	[IDKardexDestino] [int] NOT NULL,
 CONSTRAINT [PK_TrasladoDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUsuario] [nvarchar](10) NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[Clave] [nvarchar](10) NOT NULL,
	[FechaModificacionClave] [date] NOT NULL,
	[IDRol] [int] NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venta]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IDVenta] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDCliente] [int] NOT NULL,
	[IDBodega] [int] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDVenta] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_VentaDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[ClienteUnico]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClienteUnico]
AS
SELECT        NombreComercial, MIN(IDCliente) AS IDCliente
FROM            dbo.Cliente
GROUP BY NombreComercial

GO
/****** Object:  View [dbo].[ProductoConIVA]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProductoConIVA]
AS
SELECT        dbo.Producto.IDProducto, dbo.Producto.Descripcion, dbo.Producto.IDDepartamento, dbo.Producto.IDIVA, dbo.Producto.Precio, dbo.Producto.Notas, 
                         dbo.Producto.Imagen, dbo.Producto.IDMedida, dbo.Producto.Medida, dbo.IVA.Tarifa, dbo.Producto.Precio / (1 + dbo.IVA.Tarifa / 100) AS ValorBase, 
                         dbo.Producto.Precio - dbo.Producto.Precio / (1 + dbo.IVA.Tarifa / 100) AS ValorIVA
FROM            dbo.Producto INNER JOIN
                         dbo.IVA ON dbo.Producto.IDIVA = dbo.IVA.IDIVA

GO
/****** Object:  View [dbo].[ProductoUnico]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProductoUnico]
AS
SELECT        Descripcion, MIN(IDProducto) AS IDProducto
FROM            dbo.Producto
GROUP BY Descripcion

GO
/****** Object:  View [dbo].[ProveedorUnico]    Script Date: 25/07/2014 7:33:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProveedorUnico]
AS
SELECT        Nombre, MIN(IDProveedor) AS IDProveedor
FROM            dbo.Proveedor
GROUP BY Nombre

GO
SET IDENTITY_INSERT [dbo].[Bodega] ON 

INSERT [dbo].[Bodega] ([IDBodega], [Descripcion]) VALUES (1, N'Principal')
INSERT [dbo].[Bodega] ([IDBodega], [Descripcion]) VALUES (2, N'Envigado')
INSERT [dbo].[Bodega] ([IDBodega], [Descripcion]) VALUES (3, N'Itagüí')
INSERT [dbo].[Bodega] ([IDBodega], [Descripcion]) VALUES (4, N'Sabaneta')
INSERT [dbo].[Bodega] ([IDBodega], [Descripcion]) VALUES (5, N'Medellín')
INSERT [dbo].[Bodega] ([IDBodega], [Descripcion]) VALUES (6, N'Bello')
SET IDENTITY_INSERT [dbo].[Bodega] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (1, 1, N'98622480', N'JUAN CARLOS ZULUAGA CARDONA', N'JUAN CARLOS', N'ZULUAGA CARDONA', N'Calle Luna Calle Sol', N'2335566', N'3005668090', N'jzuluaga55@gmail.com', N'Es muy apuesto', CAST(0xF8FF0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (2, 2, N'8005894898', N'POLITÉCNICO GRANCOLOMBIANO', N'WILLIAN', N'WALLACE', N'Calle 81 #67 54', N'3446677', N'4567788', N'willi@hotmail.com', N'Es una muy buena universidad, donde estudian los mejores aprendices de ADSI de todo Medellín', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (3, 2, N'980909099', N'RESTAURANTE EL CAN FRITO', N'SHAO', N'MING CHU', N'Diagonal 45 #56 54', N'3448899', N'3126789090', N'domicilios@canfrito.com', N'El mejor perro frito de la ciudad', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (4, 1, N'43567987', N'DURLEY LÓPEZ', N'DURLEY', N'LÓPEZ', N'Carrera 67 #55 45', N'2445566', N'3118009056', N'duru@gmail.com', N'Es un poquito brava', CAST(0x29010B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (7, 1, N'434322', N'LEDYS BEDOYA CANO', N'LEDYS', N'BEDOYA CANO', N'Carrera 56 #43 43', N'2780967', N'3126780909', N'ledys@hotmail.com', N'Su esposo es el hombre más lindo del mundo', CAST(0xF6080B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (8, 2, N'9008007005', N'VINOS & VINOS', N'LUIS', N'PERALES', N'Circula 14 #45 45', N'3445678', N'3124567656', N'pedidos@vinosyvinos.com', N'Los mejores vinos nacionales e importados', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (10, 4, N'3423323', N'HELBERT SHIWSTHZ', N'HELBERT', N'SHIWSTHZ', N'Calle 1 #34 34', N'3455678', N'4567888', N'Shiwsthz@gmail.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (11, 3, N'290290909', N'RONAL BEDOYA', N'RONAL', N'BEDOYA', N'Carrera 45 #45 67', N'2897889', N'', N'ronal@gmail.com', N'', CAST(0x79320B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (12, 1, N'6434544', N'FERNANDO FERNANDEZ', N'FERNANDO', N'FERNANDEZ', N'Calle 34 #34 56', N'5678998', N'', N'fercho@yahoo.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (13, 1, N'589898', N'DISTRIBUIDORA SNEIDER', N'SNEIDER', N'RUPENSTISKI', N'Calle 45 #43 54', N'5617889', N'5678990', N'distrisne@hotmail.com', N'', CAST(0x34160B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (15, 1, N'908989', N'CAROLINA ZAFRA', N'CAROLINA', N'ZAFRA', N'Carrer 50 #45 43', N'4567898', N'3105446677', N'carozafra@gmail.com', N'Es muy guapa', CAST(0x46160B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9653, 2, N'89655', N'OLREDIS MIELES', N'ORLEDIS', N'MIELESO', N'Calle 45#56 56', N'4454554', N'4512', N'oRLEDIS@hotmail.com', N'Soy una niña', CAST(0xB81E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9654, 1, N'86441', N'NAVELIS MIELES', N'NAVLIES', N'MIELESNAVELIS', N'Calle 45#96 56', N'4655881654', N'784555', N'Nave@hotmail.com', N'Soy Negra', CAST(0xC71A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9655, 1, N'5145114', N'CAROLINA TAMAYO', N'CAROLINA', N'TAMAYO', N'cll 53 # 11 b 41', N'62484454', N'3015489824', N'carotamayo@gmail.com', N'se perdio', CAST(0x0B2A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9656, 1, N'64741411', N'MILVIA HENAO', N'MILVIA', N'HENAO', N'cll 50 # 45 b 44', N'5285996', N'30151449824', N'tamayomilvia@gmail.com', N'', CAST(0xC3250B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9657, 1, N'482154', N'JESENIA TORREZ', N'JESENIA', N'TORRES', N'cll 90 # 45 b 84', N'3254810', N'3115749824', N'jesnia@gmail.com', N'para traer todo', CAST(0x782B0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9658, 1, N'24154', N'JONATHAN CORREA', N'JONATHAN', N'CORREA', N'crr 40 # 45 b 44', N'5249872', N'31442542155', N'correa@gmail.com', N'151174 años', CAST(0x4F380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9659, 1, N'52441', N'JUAN ZAFRA', N'JUAN', N'ZAFRA', N'cll 50 # 80 ee 44', N'5293740', N'4544', N'juan@gmail.com', N'nada', CAST(0xCC2E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9660, 1, N'2144145', N'LEIDY LOPERA', N'LOPERA', N'LEIDY', N'cll 20 # 33 b 44', N'53245514', N'30185825544', N'leidy@gmail.com', N'feaa loca', CAST(0x51380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9661, 1, N'5244144', N'ELVIS MIELES', N'MIELES', N'GUARIN', N'cll 33 # 45 b 44', N'5291440', N'30148249824', N'guarin@gmail.com', N'nada 20154 ', CAST(0x95380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9662, 1, N'5247256', N'JULIAN AMAYA', N'JULIANA', N'AMAYA', N'cll 108 # 45 b 44', N'5720972', N'30482452445', N'amaya@gmail.com', N'mmmmm', CAST(0xB1250B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9663, 1, N'5681154', N'PAOLA VARGAS', N'PAOLA', N'VARGAS', N'cll 55 # 45 b 44', N'3547441', N'3015751824', N'paola@gmail.com', N'nada :', CAST(0x71380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9664, 1, N'56415442', N'EUGENIA CORREA', N'EUGENIA', N'CORREA', N'cll 48 # 45 b 44', N'3545444', N'30157498555', N'eugenia@gmail.com', N'nada tido', CAST(0x4D380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9665, 1, N'57825285', N'LEYDI VILLA', N'LEYDI', N'VILLA', N'cll 80 # 33 b 44', N'5249572', N'325454421', N'leyd@gmail.com', N'nada33', CAST(0x53380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9682, 1, N'1235', N'LIVIS MIELES', N'LIVIS', N'MIELES', N'Calle 45#96 56', N'7842210', N'012354445', N'Livis@hotmail.com', N'Soy pelicortica', CAST(0x15100B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9683, 1, N'496554', N'OLVIS', N'OLVIS', N'MIELESORTEGA', N'Calle 47#56 56', N'8654545', N'78445525', N'Olvis@hotmail.com', N'Soy un viejito amargado', CAST(0xCB1A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9684, 1, N'44587', N'EDALI GUARIN', N'EDALI', N'GUARIN', N'Calle 45#96 56', N'454875', N'8622455', N'Edalig@hotmail.com', N'Soy la mejor madre del mundo', CAST(0x76170B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9685, 1, N'41258', N'ANDREA', N'ANDREA', N'CARDONA', N'Calle 45#56 14', N'965200', N'147822', N'AndreaCardona@hotmail.com', N'Soy Prima', CAST(0x321F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9686, 1, N'963014', N'MARIA MERCEDES', N'MERCEDES', N'RODRIGUEZ', N'Calle 45#56 96', N'789620', N'45', N'Mariamercedes@hotmail.com', N'soy una mamita', CAST(0xA51D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9687, 1, N'45124', N'FERNANDA', N'FERNANDA7', N'FERNAND', N'Calle 95#56 56', N'454', N'4512', N'fernds@hotmail.com', N'usted quiere lo mismo que yo ', CAST(0x23F20A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9688, 1, N'96324', N'ALEX', N'ALEX M', N'MAZO', N'Calle 45#96 56', N'46544', N'451242', N'elvismieles@hotmail.com', N'Lo unico que se es que anda con mis piernas', CAST(0x38AA1A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9699, 1, N'2585', N'MECHAS', N'CARLOS', N'RUIZ', N'calle 55 # 82 53', N'5702638', N'2468756', N'mechas@yahoo.com', N'tiene muchas mechas', CAST(0xF0370B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9700, 4, N'54689', N'SACAPIOJOS', N'RASCAME', N'PIOJILLO', N'calle 65 # 2 73', N'5549638', N'2468756', N'sacapiojos@yahoo.com', N'tiene muchas piojos', CAST(0x09360B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9701, 2, N'5458', N'PELUSA', N'PELITO', N'LUSA', N'calle 92 # 8 73', N'22401058', N'5103624', N'pelusa@yahoo.com', N'tiene muchas pelitos', CAST(0xE6330B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9702, 2, N'785', N'CARMAS', N'DOLORES', N'COLICO', N'calle 85 # 82 53', N'5210364', N'1254789', N'carmas@yahoo.com', N'tiene muchas dolores', CAST(0x57370B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9703, 1, N'688', N'MORTEROS', N'PACHO', N'SANCHEZ', N'calle 15 # 82 98', N'5578903', N'4895624', N'morteros@yahoo.com', N'tiene muchas mrteros', CAST(0xA9380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9704, 2, N'7956', N'BLUE', N'SOCORRO', N'VELEZ', N'calle 58 # 65 5', N'4451023', N'4512367', N'blue@yahoo.com', N'tiene muchas azules', CAST(0x80370B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9705, 4, N'589', N'NEER', N'INES', N'VALENCIA', N'calle 87 # 42 13', N'7802569', N'8451267', N'neer@yahoo.com', N'tiene muchas tareas', CAST(0xD8340B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9706, 2, N'7487', N'PECAS', N'NEER', N'GUZMAN', N'calle 25 # 83 6', N'2360158', N'5701245', N'pecas@yahoo.com', N'parece un milo mal revuelto', CAST(0x15370B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9707, 1, N'8798', N'RECHA', N'YES', N'ARISMENDY', N'calle 95 # 85 63', N'1456987', N'74569823', N'recha@yahoo.com', N'tiene muchas caras', CAST(0x20390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9708, 2, N'989', N'BICTH', N'VERACRUZ', N'HERNANDEZ', N'calle 78 # 57 3', N'4569872', N'1472583', N'bicth@yahoo.com', N'tiene muchas nenas', CAST(0xB8330B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9710, 1, N'1234567', N'DANIEL', N'DANIEL', N'BELTRAN', N'cll 54 # 14 b 42', N'3636398', N'3012365696', N'daniel@gmail.com', N'conchitas', CAST(0x232D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9711, 1, N'8910111', N'CARLOS BERRIO', N'CARLOS', N'BERRIO', N'cll 55 # 15 b 43', N'2365623', N'3013625458', N'carlos@hotmail.com', N'lds', CAST(0xFB280B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9712, 1, N'3215648', N'FONCECA CARNEDAS', N'FONCECA', N'CARDENAS', N'cll 56 # 16 b 46', N'62454654', N'3015899824', N'cardenas@gmail.com', N'ganas', CAST(0xF1290B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9713, 1, N'1232322', N'SANTANA', N'JHONATAN', N'SANTANA', N'cll 23 # 31 b 61', N'36521454', N'304236824', N'santana@gmail.com', N'muy rico', CAST(0xD12E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9714, 1, N'4565654', N'BOLIVAR', N'DAVID', N'BOLIVAR', N'cll 12 # 31 b 81', N'2654564', N'30126549824', N'bolivar@gmail.com', N'gas', CAST(0x6A300B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9715, 1, N'5465435', N'SAN DIEGO', N'JUAN DIEGO', N'PEREZ', N'cll 43 # 51 b 71', N'2926586', N'3015658963', N'diego@gmail.com', N'delicioso', CAST(0xBA310B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9716, 1, N'4856546', N'LAURA GOMEZ', N'LAURA', N'GOMEZ', N'cll 15 # 21 b 36', N'2924454', N'3032014569', N'laura@gmail.com', N'bueno', CAST(0x5B320B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9717, 1, N'2163546', N'PAOLA', N'PAOLA', N'GONZALES', N'cll 83 # 90 b 105', N'2569852', N'3045698635', N'paola@gmail.com', N'esta bien', CAST(0xF0330B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9718, 1, N'4565353', N'JUAN SANCHEZ', N'JUAN', N'SANCHEZ', N'cll 50 # 06 b 75', N'2926536', N'3012569878', N'juan@gmail.com', N'aguanta', CAST(0x1B390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9719, 1, N'96101114969', N'LE BLANC', N'ESMERALDA', N'PEREZ', N'calle32 #54 18', N'6845131', N'31865454', N'Pepe@hotmail.com', N'Aprendi Mucho', CAST(0x19390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9720, 1, N'4565456', N'YASUO', N'HECTORSITO', N'ARNULIO', N'calle52 #65 96', N'4474177', N'31874742', N'Yasuoooo@hotmail.com', N'el pro de pros', CAST(0x501F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9721, 1, N'56414565', N'CAI', N'CAITLYNO', N'VALENCIA', N'calle51 #10 98', N'7523453', N'54141', N'Pablito@hotmail.com', N'Alcance OP', CAST(0x4B1E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9722, 1, N'4697646', N'VOLI', N'VOLIBEAR', N'TRUENO', N'calle78 #96 18', N'45254271', N'752542', N'El.SEñor@hotmail.com', N'Gruaaaaaaur', CAST(0xC81F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9723, 1, N'8946151', N'JINX', N'JINXELIADORA', N'DUQUE', N'calle89 #75 115', N'86451', N'984561231', N'Jinx@hotmail.com', N'Cargado y preparado', CAST(0x57F80900 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9724, 1, N'684411', N'FIORA', N'FLORES', N'VELASQUEZ', N'calle99 #87 92', N'5423453', N'310225454', N'Luchito@hotmail.com', N'La Flor Velasquez', CAST(0xE1DD0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9725, 1, N'86421654', N'DRAVEN', N'DRAVEN ARTURO', N'GOMEZ', N'calle71 #54 18', N'57641561', N'96846541', N'Creido@hotmail.com', N'Draven no. DRAAAAAVEN', CAST(0x6E1F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9726, 1, N'45274534', N'EVELYN', N'EVEE', N'ARANGO', N'calle98 #10 1558', N'8752', N'5723543', N'IVYYYY@hotmail.com', N'Arañaaaaaas', CAST(0x08900A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9727, 1, N'86453453', N'CHOGATH', N'CHO GATH', N'CANGREJO', N'calle12 #96 74', N'453543453', N'37865454', N'Chogi@hotmail.com', N'Muereeeeee', CAST(0x39250B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9728, 1, N'453453453', N'ISA', N'MARIA ISABEL', N'VALENCIA MURIEL', N'Diagonal 87 #96 82', N'8651541', N'84184', N'MariaBonita@hotmail.com', N'Te quiero mucho', CAST(0x2E210B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9729, 1, N'11111111', N'GRANERO DON JUAN', N'JUAN ANDRES', N'GOMEZ', N'Calle 22 # 85 20', N'2642070', N'3015562238', N'andre@live.com', N'Molesta Mucho', CAST(0x8F390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9730, 1, N'22222222', N'MORCILLERIA MARIELA', N'ANDREA MARIA', N'ECHEVERRY', N'Diagonal 10 # 70 70', N'4526633', N'3026558923', N'morcilla@hotmail.es', N'Es Muy Inteligente', CAST(0x01380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9731, 1, N'33333333', N'TAQUERIA JUACO', N'ANDRES JOSE', N'MOLINA', N'Calle 70 # 77 29', N'7895622', N'3015263333', N'juaco@live.com', N'Que Man Tan Canzon', CAST(0x22380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9732, 1, N'44444444', N'TIENDA DON LUIS', N'DAVID JANDRO', N'CIFUENTES', N'Calle 10 # 74 45', N'4852210', N'2506332015', N'luismejo@live.com', N'No Le Gusta Que Lo Molesten', CAST(0xA63C0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9733, 1, N'55555555', N'PIZZAS PICOLO', N'MAGNOLIA JOSEFA', N'PEREZ', N'Calle 45 # 44 50', N'2554646', N'3035201113', N'mano@gmail.com', N'Feo A Morir', CAST(0xF33D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9734, 1, N'66666666', N'SUPERMERCADO EL CALIDOSO', N'ARGIRO GABRIEL', N'PENAGOS', N'Diagonal 101 # 33 30', N'4521110', N'3014562389', N'serrucho@live.com', N'Solo Le Gusta Lo Barato', CAST(0x541E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9735, 1, N'77777777', N'MANGOS DON PEPE', N'ATAGUALPA VERENICE', N'ZOCO', N'Calle 66 # 25 56', N'2303030', N'3014562385', N'india@live.com', N'Vende Mangos Robados', CAST(0xCF2F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9736, 1, N'88888888', N'LIBRERIA ANTON', N'FABRICIO TUTUCAN', N'RESTREPO', N'Calle 00 # 14 13', N'9602356', N'3098562211', N'pelagra@yahoo.com', N'Solo Pirata', CAST(0x75250B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9737, 1, N'99999999', N'TIENDA ELBALAZO', N'SANDRA DEDALO', N'JIMENEZ', N'Carrera 55 # 69 289', N'6033030', N'3001234567', N'melo@hotmail.com', N'Mera Frontera', CAST(0x16FF0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9738, 2, N'00542040', N'LEGUMBRERIA EL PRECIO MENOS', N'DARIO JOSE', N'GOMEZ', N'Calle 44 # 11 99', N'4215285', N'30001025636', N'joselo@live.com', N'Solo Lo Mejor', CAST(0x02380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9739, 1, N'98521452', N'LICORES FLA', N'LICORES', N'FLA', N'Sol a la una 45', N'5342512', N'3114872540', N'Licoresgmail.com', N'', CAST(0x4F390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9741, 1, N'87451265', N'CAFE SALUD', N'DIOSA', N'MARGARITA', N'Sol a la  35', N'5442512', N'3124872540', N'	Diosagmail.com', N'', CAST(0x53390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9742, 2, N'24456789', N'SENA', N'SANTIAGO', N'AXIS', N'Sol  la  45', N'5547552', N'3184872540', N'sena@gmail.com', N'', CAST(0x7B220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9743, 1, N'754781236', N'CHOCOLOTES', N'GUILLERMO', N'DAVID', N'Luna la 74 # 84 21', N'5874512', N'3548790012', N'Chocolate@gmail.com', N'', CAST(0xE8230B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9744, 1, N'21874254', N'SUSANAFB', N'SUSANA', N'FB', N'Noche la 34', N'5348712', N'3114981234', N'Susana@gmail.com', N'', CAST(0xBA530A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9745, 1, N'88030952795', N'PASCUAL', N'PASCUALSITO', N'BRAVO', N'CALLE MORELOS NO. 24', N'913367385', N'2374409', N'Pascual@gmail.com', N'no esta en contacto', CAST(0x171E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9746, 1, N'76166725425', N'TOMAS', N'TOMI', N'VILLA', N'CALLE MATAMOROS NO. 225', N'913367385', N'2374410', N'tomas@gmail.com', N'no esta casado y esta solo', CAST(0xCB1C0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9747, 1, N'89120569377', N'ARMANDO', N'ARMANDITO', N'RIOS', N'CAV.INDEPENDENCIA NO. 574', N'913367385', N'2344409', N'armando@gmail.com', N'tiene novia', CAST(0x731E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9748, 1, N'90020268726 ', N'ARTURO', N'ARTURITO', N'VILLA', N'AV. INDEPENDENCIA NO. 565-A', N'913367385', N'2374533', N'arturo@gmail.com', N'no esta en contacto', CAST(0xF2200B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9749, 1, N'89062176506', N'FREDY', N'FRDITO', N'ZULUAGA', N'	AV. LIBERTAD NO. 956', N'913367385', N'2363396', N'fredy@gmail.com', N'tiene sueños malos', CAST(0x13370B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9750, 1, N'88070179002', N'LAURA', N'LAURITA', N'RODRIGUEZ', N'AV. LIBERTAD NO. 897', N'913367385', N'2374414', N'laura@gmail.com', N'come mucho', CAST(0x5E1D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9751, 1, N'89112363808', N'ARNULIO', N'ARNULITO', N'ZAPATA', N'CALLE AGUSTIN LARA NO. 69-B', N'913367385', N'2374623', N'arnulio@gmail.com', N'es super normal', CAST(0x3A230B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9752, 1, N'89022457765', N'CAROLINA', N'CARO', N'CAICEDO', N'CALLE AGUSTIN LARA NO. 69-B', N'913367385', N'2375369', N'carolina@gmail.com', N'y no tiene mascota', CAST(0x5F220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9753, 1, N'90040855555', N'BRAYAN', N'BRAYITAN', N'ZULETA', N'CALLE AGUSTIN LARA NO. 69-B', N'913367385', N'2774409', N'brayan@gmail.com', N'tiene autoestima alto', CAST(0xD1230B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9754, 1, N'90032672999', N'JOHANA', N'JOHA', N'ARIAS', N'CALLE AGUSTIN LARA NO. 69-B', N'913367385', N'2374499', N'johana@gmail.com', N'si tiene plata', CAST(0x5D220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9755, 1, N'970203640', N'TAMARINDOS', N'JUAN', N'VELEZ', N'Calle 58b #07c 12', N'3121067', N'320245', N'TamaJuan@hotmail.com', N'Tamarindo Dulce', CAST(0x731E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9756, 1, N'970408094', N'PASTAS LA MUÑECA', N'GLORIA', N'BERMUDEZ', N'Calle 69a #14c 20', N'3148596', N'2699874', N'Gloria@hotmail.com', N'Las mejores pastas', CAST(0x28240B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9757, 1, N'950206450', N'BOCADILLOS EL CARIBE', N'PASCUALO', N'ALVAREZ', N'Calle 70 #07 12', N'2110100', N'2203000', N'Alvarez@hotmail.com', N'Para toda la vida', CAST(0xF72F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9758, 1, N'112185486', N'LICORES ANU', N'MANUELA', N'GOMES', N'Calle 69b #47c 12', N'2045263', N'2016869', N'Manu@hotmail.com', N'Solo para mayores de edad', CAST(0xC78F0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9759, 1, N'112698978', N'GOMITAS KATHE', N'KATHERINE', N'ORTIZ', N'Calle 65b 26 12', N'2345658', N'4203236', N'Kathe@hotmail.com', N'Gomitas Trululu', CAST(0x7B210B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9760, 1, N'112568412', N'CHOCOLATES', N'SANTIAGO', N'GOMEZ', N'Calle 62 #12 26', N'4225669', N'4484649', N'Santii@hotmail.com', N'Cocolates Jet', CAST(0x731E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9761, 1, N'415651586', N'MENTAS CHAO', N'ADRES', N'TUFOLIO', N'Calle 29a #69 20', N'4986321', N'3204569', N'Mentitas@hotmail.com', N'Chao Chao', CAST(0x81950900 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9762, 1, N'850485455', N'GORRAS', N'MERVIN', N'PANIAGUA', N'Calle 15 #56b 12', N'2016589', N'4562136', N'pani@hotmail.com', N'Gorras a 5000', CAST(0xD1320B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9763, 1, N'412331341', N'ZAPATOS', N'NAREN', N'GOMES', N'Calle 39b #58c 12', N'2299865', N'2299897', N'Nare@hotmail.com', N'ADIDAS', CAST(0x28240B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9764, 1, N'415654621', N'CAFE', N'RAMON', N'VALDEZ', N'Calle 37b 15 12', N'2016965', N'4556362', N'ramon@hotmail.com', N'EL cafe de colombia', CAST(0x74210B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9765, 3, N'999484876', N'DDC', N'DAVID', N'DUQUE', N'Calle 39C #116 18', N'1027834', N'3189856', N'david@gmail.com', N'', CAST(0x4A240B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9766, 3, N'5489436893', N'CASILDA OCHOA', N'CASILDA', N'OCHOA', N'Carrera 9 #200 07', N'5479263', N'4529304', N'casi@hotmail.com', N'', CAST(0xEE1E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9767, 1, N'8345734985', N'CLOTILDE71', N'CLOTILDE', N'VÁSQUEZ', N'Calle 54 #34 78', N'5724398', N'4945637', N'clo71@yahoo.com', N'Mujer joven', CAST(0xDCE50900 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9768, 1, N'23125878', N'FABRICATO S.A.', N'ANGELA', N'VELEZ', N'Calle 2 #234 78', N'7452738', N'7456573', N'angelav@gmail.com', N'', CAST(0x2AEC0A00 AS Date))
GO
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9769, 1, N'576303459', N'I.E. EDOS', N'SUSANA', N'CARDENAS', N'Calle 126C #16 128', N'3748596', N'3478394', N'susanaedos@hotmail.es', N'Coordinadora superior', CAST(0xEE1E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9770, 1, N'345423523', N'CLARO S.A.', N'MARIANA', N'GUARÍN', N'Carrera 52A #28 34', N'5746293', N'5826533', N'guarin123@gmail.com', N'', CAST(0x3F160B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9771, 1, N'68944654', N'BIMBO', N'SANTIAGO', N'RENTERÍA', N'Calle 58C #98B 07', N'5485734', N'6549659', N'santi@hotmail.com', N'', CAST(0xA2160B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9772, 1, N'4544564', N'P&G', N'JUAN', N'BUILES', N'Carrera 39C #116 18', N'9835467', N'9856374', N'builes@gmail.com', N'', CAST(0xEE1E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9773, 1, N'656546456', N'COLGATE', N'JOSÉ', N'URIBE', N'Avenida 3 #16 8', N'3547586', N'9806738', N'colgatejose@outlook.es', N'', CAST(0xEE1E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9774, 1, N'738293057', N'EPM', N'FRANK', N'POTTER', N'Calle 87E #21 1', N'3467894', N'9678456', N'frnk@outlook.com', N'', CAST(0xEE1E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9775, 1, N'96081913784', N'ANDRÉS ZAPATA', N'ANDRÉS', N'ZAPATA', N'calle 49 # 99 E 86', N'4906895', N'3004957867', N'', N'', CAST(0x391F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9776, 2, N'3224564', N'ADALVERTO', N'ADALVERTO', N'LAZCARRO', N'calle 67 # 54 98', N'2345442', N'31346543', N'', N'profesor de economia', CAST(0xD8000B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9777, 1, N'7865688', N'CRISTINA RUIZ', N'CRISTINA', N'RUIZ', N'calle 34 # 68 E 98 interior 204', N'49065433', N'300654343', N'', N'matematicas', CAST(0x90050B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9778, 1, N'98657865455', N'HIGINIO', N'JUAN DAVID', N'RIOS', N'calle 65 # 67 E 88', N'4906543', N'3004957543', N'', N'', CAST(0x571F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9779, 1, N'96544335677', N'DUVAN CARVAJAL', N'DUVAN', N'CARVAJAL', N'calle 67 # 65 45', N'4906895', N'3004957867', N'', N'', CAST(0x391F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9780, 1, N'9687655787', N'ANDRÉS MAZO', N'ANDRÉS', N'MAZO', N'calle 49 # 87 E 56 interior 301', N'2563332', N'300654344', N'', N'vecino', CAST(0xA6200B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9781, 2, N'4543223453', N'ORLANDO TERRI', N'ORLANDO', N'RIOS', N'calle 78 # 65  97', N'49065533', N'3006545676', N'', N'', CAST(0x65080B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9782, 2, N'4544323566', N'MILO VALENCIA', N'CAMILO', N'VALENCIA', N'calle 54 # 78 AA 86', N'490556', N'30075678786', N'', N'mi musica', CAST(0xE2E40A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9783, 1, N'656875432', N'OSCAR EL EMO', N'OSCAR', N'DUARTE', N'calle 65 # 75 EE 76', N'4906567', N'3004654567', N'', N'la sangre', CAST(0xAC150B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9784, 1, N'5435776543', N'SEBAS', N'SEBASTIAN', N'QUINTERO', N'calle 45 # 99 E 86', N'49066436', N'3004956778', N'', N'el metro', CAST(0x92E40A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9785, 1, N'95100621844', N'JUAN', N'CAMILO', N'ZAPATA', N'Restrepo', N'Cra50A-87#28', N'2365868', N'3135099693', N'Responsable', CAST(0xFB1D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9786, 2, N'1152701134', N'DAYAN', N'ALEXANDER', N'PELAEZ', N'Tirado', N'Cra50A-87#28', N'2365868', N'3207068179', N'Trabajador', CAST(0xED180B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9787, 1, N'39325313', N'CLARA', N'INES', N'TIRADO', N'Franco', N'Cra49A-56#18', N'2368545', N'3147232154', N'Una Mujer Fuerte', CAST(0x81F30A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9788, 2, N'39325816', N'OSCAR', N'HERNANDO', N'TIRADO', N'Franco', N'Avenida Caracas', N'4165287', N'3103596564', N'extaordinario', CAST(0x5F090B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9791, 1, N'1452368', N'MARIA', N'FERNANDA', N'ZAPATA', N'Franco', N'Cra50A-87#28', N'2355868', N'313509456', N'Hermosa', CAST(0x0D210B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9792, 2, N'236584879', N'ANDREZ', N'CAMILO', N'ZAPATA', N'Restrepo', N'Cra50A-87#28', N'2365868', N'3135099693', N'Responsable', CAST(0xFB1D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9795, 2, N'98754632599', N'EMPANADAS LA LUPA', N'LUIS', N'FRANCO', N'Calle 59 # 69 51', N'2309263', N'3126068617', N'empanaditas@gmail.com', N'ricas', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9796, 1, N'43456357', N'MARTA FRANCO', N'MARTA', N'FRANCO', N'cra 80 # 69 51', N'4364983', N'5216398', N'martica@gmail.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9797, 3, N'718965236', N'ANA UPEGUI', N'ANA', N'UPEGUI', N'Calle 25 # 65 51', N'5236984', N'7452396', N'anaU@gmail.com', N'', CAST(0x3C220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9798, 2, N'87546293', N'RESTAURANTE NELLY', N'NELLY', N'OSSA', N'Calle 70 # 43 61', N'2605846', N'3135248657', N'restauranteNelly@hotmail.com', N'innovador, y delicioso', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9799, 2, N'54268964', N'LA ESPERANZA', N'FRANCISCO', N'CESPEDES', N'cra 59 # 78 23', N'2695874', N'2695362', N';Laesperanza@yahoo.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9800, 3, N'98654123699', N'DARIO MURILLO', N'DARIO', N'MURILLO', N'cra 38 # 52 63', N'5239687', N'3116311907', N'dario@gmail.com', N'', CAST(0x73210B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9801, 1, N'71896523', N'JAIRO MUÑOZ', N'JAIRO FRANCISCO', N'MUÑOZ LOPEZ', N'calle 24 # 32 65', N'2308545', N'312563984', N'jairito@gmail.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9802, 2, N'9865236', N'LA MAZAMORRA PAISA', N'CLAUDIA', N'QUINTERO', N'cra 52 # 56 32', N'25639850', N'3125648796', N'mazamorrapaisa@hotmail.com', N'sustanciosa', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9803, 1, N'98563241', N'CIGARRERIA', N'ANTONIO', N'DE LA RUA', N'Calle 56 # 87 56', N'5896321', N'3047859632', N'delarua@gmail.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9804, 1, N'43563256', N'AMANDA LOPEZ', N'AMANDA CECILIA', N'LOPEZ MORALES', N'cra 32 # 69 51', N'2605636', N'3135226366', N'Amanda@gmail.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9805, 2, N'785695', N'LA CHARCUTERIA', N'MELISSA', N'RUA', N'calle 70 # 65 95', N'2306666', N'2605555', N'charcuteria@yahoo.com', N'', CAST(0xF4230B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9806, 1, N'1215453246', N'EL PEPINO', N'LUKAS', N'ZUARES', N'Cr 81 C CL4 SUR 9 (interior 124)', N'3452145', N'2382156', N'PepinoFres@gmail.com', N'Frescos', CAST(0x52EF0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9807, 2, N'1216545420', N'PASTEL', N'MATEO', N'RENTERIA', N'Cll5 # 30 a 10 ', N'2541102', N'2365456', N'PepinoFres@hotmail.com', N'Delicioso con Gaseosa', CAST(0x0F170B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9808, 3, N'7852123232', N'SALCHIPAPAS', N'ROBINSON', N'HURTADO', N'Cll21 # 45 a 23', N'5124565', N'3215278', N'Salchi10@yahoo.es', N'Deliciosas', CAST(0xDF090B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9809, 3, N'1152445569', N'EL SABOREO', N'DAVID', N'RESTREPO', N'Cll32 # 35 a 23', N'3432105', N'3438016', N'ElSaboreo@gmail.com', N'Delicioas', CAST(0x11FE0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9810, 2, N'6446413568', N'SALCHICHA', N'GEORGE', N'RAMIREZ', N'Cll54 # 30 a 30', N'2310801', N'2252150', N'Salchicha@outlook.com', N'Frescas', CAST(0xA6600A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9811, 3, N'1216453046', N'LECHE', N'MANUEL', N'PEREA', N'Cll21 # 54 a 68', N'3413115', N'3421029', N'Leche@gmail.com', N'Leche del Campo', CAST(0x55FE0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9812, 1, N'4443213684', N'BOLIS', N'DUVAN', N'LOPEZ', N'Cll35 # 54 a 68', N'3252205', N'3435446', N'Bolis@hotmail.com', N'Dulces y FResco', CAST(0x61A80A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9813, 2, N'5435432867', N'EL BOROJO', N'JUANCHO', N'MOSQUERA', N'Cll30 # 64 a 68', N'3665285', N'3682056', N'Elborojo@gmail.com', N'Fresco y bitaminoso ', CAST(0xFF1A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9814, 1, N'1225485325', N'CHONTADURO', N'LUZ', N'HENAO', N'Cll10 # 64 a 68', N'3021450', N'2365456', N'Chontaduro@outlook.com', N'Frescos', CAST(0x0EE10A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9815, 2, N'1152456568', N'LOSCOCOS', N'SEBASTIAN', N'VALLEJO', N'C82a # 54 a 50', N'3045758605', N'4215733', N'sba123@gmail.com', N'rico', CAST(0x631B0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9816, 2, N'1155436567', N'LOS MANGOS', N'CARLOS', N'BERRIO', N'C86a # 58 a 50', N'3045434665467', N'4234545', N'carlos@gmail.com', N'dulce', CAST(0xA18C0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9817, 2, N'1232124345', N'LAS PAPAS', N'DAVID', N'CANO', N'C82a # 50 a 50', N'3035759605', N'4215533', N'cano@gmail.com', N'fritas', CAST(0xCFFD0900 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9818, 2, N'1124355486', N'AZUCAR', N'ANDRES', N'BERMUDEZ', N'C87a # 54 a 50', N'3045758605', N'4445733', N'andres@gmail.com', N'dulce', CAST(0x96440900 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9819, 1, N'1112466568', N'ARROZ', N'LUISA', N'RIOS', N'C83a # 54 a 50', N'3045754605', N'4211133', N'luisa@gmail.com', N'duradero', CAST(0xC27D0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9821, 1, N'1142434368', N'LOS PEPINOS', N'MICHEL', N'ARENAS', N'C82a # 34 a 50', N'3045756605', N'4215799', N'michel@gmail.com', N'rico', CAST(0xA8360B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9822, 2, N'1162456768', N'EXITO', N'ISABEL', N'ESCOBAR', N'C88a # 55 a 51', N'3045766605', N'4417733', N'isabel@gmail.com', N'ricos', CAST(0x5C1A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9823, 1, N'1172454568', N'LOS PANES', N'ANDREA', N'ZAPATA', N'C80a # 54 a 50', N'3045778605', N'2315533', N'andrea@gmail.com', N'dulces', CAST(0x9A1A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9824, 2, N'1182423368', N'LOS PASTELES', N'ARNULIO', N'RAMIREZ', N'C80a # 40 a 50', N'3048858605', N'3315733', N'ramirez@gmail.com', N'grandes', CAST(0xD6350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9825, 2, N'102345', N'PIPE', N'FELIPE', N'DUQUE', N'Calle 56 N 32-12', N'4540234', N'3015948758', N'duquefelipe95@gmail.com', N'Es muy grande', CAST(0x2B380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9826, 2, N'102346', N'CHEPE', N'JHON', N'CÓRDOBA', N'Calle 85 N 45-32', N'8564489', N'3035948754', N'chepe@gmail.com', N'Es pequeño', CAST(0x4A220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9827, 1, N'102347', N'CALICHE', N'CARLOS', N'VANEGAS', N'Carrera 25 N 65-82', N'4444402', N'3085699878', N'kaliche@gmail.com', N'Es muy trabajador', CAST(0x991E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9828, 2, N'102348', N'KIKE', N'ENRIQUE', N'JARAMILLO', N'Calle 12 N 56-87', N'4444408', N'3105623667', N'kike5465@gmail.com', N'Es muy inteligente', CAST(0xCE120B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9829, 2, N'102349', N'PACHO', N'FELIPE', N'DUQUE', N'Calle 56 N 32-12', N'4540234', N'3015948758', N'pachito@gmail.com', N'Es muy grande', CAST(0x09200B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9830, 2, N'102341', N'ANA', N'MARIA', N'CARDONA', N'Calle 21 N 78-65', N'2336587', N'3185896932', N'anamelosa@gmail.com', N'Es muy melosa', CAST(0xE8160B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9832, 2, N'102343', N'JAVI', N'JAVIER', N'HERNANDEZ', N'Carrera 88 N 36-85', N'8888888', N'3026665645', N'golcaracol@gmail.com', N'Goooooooooooool', CAST(0x96F90A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9833, 2, N'102340', N'ALFA', N'SANTIAGO', N'CARVAJAL', N'Carrera 55 N 25-84', N'4444565', N'3147575116', N'alfalfasoyyo@gmail.com', N'Se me para el pelo', CAST(0xC51E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9834, 1, N'102545', N'JIME', N'JIMENA', N'VILLA', N'Carrera 89 N 23-15', N'9566962', N'3012569863', N'wskhfeiughweiu@gmail.com', N'Te atiendo', CAST(0xF61E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9835, 1, N'1567459236', N'J & F', N'JUAN', N'QUINTERO', N'C65b # 54 a 20', N'3045695245', N'6584512', N'Quientero14@gmail.com', N'ala Fresca', CAST(0x2B1D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9836, 1, N'4569853125', N'LAS PALMERAS', N'SEBASTIAN', N'OROZCO', N'C95b # 33 a 10', N'4325941638', N'7416523', N'Orozkito_4@gmail.com', N'Delicias para el paladar', CAST(0x9B1A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9837, 1, N'3524896215', N'ZENU', N'ARNULIO', N'RASTASTAS', N'C84b # 67 a 15', N'1895614263', N'6584125', N'Arnulito_rastas@gmail.com', N'Refrescante', CAST(0x191C0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9838, 1, N'5482444458', N'ALPINA', N'DANIEL', N'VARELA', N'C75b # 10 a 44', N'8531274596', N'1478523', N'Danielrxn@gmail.com', N'Dulce y Sabroso', CAST(0x2B1D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9839, 1, N'3571596548', N'JET', N'MATEO', N'QUINTERO', N'C13b # 55 a 99', N'3541268754', N'4754295', N'Mateo_lds@gmail.com', N'Dulce Chocolate', CAST(0x52200B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9840, 1, N'9874563165', N'SYSTEMS', N'JUAN', N'ZULUAGA', N'C48b # 64 a 65', N'6825473120', N'1203640', N'jzulu_55@gmail.com', N'Tecnologia', CAST(0x10230B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9841, 1, N'4563211597', N'FRITO LAY', N'DIDIER', N'VERA', N'C41b # 65 a 20', N'2014795631', N'7539512', N'Vera15@gmail.com', N'Fritos', CAST(0x06240B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9842, 1, N'4598261574', N'ABURRA', N'CAMILO', N'RIOS', N'C77b # 66 a 66', N'7519530265', N'7851354', N'Camilochochis@gmail.com', N'Grano', CAST(0x401F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9843, 1, N'4136589746', N'MIRASOL', N'ANDRES', N'ZAPATA', N'C33b # 57 a 17', N'9874123654', N'1539578', N'Zapatika@gmail.com', N'Lacteos', CAST(0x521D0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9844, 1, N'6985213489', N'LAVANDER', N'ELVIS', N'PALACIOS', N'C52b # 36 a 10', N'3698741025', N'2015638', N'Levispala@gmail.com', N'Cosmeticos', CAST(0xA6190B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9845, 3, N'4821684', N'SINGUENTHON', N'SINGUENTHON', N'GONZALES', N'CALLE 90 NO 65 APT 201', N'254887424', N'4554142', N'singuenthon218@yahoo.es', N'casado', CAST(0x12310B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9847, 3, N'8119784', N'SEBASTIAN', N'SEBAS', N'OROZCO', N'CALLE 45 NO 33 APT 301', N'57461564', N'4597144', N'sebas@yahoo.es', N'casado', CAST(0x4F300B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9848, 3, N'4681154', N'VALERIA', N'VALE', N'GONZALES', N'CALLE 20 NO 45 APT 203', N'841687', N'43541565', N'valeria18@yahoo.es', N'soltero', CAST(0x70380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9849, 3, N'4846584', N'JULISSA', N'YULI', N'CORRALES', N'CALLE 10 NO 45 APT 20', N'2546744', N'456444', N'julissaon218@yahoo.es', N'casada', CAST(0x71370B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9854, 1, N'15645616', N'EL MACHETEADERO', N'PEDRO', N'RUIZ', N'Calle 50 # 96 40', N'4552566', N'3114555440', N'pedro.r@gmail.com', N'Sele Brinda Respeto', CAST(0x373A0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9855, 1, N'03541331', N'SOLO PALETAS', N'JUAN', N'GOMEZ', N'Calle 80 # 92 45', N'4682435', N'3215568424', N'juan.g@gmail.com', N'Para Esos Calores Matadores', CAST(0x9A390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9856, 1, N'54512545', N'SUPER HELADO', N'LUIS', N'VELEZ', N'Carrera 20 # 50 92', N'4552266', N'3186654422', N'liusito@gmail.com', N'Deleitate Con El Super Helado', CAST(0x85390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9857, 1, N'65425454', N'POLLO FRESCO', N'FRANCISCO', N'PEREZ', N'Calle 56 # 42 65', N'8554466', N'3115588552', N'fransisc@gmail.com', N'Pollo A Carbon', CAST(0x1A300B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9858, 1, N'75624521', N'EL CHORIZERO', N'CALICHE', N'IBARGUEN', N'Calle 30 # 61 56', N'2554445', N'3144553322', N'caliche.i.@gmail.com', N'Grandes y Deliciosos', CAST(0x6E350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9859, 1, N'85754255', N'EL RESUCITE', N'DORIS', N'RAMIREZ', N'Calle 50 # 89 22', N'6554422', N'3114506588', N'doris.r@gmail.com', N'Caldito Levanta Muertos', CAST(0xB7350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9860, 1, N'62654525', N'SOLO FRIAS', N'FERNANDO', N'GALVIS', N'Calle 45 # 65 21', N'2445587', N'3217896544', N'fernando@gmail.com', N' Para Que Te Refresques', CAST(0xB4320B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9861, 1, N'85455642', N'EL REFRESQUE', N'ALFREDO', N'MORENO', N'Calle 90 # 54 54', N'5528224', N'3124789622', N'alfred@gmail.com', N' Pola Refrescante', CAST(0x462C0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9862, 1, N'32354122', N'SOLO POLAS', N'CAMILO', N'LOPEZ', N'Calle 50 # 11 14', N'4772255', N'3186635512', N'milo.l.@gmail.com', N'Polas Las Frescuras  ', CAST(0xF0390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9863, 1, N'23564554', N'EL AGUARDIENTERO', N'JULIAN', N'GRACIANO', N'Calle 120 # 54 14', N'4552566', N'3127895244', N'julian.g.@gmail.com', N'Para Subirte El Animo', CAST(0xAB360B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9864, 1, N'11224588', N'DOMO', N'CAMILA', N'SANCHEZ', N'CRR 113 34-23', N'47563256', N'9513520', N'ZUÑIGA@GMAIL.COM', N' ', CAST(0xF81E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9865, 1, N'84553095', N'MTV', N'JULIETH', N'ORTEGA', N'CLL 3-23', N'2577885', N'42355789', N'CAMI@GMAIL.COM', N' ', CAST(0x6D200B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9867, 1, N'11224581', N'TOTTO', N'CAMIL0', N'SANTANDER', N'CRR 113 54-93', N'997563256', N'9513527', N'JAMESA@GMAIL.COM', N' ', CAST(0x89180B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9869, 1, N'11224583', N'ALQUERIA', N'ANDRES', N'SEPULVEDA', N'CRR 102 34-23', N'78963256', N'9513525', N'DAVIDLUIZ@GMAIL.COM', N' ', CAST(0xC8120B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9870, 1, N'11224584', N'IBIZA', N'ROSA', N'MELANO', N'CLL 74 34-23', N'4755448256', N'9513524', N'ELVIO@GMAIL.COM', N' ', CAST(0x53170B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9871, 1, N'11224585', N'JGB', N'LISEET', N'PINEDA', N'CRR 65 34-93', N'448553256', N'9513523', N'LADERAS@GMAIL.COM', N' ', CAST(0x65220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9872, 1, N'11224586', N'LENOVO', N'BENITO', N'CAMELO', N'CL 78 34-91', N'47123256', N'9513522', N'PONCHIS@GMAIL.COM', N' ', CAST(0xF71E0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9873, 1, N'11224587', N'MONTEFRIO', N'JULIANA', N'MUNERA', N'CRR 11 44-18', N'47568256', N'9513521', N'jUAÑA@GMAIL.COM', N' ', CAST(0xD91C0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9879, 3, N'50978164', N'DIEGO', N'ANDRES', N'PEREZ', N'CALLE 58 NO 54 APT 210', N'254657924', N'467144', N'diegoandresn218@yahoo.es', N'soltero', CAST(0x69320B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9880, 3, N'4547821', N'JULIETA', N'JULI', N'PERAS', N'CALLE 45 NO 65 APT 401', N'2564564', N'48759644', N'julieta8@yahoo.es', N'casado', CAST(0x86340B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9881, 3, N'64721054', N'ALEJANDRO', N'ALEJO', N'CUARTAS', N'CALLE 25 NO 45 APT 410', N'2525424', N'46544', N'alejo18@yahoo.es', N'soltero', CAST(0x08310B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9882, 3, N'100024785', N'ALEXANDRA', N'ALEX', N'GUARIN', N'CALLE 80 NO 65 APT 410', N'254887424', N'4597144', N'alexandra@yahoo.es', N'casado', CAST(0x7A2F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9883, 2, N'952307745', N'EL ENCANTO', N'OMAR', N'MONTOYA', N'Cra 83 # 54 - 16', N'3664555', N'32144565578', N'omarMon@Gmail.es', N'don omar es mejor que jaime', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9884, 1, N'10626327542', N'LOS BILLARES DE PACHO', N'GUILLERMO', N'BENITEZ', N'Cra 81 # 56 - 06', N'25478887', N'3206569515', N'Gulle_Garden@Hotmail.com', N'bola 8 te atiende', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9885, 2, N'962604547', N'MERCAYOLANDA', N'BEATRIZ', N'LOAIZA', N'Cra 80 # 54', N'45566877', N'3186521471', N'Beatriz@Merca.es', N'todos sus productos en un mismo sitio', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9886, 1, N'26075458', N'LA EMPANADA DE MI ESPOSA', N'FRANCISCO', N'EL HOMBRE', N'Circular 1 # 46 - 21', N'8955214', N'2564115', N'Francisco@elHombre.es', N'empanada no hay igual', CAST(0x7C350B00 AS Date))
GO
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9887, 2, N'762645643', N'EL CHORIZO DE ERNESTO', N'ERNESTO', N'ESPINOSA', N'Cra 10 # 01 - 24', N'3144556', N'3006009525', N'Chory@gmail.es', N'el mejor chorizo, aunque duro', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9888, 1, N'3626415', N'COMA ADREIM', N'GLORIA', N'LA DEL METRO', N'Cl 32 # 93 - 48', N'7890120', N'3128446974', N'Gloria@yahoo.es', N'es la misma del metro', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9889, 2, N'962607548', N'TULUA PRESENTE', N'JOSÉ', N'PECKERMAN', N'Cl 54A # 39B - Circular 9 Con la 10', N'3554120', N'3109154876', N'Peckerman@presente.es', N'vamos pa brasil', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9890, 1, N'462607546', N'AREPAS DE PEREIRA', N'CAMILO', N'LOZANO', N'Av 91  37 - 22', N'6550314', N'3214556985', N'Camilo_Arepas@gmail.es', N'las mejores de la ciudad', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9891, 2, N'10625765', N'LLEVE SU GAROTA', N'ARNULIO', N'LUIS', N'Cl 50 # 80 - 81', N'2463586', N'2648552', N'Arnulio@garotas.es', N'Brasil presente', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9892, 1, N'7066075465', N'MUJERES CASI VIRGENES', N'NICOLAS', N'RESTREPO', N'Cra 23 # 15 - 49', N'9132285', N'3046587410', N'Nicolas@virgen.es', N'Llevar condon', CAST(0x7C350B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9893, 3, N'1596541235', N'EL BEBEDERO', N'JUAN', N'MARIN', N'Calle 25 # 52 52', N'4523658', N'4123232', N'bebedero@gmail.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9894, 4, N'1547865234', N'PEDRO MARIN', N'PEDRO', N'GIRALDO', N'cra 14 # 52 78', N'4586235', N'4785236', N'pedro@gmail.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9895, 4, N'1125653248', N'SOFIA UPEGUI', N'SOFIA', N'UPEGUI', N'Calle 14 # 85 02', N'5426857', N'2456985', N'sofi@gmail.com', N'', CAST(0x3C220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9896, 1, N'1147856923', N'GUILLERMO QUINTERO', N'GUILLERMO', N'QUINTERO', N'Calle 56# 82 14', N'2648562', N'4223356', N'guille@hotmail.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9897, 2, N'1156823336', N'LA PALETERA', N'MAURICIO', N'GALAN', N'cra 22 # 51 33', N'4512354', N'4225588', N';paletera@yahoo.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9898, 2, N'1145896632', N'LA CARMENZA', N'CLAUDIA', N'MURILLO', N'cra 77 # 33 22', N'4785562', N'2465325', N'carmenza@gmail.com', N'', CAST(0x73210B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9899, 2, N'1147852369', N'PAULO JARAMILLO', N'PAULO EMILIO', N'LEON JARAMILLO', N'calle 20 # 14 85', N'4562314', N'451263', N'paulo@gmail.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9900, 2, N'1111122233', N'LA SOPERA', N'SANTIAGO', N'RENTERIA', N'cra 88 # 45 66', N'4556699', N'4228855', N'lasopera@hotmail.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9901, 1, N'1125669887', N'MORCILLA', N'ALBERTO', N'ARRACACHA', N'Calle 22 # 45 78', N'4556675', N'4222222', N'arracacha@gmail.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9902, 1, N'1245632054', N'LA ESQUINA', N'RAMON', N'VALDEZ', N'cra 22 # 84 63', N'4200001', N'4025689', N'laesquina@gmail.com', N'', CAST(0x081F0B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9903, 1, N'1035555555', N'JUANCHO PANSA', N'CAMI', N'SUAREZ', N'c11 # 10 10 ', N'3438888', N'312255555', N'cami@gmail.com', N'estudiante', CAST(0xD6380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9904, 1, N'1035455455', N'TIENDA EL SAN JUAN', N'PEDRO', N'CABIAR', N'c14 # 11 11 ', N'3438448', N'313666668', N'juan@gmail.com', N'obraNegra', CAST(0xD7380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9905, 1, N'115554565', N'EL DOCTORADO', N'GABRIEL', N'SERNA', N'c20 # 10 10 ', N'3458888', N'31265555', N'gabriel@gmail.com', N'doctor', CAST(0xDC380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9907, 1, N'10344455', N'TABERNA', N'CARLOS', N'BASQUE', N'c15 # 13 55 ', N'3438778', N'318596541', N'taberna@gmail.com', N'tabernante', CAST(0x19390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9908, 1, N'108557962', N'CAMARONES', N'SEBAS', N'BENITESS', N'c11 # 14 17 ', N'3435555', N'312256566', N'cabrones@gmail.com', N'labores', CAST(0xDB380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9913, 1, N'45615697', N'ROPA SA', N'ROPA', N'SA', N'plaza del gamin', N'5284625', N'316023458', N'Ropamoda@gmail.com', N'', CAST(0x36390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9914, 1, N'12345688', N'DISTRIBUIDORA FLACUCHO', N'ANDRES', N'GOMEZ', N'Avenida los Cocos', N'2924875', N'311551463', N'Distribu@gmail.com', N'', CAST(0xD8380B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9915, 1, N'42075651', N'PANADERIA RICA', N'ALBERTO', N'DIAZ', N'Calle 42 # 15', N'5723677', N'310552330', N'	Albergmail.com', N'', CAST(0x53390B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9916, 2, N'21154569', N'DISFRASES', N'ROBIN', N'TABORDA', N'Barrio Morrudo', N'5547552', N'319223041', N'Robinsena@gmail.com', N'', CAST(0x7B220B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9919, 2, N'5641746', N'MAZDA', N'MAGALI', N'ROJAS', N'AV. 20 DE NOVIEMBRE NO 1053', N'91-336-7387', NULL, N'gerencia@mazda.com.co', N'El mejor concecionario mazda de la ciudad', CAST(0xD9060B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9920, 3, N'99544854', N'COLORADO REINOS', N'COLORADO', N'REINOS', N'BLVD. BENITO JUAREZ NO. 1466-A', N'91-336-7378', N'', N'colorado@gmail.com', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9921, 3, N'98456154', N'ANAFE', N'ANAFE', N'DOMINGUEZ', N'CALLE MATAMOROS NO.280', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9922, 3, N'68741687', N'AMARILLO', N'POLANCO', N'FLORIAN', N'AV. INDEPENDENCIA NO. 545', N'91-336-7384', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9923, 3, N'979388348', N'PELAO', N'DE LA ROSA', N'RAMIREZ', N'AV. INDEPENDENCIA NO. 1282-A', N'91-336-7383', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9924, 3, N'108684155', N'ELTON', N'JHON', N'OROZCO', N'CALLE MATAMOROS NO. 127', N'91-336-7383', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9925, 3, N'887949886', N'BRUCE', N'LEE', N'CABRERA', N'AV.INDEPENDENCIA NO.1010', N'91-336-7379', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9926, 3, N'887964876', N'TOSHIBA', N'FIDELINA', N'PERALTA', N'AV. 5 DE MAYO NO. 1652', N'91-336-7374', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9927, 3, N'889779216', N'FAUSTINO FOSTEN', N'FAUSTINO', N'FOSTEN', N'AV. INDEPENDENCIA NO. 748', N'91-336-7387', N'', N'tino', N'', CAST(0x5B950A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9928, 1, N'8264874', N'TEAMO', N'AMADOR', N'MONTERO', N'CALLE MORELOS NO. 24', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9929, 1, N'7354888', N'PAPASITO', N'LUIS', N'YOIS', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9930, 1, N'894484377', N'NUEVECITA', N'SANTANA', N'COLON', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9931, 1, N'987988486 ', N'PELIGROSO', N'SUERO', N'NOBOA', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9932, 1, N'88979464606', N'MICHAEL', N'JORDAN', N'ABREU', N'	Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9933, 1, N'88234654', N'CUCA', N'ALTAGRACIA', N'FELIZ', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9934, 1, N'895789708', N'CHUCHA', N'COLON', N'GRACIA', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9935, 1, N'877165465', N'BARNEY', N'FRANCIS', N'DELA CRUZ', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9937, 1, N'912157899', N'ANAL', N'RAFAEL', N'TEJEDA', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9939, 3, N'984658796', N'WISTON', N'CHURCHIL', N'MERCEDES', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9940, 3, N'889744984', N'POPOLON', N'ROSARIO', N'LEDESMA', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9941, 3, N'249687441 ', N'WACHI', N'VERGA', N'FORTUNA', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9942, 3, N'84968715687', N'SHAKESPEARE', N'MOZART', N'CORREA', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9943, 3, N'8854894486', N'JUAREZ', N'DISNEY', N'LANDYA', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9944, 3, N'845674174', N'FLORES', N'VALGAZ', N'ALAVA', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9945, 3, N'66545461', N'USNAVY', N'MARINA', N'PEREZ', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9946, 3, N'6524646461', N'EMAIL', N'BARBOSA', N'SUAREZ', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9947, 3, N'254815415', N'LUISA', N'SELMIRA', N'WALTER', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9948, 2, N'5814851151', N'JAMES', N'BONO', N'NOTENO', N'Carrera 13, nº 26-62', N'91-336-7385', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9949, 2, N'86418171156', N'NORMANDÍA', N'CHURICA', N'ESPÍRITU', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9950, 2, N'6515154815', N'AQUILES', N'MACHUCA', N'TISSOT', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9951, 2, N'7456489416', N'CLAVELO', N'SEMEN', N'FUNCIONARIO', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9952, 2, N'56481561', N'SEVERO', N'SANTA', N'ESPLÉNDIDA', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9953, 2, N'6874168', N'VESPERTÍN', N'CARPULINA', N'CONDORAZO', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9954, 2, N'3254844', N'MANUEL', N'MANUELITO', N'ZAPATA', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9955, 2, N'26548915', N'RUTHALIA', N'WOVER', N'ROSULA', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9956, 2, N'649874165', N'EDICIOCLECIANA', N'BLANCA', N'RAMIREZ', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9957, 2, N'357718571', N'JULIAN', N'JULIANSITO', N'NIEVES', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9958, 2, N'24894654', N'VOLTAIRE', N'EDILIA', N'GLAY', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9959, 2, N'357561654', N'EMIGDI', N'LISIÓN,', N'CRUZCAYA', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9960, 2, N'288774647', N'CEVISNE', N'NEURESDIN', N'RINGO', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9961, 2, N'9567489 ', N'ABDÓN', N'ABUNDIO', N'VILLA', N' Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9962, 3, N'94451212', N'AGAPITO', N'AMBROSIO', N'ANICETO', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9963, 3, N'81548898', N'ASTERIO', N'BARTOLO', N'BASILIO', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9964, 3, N'265489', N'CANCIO', N'CASILDO', N'CASIMIRO', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9965, 3, N'657185241', N'CECILIO', N'CELEDONIO', N'CIPRIACO', N'Carrera 13, nº 26-62', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9966, 3, N'5674984', N'CLEMENTE', N'CRISPÍN', N'CRUZ', N'Carrera 8 no. 9-83', N'327 4916', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9967, 3, N'56489498711', N'DEOGRACIAS', N'DIONISIO', N'DOMICIANO', N' Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL, CAST(0x3EFA0A00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9968, 2, N'89766666', N'Univeridad de Antioquia', N'Luis', N'Rosales', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9970, 1, N'98989898', N'Emiliano Zuleta Buenaventura', N'Emiliano', N'Zuleta Buenaventura', N'Calle 34 #45 56', N'2334455', N'3005557788', N'emili909@hotmail.com', N'Canta vallenatos', CAST(0x24130B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9971, 2, N'890770790909', N'Magia a Domicilio', N'Juan', N'Tamariz', N'Calle 45 #45 55', N'2334466', N'3124567890', N'juantama@gamil.com', N'Es muy narizon', CAST(0x36240B00 AS Date))
INSERT [dbo].[Cliente] ([IDCliente], [IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (9972, 1, N'4554544334', N'Laura Acuña', N'Laura', N'Acuña', N'', N'', N'', N'', N'', CAST(0xCE380B00 AS Date))
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Concepto] ON 

INSERT [dbo].[Concepto] ([IDConcepto], [Descripcion]) VALUES (1, N'Averia')
INSERT [dbo].[Concepto] ([IDConcepto], [Descripcion]) VALUES (2, N'Autoconsumo')
SET IDENTITY_INSERT [dbo].[Concepto] OFF
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (1, N'Licores')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (2, N'Aseo Personal')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (3, N'Aseo Hogar')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (4, N'Ferretería')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (5, N'Niños')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (6, N'Interior Masculino')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (7, N'Interior Femenino')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (8, N'Frutas y Verduras')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (9, N'Granos')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (10, N'Electrodomésticos')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (11, N'Farmacia')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (12, N'Panadería')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (13, N'Belleza Mujer')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (14, N'Jugos Naturales')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (15, N'Deporte')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (16, N'Literatura')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (17, N'Arte')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (18, N'Lacteos')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (19, N'Seguridad Personal')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (20, N'Charcutería')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (21, N'Carnicería')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (22, N'Salsas')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (23, N'Verduras y frutas')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (24, N'Lacteos')
INSERT [dbo].[Departamento] ([IDDepartamento], [Descripcion]) VALUES (25, N'Carniceria')
SET IDENTITY_INSERT [dbo].[Departamento] OFF
SET IDENTITY_INSERT [dbo].[IVA] ON 

INSERT [dbo].[IVA] ([IDIVA], [Descripcion], [Tarifa]) VALUES (1, N'Excluido', 0)
INSERT [dbo].[IVA] ([IDIVA], [Descripcion], [Tarifa]) VALUES (2, N'Exento', 0)
INSERT [dbo].[IVA] ([IDIVA], [Descripcion], [Tarifa]) VALUES (3, N'IVA 10%', 10)
INSERT [dbo].[IVA] ([IDIVA], [Descripcion], [Tarifa]) VALUES (4, N'IVA 16%', 16)
SET IDENTITY_INSERT [dbo].[IVA] OFF
INSERT [dbo].[Medida] ([IDMedida], [Descripcion]) VALUES (N'KG', N'Kilogramo')
INSERT [dbo].[Medida] ([IDMedida], [Descripcion]) VALUES (N'LT', N'Litro')
INSERT [dbo].[Medida] ([IDMedida], [Descripcion]) VALUES (N'UN', N'Unidad')
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (99, N'MANGO DE AZUCAR X 0.2 KG', 11, 3, 1390.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (100, N'PAPAYA COMUN X 3 KG', 11, 2, 6450.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (101, N'PLATANO MADURO X 0.42 KG', 11, 2, 424.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (102, N'MARACUYA A GRANEL X 0.21 KG', 11, 2, 836.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (103, N'BROCOLI X 500 KG', 11, 2, 2145.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (104, N'VINO ESPUMOSO DEMI SEC', 1, 4, 35800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (105, N'VINO ESPUMOSO BRUT ROYAL', 1, 4, 54200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (106, N'VINOTINTO MALBEC BLACK LABEL', 1, 4, 53900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (107, N'VINOTINTO CABERN.SAUVIG.BLACK LABE', 1, 4, 57100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (108, N'VINOTINTO MALBEC PRIMOS', 1, 4, 203900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (109, N'CRISTALPISOS X 500 ML', 6, 2, 5834.9500, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (110, N'CRISTAL BABY FRESH X 960 ML', 6, 1, 3129.6550, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (111, N'INSECTICIDA AEROSOL PULGAS', 6, 3, 12200.3500, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (112, N'CRISTAL CANELA PINOLINA', 6, 1, 4423.9530, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (113, N'MÁXIMO BRILLO TODO COLOR MANSION', 6, 4, 31614.8200, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (114, N'BAYGON AEROSOL VERDE', 6, 3, 13568.9110, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (115, N'AJAX FRESCO LIMÓN', 6, 2, 5834.9500, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (116, N'TV LED 126 CM SMARTTV SAMSUNG', 13, 4, 1620408.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (117, N'TEATRO EN CASA 1000W RMS 3D LG', 13, 4, 799900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (118, N'BLU RAY BD-F6500 SAMSUNG', 13, 4, 349900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (119, N'PORTATIL TOUCH HEWLETT PACKARD', 13, 4, 125900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (120, N'MACBOOK AIR 11.6 128 GB FLASH APPLE', 13, 4, 1859000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (121, N'TABLET INTEL 7 8GB WIFI SIMPLY', 13, 4, 289520.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (122, N'BALÓN DE FUTBOL FIFA 2014', 18, 4, 49900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (123, N'SILBATO PROFESIONAL POWER SOUN ZENITH', 18, 3, 10200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (124, N'INFLADOR ASATEX', 18, 2, 9200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (125, N'PATINES ZOOM CHASIS ALUMINIO', 18, 4, 149900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (126, N'CASCO ZOOM BK AZUL TALLA M', 18, 4, 32200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (127, N'BICICLETA DE IRON MAN HUFFY', 18, 4, 299000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (128, N'TRI-WHEEL GREEN MACHINE HUFFY', 18, 4, 449000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (129, N'FLOTADOR EN FORMA DE DELFÍN', 18, 4, 22900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (130, N'POMO FACIAL MAQUILLAJE CREMOSO ZAFHIR S', 16, 3, 2030.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (131, N'POLVO CANELA ANGEL FACE', 16, 3, 2640.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (132, N'ESPEJO TOCADOR CUELLO PLATEADO', 16, 3, 11700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (133, N'DELIN OJOS BLACK VITU', 16, 3, 10960.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (134, N'ASEPXIA POLVO COMPACTO NATURAL', 16, 4, 21850.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (135, N'ESPEJO DOBLE FAZ DE AUMENTO', 16, 2, 5150.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (136, N'BON YOURT ZUCARITAS', 2, 3, 1890.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (137, N'BEBIDA DE SOYA VAINILLA SOYPLUS', 2, 2, 7270.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (138, N'POSTRE DE 3 LECHES MORA', 2, 1, 4500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (139, N'LECHE SEMIDESCREMADA COLANTA X 1LITRO', 2, 1, 2840.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (140, N'FERMEN FRESA BOLSA FINESSE X 1LITRO', 2, 2, 5400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (141, N'MARGARINA CULINARIA EXITO X250GR', 2, 1, 1490.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (142, N'QUESITO REDONDO EN BOLSA COLANTA X 400 GR', 2, 1, 4400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (143, N'SIXPACK REFRESCO TUTIFRUTI X 250 ML', 17, 2, 5650.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (144, N'ADES NARANJA 1LITRO', 17, 3, 4103.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (145, N'DEL VALLE FRESCO NARANJA X 500ML', 17, 1, 1450.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (146, N'HIT MORA PET 500 ML', 17, 1, 1760.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (147, N'REFRESCO NARANJA TAMPICO X 2LITROS', 17, 1, 4140.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (148, N'TÉ DHARAMSALA', 11, 4, 41400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (149, N'CERVEZA TIBETANA BARLEY', 1, 4, 43700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (150, N'SIROPE DE REGALIZ', 11, 4, 23000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (151, N'ESPECIAS CAJUN DEL CHEF ANTON', 11, 4, 50600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (152, N'MEZCLA GUMBO DEL CHEF ANTON', 11, 4, 49105.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (153, N'MERMELADA DE GROSELLAS DE LA ABUELA', 11, 4, 57500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (154, N'PERAS SECAS ORGÁNICAS DEL TÍO BOB', 11, 4, 69000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (155, N'SALSA DE ARÁNDANOS NORTHWOODS', 22, 4, 92000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (156, N'BUEY MISHI KOBE', 11, 4, 223100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (157, N'PEZ ESPADA', 11, 4, 71300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (158, N'QUESO CABRALES', 18, 4, 48300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (159, N'QUESO MANCHEGO LA PASTORA', 18, 4, 87400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (160, N'ALGAS KONBU', 11, 3, 13800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (161, N'CUAJADA DE JUDÍAS', 11, 4, 53475.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (162, N'SALSA DE SOJA BAJA EN SODIO', 22, 4, 35650.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (163, N'POSTRE DE MERENGUE PAVLOVA', 11, 4, 40135.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (164, N'CORDERO ALICE SPRINGS', 11, 4, 89700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (165, N'LANGOSTINOS TIGRE CARNARVON', 11, 4, 143750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (166, N'PASTAS DE TÉ DE CHOCOLATE', 11, 4, 21160.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (167, N'MERMELADA DE SIR RODNEYS', 11, 4, 186300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (168, N'BOLLOS DE SIR RODNEYS', 11, 4, 23000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (169, N'PAN DE CENTENO CRUJIENTE ESTILO GUSTAFS', 12, 4, 48300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (170, N'PAN FINO', 12, 4, 20700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (171, N'REFRESCO GUARANÁ FANTÁSTICA', 11, 3, 10350.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (172, N'CREMA DE CHOCOLATE Y NUECES NUNUCA', 11, 4, 32200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (173, N'OSITOS DE GOMA GUMBÄR', 11, 4, 71829.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (174, N'CHOCOLATE SCHOGGI', 11, 4, 100970.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (175, N'COL FERMENTADA RÖSSLE', 11, 4, 104880.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (176, N'SALCHICHA THÜRINGER', 11, 4, 284717.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (177, N'ARENQUE BLANCO DEL NOROESTE', 11, 4, 59547.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (178, N'QUESO GORGONZOLA TELINO', 18, 4, 28750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (179, N'QUESO MASCARPONE FABIOLI', 18, 4, 73600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (180, N'QUESO DE CABRA', 18, 2, 5750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (181, N'CERVEZA SASQUATCH', 1, 4, 32200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (182, N'CERVEZA NEGRA STEELEYE', 1, 4, 41400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (183, N'ESCABECHE DE ARENQUE', 11, 4, 43700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (184, N'SALMÓN AHUMADO GRAVAD', 11, 4, 59800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (185, N'VINO CÔTE DE BLAYE', 1, 4, 606050.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (186, N'LICOR VERDE CHARTREUSE', 1, 4, 41400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (187, N'CARNE DE CANGREJO DE BOSTON', 21, 4, 42320.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (188, N'CREMA DE ALMEJAS ESTILO NUEVA INGLATERRA', 11, 4, 22195.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (189, N'TALLARINES DE SINGAPUR', 11, 4, 32200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (190, N'CAFÉ DE MALASIA', 11, 4, 105800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (191, N'AZÚCAR NEGRA MALACCA', 11, 4, 44735.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (192, N'ARENQUE AHUMADO', 11, 4, 21850.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (193, N'ARENQUE SALADO', 11, 4, 27600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (194, N'GALLETAS ZAANSE', 11, 4, 21850.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (195, N'CHOCOLATE HOLANDÉS', 11, 4, 29325.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (196, N'REGALIZ', 11, 4, 46000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (197, N'CHOCOLATE BLANCO', 11, 4, 37375.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (198, N'MANZANAS SECAS MANJIMUP', 11, 4, 121900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (199, N'CEREALES PARA FILO', 11, 3, 16100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (200, N'EMPANADA DE CARNE', 21, 4, 75440.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (201, N'EMPANADA DE CERDO', 12, 3, 17135.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (202, N'PATÉ CHINO', 11, 4, 55200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (203, N'GNOCCHI DE LA ABUELA ALICIA', 11, 4, 87400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (204, N'RAVIOLIS ANGELO', 11, 4, 44850.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (205, N'CARACOLES DE BORGOÑA', 11, 4, 30475.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (206, N'RACLET DE QUESO COURDAVAULT', 18, 4, 126500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (207, N'CAMEMBERT PIERROT', 11, 4, 78200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (208, N'SIROPE DE ARCE', 11, 4, 65550.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (209, N'TARTA DE AZÚCAR', 11, 4, 113390.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (210, N'SANDWICH DE VEGETALES', 11, 4, 100970.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (211, N'BOLLOS DE PAN DE WIMMER', 12, 4, 76475.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (212, N'SALSA DE PIMIENTO PICANTE DE LUISIANA', 22, 4, 48415.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (213, N'ESPECIAS PICANTES DE LUISIANA', 11, 4, 39100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (214, N'CERVEZA LAUGHING LUMBERJACK', 1, 4, 32200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (215, N'BARRAS DE PAN DE ESCOCIA', 12, 4, 28750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (216, N'QUESO GUDBRANDSDALS', 18, 4, 82800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (217, N'CERVEZA OUTBACK', 1, 4, 34500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (218, N'CREMA DE QUESO FLØTEMYS', 18, 4, 49450.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (219, N'QUESO MOZZARELLA GIOVANNI', 18, 4, 80040.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (220, N'CAVIAR ROJO', 11, 4, 34500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (221, N'QUESO DE SOJA LONGLIFE', 18, 4, 23000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (222, N'CERVEZA KLOSTERBIER RHÖNBRÄU', 1, 3, 17825.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (223, N'LICOR CLOUDBERRY', 1, 4, 41400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (224, N'SALSA VERDE ORIGINAL FRANKFURTER', 22, 4, 29900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (229, N'AFTER SHAVE SENSITIVE FOR MEN NIVEA X 100 UN', 6, 2, 10300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (235, N'ANANA EN RODAJAS LIGHT CANALE X 825 KG', 11, 2, 8250.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (236, N'ANTIPOLILLAS SIN NAFTALINA AGENT X 10 UN', 9, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (237, N'ANTITRANSPIR TROPICAL ENERGY REXONA TEENS X 64 UN', 6, 2, 6592.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (239, N'APOSITOS POST PARTO PLENITUD X 10 UNI', 13, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (241, N'ARITOS DE CEREAL AVENA-MIEL 3 ARROYOS BOLSA X 180', 12, 2, 1800.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (243, N'ARROZ LARGO FINO 0000 LUCCHETTI X 500 KG', 12, 1, 5000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (244, N'ARVEJAS SECAS REMOJADAS NOEL X 300 GRS', 12, 1, 3000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (245, N'ASADO C/HUESO', 11, 2, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (247, N'BAÑO LIQUIDO CREMOSO JOHNSONS BABY X 200 UN', 14, 3, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (251, N'BONDIOLA DE CERDO', 11, 3, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (252, N'BRILLA METAL BRASSO X 504 UN', 5, 2, 5400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (255, N'CARNE PICADA COMUN', 11, 1, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (256, N'CARNE DE CERDO C/HUESO', 11, 1, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (258, N'CEPILLO DENTAL DOBLE ACCION ALCANCE 60M PROX1UNI', 6, 2, 1030.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (259, N'CERA CREMA P/MADERA COLOR NATURAL SUIZA X 8 UN', 5, 2, 8500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (260, N'CERA DEPILATORIA LATA MIEL MISS YLANG X 20 UN', 6, 2, 2060.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (263, N'CHINCHULINES', 11, 3, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (264, N'CHOCLO CREMOSO AMARILLO ARCOR LATA X 300 GRS', 10, 2, 3000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (265, N'CHULETA DE PALETA DE CERDO', 11, 2, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (273, N'CUERO DE CERDO', 11, 3, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (274, N'LIMPIADOR ANTIGRASA MANZ VERDE PROCENEX X 900 CC', 5, 3, 900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (296, N'AZUCAR BLANCA MOLIDA DOMINO X 1000 GRS', 18, 3, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (298, N'BIZCOCHUELO COCO EXQUISITA X 540 GRS', 18, 2, 5400.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (303, N'CACAO EN POLVO ARCOR BOLSA X 180 GRS', 16, 2, 1800.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (311, N'CEREAL MIX TROPICAL 3 ARROYOS BOLSA X 350 GRS', 16, 3, 3500.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (318, N'COLOR PERM CREMA T55 SOFT COLOR X 1 UNI', 15, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (319, N'COMINO MOLIDO LA PARMESANA SOBRE X 50 GRS', 16, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (321, N'COPOS DE CEREAL CHOCOLATADO CHOCAPIC CAJA X 250 GRS', 18, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (322, N'CREMA CORPORAL FREE TIME NIVEA BODYX 400 CC', 15, 2, 4000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (326, N'ACEITUNAS NEGRAS DOY PACK YOVINESSA X 180 UN', 16, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (375, N'ACEITE GIRASOL CANUELAS PET X 1.5 UN', 16, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (380, N'AGUA MINERAL SIN GAS BAJO SODIO SER X 1.5 UN', 1, 3, 1500.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (382, N'ALIM BASE JUGO/LECHE FRUTILLA JUNIOR SCHT X 1 UN', 2, 1, 1000.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (383, N'ALIMENTO BATIDO VAINILLA ETAPA 3 NESTUM X 200 UN', 2, 2, 2000.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (384, N'AMERICANO LUSERA X 950 UN', 2, 2, 9500.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (388, N'APERITIVO S/ALCOHOL BLANCO SIBSAYA X 1.5 UN', 4, 3, 1500.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (390, N'APRESTO P/ROPA DOY PACK KLARO X 500 UN', 2, 2, 500.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (412, N'CERVEZA BLANCA BIECKERT BOTELLA X 970 CC', 1, 2, 9700.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (427, N'ACELGA CORTADA LA BANDA LATA X 350 UN', 16, 2, 7750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (428, N'ACONDICIONADOR AVENA Y MIEL BABYBASIC X 400 UN', 15, 1, 4000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (431, N'AJI TRITURADO ALICANTE X 25 GRS', 16, 2, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (450, N'BODY MIST POMELO Y LIMON DOVE X 125 UN', 15, 3, 12500.0000, NULL, NULL, N'UN', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (454, N'CAFE INSTANTANEO LA VIRGINIA FRASCO X 100 GRS', 16, 1, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (457, N'CEBOLLA COMERCIAL BOLSITA', 16, 2, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (466, N'COBERTURA DE CHOCOLATE BLANCO GEORGALOS X 100 GRS', 18, 1, 1000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (467, N'COLONIA P/ BEBE S/ALC CITRUS JOHNSONS BABY X 10', 15, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (470, N'CONDIMENTO PIZZADOBO LA PARMESANA SOBRE X 25 GRS', 16, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (475, N'LECHE CONDENSADA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (476, N'CONCENTRADOS DE FRUTA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (477, N'LENTEJAS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (478, N'ARBEJITAS VERDES', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (479, N'GARBANZOS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (480, N'AZÚCAR MORENA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (481, N'LEVADURA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (482, N'VAINILLA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (483, N'COLORANTES ARTIFICIALES', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (484, N'FRUTAS GLASEADAS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (485, N'CHOCOLATE POLVO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (486, N'CEREALES', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (487, N'HELADO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (488, N'YOGURT FIRME', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (489, N'HARINA DE MAÍZ', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (490, N'AFRECHO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (491, N'AVENA HOJUELA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (492, N'PANQUECAS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (493, N'VINAGRE', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (494, N'VINO COCINAR', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (495, N'SALSA SOYA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (496, N'SALSA DE TOMATE', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (497, N'PASTA TOMATE', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (498, N'LICORES', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (499, N'QUESO CREMA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (500, N'BERENJENA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (501, N'CARNE MOLIDA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (502, N'CLORO X 1 LT', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (503, N'SAX X 1 KG', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (504, N'AJO EN POLVO X 1 KG', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (505, N'CEBOLLA EN POLVO X 1 KG', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (506, N'TOMILLO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (507, N'SALVIA, MEJORANA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (508, N'MOSTAZA', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (509, N'ALCAPARRAS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (510, N'ACEITUNAS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (511, N'CAFÉ EN POLVO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (512, N'TÉ NEGRO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (513, N'ORÉGANO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (514, N'MAIZ DORADO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (515, N'CONSOMÉ', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (516, N'CAÑAMO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (517, N'CARAOTAS NEGRAS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (518, N'JAMÓN ENDIABLADO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (523, N'ATÚN', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (524, N'SARDINAS', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (525, N'LECHE EN POLVO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (526, N'TOALLA HIGI TANGA X 30', 5, 2, 9400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (527, N'CEPILLO SANITARIO SIN BASE', 5, 2, 6930.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (528, N'DESINFEX BRISA NATURAL X 650ML', 5, 2, 9400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (529, N'AEROSOL BONAIRE CANELA X 400ML', 5, 2, 8500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (530, N'PAPEL H MAXIRROLLO X 4 ROLLOS', 5, 2, 6810.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (531, N'PANTY LISO CINTURA', 7, 2, 9682.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (532, N'PANTY BRASILERA NYLON LYCRA', 7, 3, 13287.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (533, N'BRASILERA PIERNAS ENCAJE', 7, 3, 14935.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (534, N'BRASSIER ESTAMPADO', 7, 4, 51500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (535, N'BRASSIER ESPALDA DEPORTIVA ETN', 7, 4, 39655.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (536, N'BIKINI ALG ELAST', 8, 2, 8500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (537, N'BOXER MD EST CON ELASTICO EXP', 8, 3, 11900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (538, N'BOXER AJUSTADO JAIDER', 8, 3, 18900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (539, N'TANGA ALGODÓN UNICOLOR', 8, 2, 8500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (540, N'CAMISILLA RIB ANCHO', 8, 3, 15500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (541, N'EQUIPO DE PRESIÓN 2 HP', 9, 4, 2132900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (542, N'BARNIZ ENCINA CLARO 5L EXTER', 9, 4, 197900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (543, N'TALADRO 1/2 PERCUTOR 550W 3000RPM', 9, 4, 89900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (544, N'CERRADURA ENTRADA MANIJA', 9, 4, 52900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (545, N'ESCALERA 20 PASOS EXTENSIÓN KD2-20', 9, 4, 514900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (546, N'MANGO DE AZUCAR SELECTO X 0.2KG', 10, 1, 1200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (547, N'ARVEJA DESGRANADA X 500G', 10, 2, 8310.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (548, N'MANDARINA ARRAYANA X 0.43KG', 10, 1, 1152.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (549, N'TOMATE CHONTO X 0.15KG', 10, 1, 237.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (550, N'AGUACATE HASS X 0.2KG', 10, 1, 716.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (551, N'PINCHO DE RES X 1.0KG', 11, 3, 15800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (552, N'MILANESA RES X 1.0KG', 11, 3, 14720.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (553, N'BIFE PARRILLERO X 1.0KG', 11, 3, 14000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (554, N'COSTILLA DE CERDO ECONOMICA X 1.0KG', 11, 2, 9400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (555, N'BRONQUISOL ADULTOS', 12, 2, 7890.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (556, N'ALKA SELTZER X 12 TABLETAS', 12, 2, 7490.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (557, N'TODAY HOT SENSATION X 3', 12, 2, 8180.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (558, N'ALGODON POMOS X 100G', 12, 2, 2490.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (559, N'FRIJOL NIMA X 500G', 13, 1, 2030.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (560, N'MAIZ PIRA X 500G', 13, 1, 2550.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (561, N'SABANERO BLANCO X 1000G', 13, 2, 6700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (573, N'WHISKY OLD PARR 12 X 1L', 4, 4, 90000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (574, N'VINO BLANCO CHATEAU DES ALOUETTES', 4, 4, 40400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (575, N'VODKA RED REINO UNIDO', 4, 4, 26100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (576, N'RON SANTA FE TETRA X 250ML', 4, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (584, N'VESTIDO CORTO', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (632, N'AGUA CIELO X 620 ML', 1, 2, 1575.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (633, N'RON MEDELLIN X 750 ML', 3, 4, 27524.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (634, N'SALCHICHON ZENU', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (635, N'FAB', 4, 2, 6570.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (636, N'DETERGENTE DERZA', 4, 2, 2550.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (639, N'ARROZ', 11, 1, 1550.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (640, N'PANELA VALLUNA', 11, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (641, N'COLGATE', 5, 1, 2300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (642, N'MAZANAS', 9, 1, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (643, N'PERAS', 9, 1, 900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (644, N'ASPIRINA EFERBECENTE', 12, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (645, N'ASPIRINA 100', 12, 1, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (646, N'ASPIRINA', 12, 2, 7550.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (647, N'LECHE COLANTA', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (648, N'LECHE MONTEFRIO', 1, 1, 1700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (649, N'LECHE RICURA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (650, N'QUESITO PEQUEÑO COLANTA', 1, 1, 1600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (651, N'CREMA DE LECHE', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (654, N'FAMILIA MEGARROLLO', 5, 1, 1600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (655, N'PROTEX', 5, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (656, N'CEDA DELTAL', 5, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (657, N'LLANTAS MICHELLLIN', 21, 4, 240000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (658, N'KID ASEO AUTOMIVILES', 21, 4, 30000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (659, N'CARNE DE CERDO X KG', 10, 3, 12500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (660, N'CARNE DE RES X KG', 10, 3, 16400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (661, N'CAJA DE CLAVOS ACERO', 8, 2, 7550.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (662, N'ARENA REBOQUE X LATA', 8, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (663, N'ARENA PEGA X LATA', 2, 1, 850.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (664, N'PDADORA', 19, 4, 6500000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (665, N'CARRO CONTROL REMOTO', 22, 4, 75000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (666, N'KID COMPLETO BOTIQUIN', 21, 4, 230000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (667, N'TALADRO BAUKER', 14, 4, 1200000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (668, N'CALADORA DEWALT', 14, 4, 1500000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (669, N'KID DE HERRAMIENTAS', 21, 4, 75000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (670, N'PASASINTA', 21, 4, 560000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (671, N'GPS', 21, 4, 70000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (672, N'TELEFONO INALAMBRICO', 17, 4, 75000.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (673, N'PINTUCO LABABLE', 18, 4, 75000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (674, N'PINTUCO EXTERIORES', 18, 4, 96000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (675, N'JARRON PORSELANA', 20, 4, 340000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (676, N'ALCOBA COMPLETA MATRIMONIAL', 17, 4, 7254500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (677, N'SALA COMPLETA CON TODO INCLUIDO', 17, 4, 8230000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (678, N'COCA COLA X 350 ML', 1, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (679, N'LECHE COLANTA X 350 ML', 2, 3, 20000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (680, N'SALCHICON ZENU X 500 GR', 3, 4, 32000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (681, N'AGUARDIENTE ANTIOQUEÑO X 450 ML', 4, 4, 250000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (682, N'RON MEDELLIN X 2540 ML', 4, 4, 300000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (683, N'BOCKA X 350 ML', 4, 4, 350000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (684, N'JEANS FEMENINOS', 6, 3, 15450.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (685, N'CAMISA ESTRAPLE', 6, 4, 25750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (686, N'FALDA CORTA', 6, 4, 154500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (687, N'FALDA LARGA', 6, 4, 30900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (688, N'CERVEZA ENLATADA', 3, 4, 250000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (689, N'CREMA DE FRESAS', 7, 4, 30900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (690, N'CHAQUETA DE DAMA', 7, 4, 463500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (691, N'JEANS DE HOMBRE', 6, 4, 566500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (692, N'CAMISAS', 2, 4, 320000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (694, N'CAMISILLAS', 7, 3, 15450.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (695, N'CAMIBUSOS DE HOMBRE', 7, 4, 133900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (696, N'CAMIBUSOS DE MUJER', 6, 4, 257500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (697, N'SACOS', 9, 4, 520000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (698, N'HOBEROLES', 2, 4, 850000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (699, N'FALDAS', 9, 4, 650000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (700, N'VESTIDOS', 9, 4, 750000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (701, N'JEANS', 9, 4, 320000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (702, N'CORBATAS', 7, 4, 226600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (704, N'CAMISAS MANGA LARGA', 8, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (705, N'JEANS PARA NIÑAS', 9, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (706, N'SHORT', 9, 4, 85000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (707, N'SHORT PARA DAMA', 6, 4, 329600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (708, N'MOCHOS', 8, 4, 150000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (709, N'VESTIDOS DE DAMA', 6, 4, 154500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (710, N'BOXER', 11, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (711, N'BRAZIER', 10, 4, 150000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (712, N'CUCOS', 13, 4, 120000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (713, N'BOXER NIÑOS', 12, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (714, N'CACHETEROS NIÑAS', 13, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (715, N'TOPS', 13, 4, 120000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (716, N'BRAZIER NIÑAS', 13, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (717, N'TRIQUINIS', 14, 4, 350000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (720, N'QUESITO * 1/4 KG', 1, 1, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (721, N'ARROZ * 5KG', 3, 1, 1700.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (722, N'PAPAS * 2KG', 3, 1, 2500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (723, N'PANELA * 1/2 KG', 3, 1, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (724, N'AGUACATE * UN', 11, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (725, N'LULO * 1KG', 11, 1, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (726, N'MANGO * 1KG', 11, 1, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (727, N'PAPEL HIGIENICO * UN', 19, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (728, N'JABON DE BAÑO * UN', 18, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (729, N'LAVALOZA * UN', 19, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (730, N'MAQUINA DE AFEITAR * UN', 18, 1, 2800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (731, N'SALCHICHA RANCHERA X 25 * UN', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (732, N'CHOCOLATE * UN', 3, 1, 2800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (733, N'AZUCAR * 1KG', 3, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (734, N'SAL * UN', 3, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (735, N'PAQUETE LENTEJAS * 1KG', 3, 1, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (736, N'PAQUETE FRIJOLES * 1KG', 3, 1, 2300.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (737, N'SALCHICHON * UN', 6, 1, 2678.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (740, N'MORTADELA ZENU X 30 * UN', 6, 1, 4635.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (741, N'SEDA DENTAL * UN', 18, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (742, N'CEPILLO DE DIENTES * UN', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (743, N'CREMA PARA AFEITAR * UN', 18, 3, 18000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (744, N'DETERGENTE * 5KG', 19, 2, 8200.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (745, N'TOALLAS HIGIENICAS * UN', 18, 1, 4000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (746, N'PAQUETE MILO * UN', 13, 3, 13000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (747, N'PAN  * UN', 13, 1, 2800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (748, N'ESCOBAS * UN', 19, 1, 4500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (749, N'TRAPEADORA * UN', 19, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (753, N'EQUIPO DE SONIDO * UN', 15, 1, 1.1000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (754, N'TELEVISOR DE 42 PULGADAS * UN', 15, 1, 1.2000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (755, N'LICUADORA * UN', 15, 4, 90000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (756, N'MICROONDAS * UN', 15, 4, 300000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (757, N'CAMISA HOMBRE * UN', 21, 4, 21000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (758, N'CACHETEROS * UN', 21, 2, 5800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (759, N'TENIS NIKE * UN', 21, 1, 220.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (760, N'ACETAMINOFEN * UN', 20, 1, 300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (761, N'OMEPRAZOL * UN', 20, 1, 600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (762, N'CONDONES * UN', 20, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (763, N'SAL DE FRUTAS LUA * UN', 20, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (764, N'DOG CHOW * 2KG', 9, 2, 7500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (765, N'ALPISTE * 1KG', 9, 1, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (766, N'CAT CHOW * 2KG', 9, 2, 8000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (767, N'PEDI GREE *', 9, 2, 9000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (768, N'YOGURT * 1LT', 1, 1, 2000.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (769, N'LECHE * 1LT', 1, 1, 2000.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (788, N'VINO CHILENO * LT', 4, 4, 25000.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (789, N'VINO ARGENTINO * LT', 4, 4, 24000.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (800, N'COCA COLA * 1.5 LT', 12, 1, 2200.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (801, N'COCA COLA * 2.5 LT', 12, 1, 2000.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (802, N'JUGO DEL VALLE * 2.0 LT', 12, 1, 3500.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (821, N'CHOCOLATINA JET', 6, 4, 515.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (822, N'DULCE ROSADO', 6, 2, 206.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (823, N'MENTA', 6, 2, 103.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (824, N'HERSHEY', 6, 4, 2060.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (825, N'CHOCOLATINA BLANCA', 6, 2, 2060.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (826, N'MONT BLACK', 6, 2, 3090.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (827, N'ALMENDRAS', 6, 2, 1030.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (842, N'PERA', 8, 3, 1000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (843, N'MANZANA', 8, 2, 1000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (846, N'VASOS DESECHABLES', 7, 2, 2575.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (847, N'CUCHARAS DESECHABLES', 7, 2, 2060.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (848, N'TENEDORES DESECHABLES', 7, 2, 1648.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (849, N'SERVILLETAS', 7, 3, 1236.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (851, N'FRIJOLES', 4, 2, 1000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (854, N'PEPINO', 22, 2, 500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (855, N'LECHUGA', 22, 4, 200.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (856, N'MORTADELA DAN', 5, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (857, N'JAMON  DAN', 5, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (858, N'FANTA', 1, 2, 1300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (859, N'CHOCOLATINA JUMBO', 6, 2, 2060.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (860, N'CONFIDELAY', 6, 2, 103.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (861, N'CHICLE ADAMS', 6, 2, 103.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (862, N'BOMBOM BUM', 6, 3, 309.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (863, N'BRASILERA DAMA', 10, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (864, N'CAMISA DAMA', 12, 4, 25000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (865, N'CAMISETA HOMBRE', 13, 4, 30000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (866, N'BRASIEL DAMA', 10, 3, 15000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (867, N'TOP DAMA', 10, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (868, N'PANTALON NIÑO', 8, 4, 30000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (871, N'RED BULL', 11, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (872, N'REDS', 11, 3, 1700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (873, N'CARVEZA AGUILA LIGHT', 11, 2, 1700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (881, N'LIMPIA VIDRIO', 19, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (882, N'AXION', 19, 2, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (883, N'LOZA CREM', 19, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (885, N'LIMPIA PISO', 19, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (886, N'JABON COCO', 19, 2, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (888, N'AROMATEL', 19, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (890, N'INALADOR SALBUTAMOL', 12, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (891, N'VERAPAMILO', 12, 4, 3200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (892, N'ENALAPRIL', 12, 2, 4500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (893, N'JARABE DE ROBITUSIN', 12, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (894, N'DULCOLAX', 12, 4, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (897, N'JABON FAB', 19, 2, 6000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (898, N'FABULOSO', 19, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (903, N'LIMPIDO', 19, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (922, N'TEKILA', 11, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (923, N'OLD PAR', 11, 4, 100000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1024, N'CERVEZA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1025, N'SALCHICHON', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1026, N'PAN', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1027, N'LECHE', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1029, N'AGUCATE', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1030, N'PANELA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1031, N'ACEITE', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1032, N'PAPEL', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1033, N'CELULARES', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1034, N'COMPUTADORES', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1035, N'TELEVISORES', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1036, N'TABLET', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1037, N'ZAPATOS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1038, N'CAMISA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1039, N'PAPAYA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1040, N'MANDARINA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1041, N'GORRAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1042, N'GAFAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1044, N'PAÑALES', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1045, N'MELÓN', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1046, N'UVAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1047, N'SANDIA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1048, N'SALSAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1049, N'HUEVOS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1050, N'KESO', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1051, N'GRANADILLA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1052, N'MAGUI', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1053, N'ESCOBA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1054, N'TRAPEADORA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1055, N'GALLETAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1057, N'MANI', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1058, N'GELATINA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1059, N'COLELINO', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1060, N'GOMINA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1061, N'CAFE', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1062, N'TOMATE', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1063, N'CEVOLLA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1064, N'MASAMORRA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1066, N'CORREA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1067, N'ESPEJO', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1068, N'MEDIAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1069, N'CHANCLAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1070, N'PANTALON', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1071, N'CHAQUETAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1072, N'PIMENTON', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1073, N'PLATOS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1124, N'MANCUERNAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1125, N'CAMINADORA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1126, N'BICICLETA ESTATICA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1127, N'CHAMPU', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1130, N'BANDAS ELASTICAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1131, N'BICICLETA DE RUTA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1132, N'BICICLETA ELICTICA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1139, N'COLCHONETAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1141, N'BANCOS ABDOMINALES', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1142, N'TRIGO', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1145, N'ROPA DEPORTIVA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1146, N'MUSICA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1147, N'SUPLEMENTOS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1148, N'CUADERNSO', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1150, N'LIBROS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1152, N'BANCO OLIMPICO', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1153, N'CONSOLA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1157, N'MULTI GIMNASIO', 1, 1, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1160, N'CAJA DE SIGARRILLOS', 1, 1, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1164, N'TOCINETA COLANTA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1166, N'CAMAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1167, N'ADORNOS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1170, N'FILETEADORA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1171, N'RUEDA  CIRCULAR', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1172, N'MANTELES', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1173, N'CUBIERTOS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1174, N'TENIS NIKE AIR', 4, 1, 210.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1175, N'ENDULZANTE ALDY ORIGINAL X 100 SOBRES', 15, 4, 562450.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1176, N'ENDULZANTE FRUCTEVIA X 200G.', 15, 4, 563556.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1177, N'ENDULZANTE ALDY STEVIA X 200 GRAMOS', 15, 4, 452012.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1178, N'ENDULZANTE ALDY STEVIA X 70 SOBRES', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1179, N'ENDULZANTE ALDY SUCRALOSA X 200 GRAMOS', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1180, N'ENDULZANTE ALDY ORIGINAL X 200 GRAMOS', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1181, N'ENDULZANTE ALDY SACARINA X 70 SOBRES', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1182, N'ENDULZANTE ALDY ORIGINAL X 70 SOBRES', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1183, N'ENDULZANTE ALDY SUCRALOSA X 70 SOBRES', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1184, N'FRUCTOSA FRUKTA X 250 GRAMOS', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1185, N'FRUCTOSA PURA FRUKTA X 450 GRAMOS', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1186, N'AZUCAR MANUELITA LIGHT X 454G - COD. 683332', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1187, N'ENDULZANTE EN POLVO SPLENDA BOL X 275 GR', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1188, N'STEVIA EL ENDULZANTE NATURAL', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1189, N'VENDULZANTE SPLENDA CAJAS X 200 SOBRES 200 G', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1191, N'DETERGENTE LÍQUIDO', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1192, N'DETERGENTE LÍQUIDO ROPA BLANCA', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1193, N'DETERGENTE LÍQUIDO ROPA NEGRA', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1194, N'DETERGENTE LÍQUIDO HIPOALERGÉNICO BEBÉ', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1195, N'ABLANDADOR', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1196, N'LAVALOZA CONCENTRADO', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1197, N'LIMPIADOR LÍQUIDO MULTIUSO R Y R', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1198, N'ELIMPIADOR LÍQUIDO MULTIUSO POETT', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1199, N'BOLSAS BASURA 50 X 70 (CHICAS)', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1200, N'BOLSAS BASURA 70 X 90 (MEDIANAS)', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1201, N'BOLSAS BASURA 80 X 110 (GRANDES)', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1202, N'CLORO GEL IGENIX VIRGINIA', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1203, N'CLORO GEL R Y R', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1204, N'ANTIGRASA', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1205, N'EXFOLIANTE PARA CARA Y CUERPO ANTI-AGING BUFFING BEADS', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1206, N'SUERO REPARADOR REPAIRWEAR LASER FOCUS WRINKLE & UV DAMAGE CORRECTOR', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1207, N'ACTIVE NATURALS POSITIVELY NOURISHING HYDRATING BODY WASHO', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1208, N'JABÓN LÍQUIDO TOUCH OF HAPPINESS MOISTURIZING BODY WASH', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1209, N'CHAMPÚ MOISTURE RECOVERY SHAMPOO', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1210, N'MOUSSE BIOLAGE STYLING VOLUMIZING WHIPPED MOUSSE', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1211, N'MASCARILLA SUAVIZANTE SUPERBLY SMOOTHING ARGAN HAIR PAK', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1212, N'SUERO PARA ALISAR SUPER SKINNY SERUM', 15, 4, 80000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1225, N'BANANO', 8, 2, 1200.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1226, N'NARANJA', 8, 2, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1229, N'KIWI', 8, 2, 4500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1231, N'PIÑA', 8, 2, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1232, N'CURUBA', 8, 2, 1800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1233, N'DURAZNO', 8, 2, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1234, N'LIMON', 8, 2, 1000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1235, N'AGUACATE', 8, 2, 1200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1236, N'COCO', 8, 2, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1237, N'TOMATE DE ARBOL', 8, 2, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1239, N'LULO', 8, 2, 1600.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1240, N'UVA', 8, 2, 3000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1241, N'UCHUVA', 8, 2, 1800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1242, N'CIRUELA', 8, 2, 1800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1244, N'GUAYABA', 8, 2, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1246, N'FRESA', 8, 2, 3200.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1247, N'MORA', 8, 2, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1248, N'BOROJO', 8, 2, 2900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1251, N'MARACUYA', 8, 2, 2000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1252, N'TAMARINDO', 8, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1253, N'MANGO', 8, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1255, N'APIO', 8, 2, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1256, N'YUCA', 8, 2, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1259, N'REPOLLO', 8, 2, 1700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1260, N'ESPINACA', 8, 2, 1200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1261, N'ARVEJA', 8, 2, 4000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1262, N'BROCOLI', 8, 2, 3200.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1263, N'CEBOLLA', 8, 2, 1200.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1264, N'HABICHUELA', 8, 2, 1400.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1265, N'GUINEO', 8, 2, 300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1266, N'ZANAHORIA', 8, 2, 1500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1267, N'ARRACACHA', 8, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1268, N'PLATANO VERDE', 8, 2, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1269, N'PLATANO MADURO', 8, 2, 400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1270, N'AHUYAMA', 8, 2, 800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1271, N'CEBOLLA JUNCA', 8, 2, 1000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1272, N'CHAMPINON', 8, 2, 2800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1273, N'CEBOLLA ROJA', 8, 2, 1300.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1274, N'LECHUGA MORADA', 8, 2, 2300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1282, N'FRESAS', 11, 3, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1283, N'FRAMBUESA', 11, 2, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1284, N'CERESAS', 11, 3, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1287, N'MELOCOTON', 11, 1, 750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1289, N'MELON', 11, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1290, N'GROSELLA NEGRA', 11, 3, 750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1291, N'GROSELLA ROJA', 11, 3, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1292, N'POMELO', 11, 1, 1420.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1293, N'ALMENDRA', 11, 2, 1050.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1297, N'CEBOLLA DE RAMA', 11, 3, 300.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1301, N'AJO', 11, 3, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1302, N'COL', 11, 3, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1304, N'TOMATES RAF', 11, 3, 269.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1305, N'REMOLACHA', 11, 1, 982.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1307, N'PATATA', 11, 1, 750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1308, N'NABOS', 11, 1, 350.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1310, N'HABAS', 11, 3, 900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1311, N'GUISANTES', 11, 3, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1312, N'GRELOS', 11, 1, 1420.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1313, N'ESPÁRRAGOS', 11, 2, 1050.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1314, N'ESCAROLA', 11, 2, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1315, N'ENDIBIAS', 11, 3, 750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1316, N'CHIRIVÍA', 11, 2, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1317, N'CANÓNIGOS', 11, 1, 750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1318, N'CALABAZA', 11, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1319, N'CALABACÍN', 11, 1, 1700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1320, N'BONIATO', 11, 3, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1321, N'BERROS', 11, 3, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1323, N'ALFALFA', 11, 2, 1050.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1324, N'ALCACHOFA', 11, 2, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1372, N'SALCHICON ZENU', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1374, N'LECHE CON SABOR A CHOCOLATE', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1375, N'LECHE CON SABOR A FRESA', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1376, N'QUESO MOZZARELLA', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1377, N'QUESO SUIZO', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1378, N'REQUESON', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1379, N'YOGUR', 2, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1381, N'MNTEQUILLA', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1382, N'NATA', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1383, N'CARNE DE AVE', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1384, N'JAMON', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1385, N'CARNE DE RES', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1386, N'CARNE DE CERDO', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1387, N'MARTILLO', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1389, N'TANGAS', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1390, N'BAFLES', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1391, N'TV', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1392, N'TELEFONO', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1393, N'COMPUTADOR', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1394, N'PALA', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1399, N'RON AÑEJO', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1400, N'WISKI', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1405, N'JABON DE BAÑO', 1, 2, 6100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1407, N'PANTALONETAS', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1408, N'CORREAS', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1410, N'AGUARDIENTE', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1411, N'CHICHARRON', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1412, N'CELURARES', 2, 2, 7800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1413, N'PAPEL HIJIENICO', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1414, N'PAÑALES MEDIANOS', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1415, N'DETERGENTE', 2, 2, 5800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1416, N'CEPILLO DE DIENTES', 2, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1417, N'DESODORANTE', 1, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1419, N'LISTERINE', 1, 1, 4500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1420, N'AZUCAR', 2, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1471, N'ROSAS BLANCAS NATURALES', 2, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1472, N'CEBOLLA CABEZONA', 9, 2, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1473, N'FRIJOL VERDE', 9, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1475, N'CHOCOLA MAZORCA', 9, 1, 230.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1476, N'TOMATE CHONTO', 9, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1477, N'TOMATE RIÑON', 9, 1, 900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1480, N'BANANO CRIOLLO', 9, 1, 400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1482, N'CARNE ESPECIAL', 4, 2, 7500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1483, N'CARNE LLAMA', 4, 2, 7000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1485, N'CARNE DE POLLO', 4, 1, 3600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1487, N'CARNE MUCHACHO', 4, 2, 6000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1488, N'CARNE ENTRE PIERNA', 4, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1489, N'MUSLOS', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1490, N'LOMO VETADO', 4, 2, 5400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1491, N'PAN DULCE', 1, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1492, N'ANTOJITOS ANTIOQUEÑOS', 1, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1493, N'DONAS', 1, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1494, N'ROSCAS', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1495, N'TORTA ENVINADA', 1, 2, 6000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1496, N'TORTA DECORADADA', 1, 2, 9000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1497, N'TORTA DE DOS PISOS', 1, 1, 2900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1498, N'PASTEL DE CEREZA', 1, 3, 20000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1499, N'PASTEL DE FRESA', 1, 4, 31000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1500, N'PAN DE QUESO', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1501, N'PAN SANDWICH', 1, 1, 2600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1502, N'HAMBURGUESA', 1, 1, 4000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1503, N'PERRO CALIENTE', 1, 1, 2700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1504, N'BANQUETE', 1, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1505, N'PIÑITA', 1, 1, 2300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1506, N'CANILLA', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1507, N'PAN DE JAMÓN', 1, 1, 2400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1508, N'PASTELE SALADO', 1, 1, 3800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1509, N'EMPANADA', 1, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1510, N'BUÑUELO', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1511, N'BALON DE WATERPOLO', 3, 2, 9000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1512, N'JUEGO DE MESA', 3, 3, 12000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1513, N'PATINETA', 3, 3, 20000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1514, N'MONOPATIN', 3, 4, 30000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1515, N'RAQUETAS', 3, 2, 8000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1516, N'TROMPO', 3, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1517, N'PELOTA DE PLAYA', 3, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1518, N'MOTO DE NIÑO', 3, 4, 60000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1519, N'BICICLETA DE NIÑA', 3, 4, 102000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1520, N'CASA DE BARBIE', 3, 4, 21000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1521, N'MORCILLA', 1, 2, 2000.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1523, N'CHOCOLATE', 1, 2, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1524, N'MILO', 1, 2, 7500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1529, N'ACONDICIONADOR', 1, 3, 15000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1530, N'SHAMPOO', 1, 3, 20000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1536, N'GUANABANA', 1, 2, 1550.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1538, N'CRISPETAS', 1, 2, 1200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1539, N'TIPITIN', 1, 2, 2000.0000, NULL, NULL, N'UN', 50)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1540, N'PALETA DE SANDIA', 1, 2, 3500.0000, NULL, NULL, N'UN', 20)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1541, N'JOLLY RANGER', 1, 2, 8950.0000, NULL, NULL, N'UN', 30)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1542, N'FOSFOROS', 1, 2, 1550.0000, NULL, NULL, N'UN', 10)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1543, N'GALLETAS WAFER', 1, 2, 3000.0000, NULL, NULL, N'UN', 18)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1544, N'BONICE', 1, 2, 4450.0000, NULL, NULL, N'UN', 12)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1545, N'BALACA', 1, 2, 5000.0000, NULL, NULL, N'UN', 6)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1546, N'BOLIS', 1, 2, 3550.0000, NULL, NULL, N'UN', 50)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1547, N'MORITAS', 1, 2, 1000.0000, NULL, NULL, N'UN', 40)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1548, N'OBLEAS', 1, 2, 20.0000, NULL, NULL, N'UN', 16)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1549, N'ACEITE DE COCINA', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1553, N'GALLETA RELLENA', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1554, N'GALLETAS NOEL', 2, 1, 3800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1555, N'SAL', 1, 1, 500.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1557, N'LECHE KLIM', 3, 1, 2800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1558, N'PASTAS DORIA', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1559, N'TÉ', 1, 1, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1560, N'HARINA', 2, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1562, N'HIELO', 3, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1563, N'SALSA TOMATE', 1, 1, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1564, N'SALSA MAYONESA', 1, 1, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1565, N'SALSA ROSADA', 1, 1, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1566, N'AJI TRITURADO ALICANTE', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1567, N'DURASNO', 1, 1, 800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1568, N'QUESO', 1, 1, 4000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1569, N'FIDEOS', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1570, N'CAMARONES', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1573, N'VANANO', 1, 1, 250.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1574, N'VINO', 1, 2, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1576, N'BEBIDA ENERGISANTE', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1577, N'PRESTO BARBA', 1, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1578, N'CREMA DENTAL', 1, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1579, N'PAPEL HIGIENICO', 1, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1580, N'CEPILLO DENTAL', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1581, N'VACARDI', 1, 3, 12000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1582, N'NUVO', 1, 4, 50000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1583, N'JABON ANTIVACTERIAL', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1591, N'NATI PAN', 1, 1, 2800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1592, N'PIPIOLO', 1, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1593, N'PAPAS MARGARITAS', 1, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1594, N'PAPA', 1, 1, 1200.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1595, N'PAÑITOS HUMEDOS', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1596, N'TAMPICO', 1, 4, 30000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1665, N'PAPEL HIGIENICO SCOT', 9, 2, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1668, N'JABON FAB ARIEL', 9, 2, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1670, N'CACHETERO DE NIÑA', 9, 2, 8000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1745, N'PAPAS', 20, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1749, N'CILANTRO', 9, 2, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1750, N'PLATANOS', 5, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1751, N'JABÓN', 3, 2, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1752, N'CONDONES', 1, 2, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1755, N'PAPEL FAMILIA', 4, 3, 15000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1756, N'MANILLAS', 4, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1759, N'CHOCOLATE CORONA', 19, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1760, N'CHOCOLISTO', 12, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1763, N'COLOMBIANA', 13, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1764, N'SEVEN UP', 6, 2, 5150.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1765, N'PONY MALTA', 4, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1766, N'MISTER TE', 7, 1, 5150.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1767, N'SUNTEA', 6, 1, 5150.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1768, N'FUNZE TEA', 5, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1769, N'BOM BOM BUM', 2, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1770, N'GANSITO', 3, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1771, N'CHOCORRAMO', 4, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1772, N'GALA', 1, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1773, N'BONYURT', 6, 1, 5150.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1777, N'MANTEQUILLA LA FINA', 4, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1778, N'AJI', 7, 1, 5150.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1780, N'MAYONESA', 6, 1, 5150.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1781, N'SALSA DE PIÑA', 4, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1782, N'AREQUIPE', 5, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1783, N'LECHERA', 4, 1, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1784, N'SALSA TARTARA', 9, 2, 5000.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1785, N'CHOCO CRISPIS', 4, 2, 5300.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1786, N'TROCIPOLLO', 4, 2, 5300.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1787, N'ATÚNLAESPANOLA', 4, 2, 5300.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1788, N'HUEVOCODORNÍZ', 4, 2, 5300.0000, NULL, NULL, N'UN', 32)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1789, N'PAR DE TENIS NIKE AIR', 4, 1, 210.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1790, N'PAR DE TENIS ADIDAS F50', 4, 2, 190.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1791, N'PAR DE TENIS REEBOK CLASIC', 4, 3, 215.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1792, N'PAR DE TENIS OAKLEY', 4, 1, 310.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1793, N'CEPILLO DE DIENTES PRO', 5, 1, 2300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1794, N'CEDA DENTAL', 5, 2, 3500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1795, N'DESODRANTE REXONA', 5, 3, 4800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1796, N'TALCO', 5, 3, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1797, N'PAPEL HIGIENICO FAMILIA', 6, 1, 2369.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1798, N'LIMPIDO COLOR', 6, 2, 4017.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1799, N'JABON DE COCINA', 6, 3, 4738.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1801, N'CAMISA POLO NEGRA', 7, 3, 154.5000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1802, N'CAMISETA FOX', 7, 2, 61.8000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1803, N'JEAN DIESEL', 7, 3, 103.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1804, N'BUZO NIKE', 7, 3, 216.3000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1805, N'LICUADORA SAMURAI', 8, 1, 120.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1806, N'MANGUERA EXPANDIBLE 15 METROS', 8, 2, 89.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1807, N'OLLA ARROCERA OSTER', 8, 3, 90.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1808, N'SARTEN EN ZAFIRO STONE', 8, 3, 190.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1809, N'XBOX 360 ONE', 9, 3, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1810, N'TELEVISOR LED 3D LG', 9, 3, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1811, N'EQUIPO DE SONIDO CON MEZCLADOR', 9, 2, 1200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1812, N'PORTATIL HP 1000-1423LA COLOR GRIS PLATA', 9, 1, 880.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1813, N'MULTIFUERZA', 10, 3, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1814, N'GYMBALL', 10, 1, 30.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1815, N'MAMCUERNAS', 10, 2, 60.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1816, N'DISCOS PARA PESAS', 10, 1, 20.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1817, N'ABDOMINALES FIT MINUTE', 10, 3, 360.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1818, N'BALON BRAZUCA', 11, 3, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1819, N'CAMISE DE ATLETICO NACIONAL', 11, 3, 210.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1820, N'BATE DE BEISBOL', 11, 2, 90.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1821, N'RAQUETA PROFECIONAL', 11, 3, 350.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1822, N'GUISCAS', 12, 1, 30.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1823, N'DOGSHOW', 12, 2, 20.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1824, N'PURINA DOGSHOW', 12, 3, 15.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1825, N'NUTRICAN', 12, 3, 10.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1827, N'MANGOS', 13, 2, 8000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1829, N'BANANOS', 13, 2, 4000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1830, N'PAN FRANCES', 14, 2, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1831, N'PAN PIZZA', 14, 3, 12000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1832, N'PAN SALCHICHA', 14, 3, 12000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1833, N'PASTEL DE AREQUIPE', 14, 3, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1834, N'CRALLOLAS', 15, 3, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1835, N'LIBRO PARA COLOREAR', 15, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1837, N'CHUPA', 15, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1838, N'GOMITAS TRLULU', 16, 1, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1840, N'BARRILETES', 16, 2, 150.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1841, N'CHOCOLATINAS', 16, 3, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1842, N'DOLEX FORTE', 17, 3, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1843, N'CAMIDOL', 17, 2, 1300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1845, N'LOSARTAN', 17, 1, 4000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1846, N'SACHICHAS RANCHERAS', 18, 2, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1847, N'CHORIZOS DE TERNERA', 18, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1849, N'LONGANIZA ZENU', 18, 3, 3500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1850, N'CAFE CON LECHE', 19, 1, 250.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1851, N'EMPANADAS', 19, 2, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1852, N'BUÑUELOS', 19, 3, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1853, N'PASTEL DE POLLO', 19, 3, 1200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1854, N'TALADRO', 20, 3, 90.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1855, N'ALICATE', 20, 2, 10.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1856, N'CERRUCHO', 20, 1, 30.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1857, N'MACHETE', 20, 3, 20.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1858, N'JUGUETES SEXUALES PARA HOMBRE', 21, 1, 22.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1859, N'JUGUETES SEXUALES PARA MUJER', 21, 2, 24.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1860, N'PELICULAS XXX', 21, 1, 10.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1861, N'DISFRAZES', 21, 3, 30.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1862, N'COCA COLA X 620 ML', 1, 2, 1575.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1863, N'RON DE CALDAS X 750 ML', 4, 4, 27000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1864, N'PAN DELI', 5, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1867, N'VOLT', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1868, N'RETBULL', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1875, N'FRUNAS', 12, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1878, N'LECHERITA', 1, 1, 1510.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1879, N'LINAZA', 7, 3, 1545.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1880, N'QUESO COSTEÑO', 2, 1, 1600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1881, N'CREMA DE DIENTE', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1882, N'SON TE', 7, 2, 515.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1883, N'NEZTLIN', 1, 2, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1884, N'POPULAR', 1, 3, 1600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1885, N'NECO', 2, 3, 15000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1886, N'ACEPCIA', 5, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1887, N'BLU JEAN', 1, 4, 240000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1888, N'ASE HOGAR', 11, 4, 30000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1889, N'CARNES FRIAS X KG', 10, 4, 22570.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1893, N'CAJA DE CERVEZA', 2, 4, 60000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1894, N'RELOJ', 1, 4, 6500000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1895, N'CAMISA MASCULINA', 2, 4, 75000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1896, N'KID ESCOLAR', 10, 4, 230000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1897, N'TENNI NIKE', 1, 4, 1200000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1898, N'BOLSO TOTTO', 1, 4, 150000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1900, N'BLUSA FEMENINA', 3, 4, 560000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1901, N'CELULAR SAMSUM', 1, 4, 700000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1903, N'TELEVISOR LG', 1, 4, 2500000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1905, N'EQUIPO DE SONIDO', 1, 4, 3400000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1906, N'MUEBLE EN L', 1, 4, 725500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1907, N'VENTILADOR', 1, 4, 230000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1909, N'RAQUETE DE PAPITAS MARGARITAS', 11, 3, 380.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1910, N'ROLLOS DE AZUCAR', 7, 1, 515.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1911, N'PALITOS DE QUESO', 7, 1, 206.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1912, N'PANZEROTI', 7, 1, 2060.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1913, N'BALON DE FUTBOLL TANGO', 6, 4, 25750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1914, N'GUAYOS NIKE', 6, 4, 30900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1915, N'ACONDICIONADOR SEDAL', 3, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1916, N'SHAMPOO SEDAL', 3, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1917, N'JABON PALMOLIVE', 3, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1922, N'EQUIPO DE SONIDO LG', 10, 4, 300000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1923, N'TELEVISOR PLASMA LG', 10, 4, 200000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1924, N'COMPUTADOR DELL', 10, 1, 2.5000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1925, N'AGUA H2O', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1926, N'VAJILLA DE PORCELANA', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1927, N'AZUCAR RIO CAUCA', 2, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1928, N'LECHE DESLACTOSADA ALQUERIA', 5, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1929, N'CAFE INSTANTANEO', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1930, N'ARROZ DIANA', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1931, N'BLUSA DE DAMA TALLA S', 8, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1932, N'PNATALON DE HOMBRE', 9, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1933, N'GASEOSA COLOMBIANA', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1934, N'MANTEQUILLA COLANTA', 5, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1935, N'HARINA DE TRIGO', 4, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1936, N'PANELA CAUCA', 1, 1, 1100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1937, N'SALSA DE TOMATE FRUKO', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1938, N'CREMA DENTAL FORTIDENT', 3, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1939, N'TOALLAS FEMENINAS NOSOTRAS', 3, 1, 4000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1940, N'ATUN CARIBE', 4, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1941, N'MERMELADA DE FRESA', 1, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1942, N'FRUTIÑO MARACUYÀ', 4, 1, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1943, N'DETERGENTE OMO', 3, 2, 6000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1945, N'YOGURT ALPINA', 5, 1, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1946, N'ACETAMINOFEN 500', 12, 1, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1947, N'CERVEZA REDDS', 9, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1948, N'CREMA CORPORAL NIVEA', 11, 2, 8000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1949, N'DESODORANTE MASCULINO', 3, 2, 9000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1950, N'QUESO RALLADO', 4, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1951, N'MAYONESA FRUKO', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1952, N'PAÑALES PEQUEÑIN', 3, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1953, N'MAQUINA DE AFEITAR', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1954, N'ARVEJAS', 4, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1955, N'ACEITE DE GIRASOL', 4, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1956, N'AZUCAR MORENA', 4, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1959, N'CAJA DE HUEVOS', 4, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1960, N'CUADERNOSNORMA', 6, 1, 1864.3000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1961, N'CONDONESDUREX', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1962, N'CALZONESDEMURCIELAGO', 1, 3, 856.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1963, N'SOPADEMARISCOS', 11, 2, 4800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1964, N'BALONESBRAZUCA', 15, 1, 38000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1965, N'CANDADOSGATO', 4, 2, 5300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1966, N'YOGURTDEMANZANAMANGO', 7, 2, 8961.0000, NULL, NULL, N'LT', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1967, N'DEDITOSDEPOLLO', 11, 3, 11000.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1968, N'ALMOHADASROMANCERELAX', 1, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1969, N'PACKREFRESCOSCIFRUT', 7, 2, 5386.9000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1970, N'CHORIZOALEMÁN', 12, 3, 1255.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1971, N'CEDROESTERILLADO', 20, 3, 12500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1972, N'ESCOBADUREX', 16, 3, 1401.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1973, N'ACETAMINOFEN', 8, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1974, N'REDSMIRNOFF', 9, 2, 11237.0000, NULL, NULL, N'LT', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1975, N'ZANAHORIAROJAPEAR', 13, 2, 523.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1976, N'POLLOAHUMADO', 12, 1, 37582.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1977, N'CONSOMEDEROBALO', 12, 1, 5600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1978, N'TIJERASDOBLEFILOALICE', 19, 3, 13789.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1979, N'HELADOFRESAINTENSA', 18, 1, 8560.0000, NULL, NULL, N'LT', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1980, N'ALICIAMARAVILLAS', 14, 2, 4444.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1981, N'PANDOBLETRENZA', 7, 2, 7746.6300, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1982, N'CRISPETASMARAY', 7, 2, 7770.3200, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1983, N'FLORDECANELA', 10, 2, 1234.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1984, N'BLOCKRESMANDET', 6, 1, 435690.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1985, N'BAILEYS', 9, 3, 25000.0000, NULL, NULL, N'LT', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1986, N'PAPASBAYUNAS', 11, 3, 5211.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1987, N'REMOLACHAJUNER', 11, 3, 2300.0000, NULL, NULL, N'KG', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1988, N'BOMBILLOSLED', 4, 3, 2222.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1989, N'CEPILLOFRANCESDEED', 19, 3, 6522.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1991, N'TENIS ADIDAS GALAXI', 4, 1, 250000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1992, N'JABÓN DE BAÑO', 18, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1994, N'SHAMPO', 18, 1, 9000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (1998, N'POLLO', 14, 1, 4000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2001, N'SALCHICHÓN', 14, 1, 6000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2004, N'PAN TAJADO', 17, 1, 3500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2005, N'PAN LECHE', 17, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2006, N'CROISSANT', 17, 1, 1800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2007, N'CURAS', 20, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2010, N'TELEVISOR 32 PULGADAS', 15, 1, 980000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2011, N'LICUADORA', 15, 1, 75000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2012, N'CUCHILLO', 15, 1, 8000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2013, N'CABANOS', 3, 1, 3600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2014, N'FRIJOLES ENLATADOS', 7, 1, 5974.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2018, N'YOGURT', 2, 1, 4200.0000, NULL, NULL, N'LT', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2022, N'CHICLETS', 8, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2023, N'CARBÓN', 3, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2024, N'AGUA', 1, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2025, N'ENERGIZANTE', 1, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2026, N'GASEOSA 350ML', 12, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2027, N'GASEOSA 4.5LT', 12, 1, 4500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2028, N'GASEOSA 1.5LT', 12, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2030, N'CUAJADA', 2, 1, 6000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2031, N'CARRO A CONTROL REMOTO', 16, 1, 120000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2032, N'CUIDO PARA PERROS', 9, 1, 7800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2033, N'CUIDO PARA GATOS', 9, 1, 6800.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2034, N'MANZANAS', 11, 1, 1000.0000, NULL, NULL, N'KG', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2036, N'PERIODICO', 10, 1, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2040, N'RON', 4, 1, 18000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2042, N'TENIS NIKE AIR MAX', 1, 1, 210000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2043, N'TENIS NIKE AIR GALAXY', 2, 1, 250000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2044, N'TENIS ADIDAS', 3, 1, 100000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2045, N'TENIS PUMA', 4, 1, 150000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2046, N'TENIS CROIDON', 5, 1, 50000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2047, N'TENIS ROYAL', 5, 1, 210.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2048, N'MANTEQUILLA', 6, 1, 2060.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2052, N'CHICLET ADANS', 11, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2053, N'BOM BOM BUM ROJO', 12, 1, 22000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2054, N'BOM BOM BUM ROSADO', 13, 1, 22000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2055, N'PAPITAS MARGARITAS', 4, 1, 5000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2056, N'CERVESA', 14, 1, 210.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2057, N'PAPITAS MARGARITA', 15, 1, 8500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2062, N'SHANAORIA', 20, 1, 20000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2064, N'PAPA CRIOLLA', 22, 1, 6000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2066, N'ROSQUILLAS', 24, 1, 6000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2067, N'FRUTIÑO', 25, 1, 300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2081, N'SALSA BBQ', 2, 1, 5000.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2082, N'TACHES MERCURIAL', 2, 1, 210000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2083, N'CAMISETA', 3, 1, 40000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2084, N'CAMISILLA', 3, 1, 10000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2088, N'AVENA', 3, 1, 3000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2089, N'ARINA DE TRIGO', 3, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2090, N'MAIZ', 3, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2091, N'FRIJOL', 3, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2097, N'VIVE 100', 23, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2113, N'SUN TEA CON GAS', 23, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2398, N'PERROS', 1, 2, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2399, N'PAPAS CABEZONA', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2404, N'MIXTOS', 1, 2, 520600.0000, NULL, NULL, N'UN', 30)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2405, N'CARAOTAS', 1, 2, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2406, N'TOMATES', 1, 2, 1512000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2407, N'NATURALES', 1, 2, 2011000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2408, N'JAMÓN', 1, 2, 21000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2411, N'ANCHOAS', 1, 2, 300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2412, N'COCKTAIL', 1, 2, 24000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2417, N'CARAOTAS ROJAS', 1, 2, 33500.0000, NULL, NULL, N'UN', 20)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2418, N'CARAOTAS BLANCAS RANGER', 1, 2, 86950.0000, NULL, NULL, N'UN', 30)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2422, N'PURÉ DE PAPAS', 1, 2, 50030.0000, NULL, NULL, N'UN', 6)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2426, N'PASTA DE SÉMOLA', 1, 2, 20121.0000, NULL, NULL, N'UN', 16)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2428, N'NUEZ MOSCADA', 1, 2, 2500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2429, N'CANELA (EN POLVO Y EN RAMA) CABEZONA', 1, 2, 5500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2430, N'CREMOR TÁRTARO', 1, 2, 25300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2431, N'GUAYABITA', 1, 2, 75400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2432, N'FÉCULA DE MAÍZ', 1, 2, 40500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2433, N'CONFITES ADORNO', 1, 2, 26600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2437, N'PASAS, GUINDAS', 1, 2, 2011000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2438, N'GELATINAS', 1, 2, 21000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2440, N'SIROP (FRESA, MORA, CHOCOLATE)', 1, 2, 4800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2446, N'AGUA POTABLE', 1, 2, 20800.0000, NULL, NULL, N'UN', 50)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2447, N'AGUAKINA/SODA DE SANDIA', 1, 2, 33500.0000, NULL, NULL, N'UN', 20)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2448, N'AGUAKINA/SODA', 1, 2, 86950.0000, NULL, NULL, N'UN', 30)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2449, N'CERVEZAS', 1, 2, 14550.0000, NULL, NULL, N'UN', 10)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2450, N'JUGO DE NARANJA WAFER', 1, 2, 38000.0000, NULL, NULL, N'UN', 18)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2451, N'JUGO DE NARANJA', 1, 2, 44350.0000, NULL, NULL, N'UN', 12)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2452, N'REFRESCOS', 1, 2, 50030.0000, NULL, NULL, N'UN', 6)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2453, N'YOGURT LÍQUIDO', 1, 2, 35520.0000, NULL, NULL, N'UN', 50)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2454, N'JUGOS DE FRUTAS', 1, 2, 10200.0000, NULL, NULL, N'UN', 40)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2455, N'TACO, RICOMALT', 1, 2, 2012.0000, NULL, NULL, N'UN', 16)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2456, N'CAFÉ INSTANT.', 1, 2, 20121.0000, NULL, NULL, N'UN', 16)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2457, N'TÉ DE MENTA
', 1, 2, 21012.0000, NULL, NULL, N'UN', 16)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2458, N'TÉ DE TILO RANGER', 1, 2, 86950.0000, NULL, NULL, N'UN', 30)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2459, N'TÉ DE TILO', 1, 2, 14550.0000, NULL, NULL, N'UN', 10)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2461, N'TÉ DE TILOM', 1, 2, 44350.0000, NULL, NULL, N'UN', 12)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2462, N'BALACAS', 1, 2, 50030.0000, NULL, NULL, N'UN', 6)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2463, N'BOLISITO', 1, 2, 35520.0000, NULL, NULL, N'UN', 50)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2464, N'MORITA', 1, 2, 10200.0000, NULL, NULL, N'UN', 40)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2465, N'OBLEA', 1, 2, 2012.0000, NULL, NULL, N'UN', 16)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2468, N'LECHE COLANTA PASTEURIZADA', 1, 4, 1700.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2469, N'CREMA DE LECHE ALQUERÍA', 1, 3, 2300.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2470, N'LECHE ALQUERÍA', 1, 4, 2500.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2471, N'QUESO CREMA COLANTA', 1, 2, 4000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2473, N'YOGOURT YOGO YOGO', 1, 4, 700.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2474, N'MANTEQUILLA CAMPI', 1, 2, 2800.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2475, N'KILO DE PAPAS', 2, 1, 1300.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2476, N'BANDEJA DE UVAS', 2, 2, 1600.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2477, N'BANDEJA DE FRESAS', 2, 2, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2478, N'SANDÍAS FRESCAS', 2, 1, 2000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2479, N'PAQUETE DE MORAS', 2, 1, 1800.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2480, N'PULPA DE FRUTA', 2, 3, 1500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2484, N'PAPEL HIGIÉNICO SCOTT', 4, 3, 2000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2485, N'SHAMPOO EGO', 4, 4, 6400.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2486, N'JABÓN PALMOLIVE', 4, 3, 1700.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2487, N'PRESTOBARBA GILLETTE', 4, 3, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2488, N'JUEGO DE MESA MONOPOLY', 5, 4, 60000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2489, N'BALÓN DE FUTBOL', 5, 3, 50000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2490, N'PISTA HOT WHEELS', 5, 4, 85000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2491, N'PAQUETE DE GORROS PARA PIÑATA', 6, 1, 2300.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2493, N'RESMA DE PAPEL', 7, 3, 12000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2494, N'CAJA DE LÁPICES', 7, 3, 2700.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2495, N'CARTUCHOS PARA IMPRESORA', 7, 4, 48000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2496, N'CUADERNO 5 MATERIAS', 7, 2, 6000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2497, N'FOLTER TAMAÑO CARTA', 7, 3, 25000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2499, N'SARDINA', 8, 3, 3400.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2500, N'FRIJOLES PRE COCINADOS', 8, 3, 5200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2501, N'MAIZ TIERNO', 8, 3, 4900.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2502, N'ARBERJAS', 8, 3, 2350.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2503, N'PAN FRANCÉS', 9, 2, 6000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2505, N'TORTA REFRIGERADA', 9, 3, 10000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2507, N'ALMOHABANA', 9, 1, 400.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2508, N'CERVEZA PILSEN', 10, 4, 1500.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2509, N'CERVEZA AGUILA', 10, 4, 1500.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2510, N'CERVEZA CLUB COLOMBIA', 10, 4, 2500.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2511, N'AGUARDIENTE ANTIOQUEÑO GARRAFA', 10, 4, 52000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2512, N'RON MEDELLÍN GARRAFA', 10, 4, 61000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2513, N'OLD PARR', 10, 4, 57000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2514, N'TEQUILA JOSÉ CUERVO', 10, 4, 30000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2515, N'VODKA', 10, 4, 32000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2516, N'CREMA DE WISKY BAILEYS', 10, 4, 35000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2517, N'CORONA MASTER', 10, 4, 8000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2518, N'PAQUETE DE BARRILETE', 11, 3, 2500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2519, N'PAQUETE DE BOM BOM BUM', 11, 3, 3600.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2520, N'CHOCOLATE HERSHEY', 11, 4, 6000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2521, N'CAJA DE CHOCOLATES FERRERO', 11, 4, 15000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2522, N'PAQUETE DE GOMITAS TRULULU', 11, 3, 2200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2523, N'CAMISETA NIÑO', 12, 3, 25000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2524, N'BLUSA NIÑA', 12, 3, 21300.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2525, N'CAMISA HOMBRE', 13, 4, 39900.0000, NULL, NULL, N'un', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2526, N'CAMISETA ATLÉTICO NACIONAL', 13, 4, 140000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2527, N'CAMISETA SELECCIÓN COLOMBIA', 13, 4, 128000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2528, N'CAMISETA INDEPENDIENTE MEDELLÍN', 13, 4, 95000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2529, N'GUAYOS NIKE MAGISTA', 13, 4, 170000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2530, N'SOAT MOTOCICLETA', 14, 4, 210000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2531, N'SOAT AUTOMOVIL', 14, 4, 340000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2532, N'LLANTAS MICHELLIN', 14, 4, 62000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2533, N'KIT DE CARRETERA', 14, 4, 84000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2534, N'BATERÍA PARA CARRO', 14, 4, 280000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2535, N'EMULSIÓN SCOTT', 15, 3, 4000.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2536, N'CARTÓN DE ACETAMONOFÉN', 15, 2, 1200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2537, N'VITAMINA C MK', 15, 3, 4100.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2538, N'ALCOHÓL ETÍLICO', 15, 3, 1700.0000, NULL, NULL, N'lt', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2539, N'CONDONES TODAY', 15, 3, 2300.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2540, N'PIERNA DE CERDO', 16, 2, 6400.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2541, N'SOLOMO EXTRANJERO', 16, 2, 6900.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2542, N'MUSLOS DE POLLO (BANDEJA)', 16, 3, 5400.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2543, N'TILAPIA ROJA', 16, 2, 8000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2544, N'BAGRE', 16, 2, 7600.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2545, N'SALCHICHÓN ZENÚ', 17, 3, 2500.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2546, N'SALCHICHAS RANCHERAS', 17, 3, 3650.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2547, N'CARNE DE HAMBURGUESA', 17, 3, 4700.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2548, N'XBOX 360', 18, 4, 550000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2549, N'PC DE ESCRITORIO', 18, 4, 600000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2550, N'LAPTOP ACER', 18, 4, 800000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2551, N'LAPTOP DELL', 18, 4, 110000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2552, N'IPHONE 5', 18, 4, 1200000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2553, N'SAMSUNG GALAXY S5', 18, 4, 1300000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2554, N'TELEVISON SONY BRAVIA', 18, 4, 1100000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2556, N'CAMARA DIGITAL PANASONIC', 18, 4, 300000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2557, N'IMPRESORA CANON', 18, 4, 470000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2558, N'PURINA DOG CHOW', 19, 3, 3400.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2559, N'PURINA CAT CHOW', 19, 3, 2800.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2560, N'CAMA PARA PERRO', 19, 2, 87400.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2561, N'CAJA DE ARENA PARA GATO', 19, 2, 60000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2562, N'PECERA', 19, 3, 90000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2563, N'BOMBILLO AHORRADOR', 20, 3, 3600.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2564, N'CAJA DE HERREMIENTAS', 20, 4, 264000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2565, N'ESCALERAS METÁLICAS', 20, 3, 140000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2566, N'GALÓN DE PINTURA PINTUCO', 20, 3, 83000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2567, N'MANGUERA 20 MTS', 20, 3, 47000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2568, N'CALDO MAGGIE', 5, 2, 350.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2569, N'AREPAS DEL NIÑO', 24, 1, 900.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2571, N'AROMATEL X 200ML', 10, 1, 3200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2572, N'JABON REY', 10, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2573, N'GUSANOS TRULULU X 200', 22, 1, 8302.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2574, N'DORITOS', 22, 1, 945.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2575, N'PAPAS MARGARITA', 22, 1, 894.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2577, N'SALCHICHON X LIBRA', 14, 2, 4320.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2578, N'QUESITO PEQUEÑO', 14, 2, 1870.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2579, N'QUESITO GRANDE', 14, 2, 2803.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2580, N'REPUESTO DE AXION', 10, 1, 780.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2581, N'LIMPIDO PEQUEÑO', 10, 1, 1111.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2582, N'FAB PEQUEÑO', 10, 1, 980.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2583, N'VEL ROSITA', 10, 1, 1760.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2584, N'SUAVITEL UN USO', 10, 1, 750.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2585, N'TUMIX', 22, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2586, N'MERENGUE', 22, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2588, N'CHUSQUITAS', 22, 1, 250.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2589, N'BOMBONBUM', 22, 1, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2593, N'SUNTEA 1.5LITRO', 24, 1, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2594, N'PINGUINOS MARISELLA', 22, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2595, N'PALETA DE AGUA', 22, 2, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2596, N'CHOCOCONO DE KRISPIS', 22, 2, 1300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2597, N'CHOCOCONO DE NUEZ', 22, 2, 1300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2598, N'CHOCOCONO NORMAL', 22, 2, 1300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2599, N'HELADO EN CONO', 22, 2, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2600, N'HELADO EN VASO', 22, 2, 800.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2601, N'HELADO EN CONO DOBLE', 22, 2, 1600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2602, N'HELADO EN VASO DOBLE', 22, 2, 1600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2603, N'CHOCOBKEAK', 22, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2604, N'CHOCOLATINA JET PEQUEÑA', 22, 1, 350.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2605, N'CHOCOLATINA JET MEDIANA', 22, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2606, N'CHOCOLATINA JET GRANDE', 22, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2607, N'CHOCOLATINA JUMBO JET PEQUEÑA', 22, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2608, N'CHOCOLATINA JUMBO JET MEDIANA', 22, 1, 1300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2609, N'CHOCOLATINA JUMBO JET GRANDE', 22, 1, 2600.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2610, N'CHOCOMASMELO', 22, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2611, N'GALLETA MAMUT NORMAL', 22, 1, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2612, N'GALLETA MAMUT BLANCA', 22, 1, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2613, N'GALLETA MAMUT FRESA', 22, 1, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2614, N'GALLETA MAMUT GRANDE', 22, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2615, N'CHOCOLATE SOL', 5, 1, 300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2616, N'CHOCOLATE CRUZ', 5, 1, 300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2617, N'CAFE 1/4 LIBRA', 5, 1, 2700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2618, N'CAFE PAPELETA PEQUEÑA', 5, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2619, N'CAFE PAPELETA GRANDE', 5, 1, 1200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2620, N'PAÑOS PEQUEÑIN X UNIDAD', 11, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2621, N'PAÑOS PEQUEÑIN X 30', 11, 1, 2700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2622, N'PAÑALES PEQUEÑIN ETAPA 3', 11, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2623, N'PAÑALES PEQUEÑIN ETAPA 2', 11, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2624, N'PAÑALES PEQUEÑIN ETAPA 4', 11, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2625, N'PAÑALES PEQUEÑIN ETAPA 5', 11, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2626, N'LAPIZ NUMERO 2', 7, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2627, N'LAPICERO', 7, 1, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2628, N'CUADERNO DE 50 HOJAS RAYADO', 7, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2629, N'CUADERNO DE 100 HOJAS RAYADO', 7, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2630, N'CUADERNO DE 50 HOJAS CUADRICULADO', 7, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2631, N'CUADERNO DE 100 HOJAS CUADRICULADO', 7, 1, 1500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2632, N'CUADERNO DE 100 HOJAS CUADRICULADO ARGOLLADO', 7, 1, 2000.0000, NULL, NULL, N'UN', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2633, N'CUADERNO DE 100 HOJAS RAYADO ARGOLLADO', 7, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2640, N'CARTULINA PLIEGO', 7, 1, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2641, N'CARTULINA MEDIOPLIEGO', 7, 1, 350.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2642, N'CARTULINA  1/4 PLIEGO', 7, 1, 200.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2643, N'BURBUJA DE CHOCOLATE JET', 22, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2644, N'BLOC RAYADO', 22, 1, 2700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2645, N'BLOC SIN RAYAS', 22, 1, 2700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2646, N'BARRILETE', 22, 1, 100.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2648, N'CEBOLLA XLIBRA', 9, 2, 700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2649, N'TOMATE X LIBRA', 9, 2, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2661, N'SPAGUETI', 5, 1, 2000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2662, N'CABELLOS DE ANGEL', 5, 1, 1400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2663, N'SOPA DE LETRAS', 5, 1, 1499.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2670, N'TOALLA HIGIENICAS', 11, 1, 3344.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2671, N'PROTECTORES', 11, 1, 2300.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2673, N'ALGODON', 11, 1, 2345.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2674, N'COPOS PARA OIDOS', 11, 1, 1567.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2675, N'TIJERAS', 11, 1, 1700.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2676, N'BISTURIN', 11, 1, 2400.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2677, N'SUBMARINO PEQUEÑO', 22, 1, 500.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2678, N'SUBMARINO GRANDE', 22, 1, 1000.0000, NULL, NULL, N'UN', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2976, N'GASEOSA', 1, 1, 1200.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2983, N'TINTES', 5, 1, 5000.0000, NULL, NULL, N'un', 200)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2989, N'MUÑECA', 1, 1, 12000.0000, NULL, NULL, N'un', 85)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2990, N'CARRO DE JUGUETE', 1, 1, 10000.0000, NULL, NULL, N'un', 85)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2991, N'CUADROS', 1, 1, 30000.0000, NULL, NULL, N'un', 550)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2992, N'ESCOBAS', 1, 1, 3000.0000, NULL, NULL, N'un', 15)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2993, N'TRAPEADORAS', 1, 1, 3000.0000, NULL, NULL, N'un', 15)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (2998, N'SALCHICHAS', 1, 1, 3000.0000, NULL, NULL, N'un', 30)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3002, N'PORTATIL', 1, 1, 800000.0000, NULL, NULL, N'un', 850)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3004, N'ELIPTICA', 1, 1, 1200000.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3008, N'LULOS', 1, 1, 1000.0000, NULL, NULL, N'un', 20)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3009, N'ATUN', 1, 1, 4000.0000, NULL, NULL, N'un', 85)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3010, N'TORNILLOS', 1, 1, 200.0000, NULL, NULL, N'un', 12)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3013, N'TENDIDOS', 1, 1, 3000.0000, NULL, NULL, N'un', 286)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3014, N'ALMOHADAS', 1, 1, 3000.0000, NULL, NULL, N'un', 380)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3016, N'CORTINAS', 1, 1, 3000.0000, NULL, NULL, N'un', 280)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3017, N'TOALLAS', 1, 1, 2800.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3018, N'CERVILLETA', 1, 1, 1000.0000, NULL, NULL, N'un', 69)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3019, N'PAÑUELOS', 1, 1, 2000.0000, NULL, NULL, N'un', 15)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3022, N'ASADOR', 1, 1, 800000.0000, NULL, NULL, N'un', 850)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3024, N'LAPIZ', 1, 1, 700.0000, NULL, NULL, N'un', 10)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3026, N'BORRADOR', 1, 1, 1200.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3027, N'HOJAS DE BLOCK', 1, 1, 200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3028, N'PLANCHA', 1, 1, 800000.0000, NULL, NULL, N'un', 450)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3029, N'ANILLOS', 1, 1, 100000.0000, NULL, NULL, N'un', 580)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3031, N'OLLA ARROCERA', 1, 1, 100000.0000, NULL, NULL, N'un', 25)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3032, N'COLLAR', 1, 1, 200000.0000, NULL, NULL, N'un', 10)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3033, N'PLANCHA PARA EL CABELLO', 1, 1, 200000.0000, NULL, NULL, N'un', 600)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3034, N'SECADOR', 1, 1, 150000.0000, NULL, NULL, N'un', 600)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3035, N'CINTAS', 1, 1, 500.0000, NULL, NULL, N'un', 2)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3036, N'MOÑOS', 1, 1, 750.0000, NULL, NULL, N'un', 4)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3037, N'PINZAS', 1, 1, 200.0000, NULL, NULL, N'un', 3)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3038, N'DELANTALES', 1, 1, 45000.0000, NULL, NULL, N'un', 26)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3039, N'SANDUCHERA', 1, 1, 85000.0000, NULL, NULL, N'un', 46)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3041, N'ESPRIMIDOR', 1, 1, 3000.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3043, N'PECHUGA', 1, 1, 7000.0000, NULL, NULL, N'un', 370)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3044, N'PESCADO', 1, 1, 8000.0000, NULL, NULL, N'un', 320)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3045, N'AUDIFONOS', 1, 1, 45000.0000, NULL, NULL, N'un', 290)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3046, N'MAUSE', 1, 1, 35000.0000, NULL, NULL, N'un', 452)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3047, N'IPHONES', 1, 1, 300000.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3048, N'IMPRESORA', 1, 1, 450000.0000, NULL, NULL, N'un', 510)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3049, N'GRAPADORA', 1, 1, 1000.0000, NULL, NULL, N'un', 52)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3050, N'PORTA MINAS', 1, 1, 1200.0000, NULL, NULL, N'un', 30)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3051, N'TEATRO EN CASA', 1, 1, 850000.0000, NULL, NULL, N'un', 952)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3052, N'MINI COMPONENTE', 1, 1, 530000.0000, NULL, NULL, N'un', 720)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3053, N'MP3', 1, 1, 200000.0000, NULL, NULL, N'un', 410)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3054, N'MP4', 1, 1, 340000.0000, NULL, NULL, N'un', 410)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3055, N'MP5', 1, 1, 580000.0000, NULL, NULL, N'un', 410)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3056, N'BALONES', 1, 1, 1200.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3057, N'REVISTAS', 1, 1, 3000.0000, NULL, NULL, N'un', 15)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3058, N'DICIONARIOS', 1, 1, 35000.0000, NULL, NULL, N'un', 430)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3059, N'ENCICLOPEDIAS', 1, 1, 550000.0000, NULL, NULL, N'un', 430)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3060, N'PEINES', 1, 1, 2800.0000, NULL, NULL, N'un', 25)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3061, N'BOMBILLOS', 1, 1, 1200.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3062, N'ARENA', 1, 1, 5000.0000, NULL, NULL, N'un', 490)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3063, N'MATERAS', 1, 1, 1200.0000, NULL, NULL, N'un', 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3064, N'SEMILLAS', 1, 1, 900.0000, NULL, NULL, N'un', 4)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3065, N'CORTA UÑAS', 1, 1, 2000.0000, NULL, NULL, N'un', 10)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3066, N'DESODORANTE AERO ANARCHY FOR MEN AXE X160 CC', 4, 1, 210.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3067, N'DESODORANTE AEROSOL EXPLORER STONE X 160 CC', 4, 2, 190.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3068, N'DESODORANTE AEROSOL ROMANTIC SPARK IMPULSE X 53GRS', 4, 3, 215.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3069, N'DESODORANTE AMB CAMPOS LAVANDA AERO GLADE X 360CC', 4, 1, 310.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3070, N'DESODORANTE MASC TERRA AERO PATRICHS X 105 CC', 5, 1, 2300.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3071, N'DETERGENTE CAMPO MANZANA MAGISTRAL X 600 CC', 5, 2, 3500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3072, N'DETERGENTE FRUTAS CITRICAS ALA X 750CC', 5, 3, 4800.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3073, N'DETERGENTE NARANJA MAGISTRAL X 300 CC', 5, 3, 5000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3074, N'DOGUI POLLO C/ SEL. DE VEGETALES X1.5KG', 6, 1, 2300.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3075, N'DULCE DE BATATA CHOCOLATE CARREFOUR X 500 GRS', 6, 2, 3900.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3076, N'DULCE DE LECHE SANCOR X 1000 GRS', 6, 3, 4600.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3077, N'DURAZNOS EN MITADES NOEL X 820 GRS', 6, 2, 5100.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3078, N'EDULCORANTE LIQUIDO PET HILERET X 500 CC', 7, 3, 150.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3079, N'EDULCORANTE POLVO TUY X 100 UNI', 7, 2, 60.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3080, N'ENJUAGUE BUCAL LUMINOUS WHITE COLGATE X 500 CC', 7, 3, 100.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3081, N'ENJUAGUE BUCAL PLAX MAGIC COLGATE X 250 CC', 7, 3, 210.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3082, N'ESCOBIILLA DE BANO PRIMAVERA', 8, 1, 120.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3083, N'ESPONJA DE BANO OVALADA C/VEGETAL ESTILO SPA X1UNI', 8, 2, 89.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3084, N'ESPUMA DE AFEITAR NORMAL PRESTOBARBA X 150 GRS', 8, 3, 90.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3085, N'FIDEOS AL HUEVO LA SALTENA X 500 GRS', 8, 3, 190.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3086, N'FIDEOS BAVETTA CANALE X 500 GRS', 9, 3, 700.0000, NULL, NULL, N'un', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3087, N'FIDEOS MOSTACHOLES MANERA X 500 GRS', 9, 3, 1000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3090, N'GALLETITA CRIOLLITAS ORIGINAL 100GR', 10, 3, 700.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3091, N'GALLETITAS AVENA-PASAS CEREAL MIX X 230 GRS', 10, 1, 30.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3092, N'MGALLETITAS C/CHIPS CHOCOLATE CHOCO CHIPS X 135 GRS', 10, 2, 60.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3093, N'GALLETITAS POLVORONES MARMOLADO GOLCI X 300 GRS', 10, 1, 20.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3094, N'GALLETITAS CON LECHE MANON X 172 GRS', 10, 3, 360.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3095, N'GASEOSA COLA REGULAR COCA COLA LATA X 354 CC', 11, 3, 100.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3096, N'GASEOSA COLA REGULAR PEPSI LATA X 354 CC', 11, 3, 210.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3097, N'GEL CORPORAL HIDRATACION EXPRESS NIVEA BODY X200CC', 11, 2, 90.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3098, N'GELATINA DE CEREZA EXQUISITA X 70 GRS', 11, 3, 350.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3099, N'GELATINA FRAMBUESA EXQUISITA X 70 GRS', 12, 1, 30.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3100, N'HAMBURGUESA DE CARNE FLOWPACK PATY X 2 UNI', 12, 2, 20.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3101, N'HARINA DE TRIGO 000 CANUELAS X 1 KG', 12, 3, 15.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3102, N'HELADO D/AGUA SAB LIMON PALITO TORPEDO X 378 GRS', 12, 3, 10.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3103, N'HELADO DUL D LECH GRANI-CHOCO FRIGOR POTE X539 GRS', 13, 2, 6000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3104, N'HIGADO', 13, 2, 8000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3105, N'HILO COLGATE TOTAL FLUOR MINT X 25 MTR', 13, 3, 5000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3106, N'HISOPOS ESPECIALES PARA BEBE Q-SOFT X 30 UNI', 13, 2, 4000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3107, N'HUEVO BLANCO MAPLE CARREFOUR X 30 UNI', 14, 2, 2000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3108, N'ISOTONICA CITRUS POWERADE PET X 500 CC', 14, 3, 12000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3109, N'JABON ANTIBACTERIAL ACTIVE DEO ESPADOL X 120 GRS', 14, 1, 12000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3110, N'JABON DE TOCADOR CAMPOS DE ENSUE O LIMOL 3 X90GRS', 14, 3, 800.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3111, N'JABON EN POLVO BE NATURAL FRESH ZORRO X 800 GRS', 15, 3, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3112, N'JABON LIQUIDO GLICERINA Y MIEL ESTILO SPA X 300 CC', 15, 2, 1000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3113, N'JARDINERA DE HORTALIZAS Y LEGUMBRES X 300', 15, 2, 10.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3114, N'JUGO CONCENTRADO NARANJA CARIOCA X 1.5 LT', 15, 1, 5000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3115, N'JUGO EN POLVO ANANA TROPICAL SER SOBRE X 7.5 GRS', 16, 1, 200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3116, N'JUGO NATURAL MANZANA CEPITA X 1 LT', 16, 3, 250.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3117, N'KETCHUP RI-K SQUEEZE X 390 GRS', 16, 2, 150.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3118, N'LECHE EN POLVO ENTERA LA SERENISIMA BOLSA X 200 GR', 16, 3, 1000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3120, N'LICOR EDICION HOMENAJE LEGUI X 750 CC', 17, 2, 1300.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3121, N'MAICITOS HUECOS CON QUESO PEHUAMAR X 140 GRS', 17, 3, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3122, N'MANTECA CALIDAD EXTRA LA SERENISIMA X 100 GRS', 17, 1, 4000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3123, N'MANZANA RED COMERCIAL BOLSITA', 18, 2, 2500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3124, N'MARGARINA REPOSTERA DANICA PAN X 200 GRS', 18, 1, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3125, N'PANALES TALLE XG ACTIVE SEC MEG NENA HUGGIESX24UNI', 18, 3, 6500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3126, N'PASTILLA P/INODORO DESOD DBL ACCION BELAROM X60GRS', 18, 3, 3500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3127, N'PECHITO DE CERDO', 19, 1, 250.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3128, N'PIONONO FARGO X 200 GRS', 19, 2, 500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3129, N'PURE DE PAPAS SABOR FINAS HIERBAS MAGGI X 125 GRS', 19, 3, 500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3130, N'QUESO SARDO TROZADO TREMBLAY X KG', 19, 3, 1200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3131, N'REBOZADOR HORNO MAMA COCINA X 500 GRS', 20, 3, 90.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3132, N'SHAMPOO CERAMIDAS KERATINA PLUSBELLE X 1 LT', 20, 2, 10.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3133, N'TOALLA FEMENINA BASICA MALLASECA S/A ALWAYS X8UNI', 20, 1, 30.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3134, N'VINO BLANCO CHABLIS CORNEJO COSTAS X 1.1', 20, 3, 20.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3135, N'YOGUR ENT BEBIBLE FRUTILLA SANCOR YOGS X 190 GRS', 21, 1, 22.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3136, N'ZAPALLO ANCO COMERCIAL BOLSITA', 21, 2, 24.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3137, N'ZANAHORIA COMERCIAL BOLSITA', 21, 1, 10.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3138, N'YERBA MATE SELECCION ESPECIAL AMANDA X 1 KG', 21, 3, 30.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3250, N'PAN BLANCO', 4, 1, 210.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3251, N'MINI PAN TOSTADO', 4, 2, 190.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3252, N'PAN BIMBO KIDS', 4, 3, 215.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3254, N'LIMPIADOR LÍQUIDO MULTIUSO POETT', 5, 1, 2300.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3260, N'LIMPIADOR CREMA MR. MÚSCULO', 6, 3, 4600.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3261, N'ESPONJAS AMARILLO / VERDE', 6, 2, 5100.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3262, N'GUANTES DE GOMA PARA ASEO', 7, 3, 150.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3263, N'PALA PLÁSTICA PARA BASURA', 7, 2, 60.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3264, N'ESCOBILLÓN TIPO ESCOBA', 7, 3, 100.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3265, N'VIRUTILLA CON JABÓN PARA OLLAS', 7, 3, 210.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3266, N'ESCOBILLÓN HOGAR', 8, 1, 120.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3267, N'PASTILLAS DE CLORO PARA WC', 8, 2, 89.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3268, N'DESINFECTANTE EN AEROSOL IGENIX', 8, 3, 90.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3269, N'DESODORANTE AMBIENTAL GLADE', 8, 3, 190.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3270, N'DESODORANTE AMBIENTAL POETT', 9, 3, 700.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3271, N'VIRUTILLA LÍQUIDA R Y R', 9, 3, 1000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3272, N'LECHE DE SOYA', 9, 2, 1200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3275, N'ESPINACAS', 10, 1, 30.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3276, N'TOFU PROCESADO', 10, 2, 60.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3277, N'SALMÓN ENLATADO CON ESPINAS', 10, 1, 20.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3278, N'PUDINES DE LECHE ENTERA', 10, 3, 360.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3279, N'CREMA HELADA', 11, 3, 100.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3280, N'YOGUR HELADO', 11, 3, 210.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3281, N'YOGUR HELADO BAJO EN GRASA', 11, 2, 90.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3283, N'HELADO BAJO EN GRASA', 12, 1, 30.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3284, N'YOGUR NATURAL SIN GRASA', 12, 2, 20.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3285, N'YOGUR NATURAL BAJO EN GRASA', 12, 3, 15.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3286, N'YOGUR NATURAL', 12, 3, 10.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3287, N'YOGUR BAJO EN GRASA CON FRUTAS', 13, 2, 6000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3288, N'YOGUR DE LECHE ENTERA CON FRUTAS', 13, 2, 8000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3289, N'YOGUR SIN GRASA CON FRUTAS', 13, 3, 5000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3290, N'YOGUR SIN GRASA', 13, 2, 4000.0000, NULL, NULL, N'kg', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3291, N'YOGUR BAJO EN GRASA', 14, 2, 2000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3292, N'YOGUR DE LECHE ENTERA', 14, 3, 12000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3293, N'REQUESÓN', 14, 1, 12000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3294, N'RICOTTA', 14, 3, 800.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3295, N'PARMESANO', 15, 3, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3296, N'SUIZO', 15, 2, 1000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3297, N'MOZZARELLA', 15, 2, 10.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3298, N'CHEDDAR', 15, 1, 5000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3301, N'LECHE EVAPORADA DESNATADA', 16, 2, 150.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3302, N'LECHE EVAPORADA', 16, 3, 1000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3303, N'LECHE DESCREMADA EN POLVO', 17, 3, 2000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3305, N'LECHE SIN GRASA SIN LACTOSA', 17, 3, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3306, N'LECHE 2% DE GRASA SIN LACTOSA', 17, 1, 4000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3307, N'LECHE SIN GRASA CON LACTOSA', 18, 2, 2500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3308, N'LECHE ENTERA SIN LACTOSA', 18, 1, 3000.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3309, N'LECHE SIN GRASA', 18, 3, 6500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3310, N'PAN DE CAJA', 18, 3, 3500.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3311, N'CHILE VERDE', 19, 1, 250.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3313, N'NARANJAS', 19, 3, 500.0000, NULL, NULL, N'un', 1)
GO
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3314, N'LIMONES', 19, 3, 1200.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3315, N'PASTA DE DIENTES', 20, 3, 90.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3316, N'BIMBOLLOS', 20, 2, 10.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3317, N'BRAN FRUT FRESA', 20, 1, 30.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3318, N'BRAN FRUT MANZANA CON CANELA', 20, 3, 20.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3319, N'MANTECADAS CON NUEZ', 21, 1, 22.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3320, N'DONAS BIMBO', 21, 2, 24.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3321, N'EMPANIZADOR DE HOJUELAS', 21, 1, 10.0000, NULL, NULL, N'un', 1)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (3322, N'MANTECADAS', 21, 3, 30.0000, NULL, NULL, N'un', 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (51, N'NESTEA', 2, N'11234553', N'DIEGO', N'CASTILLA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (52, N'GILLETE', 2, N'23232323', N'FELIPE', N'MENESES', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (53, N'NOSOTRAS', 2, N'1234567', N'MARIANA', N'FLOREZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (54, N'BLANCOX', 2, N'12324354', N'JENNIFER', N'MUNERA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (55, N'AXION', 2, N'98767897', N'HECILDA', N'PINEDA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (56, N'TRULULU', 2, N'54456654', N'VALERIANO', N'MORALES', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (57, N'FABULOSO', 2, N'3433322', N'ENRIQUE', N'IGLESIAS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (58, N'JET', 2, N'2342332', N'FELIPE', N'REYES', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (59, N'FAMILIA', 1, N'2423234', N'NATALY', N'ARISMENDI', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (60, N'PEQUEÑIN', 2, N'3443448', N'DANIEL', N'DAVID', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (61, N'INES', 1, N'6564433', N'OTILIA', N'AGUIRRE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (62, N'BIMBO', 1, N'3455333', N'ABELARDO', N'GONZALES', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (63, N'COLOMBINA', 1, N'243442232', N'MARISOL', N'ROSARION', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (64, N'FRUTIÑO', 1, N'8237434', N'MERLIN', N'PINEDA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (65, N'MALBORO', 1, N'11234223', N'JULIO', N'GALLEGO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (66, N'BOSTON', 1, N'11233435', N'LUISA FERNANDA', N'FORERO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (67, N'KENT', 1, N'116775678', N'ANDRES', N'PARRAS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (68, N'SURTIMAX', 1, N'4543344', N'GUILLERMO', N'VELTRAN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (69, N'SUNTEA', 1, N'36766564', N'ALFREDO', N'VELASQUE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (70, N'ARIEL', 1, N'543434434', N'SARA', N'QUINTERO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (71, N'FAB', 3, N'1198889', N'ANGIE', N'RODRIGUEZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (72, N'GAMESA', 1, N'55443223', N'CAROLINA', N'ESCOBAR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (73, N'ZENU', 1, N'22123442', N'NATALIA', N'CADAVID', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (74, N'COCACOLA', 1, N'4355665', N'LOLA', N'RODRIGUEZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (75, N'PARMALAT', 1, N'4546664', N'VIVIANA', N'LEAL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (76, N'RIO PAILA', 1, N'3244433', N'SHARON', N'MORENO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (77, N'COLANTA', 1, N'95652333', N'LAURA', N'ZAPATA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (78, N'MONTEFRIO', 1, N'44333221', N'CAMILO', N'ARANGO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (79, N'ALPINA', 1, N'435589889', N'JHON', N'BOTERO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (80, N'PILSEN', 1, N'456776686', N'LUZ MARIA', N'CORREA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (81, N'COLTABACO', 1, N'43554664', N'JANE', N'DIAZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (82, N'NACIONALDECHOCOLATE', 1, N'6755656565', N'JUAN', N'PALACIO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (83, N'ALICANTO', 1, N'1123242', N'ANDREA', N'RESTREPOS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (84, N'PANELACOLOMBIA', 1, N'1123433', N'CARLOS', N'GOMEZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (85, N'PAN', 1, N'112256454', N'MARY', N'GARCIA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (86, N'INCAUCA', 1, N'112976554', N'ELIECER', N'JIRANDO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (87, N'JGB', 1, N'112345543', N'MARIANA', N'HERNANDEZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (88, N'HUGGIES', 1, N'232232298', N'TATIANA', N'ORDOÑEZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (89, N'DORIA', 1, N'234498989', N'LAURA', N'MONSALVE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (90, N'MAXIMA', 1, N'45677654', N'NATALIA', N'AGUIRRE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (91, N'CREMAHELADO', 1, N'32323222', N'DIANA', N'BETANCUR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (92, N'COLCAFE', 1, N'2345544', N'PAULINA', N'RUBIO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (93, N'GOURME', 1, N'2397675', N'PAOLA', N'RAMOS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (94, N'REFISAL', 1, N'457676', N'CRISTIANO', N'FALCAO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (95, N'COMARICO', 1, N'45476223', N'JAMES', N'RONALDO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (96, N'SANJORGE', 1, N'4576899', N'PEDRO', N'CUADRADO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (97, N'IBIZA', 1, N'323223', N'DURLEY', N'VELAZQUES', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (98, N'DIANA', 1, N'11234567', N'ESTEBAN', N'ROJO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (99, N'ROA', 1, N'1145623', N'JULIANA', N'CORTEZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (100, N'FORTUNA', 1, N'11242323', N'CARMEN', N'ZULUAGA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (101, N'ELVIS MIELES', 1, N'4561521', N'ELVIS', N'ELVIS M MIELES', N'Calle 45#56 56', N'45654', N'451245152', N'elvismieles@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (102, N'ORLEDIS MIELES', 1, N'451', N'ORLEDIS', N'OLREDISMIELES', N'Calle 45#56 56', N'654', N'451245152', N'ORLEDISmieles@hotmail.com', N'DIME QUE QUIERE Y TE LO DARE')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (103, N'LIVIS MIELES', 1, N'521', N'LIVIS', N'LIVISMIELES', N'Calle 45#56 56', N'46554', N'451245152', N'Livismieles@hotmail.com', N'HOLA')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (104, N'NAVELIS MIELES', 1, N'4521', N'NAVELIS', N'NAVELISMIELES', N'Calle 45#56 56', N'454544654', N'451245152', N'Navelismieles@hotmail.com', N'COMO ESTAS')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (105, N'EDALI MIELES', 1, N'45521', N'EDALI', N'EDALIMIELES', N'Calle 45#56 56', N'45445654', N'451245152', N'EdaliMadremieles@hotmail.com', N'¿QUE HACES ?')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (106, N'OLVIS MIELES', 1, N'45261', N'OLVIS', N'OLVISMIELES', N'Calle 45#56 56', N'96335654', N'451245152', N'Olvismieles@hotmail.com', N'LA VIDA ES BELLA')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (107, N'MAIRA MIELES', 1, N'45621', N'MAIRA', N'5425MIELES', N'Calle 45#56 56', N'42302245654', N'451245152', N'Mairasmieles@hotmail.com', N'QUE ME MIRAS')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (108, N'MECHIS MIELES', 1, N'455521', N'MECHIS', N'RHHMIELES', N'Calle 45#56 56', N'9632154', N'451245152', N'Mechismieles@hotmail.com', N'SOY YURANI ')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (109, N'YURANI MIELES', 1, N'49521', N'YURA', N'444MIELES', N'Calle 45#56 56', N'46545452444', N'451245152', N'yuramieles@hotmail.com', N'SOY LA YURANI DUPLICADA')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (110, N'MABEL MIELES', 1, N'459521', N'MABEL', N'MIELES44', N'Calle 45#56 56', N'46552211', N'451245152', N'Mabelmieles@hotmail.com', N'MABEL MIELES ORTEGA Y MI CELULAR ES 304542120')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (111, N'CAROLINA TAMAYO', 2, N'5148514', N'CAROLINA', N'TAMAYO', N'cll 53 # 11 b 41', N'62484454', N'3015489824', N'carotamayo@gmail.com', N'se perdio')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (112, N'MILVIA HENAO', 2, N'64741811', N'MILVIA', N'HENAO', N'cll 50 # 45 b 44', N'5285996', N'30151449824', N'tamayomilvia@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (113, N'JESENIA TORREZ', 2, N'488154', N'JESENIA', N'TORRES', N'cll 90 # 45 b 84', N'3254810', N'3115749824', N'jesnia@gmail.com', N'para traer todo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (114, N'LEIDY LOPERA', 2, N'2144815', N'LOPERA', N'LEIDY', N'cll 20 # 33 b 44', N'53245514', N'30185825544', N'leidy@gmail.com', N'feaa loca')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (116, N'JULIAN AMAYA', 2, N'5478256', N'JULIANA', N'AMAYA', N'cll 108 # 45 b 44', N'5720972', N'30482452445', N'amaya@gmail.com', N'mmmmm')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (117, N'PAOLA VARGAS', 2, N'5681584', N'PAOLA', N'VARGAS', N'cll 55 # 45 b 44', N'3547441', N'3015751824', N'paola@gmail.com', N'nada :')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (118, N'EUGENIA CORREA', 2, N'54158442', N'EUGENIA', N'CORREA', N'cll 48 # 45 b 44', N'3545444', N'30157498555', N'eugenia@gmail.com', N'nada tido')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (119, N'LEYDI VILLA', 2, N'57828285', N'LEYDI', N'VILLA', N'cll 80 # 33 b 44', N'5249572', N'325454421', N'leyd@gmail.com', N'nada33')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (120, N'CAROLINA ZAFRA', 2, N'57882285', N'CAROLINA', N'ZAFRA', N'cll 50 # 45 b 44', N'5293740', N'3015749824', N'zafracaro@gmail.com', N'nada')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (121, N'POMONA', 1, N'4562', N'ROCIO', N'PESOS', N'calle 86 # 88 53', N'4526892', N'54886356', N'pomona@yahoo.com', N'tiene muchas vidrios')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (123, N'JUMBO', 2, N'5565', N'RAMON', N'CARMONA', N'calle 36 # 82 48', N'4526125', N'8965345', N'jumbo@yahoo.com', N'tiene muchas  orejas largas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (124, N'CARREFULL', 1, N'54656', N'JORGE', N'BETANCUR', N'calle 48 # 59 3', N'7893256', N'46359856', N'carrefull@yahoo.com', N'tiene muchas carros')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (125, N'SANTAFE', 2, N'6565', N'JUAN', N'OROZCO', N'calle 32 # 82 89', N'4563218', N'789656321', N'santafe@yahoo.com', N'tiene muchas carros')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (126, N'PUNTO', 3, N'48454', N'BENJAMIN', N'VALLEJO', N'calle 69 # 82 52', N'1236598', N'4863158', N'punto@yahoo.com', N'tiene muchas puntos')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (127, N'VETER', 4, N'45486859', N'ANDREA', N'CIELO', N'calle 56 # 82 64', N'7851643', N'2548635', N'veter@yahoo.com', N'hay de todo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (128, N'EXITO', 3, N'789653145', N'ISABEL', N'SANCHEZ', N'calle 75 # 82 53', N'5702638', N'2468756', N'mechas@yahoo.com', N'tiene muchas úntos exito')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (129, N'CARULLA', 4, N'79565635', N'CARMEN', N'MILLONES', N'calle 65 # 82 53', N'7896542', N'4863256', N'carulla@yahoo.com', N'tiene muchas casas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (130, N'NEXTOP', 1, N'54859865', N'JOSHEP', N'MIEL', N'calle 77 # 82 58', N'1235648', N'5698762', N'nextop@yahoo.com', N'tiene muchas lenceria')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (131, N'CARLOS', 3, N'97010413452', N'GONZALO', N'JARAMILLO', N'cll 52 # 12 b 42', N'2969636', N'3015426986', N'jaramillo@gmail.com', N'el titanic')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (132, N'DANIEL', 3, N'980215652', N'DANIEL', N'LOPEZ', N'cll 55 # 52 b 52', N'2963636', N'301564582', N'lopez@gmail.com', N'el pez')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (133, N'SEBASTIAN', 3, N'96501041365', N'SEBASTIAN', N'BERRIO', N'cll 58 # 112 b 22', N'2985634', N'3012568974', N'sebastian@gmail.com', N'mas mejor')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (134, N'ESTEBAN', 3, N'120065652', N'ESTABAN', N'CORREA', N'cll 12 # 32 b 72', N'5896352', N'3012564510', N'estaban@gmail.com', N'asi es')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (135, N'CRISTINA', 3, N'32601046552', N'CRISTINA', N'GOMEZ', N'cll 02 # 62 b 72', N'5296356', N'3012564785', N'cristina@gmail.com', N'azulito')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (136, N'DANIELA', 3, N'54011543452', N'DANIELA', N'TORRES', N'cll 62 # 22 b 02', N'2364512', N'3045896523', N'daniela@gmail.com', N'carmen')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (137, N'SANDRA', 3, N'6571054', N'SANDRA', N'MARTINEZ', N'cll 012 # 12 b 32', N'2563695', N'3025645892', N'sandra@gmail.com', N'hay hay hay')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (138, N'MARIA', 3, N'447010465', N'MARIA', N'CELIS', N'cll 53 # 20 b 10', N'5632587', N'3002154268', N'maria@gmail.com', N'el relajo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (139, N'BEATRIZ', 3, N'656010465', N'BEATRIZ', N'VALENCIA', N'cll 10 # 33 b 09', N'2928179', N'3012104563', N'beatriz@gmail.com', N'el descanso')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (140, N'MANUELA', 3, N'9860104134656', N'MANUELA', N'MORALES', N'cll 68 # 78 b 12', N'2653698', N'302154268', N'manuela@gmail.com', N'verdugos')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (141, N'SANTY', 1, N'96101114969', N'PEPITO', N'PEREZ', N'calle32 #54 18', N'6845131', N'31865454', N'Pepe@hotmail.com', N'Aprendi Mucho')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (142, N'HECTOR', 1, N'6456151', N'HECTORSITO', N'GOMEZ', N'calle52 #65 96', N'4474177', N'31874742', N'Hector@hotmail.com', N'el pro de pros')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (143, N'PABLO', 1, N'56415163', N'PABLITO HERNANDO', N'VALENCIA', N'calle51 #10 98', N'7523453', N'54141', N'Pablito@hotmail.com', N'Asi es Señores')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (144, N'ESTELLA', 1, N'5468541', N'ESTELLITA', N'CARVAJAL', N'calle78 #96 18', N'45254271', N'752542', N'Estelita@hotmail.com', N'Jodace epa')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (145, N'JINX', 1, N'8946151', N'JINXELIADORA', N'DUQUE', N'calle89 #75 115', N'86451', N'984561231', N'Jinx@hotmail.com', N'Cargado y preparado')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (146, N'LUCIAN', 1, N'561354', N'LUCHO', N'VELASQUEZ', N'calle99 #87 92', N'5423453', N'310225454', N'Luchito@hotmail.com', N'Aprendi Mucho')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (147, N'DRAVEN', 1, N'86421654', N'DRAVEN ARTURO', N'GOMEZ', N'calle71 #54 18', N'57641561', N'96846541', N'Creido@hotmail.com', N'Draven no. DRAAAAAVEN')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (148, N'EVELYN', 1, N'45274534', N'EVEE', N'ARANGO', N'calle98 #10 1558', N'8752', N'5723543', N'IVYYYY@hotmail.com', N'Arañaaaaaas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (149, N'CHOGATH', 1, N'86453453', N'CHO GATH', N'CANGREJO', N'calle12 #96 74', N'453543453', N'37865454', N'Chogi@hotmail.com', N'Muereeeeee')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (150, N'FELO', 1, N'453453453', N'FELIPE ANTONIO', N'DUQUE', N'carrera48 #96 82', N'345234', N'23456256', N'felicho@hotmail.com', N'Si señora')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (151, N'MARCELO GOMEZ', 3, N'141415', N'MARCELO', N'CESAN', N'Diagonal 14 # 33 38', N'2569856', N'3002558545', N'elmatematico@live.com', N'Solo Excelencia')
GO
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (152, N'ANGELA PINEDA', 1, N'23702024', N'ANGEL', N'GONER', N'Calle 25 # 33 14', N'4568923', N'3012568989', N'marranazo21@live.com', N'Venga A Ver')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (153, N'FRANCISCO PELON', 4, N'2860634', N'ANTONIO', N'BANDERAS', N'Carreara 10 # 14 14', N'7895622', N'3015266689', N'serna@gmail.com', N'Ahhh')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (154, N'SANDRA SARMIENTO', 1, N'86890', N'FRANCO', N'HONESTO', N'Diagonal 22 # 85 90', N'4525566', N'3088569213', N'sanfer@live.com', N'No Me Deja En Paz')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (155, N'TONY FETUCHINY', 2, N'562034', N'VANESSA', N'CESAR', N'Diagonal 45 # 45 23', N'4221010', N'4526363', N'tetiver@live.com', N'Loco')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (156, N'FRANCIA YUCA', 4, N'3043', N'JULIANA', N'SERNA', N'Diagonal 78 # 99 103', N'4236566', N'2141401', N'retro@live.com', N'Peli seco')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (157, N'TUTANCAMON ATAGUALPA', 2, N'89207', N'MARCE', N'CEDRO', N'Diagonal 456 # 37 88', N'6668520', N'3022055632', N'rutuu@live.com', N'Care Murcielago')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (158, N'DAGOBERTO GONSALEZ', 4, N'870654', N'MARTA', N'PANIAGUA', N'Diagonal 20 # 22 01', N'2642018', N'4219978', N'retifdg@live.com', N'Feo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (159, N'CAMILO ANDES', 4, N'74868406', N'MARIA', N'POSADA', N'Calle 47 # 78 85', N'2642121', N'2304050', N'lehaco@live.com', N'Toledo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (160, N'SANTIAGO TUTE', 4, N'37064', N'ANTONIA', N'RODRIGUEZ', N'Carrera 21 # 21 88', N'4523333', N'5666223', N'regno@live.com', N'Calludo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (161, N'DANILO', 1, N'35789210', N'DIOSA', N'GUTIERREZ', N'Calle 123 # 54-89', N'5281945', N'3114587425', N'Diosa@gmail.com', N'cafe')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (162, N'MEZA', 1, N'35789312', N'ALEJANDRA', N'MEZA', N'Calle 123 # 54-89', N'5289854', N'3114587894', N'mesa@gmail.com', N'leche')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (163, N'ANTONIA', 1, N'35786542', N'MARTHA', N'GUTIERREZ', N'Calle 123 # 54-89', N'5288451', N'3114582154', N'antonia@gmail.com', N'yogurt')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (164, N'CARLA', 1, N'35789854', N'LEYDI', N'ESPINOSA', N'Calle 123 # 54-89', N'5281919', N'3114581234', N'carla@gmail.com', N'milo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (165, N'IVVONE', 1, N'35788542', N'DIOSA', N'GUTIERREZ', N'Calle 123 # 54-89', N'5281936', N'3114588954', N'ivonne@gmail.com', N'gomitas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (166, N'SANTIAGO', 1, N'35789520', N'ANDRES', N'DAVID', N'Calle 123 # 54-89', N'5281984', N'3114583694', N'santiago@gmail.com', N'carne')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (168, N'BRAYAN', 1, N'35787812', N'DANIELA', N'RENTERIA', N'Calle 123 # 54-89', N'5281935', N'3114589856', N'brayan@gmail.com', N'zapateria')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (169, N'ELVIS', 1, N'35782058', N'FELIPE', N'VELEZ', N'Calle 123 # 54-89', N'5281984', N'3114589821', N'elvis@gmail.com', N'avena')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (170, N'LEIDY', 1, N'35789654', N'MILENA', N'DUQUE', N'Calle 123 # 54-89', N'5281912', N'3114583564', N'Leidy@gmail.com', N'arepas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (172, N'MATEO', 1, N'695454', N'MATIAS', N'BENITEZ', N'AV. 20 DE NOVIEMBRE NO 1053', N'913367387', N'2161136', N'mateo@gmail.com', N'es muy amable')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (174, N'GORGEL', 1, N'86092', N'GORGITO', N'VERGARA', N'AV. INDEPENDENCIA NO. 545', N'913367384', N'2161436', N'gorgel@gmail.com', N'es tigre')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (175, N'VERONICA', 1, N'10411975467', N'VERO', N'VELEZ', N'AV. INDEPENDENCIA NO. 1282-A', N'913367383', N'2192069', N'veronicao@gmail.com', N'es una persona muy olvidada')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (177, N'TABO', 1, N'87061372448', N'GUSTABO', N'OCAMPO', N'AV.INDEPENDENCIA NO.1010', N'913367379', N'3162269', N'tabo@gmail.com', N'no es compatible con sus programas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (178, N'ANGEL', 1, N'86032631756', N'JUANITO', N'CRUZ', N'AV. 5 DE MAYO NO. 1652', N'913367374', N'5262203', N'angel@gmail.com', N'tiene una cara angelical')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (179, N'SERTGIO', 1, N'88022563216', N'TATO', N'MARTINEZ', N'AV. INDEPENDENCIA NO. 748', N'913367387', N'5661069', N'sergio@gmail.com', N'tiene lindo porte')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (180, N'JUAN', 1, N'11820095', N'JUAN PABLO', N'MOSQUERA CORDOBA', N'Calle 59b #98c 07', N'2245152', N'2336965', N'Juapa@hotmail.com', N'Cafe')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (181, N'SNEIDER', 1, N'12698412', N'SNEIDER', N'DAVID VILLA', N'Calle 77 #98c 26', N'2365152', N'2425898', N'Sneider@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (182, N'DIEGO', 1, N'214568454', N'DIEGO MAURICIO', N'CARDONA CARDONA', N'Calle 78 #18c 12', N'3121069', N'3116869', N'DiegoGo@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (183, N'KATHE', 1, N'96050203640', N'KATHERINE', N'ORTIZ DUARTE', N'Calle 25b #98 45', N'3121067', N'3145698', N'Kathe@hotmail.com', N'Gomitas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (184, N'NACY', 1, N'15165641', N'NANCY LUCIA', N'GOMES', N'Calle 69b #15 07', N'4444846', N'4444748', N'Gordis@hotmail.com', N'Donals')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (185, N'SANDRITA', 1, N'12456854', N'SANDRA', N'MOSQUERA', N'Calle 49b #95 47', N'2245152', N'31546997', N'sandra@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (186, N'SERGIO', 1, N'155544662', N'SERGIO ANTONIO', N'CARO', N'Calle 20b #98c 01', N'2022645', N'4565968', N'Sergio@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (188, N'ALBERTO', 1, N'119805698', N'ALBERTO', N'CONDOR', N'Calle 103b #98c 07', N'2456898', N'2336965', N'alber@hotmail.com', N'Zapatos')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (189, N'HOMERO', 1, N'546542341', N'HOMERO', N'SIMPSON', N'Calle siempre viva 123', N'2445663', N'2689693', N'Homo@hotmail.com', N'Duff')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (200, N'JOSÉ', 1, N'4343290345', N'JOSÉ', N'VELEZ', N'Calle 30 #28 90', N'5638492', N'5638796', N'jose@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (201, N'DESMER', 1, N'654563454', N'DESMER', N'YEPES', N'Calle 30 #28 90', N'5638492', N'5638796', N'des@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (202, N'ARMANDO', 1, N'83409656', N'ARMANDO', N'CARDENAS', N'Calle 40 #28 91', N'7845564', N'4536278', N'armando@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (203, N'GERARDO', 1, N'654363454', N'GERARDO', N'DAVID', N'Calle 70 #89 90', N'5647389', N'6748593', N'gerd@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (204, N'DAMÍN', 1, N'63634645', N'DAMÍN', N'CARDONA', N'Calle 87 #29 93', N'9780463', N'5648389', N'damin@outlook.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (205, N'DUVÁN', 1, N'343296435', N'DUVÁN', N'PATIÑO', N'Calle 98 #2 54', N'4609826', N'9573648', N'duvan@yahoo.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (206, N'FRANCISCO', 1, N'634534534', N'FRANCISCO', N'RENTERÍA', N'Calle 654 #18 07', N'452893', N'9056837', N'francis@yahoo.es', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (209, N'JHOAN', 1, N'456346537', N'JHOAN', N'RUIZ', N'Calle 08 #28 70', N'1923475', N'4536789', N'jhoan@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (210, N'TOTTO', 1, N'788848633', N'ANDRÉS', N'ZAPATA', N'calle 49 # 99 E 86', N'4906895', N'3004957867', N'andres.11996@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (211, N'HOMECENTER', 2, N'343467', N'ADALVERTO', N'LAZCARRO', N'calle 67 # 54 98', N'2345442', N'31346543', N'adalverto@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (212, N'MONTERREY', 1, N'435654', N'CRISTINA', N'RUIZ', N'calle 34 # 68 E 98 interior 204', N'49065433', N'300654343', N'cris@yahoo.es', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (213, N'ALMACENES SUSCESO', 1, N'35676544', N'JUAN', N'RIOS', N'calle 65 # 67 E 88', N'4906543', N'3004957543', N'juan@gmail.es', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (214, N'MOLL METRO', 2, N'34676454', N'DUVAN', N'CARVAJAL', N'calle 67 # 65 45', N'4906895', N'3004957867', N'duvan@hotmail.es', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (215, N'NACIONAL DE CHOCOLATES', 2, N'34567654', N'FELIPE', N'MAZO', N'calle 49 # 87 E 56 interior 301', N'2563332', N'300654344', N'anfelipe64@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (216, N'LICARESDE ANTIOQUIA', 1, N'4564333', N'ORLANDO', N'RIOS', N'calle 78 # 65  97', N'49065533', N'3006545676', N'ricapalma@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (217, N'BABARIA', 1, N'45665433', N'CAMILO', N'VALENCIA', N'calle 54 # 78 AA 86', N'490556', N'30075678786', N'valencia@yahoo.es', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (218, N'POSTOBON', 2, N'346665', N'OSCAR', N'DUARTE', N'calle 65 # 75 EE 76', N'4906567', N'3004654567', N'soyemo@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (220, N'PEDRO', 1, N'543515533', N'PABLO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (221, N'EDGARDO', 2, N'543451533', N'JACINTO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (222, N'EDITH', 3, N'5431533', N'JINX', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (223, N'EDMUNDO', 4, N'5431533', N'DRAVEN', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (225, N'EFRAÍN', 2, N'5435153', N'CHOGAT', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (226, N'EFRÉN', 1, N'5451533', N'PEDRO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (227, N'ELENA', 2, N'54351233', N'PABLO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (228, N'ELEONOR', 3, N'543533', N'JOSE', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (229, N'ELÍAS', 4, N'5533', N'FRANCISCO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (230, N'ELISA', 3, N'551533', N'RODRIGO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (231, N'ELISABETH', 4, N'533', N'ANDRES', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (234, N'ELSA', 1, N'541351533', N'FELIPE', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (235, N'ELVIRA', 4, N'514351533', N'LISA', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (236, N'EMILIA', 2, N'542351533', N'LEIDY', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (237, N'EMILIO', 4, N'5433351533', N'RUBEN', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (238, N'EMA', 1, N'5435153348', N'SEBAS', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (239, N'EMANUEL', 2, N'54351581233', N'LEON', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (241, N'ENCARNACIÓN', 2, N'543577', N'DIEGO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (242, N'ENGRACIA', 2, N'5435155553', N'ISA', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (243, N'ENRIQUE', 2, N'54666663', N'MARIA', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (244, N'ERASMO', 2, N'511133', N'MARIANA', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (245, N'ERICO', 2, N'5777533', N'BRAYAN', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (246, N'ERIC', 2, N'599533', N'ESTEBAN', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (247, N'ERICA', 2, N'53351533', N'ESNEIDER', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (248, N'ERNESTO', 2, N'4351533', N'CARLOS', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (249, N'ESMERALDA', 2, N'43551533', N'DAVID', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (250, N'ESPERANZA', 2, N'5162533', N'CAMILO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (252, N'ESTEFANÍA', 2, N'5441533', N'JEAN', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (253, N'ESTELA', 1, N'54399', N'ARMANDO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (254, N'ESTER', 1, N'5433', N'CABEZON', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (255, N'ETEL', 1, N'33', N'DROGBA', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (256, N'EUCLIDES', 1, N'58121533', N'ALONZO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (257, N'EUDOSIA', 1, N'588833', N'DEISY', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (258, N'EUDOXIO', 1, N'9991533', N'JAINIVER', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (259, N'EUFEMIO', 1, N'99933', N'JANIER', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (260, N'EUFEMIA', 1, N'6651533', N'ESTIVEN', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (261, N'EUFRASIO', 1, N'774351533', N'NOEMY', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (262, N'EUFRASIA', 1, N'54354', N'PABLO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (263, N'EUGENIO', 1, N'845', N'VANESA', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (264, N'EULALIA', 1, N'515412', N'SANTIAGO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (265, N'EUSEBIO', 1, N'654141', N'PABLO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (266, N'EVA', 1, N'654156', N'DANIEL', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (267, N'EVANGELINA', 1, N'56415410', N'EVE', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (268, N'EVARISTO', 1, N'8451', N'KATE', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (269, N'EZEQUIEL', 1, N'3541', N'PABLO', N'ARTURO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (274, N'COCA-COLA', 2, N'4563256', N'JUAN', N'PEREZ', N'cra 52 # 36 65', N'2369854', N'2569684', N'juancocacola@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (276, N'JEF', 2, N'2563984', N'SANDRA', N'MARTINEZ', N'calle 58 # 32 56', N'2605689', N'3125698745', N'jef@yahoo.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (278, N'NESTLE', 2, N'235689', N'PEDRO', N'PAEZ', N'cra 78 # 45 65', N'2605896', N'3125698745', N'Nestle@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (279, N'P&G', 2, N'2356974', N'ANDRES', N'MURILLO', N'cra 85 # 23 46', N'2605983', N'3135698745', N'P&G@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (280, N'TUMIX', 2, N'71564985', N'MANUEL', N'MORALES', N'calle 52 # 56 56', N'4258965', N'2609586', N'Tumix@gmail.com', N'')
GO
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (281, N'RED BULL', 2, N'56985625', N'ANDREA', N'MEJIA', N'cra 23 # 74 75', N'4364985', N'2309568', N'RedBull@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (282, N'COLGATE', 2, N'7385694', N'GUILLERMO', N'QUIENTERO', N'cra 78 # 12 11', N'4365896', N'2605412', N'Colgate@gmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (283, N'EPSON', 2, N'1236548', N'RODRIGO', N'FERNANDEZ', N'calle 24 # 89 99', N'3135698423', N'3125469856', N'EPSON@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (284, N'BEBIDAS RAMAHAT', 1, N'1036659420', N'SEBASTIAN', N'VALLEJO VILLA', N'Cra 54 D # 10 - 18', N'2550007', N'3187490006', N'sebasv511@gmail.com', N'Bebida hindu')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (285, N'COCOS JUANMA', 1, N'96458410', N'JUAN MANUEL', N'SANTOS CALDERON', N'cll 23# 43 - 10', N'3645211', N'3125487522', N'presidente-Chuki@yahoo.com', N'los cocos del presi')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (286, N'PAPAS ZULU', 1, N'74528621', N'JUAN CARLOS', N'ZULUAGA CARDONA', N'cra 56# 78-45', N'3654122', N'3125419855', N'juanzuluaga@gmail.com', N'Hechas en Manrique')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (287, N'CHONTADURO SA', 1, N'1036452177', N'ARNULIO', N'RAMIREZ GUISAO', N'cra 34 B # 66 - 89', N'2364522', N'3147854120', N'RasTasTas@hotmail.es', N'Arnulito RasTasTas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (288, N'SALCHICHONCHON', 1, N'1035478210', N'DAVID FERNANDO', N'ESCOBAR GAVIRIA', N'cra 45# 77-12', N'2557410', N'3018564211', N'salchi-chon@gmail.com', N'Hecho en Manrique')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (289, N'AUTOPARTES EL PETIRROJO', 1, N'1036659411', N'ANDRES', N'ZAPATA ZAPATA', N'av. 15# 12-89', N'3614788', N'3147520000', N'andrespartes@hotmail.es', N'Partes para renault 4 ')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (290, N'CHOCHIS TOCINOS', 1, N'1036542210', N'CAMILO', N'RIOS TORRES', N'cra33# 98-07', N'3697844', N'3102568841', N'chochis-cr10@gmail.com', N'Solo talento con el cr10')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (291, N'COSMETICOS LA JUANDA', 1, N'1216717716', N'JUAN DAVID', N'QUINTERO HERNANDEZ', N'cra 34# 23-12', N'3254788', N'3102548862', N'elNegritoJuanda@gmail.com', N'cosmeticos del negrito')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (292, N'LICORES JF', 1, N'1036659842', N'SEBASTIAN', N'OROZCO MENDEZ', N'cll 25# 78 - 101', N'2558944', N'3114860058', N'sebasTatabro@gmail.com', N'Si tiene esas gafas, dejalo ir')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (293, N'PANADERIA BERRIO', 1, N'1032548852', N'CARLOS ALBERTO', N'BERRIO BERMUDEZ', N'cra 67# 54-33', N'2584410', N'3115994120', N'panBerrio@hotmail.es', N'Pan fresco')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (294, N'SALCHICHONERIA J', 2, N'102000', N'ANDRES FELIPE', N'CARMONA', N'Calle 56 N 32-12', N'4540234', N'3015948758', N'duquefelipe95@gmail.com', N'Es muy grande')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (296, N'CARNES Y CARNES', 2, N'102645', N'JUAN', N'CORREA', N'Calle 45 N 12-65', N'8885566', N'3147578996', N'carnesycarnes@gmail.com', N'Las mejores carnes')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (297, N'LEGUMBRES PLAZA', 2, N'16564', N'CARLOS', N'ZULUAGA', N'Carrera 65 N 21-45', N'2232565', N'3102563668', N'legumbreria@gmail.com', N'Las mejores verduras')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (298, N'SALSAS FRUCO', 2, N'664685', N'LEIDY', N'LOPERA', N'Carrera 98 N 13-48', N'2223364', N'3147599669', N'frucoysustesos@gmail.com', N'Las salsas mas bravas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (299, N'DEPOSITO LOPEZ', 2, N'12345', N'GUSTAVO', N'LOPEZ', N'Carrera 46 N 78-25', N'4569878', N'3185632521', N'depositogustavo@gmail.com', N'Las herramientas mas practicas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (300, N'ZAPATERIA SANTI', 2, N'266656', N'SANTIAGO', N'CARVAJAL', N'Calle 69 N 98-27', N'5699878', N'3147896563', N'santiagocarvajal@gmail.com', N'Los zapatos mas comodos')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (301, N'COSMETICOS VERA', 2, N'646495', N'DIDIER', N'VERA', N'Calle 67 N 46-32', N'2366595', N'3117705509', N'cosmeticos54@gmail.com', N'El mejor maquillaje')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (302, N'DESODORANTES FELIPE', 2, N'123654', N'FELIPE', N'CARDONA', N'Carrera 78 N 65-32', N'4540234', N'3117705898', N'felipe879@gmail.com', N'Los mejores desodorantes')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (303, N'LISA Y SUS OBLEAS', 2, N'265655', N'LISA', N'AMELINES', N'Carrera 54 N 69-37', N'8966535', N'3148966562', N'lisaysusobleas@gmail.com', N'Las obleas mas ricas')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (305, N'NACIONAL DE CHOCOLATE', 2, N'163554155', N'CAMILO', N'MARTINEZ', N'Carrera 53 # 54 41', N'5212321', N'3218665527', N'camilo@gmail.com', N'Es Nutritivo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (306, N'DIRECTV', 3, N'486845328', N'SANTIAGO', N'UPEGUI', N'Carrera 54 # 45 54', N'5542245', N'3115655454', N'santiago@gmail.com', N'Mas Nitida Su Vision')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (307, N'BANCO DE OCCIDENTE', 2, N'489465452', N'SERGIO', N'VELEZ', N'Carrera 46 # 42 32', N'5454411', N'3214874544', N'sergio@gmail.com', N'Mas Seguro Su Dinero')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (309, N'GASEOSAS DE OCCIDENTE', 4, N'484444444', N'DANIEL', N'ORREGO', N'Carrera 55 # 56 42', N'5534444', N'3144567257', N'daniel@gmail.com', N'Super Refrescante')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (310, N'TELEFONIA MAOVISTAR', 4, N'484845552', N'CRISTIAN', N'TORO', N'Carrera 75 # 97 58', N'2656644', N'3114455698', N'cristian@gmail.com', N'Mas Efectiva Su Llamada')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (311, N'CLARO', 1, N'487554552', N'ANDRES', N'GONZALEZ', N'Carrera 54 # 45 57', N'2745244', N'3125452545', N'andres@gmail.com', N'Una Señal Muy Viable')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (312, N'TIGO', 2, N'487465554', N'MAURICIO', N'CALVO', N'Carrera 59 # 48 44', N'4585871', N'3125447789', N'mauricio@gmail.com', N'Minutos Mas Baratos')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (313, N'EPM', 1, N'847885552', N'DARIO', N'CARO', N'Carrera 78 # 56 55', N'267456', N'3114578963', N'dario@gmail.com', N'Un Mejor Servicio Para Su Hogar')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (314, N'COCA COLA', 4, N'897771225', N'FELIPE', N'CIFUENTES', N'Carrera 87 # 74 54', N'214425', N'3145896354', N'felipe@gmail.com', N'Bebida Que Te Hidrata')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (317, N'ADIDAS', 1, N'94782593', N'JULIANA', N'TELOUNDO', N' CALLE 35 # 98-06', N'9805786', N'5789549', N'TELOUNDOJULIANA@GMAIL.COM', NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (322, N'P & G', 1, N'97573954', N'EDGAR', N'GAJO', N'CALLE 79 # 67-129', N'67400753', N'38384199', N'EDGAR@HOTMAIL.COM', NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (325, N'JOHNSON & JOHNSON', 1, N'4855465463', N'ELVIO', N'LADO', N'CALLE 87 # 93 -20', N'3364656', N'148054567', N'PEREZFELIPE@GMAIL.COM', NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (326, N'CENTRO DE COMERCIO LA IGUANÁ', 2, N'920145996', N'TARCICIO', N'GONZALEZ', N'Cra 23 # 12A - 24', N'2342985', N'3215654785', N'Tarcicio@iguana.es', N'compra mucha hierba buena')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (327, N'PARRANDA EN EL CAFETAL', 1, N'906545788', N'JORGE', N'CELEDON', N'Circular 90 con la 33B', N'3046665', N'3016549877', N'Jorge@Cafetal.es', N'se vende mucho licor')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (328, N'LA TERTULIA', 2, N'26031548', N'OLGA', N'HERNANDEZ', N'Cra 23A # 57 - 27', N'3662854', N'3216548231', N'OrgaH@Tertulia.es', N'las gaseosas son su principal producto')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (329, N'PANADERÍA JUANA DE ARCO', 1, N'30254801', N'JUANA', N'LOZANO', N'Cl 29A  95-59', N'2314568', N'3012554788', N'Juana@delArco.es', N'llevan mucha arina de trigo')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (330, N'LICORES LA 80', 2, N'25488745', N'PATRICIO', N'DEL MAR', N'Av 83 # 15 - 47', N'2445778', N'3024556845', N'Patricio@Licor80.es', N'si principal producto de venta es el ron')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (331, N'MILOS DE LUCHO', 1, N'25449556', N'LUIS', N'FABIAN', N'Cl 32B # 10 - 65', N'23458874', N'3036548865', N'LuisF@MilosL.com', N'Leche en polvo y milo por kg')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (332, N'PICAPIEDRAS', 2, N'095641221', N'CECILIA', N'RODRIGUEZ', N'Cra 25A # 51 - 31', N'2355647', N'3045699854', N'Cecilia.21@pica.es', N'papitas YUPI y Productos postobon')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (333, N'PLAZA MAYORITATIA', 1, N'24121994', N'PABLO', N'LEON JARAMILLO', N'Cra 82 N° 26A', N'2331145', N'3156512123', N'Pablo@leonj.com', N'Frutas y verduras')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (334, N'LOS PASTELES DE COLINAS', 2, N'3221155', N'LILIANA', N'AGUDELO', N'Cra 31 # 32 - 21', N'3221455', N'3214556987', N'LiliAgu@pascol.com', N'Pasteles de la mejor calidad')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (335, N'LICORES', 1, N'146489564', N'MANUELA', N'PADIERNA', N'Calle 69b #78c 06', N'2342202', N'2211106', N'Manu@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (336, N'PAPELERIA', 1, N'112555445', N'JEAN CARLOS', N'MOSQUERA', N'Calle 11 #96 26', N'2455152', N'4445898', N'jean@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (337, N'CHOCOLATES', 1, N'216984454', N'LISA', N'SIMPSON', N'Calle 46 #15a 12', N'3129865', N'2456869', N'lisa@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (338, N'NOEL', 1, N'94523640', N'LUISA FERNADA', N'AGUDELO', N'Calle 68b #49c 45', N'3121867', N'3145642', N'Luisa@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (339, N'VERDURAS', 1, N'16489464', N'OLGA', N'PEREZ', N'Calle 45a #15b 19', N'4698846', N'4445748', N'Verduras@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (340, N'PANADERIA', 1, N'12479854', N'DIDIER', N'VERA', N'Calle 56a #05 47', N'2356152', N'2674699', N'Didier@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (343, N'CIGARRILLOS', 1, N'119554698', N'JULINA', N'PATIÑO', N'Calle 106a #98b 07', N'2696898', N'2336455', N'juli@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (344, N'RELOJES', 1, N'54652345', N'MARI', N'MISAKI', N'Calle 98b #07 123', N'2455663', N'2629693', N'maria@hotmail.com', N'')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (345, N'KAREN', 1, N'32545681', N'CARDONA', N'LOPES', N'Calle 123 # 54-89', N'2281945', N'3104587425', N'Karen@gmail.com', N'Leche')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (355, N'SAN PACHO FIESTERO', 1, N'1524455649', N'JULIAN', N'MONTLLA', N'Cl56 # 45 a 65', N'3422156', N'2563214', N'Sanpacho20@gmail.com', N'El mejor De los Bundes')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (356, N'JOE MIX', 1, N'6543516', N'EDUARDO', N'PADIERMA', N'Cl80 # 35 a 25', N'3022012', N'3019874', N'JoeMix@gmail.com', N'El mejor Restaurante de la 80')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (357, N'PIZZA DOBLE PIZZA', 1, N'1524566908', N'SANTIAGO', N'MORENO', N'Cl80 # 63 - 95', N'3002532', N'3101541', N'PizzaDoblePizza@gmail.com', N'La mejor Pizza de la  80')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (358, N'POLLOS MARIO', 1, N'4513646', N'SNAIDER', N'HERNADEZ', N'Cl70 # 70 a 85', N'1356235', N'5512522', N'PollosMario@gmail.com', N'Sabor del Campo ')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (359, N'COME PUES', 1, N'2554136431', N'FELIPE', N'ZALASAR', N'Cl70 # 75 a 80', N'5616463', N'5226530', N'ComePues@gmail.com', N'Sabor de la Casa ')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (360, N'CHORICERIA', 1, N'4962294', N'SANIER', N'MONSALVE', N'Cl60 # 65 a 70', N'6249620', N'6157820', N'Choriceria@gmail.com', N'Chorisos frescos ')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (361, N'VASO DE LECHE', 1, N'1202567813', N'SARA', N'LOPERA', N'Cl36 # 45 a 60', N'2645891', N'6451023', N'Vaso de leche@gmail.com', N'Restaurante Campestre ')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (362, N'LOS CUATES', 1, N'3145679021', N'DANIELA', N'CEBALLOS', N'Cl80 #  75 a 56', N'8462103', N'4697801', N'LosCuates@gmail.com', N'Licorera Los cuates')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (363, N'EL PLANTIO', 1, N'1546327', N'CRISTINA', N'MOLINA', N'Cl45 #  50 a 60', N'1264782', N'5641230', N'ElPlantio@gmail.com', N'Mini mercado familiar ')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (364, N'CARNELLY', 1, N'1254307895', N'TOMASA', N'FLORES', N'Cl35 #  55 a 40', N'3642015', N'7812064', N'Carnelly@gmail.com', N' Carnes frias')
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (365, N'SINGUENTHON', 1, N'4654654', N'SINGUENTHON', N'GONZALES', N'CALLE 90 NO 65 APT 201', N'28781424', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (367, N'COLORADO', 1, N'10011116685', N'COLORADO', N'REINOS', N'CALLE 90 NO 65 APT 201', N'98711778', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (368, N'ANAFE', 1, N'8687921621', N'ANAFE', N'DOMINGUEZ', N'CALLE 90 NO 65 APT 201', N'957477385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (369, N'AMARILLO', 1, N'8606541', N'POLANCO', N'FLORIAN', N'CALLE 90 NO 65 APT 201', N'987414', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (370, N'PELAO', 1, N'6571467', N'DE LA ROSA', N'RAMIREZ', N'CALLE 90 NO 65 APT 201', N'915743', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (371, N'ELTON', 1, N'1567163', N'JHON', N'OROZCO', N'CALLE 90 NO 65 APT 201', N'9574483', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (372, N'BRUCE', 1, N'868715648', N'LEE', N'CABRERA', N'CALLE 90 NO 65 APT 201', N'454855379', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (373, N'TOSHIBA', 1, N'6587266', N'FIDELINA', N'PERALTA', N'CALLE 90 NO 65 APT 201', N'92544474', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (374, N'CHICLE', 1, N'865761656', N'FAUSTINO', N'FOSTEN', N'CALLE 90 NO 65 APT 201', N'1741187', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (375, N'TEAMO', 1, N'6657962165', N'AMADOR', N'MONTERO', N'CALLE 90 NO 65 APT 201', N'5758485', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (376, N'PAPASITO', 1, N'8974195+4', N'TOMI', N'YOIS', N'CALLE 90 NO 65 APT 201', N'97417185', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (378, N'NUEVECITA', 1, N'5676126 ', N'SANTANA', N'COLON', N'CALLE 90 NO 65 APT 201', N'65487485', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (379, N'PELIGROSO', 1, N'6576857', N'SUERO', N'NOBOA', N'CALLE 90 NO 65 APT 201', N'5464185', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (380, N'MICHAEL', 1, N'987189002', N'JORDAN', N'ABREU', N'CALLE 90 NO 65 APT 201', N'9165498', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (381, N'CUCA', 1, N'6871363808', N'ALTAGRACIA', N'FELIZ', N'CALLE 90 NO 65 APT 208', N'98971215', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (382, N'CHUCHA', 1, N'86571065', N'COLON', N'GRACIA', N'CALLE 90 NO 65 APT 208', N'987217385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (383, N'BARNEY', 1, N'89154555', N'FRANCIS', N'DELA CRUZ', N'CALLE 90 NO 65 APT 201', N'65751485', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (384, N'FRANCIS', 1, N'567182999', N'FRANCOURT', N'PARTO', N'CALLE 90 NO 65 APT 201', N'95498385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (385, N'ANAL', 1, N'564056795', N'RAFAEL', N'TEJEDA', N'CALLE 90 NO 65 APT 201', N'96545945', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (387, N'WISTON', 1, N'896571377', N'CHURCHIL', N'MERCEDES', N'CALLE 90 NO 65 APT 201', N'65718785', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (388, N'POPOLON', 1, N'96878726 ', N'ROSARIO', N'LEDESMA', N'CALLE 90 NO 65 APT 205', N'478515', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (389, N'WACHI', 1, N'681106', N'VERGA', N'FORTUNA', N'CALLE 90 NO 65 APT 203', N'9657385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (390, N'JUAREZ', 1, N'87187002', N'DISNEY', N'LANDYA', N'CALLE 90 NO 65 APT 207', N'913657385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (391, N'FLORES', 1, N'564713808', N'VALGAZ', N'ALAVA', N'CALLE 90 NO 65 APT 207', N'913359385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (392, N'USNAVY', 1, N'68717765', N'MARINA', N'PEREZ', N'CALLE 90 NO 65 APT 209', N'9133647385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (393, N'EMAIL', 1, N'657155', N'BARBOSA', N'SUAREZ', N'CALLE 90 NO 65 APT 210', N'917821385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (394, N'LUISA', 1, N'96871326', N'SELMIRA', N'WALTER', N'CALLE 90 NO 65 APT 221', N'9147385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (395, N'VOLTAIRE', 1, N'56715651', N'EDILIA', N'BONO', N'Carrera 13, nº 26-62', N'5721567385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (396, N'EMIGDI', 1, N'86756456', N'LISIÓN', N'LONDOÑO', N'Carrera 13, nº 26-62', N'913367385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (397, N'CEVISNE', 1, N'6515154815', N'CRISPÍN', N'GLAY', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (398, N'ABDÓN', 1, N'5671416 ', N'CLEMENTE', N'RINGO', N'Carrera 13, nº 26-62', N'913367385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (399, N'AGAPITO', 1, N'65761561', N'SANTA', N'CASIMIRO', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (400, N'ASTERIO', 1, N'56765168', N'CARPULINA', N'CONDORAZO', N'Carrera 13, nº 26-62', N'913367385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (401, N'CANCIO', 1, N'356718654', N'CECILIO', N'CARDONA', N'Carrera 13, nº 26-62', N'913367385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (402, N'CECILIO', 1, N'26657', N'WOVER', N'DOMICIANO', N'Carrera 13, nº 26-62', N'913367385', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (403, N'DEOGRACIAS', 1, N'656715665', N'BARTOLO', N'BLANCA', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (404, N'DIONISIO', 1, N'649875', N'BARTOLO', N'BLANCA', N'Carrera 13, nº 26-62', N'57 334 250', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IDRol], [Descripcion]) VALUES (1, N'Gerente')
INSERT [dbo].[Rol] ([IDRol], [Descripcion]) VALUES (2, N'Administrador de inventarios')
INSERT [dbo].[Rol] ([IDRol], [Descripcion]) VALUES (3, N'Cajero')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[TipoDocumento] ON 

INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (1, N'Cédula de Ciudadanía')
INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (2, N'NIT')
INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (3, N'Tarjeta de Identidad')
INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (4, N'Cédula de Extranjería')
SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'aeq_01', N'Armando Esteban', N'Quito', N'258', CAST(0xA2380B00 AS Date), 1, N'AEQ@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'ag_10', N'Alejandro', N'Grisales', N'960', CAST(0x05390B00 AS Date), 1, N'Alejo10@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'akuma', N'gabriel', N'escobar', N'21515', CAST(0x21380B00 AS Date), 2, N'akuma@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'ale', N'alejandra', N'amaya castrillon', N'123456', CAST(0x24380B00 AS Date), 3, N'aleja3215@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'aleja', N'Aleja', N'Upegui', N'ale123', CAST(0xBC380B00 AS Date), 2, N'ale@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'alejandra', N'alejandra ', N'cardona munera', N'17', CAST(0xBC380B00 AS Date), 1, N'alejandra@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Alex', N'Alexander', N'Lezcano', N'lute44', CAST(0xDC380B00 AS Date), 1, N'lili@Yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Alexis', N'Alexis', N'Osorio', N'boica125', CAST(0xDC380B00 AS Date), 1, N'boica@Yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'allen', N'jose', N'estrada', N'21515', CAST(0x21380B00 AS Date), 2, N'allen@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'ana', N'Ana', N'Cordoba', N'ana123', CAST(0xD8380B00 AS Date), 2, N'Anita@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'and', N'andres', N'rios', N'125453', CAST(0x08340B00 AS Date), 2, N'andreszz@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'AndiMuñe', N'Andrea', N'Muñetón', N'245', CAST(0xF2380B00 AS Date), 1, N'Andimuñe@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Andres', N'Felipe', N'Ospina Ospina', N'10201', CAST(0x01380B00 AS Date), 1, N'felipe@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'andresP', N'Andres', N'Puerta', N'255', CAST(0x6F380B00 AS Date), 1, N'ElDoor@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'angel', N'Angel', N'Miguel', N'angel24', CAST(0xBC380B00 AS Date), 1, N'darem189.@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'angie', N'angie', N'sepulveda', N'321458', CAST(0x6B390B00 AS Date), 1, N'paolasepulveda@yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'anselmo', N'Anselmo', N'Mosquera', N'Ansel123', CAST(0xD8380B00 AS Date), 3, N'Anselmito@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'antonella', N'Fontana', N'Patiño', N'123', CAST(0xDC380B00 AS Date), 1, N'andrea@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'antoni', N'antonio', N'maso mesa', N'12315545', CAST(0x2E380B00 AS Date), 3, N'anmesa11@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'apache', N'juan', N'quintero', N'124', CAST(0xBC380B00 AS Date), 2, N'elapache345@yahoo.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'argelina', N'Argelina', N'Tutancamon', N'Argelina14', CAST(0xBC380B00 AS Date), 3, N'flacu@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'au', N'li', N'ea', N'ju7', CAST(0x333A0B00 AS Date), 1, N'sa@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'aura', N'aura', N'garcia', N'756321', CAST(0xC7330B00 AS Date), 1, N'auriita22@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'brayan', N'brayan ', N'guarin celis', N'11', CAST(0xBC380B00 AS Date), 1, N'brayan@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'brenda', N'Dahiana', N'castaño', N'123', CAST(0xDC380B00 AS Date), 1, N'Dahiana@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'bulterri', N'orlando', N'higinio', N'3452', CAST(0xBC380B00 AS Date), 3, N'ricapalma@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'c', N'calos', N'esbam', N'carlos67', CAST(0x333A0B00 AS Date), 1, N'carlos@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA12', N'CAROLINA', N'NAVARRETE', N'123', CAST(0x14390B00 AS Date), 1, N'caro12@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA13', N'SUSANA', N'ESPAÑA', N'454632', CAST(0x13370B00 AS Date), 3, N'SUSANA@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA14', N'CARLOS', N'SANCHEZ', N'12443', CAST(0xDD350B00 AS Date), 2, N'carlos13@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA15', N'MARTHA', N'GALLEGO', N'121543', CAST(0x23380B00 AS Date), 2, N'marthanj@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA16', N'SOFIA', N'ZULUAGA', N'128743', CAST(0xD5360B00 AS Date), 1, N'sofia@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA17', N'MATIAS', N'LOPEZ', N'1226543', CAST(0x5C380B00 AS Date), 3, N'matiaslopez@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA18', N'RABIT', N'SENA', N'45564', CAST(0xC8350B00 AS Date), 1, N'rabitse@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA19', N'RICHAR', N'SERNA', N'1548', CAST(0xF4350B00 AS Date), 3, N'richarser@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA20', N'CAMILO', N'NAVA', N'6565', CAST(0xA4370B00 AS Date), 2, N'camilona@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CA21', N'YESENIA', N'BETANCURT', N'5485', CAST(0x62380B00 AS Date), 1, N'yeseniabe@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'caiyu', N'caillou', N'bolivar', N'1414', CAST(0xBC380B00 AS Date), 1, N'caillou@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'calvato', N'Carla', N'Duque', N'1111111', CAST(0x202B0B00 AS Date), 1, N'amat@redestb.es ')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'cam', N'camilo', N'alzate', N'134323', CAST(0xF9360B00 AS Date), 2, N'camiloalt@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'cami', N'camila', N'tobon', N'12543', CAST(0xCB380B00 AS Date), 2, N'camilaaa@hotmail..com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'camilo', N'camilo ', N'celis correa', N'14', CAST(0xBC380B00 AS Date), 1, N'camilo@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'camio', N'Camilo', N'Garcia', N'Camilo123', CAST(0xD8380B00 AS Date), 2, N'Cami@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'car', N'carlos', N'berrio', N'123', CAST(0x041D0B00 AS Date), 2, N'carlosops39@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Carito15', N'Carolina', N'Zafra', N'468', CAST(0x7F380B00 AS Date), 1, N'CZG15@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'carla', N'carla', N'jimenezcorrales', N'125879', CAST(0x162A0B00 AS Date), 1, N'carlajimenez@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'carlitos', N'daniel', N'el travieso', N'1515', CAST(0xBC380B00 AS Date), 1, N'eltravieso@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'carlo', N'Carlos', N'Menez', N'4526444444', CAST(0x431D0B00 AS Date), 3, N'miloud_6@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'carlopan', N'juan', N'kiki', N'camilo7', CAST(0x333A0B00 AS Date), 3, N'camio@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Carlos', N'Mario', N'Arango Alvarez', N'161616', CAST(0x88380B00 AS Date), 1, N'carlo@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'CarlosB2', N'Carlos', N'Berrío', N'349', CAST(0x0F380B00 AS Date), 1, N'CBB2@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'carloseste', N'carlos', N'estebam', N'carlos67', CAST(0x333A0B00 AS Date), 1, N'carlos@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Caro', N'Carolina', N'Zafra', N'caro4', CAST(0xDC380B00 AS Date), 2, N'Caro@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'cbas', N'sebastian', N'orozco mendez', N'12345', CAST(0x99380B00 AS Date), 1, N'somdap9002@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'cell', N'juana', N'teran', N'21515', CAST(0x21380B00 AS Date), 2, N'cell@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'chavo', N'del ocho', N'bernal', N'1212', CAST(0xBC380B00 AS Date), 1, N'chavito@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Chonli', N'David Fernando', N'Escobar', N'547', CAST(0xA8380B00 AS Date), 1, N'sal-chi-CHON@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Claudia', N'Isabel', N'Ospina Ospina', N'121212', CAST(0x8D380B00 AS Date), 1, N'claudia02@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'cn', N'jn', N'kki', N'cam', CAST(0x333A0B00 AS Date), 1, N'camio@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'crack', N'Anabel', N'Ochoa', N'nim9', CAST(0x36390B00 AS Date), 1, N'frodo@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'cris', N'cristina', N'rios', N'5237', CAST(0xBC380B00 AS Date), 1, N'criss8541@yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'cristian', N'Cristian', N'Cardona', N'cris123', CAST(0xBC380B00 AS Date), 2, N'cris@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'dairo', N'Dairo', N'Lozano', N'dairo123', CAST(0xBC380B00 AS Date), 2, N'Dairo@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'dani', N'daniela', N'godoy', N'741', CAST(0xBC380B00 AS Date), 3, N'DannyBotero@yahoo.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'daniel', N'Daniel', N'Valderrama', N'daniel1236', CAST(0xBC380B00 AS Date), 1, N'tofo@yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'DanielRXN', N'Daniel', N'Varela', N'666', CAST(0x07380B00 AS Date), 1, N'danireloko10@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'dav', N'David', N'Maya', N'dav123', CAST(0xBC380B00 AS Date), 2, N'maya@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Davia', N'Alexander', N'Davi', N'7', CAST(0x9A360B00 AS Date), 3, N'Davi1@yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'David', N'Alonzo', N'Alonzo', N'9421', CAST(0x03380B00 AS Date), 2, N'Alonzo-2@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'daviid', N'juan', N'quintero', N'246', CAST(0xF2380B00 AS Date), 1, N'juan_123@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'dian', N'diana', N'restrepo uribe', N'351562345', CAST(0x64360B00 AS Date), 3, N'dianreui54@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'did', N'Didier', N'Vera', N'did123', CAST(0xBC380B00 AS Date), 1, N'didiervera@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'did965421', N'Didier vera', N'Vera zapata', N'di0013', CAST(0xBC380B00 AS Date), 1, N'didiervera@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'didier', N'Didier', N'Vera', N'didier123', CAST(0xBC380B00 AS Date), 1, N'didier@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'diego', N'Diego', N'Duque', N'123', CAST(0x3A380B00 AS Date), 2, N'diegomdc@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'diomes', N'David', N'Lopez', N'123', CAST(0xDC380B00 AS Date), 1, N'Lopez@Gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Dur', N'Durley', N'Lopez', N'dur123', CAST(0xBC380B00 AS Date), 3, N'durley@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'durley', N'Durley', N'Alzate', N'dur123', CAST(0xBC380B00 AS Date), 3, N'dur@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Edali', N'Edali', N'Guarin', N'5456215', CAST(0xF1CC3500 AS Date), 1, N'Edali@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'EDQT', N'Eimy', N'Quintero', N'158', CAST(0x55390B00 AS Date), 1, N'ed-qt@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Elkin', N'Duvan', N'Alsate', N'9021', CAST(0x96380B00 AS Date), 3, N'Elkin45@yahoo.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'ElNegro', N'fabian', N'mosquera', N'145', CAST(0xBC380B00 AS Date), 2, N'elnegromosquera@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'elv', N'Elvis', N'Mieles', N'elv123', CAST(0xBC380B00 AS Date), 2, N'elvismieles@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Elvis', N'Brayan,', N'Martinez', N'1234', CAST(0x59390B00 AS Date), 1, N'postocola@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'ElZulu', N'Juan Carlos', N'Zuluaga', N'459', CAST(0xC7380B00 AS Date), 1, N'Señor-incitador@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'enriquery', N'Enrique', N'Cardona', N'01234', CAST(0x0B240B00 AS Date), 3, N'amanchon@uf-isf.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Erika', N'Maria', N'Hernandez Ospina', N'123456', CAST(0x1E380B00 AS Date), 1, N'ainsen01@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Esneider', N'Juan', N'Ochoa', N'1234', CAST(0x59390B00 AS Date), 1, N'postocola@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'esteban', N'esteban ', N'martinez mosquera', N'15', CAST(0xBC380B00 AS Date), 1, N'esteban@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'fel', N'Felipe', N'Duque', N'fel123', CAST(0xBC380B00 AS Date), 1, N'feliped@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'felipe', N'felipe', N'duque', N'365714', CAST(0xA12B0B00 AS Date), 1, N'duquefelipe@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'fernandi', N'fernando', N'maya restrepo', N'654566545', CAST(0x8C380B00 AS Date), 3, N'fermare14@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'francazo', N'Jose', N'Jimenez', N'568934620', CAST(0x01380B00 AS Date), 3, N'ifop1@cc.uab.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'frank', N'Frank', N'Smith', N'smith09', CAST(0xE2270B00 AS Date), 3, N'fra@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'frenecy', N'Bernardo', N'Cadavid', N'marcy678', CAST(0x4C2B0B00 AS Date), 2, N'yolo@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Full', N'Mateo', N'Melody', N'249', CAST(0x34360B00 AS Date), 2, N'Teo-24@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'gabriel', N'grabriel', N'velez henao', N'359475', CAST(0xBE3E0B00 AS Date), 1, N'grabiel199@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'George', N'Luis', N'George', N'3452', CAST(0x23380B00 AS Date), 1, N'George63@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'gera', N'Geralin', N'Fernandez', N'gera123.', CAST(0xC3380B00 AS Date), 3, N'gera@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'going', N'Sofia', N'Pandeagua', N'6789', CAST(0xC6320B00 AS Date), 1, N'going@gmail.com')
GO
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'goku', N'cacaroto', N'mauricio', N'1111', CAST(0xBC380B00 AS Date), 1, N'gukumauricio@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'graciela', N'Graciela', N'Lozano', N'gracie123', CAST(0xBC380B00 AS Date), 3, N'gracie@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'gui', N'Guillermo', N'Quintero', N'gui123', CAST(0xBC380B00 AS Date), 2, N'guillermo@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Guillermo', N'Guillermo', N'Quintero', N'Guille123', CAST(0xBC380B00 AS Date), 2, N'Guille@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'has', N'paul', N'oliveros', N'21515', CAST(0x21380B00 AS Date), 2, N'has@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'hero', N'Luis', N'Perez', N'0087', CAST(0x95340B00 AS Date), 3, N'hero455@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'jang', N'Suk', N'Jang', N'suki123', CAST(0xDE380B00 AS Date), 1, N'sukighs@yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'jean', N'Jean', N'Mosquera', N'jean123', CAST(0xD8380B00 AS Date), 1, N'Jean@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Jeremias', N'dario', N'Patiño', N'123', CAST(0xDC380B00 AS Date), 1, N'dario@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Jeronimo', N'Antonio', N' Ospina Serna', N'70707', CAST(0x66390B00 AS Date), 1, N'jeronimo01@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'jessica', N'jessica ', N'berrio lopez', N'19', CAST(0xBC380B00 AS Date), 1, N'jessica@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'jesus', N'Jesus', N'Gonzalez', N'Jesus123', CAST(0xD8380B00 AS Date), 1, N'Jesus@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'jhon', N'Jhon', N'Gonzalez', N'jhon123', CAST(0xD8380B00 AS Date), 2, N'Jhon@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'jimmy', N'neutron', N'el niño genio', N'1717', CAST(0xBC380B00 AS Date), 1, N'neutron@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'juan', N'Juan', N'Paniagua', N'obama35', CAST(0xBC380B00 AS Date), 1, N'mero@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'juancho', N'juan', N'ochoa rodriguez', N'123456789', CAST(0xED370B00 AS Date), 3, N'juocho21@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'juanes', N'Juanes', N'Perez', N'perez14', CAST(0xBC380B00 AS Date), 1, N'derve1@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'juanfer', N'JuanFer', N'Lozano', N'juanfer123', CAST(0xBC380B00 AS Date), 3, N'juanfer@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'juany', N'Juan', N'Gerardo', N'ger34', CAST(0x66390B00 AS Date), 2, N'juancito@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'judas', N'Estiven', N'Davd', N'123', CAST(0xDC380B00 AS Date), 2, N'andrea@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'juliana', N'juliana', N'hernandez amaya', N'5285996', CAST(0x243E0B00 AS Date), 1, N'juliana@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'julissa', N'julissa', N'gonzalez corrales', N'100389', CAST(0x802F0B00 AS Date), 1, N'julissa563@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'karen', N'karen', N'ossa', N'4321', CAST(0xBC380B00 AS Date), 2, N'karenOssa@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Kathe', N'Katherine', N'Ortiz', N'kathe123', CAST(0xBC380B00 AS Date), 1, N'Kathe@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'KchJulio', N'Julio Cesar', N'Vallejo', N'215', CAST(0xB3380B00 AS Date), 1, N'KchJulio@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Ketty', N'yurisa', N'Ketty', N'8741', CAST(0xDA380B00 AS Date), 1, N'Ketty10@yahoo.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'lau', N'laura', N'perez', N'123343', CAST(0x43390B00 AS Date), 2, N'lauraqq@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'laur', N'laura', N'tamayo rodriguez', N'12345678', CAST(0x69380B00 AS Date), 3, N'lar112@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'laura', N'Camila', N'Mazo', N'123', CAST(0xDC380B00 AS Date), 2, N'camila@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'lautrada', N'laura', N'estrada', N'juan34567', CAST(0x333A0B00 AS Date), 2, N'laurapulgarion@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'law', N'laura', N'pulgarin', N'18745', CAST(0xBC380B00 AS Date), 2, N'law4578@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'ledys', N'Ledys', N'Bedoya', N'ledys123.', CAST(0xC3380B00 AS Date), 2, N'ledys@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'lei', N'Leidy', N'lopera', N'lei123', CAST(0xBC380B00 AS Date), 3, N'leidylopera@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Leidy', N'Johana', N'Lopera Ospina', N'3311992', CAST(0x73380B00 AS Date), 1, N'liedy_01@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Lenalee ', N'mercedes', N'castro', N'21515', CAST(0x21380B00 AS Date), 2, N'Lenalee@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Lesly', N'Mardi', N'Serna Sepulveda', N'191919', CAST(0xD8370B00 AS Date), 1, N'lesly@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Li', N'Livis', N'Mieles', N'96123', CAST(0xD8DD0700 AS Date), 1, N'did@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'lillube', N'carlos', N'godoy', N'21515', CAST(0x21380B00 AS Date), 2, N'lillube@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Lisa', N'Esteban', N'Cardona', N'1234', CAST(0x59390B00 AS Date), 1, N'postocola@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'livis', N'livis', N'hermandez amaya', N'162448', CAST(0x8D380B00 AS Date), 1, N'livisamaya@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'lorena', N'Lorena', N'Mosquera', N'Lore123', CAST(0xD8380B00 AS Date), 2, N'Lore@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Luis', N'Luis', N'Renteria', N'Rente123', CAST(0xBC380B00 AS Date), 1, N'Rente@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Luis54', N'Luis', N'García', N'518', CAST(0x1C390B00 AS Date), 1, N'Luchito@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'luisa', N'luisa', N'Manco', N'luisa123', CAST(0xBC380B00 AS Date), 1, N'luisa@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'luz', N'luz', N'rodriguez', N'344589', CAST(0x802C0B00 AS Date), 1, N'luzaeta88@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'machupichu', N'geremias', N'david', N'910', CAST(0xBC380B00 AS Date), 1, N'antonio@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Maleja1', N'Maria Alejandra', N'Restrepo', N'784', CAST(0x66380B00 AS Date), 1, N'maleja89@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'manuela', N'Manuela', N'Gonzalez', N'Manu123', CAST(0xD8380B00 AS Date), 3, N'Manu@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'marcy', N'Marcy', N'Cadavid', N'marcy678', CAST(0x4C2B0B00 AS Date), 2, N'marcymasmi@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Mari', N'Maria', N'Pineda', N'marri4', CAST(0xDC380B00 AS Date), 3, N'marri@Yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'maria', N'Maria', N'Bedoya', N'bedoya1456', CAST(0xBC380B00 AS Date), 3, N'atagualpa450@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'mariaka', N'Maria', N'Josefina', N'1215698', CAST(0x1E340B00 AS Date), 2, N'arjona@oo.upc.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'marlon', N'Marlon', N'Marin', N'marlon123', CAST(0xBC380B00 AS Date), 2, N'marlon@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'mart', N'martin', N'avendaño sepulveda', N'1234567', CAST(0x84380B00 AS Date), 2, N'maranve11@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'mati', N'Matias', N'Cataño', N'mati25', CAST(0xDC380B00 AS Date), 2, N'mati@Hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Mechis', N'Mechis7', N'Mieles g', N'9552121', CAST(0x5AF23400 AS Date), 1, N'Mechis@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'meiling ', N'bruno', N'sanches', N'21515', CAST(0x21380B00 AS Date), 2, N'meiling@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'melomuch', N'Mario', N'Castañeda', N'589425620', CAST(0xE33A0B00 AS Date), 1, N'fa1cazal@uco.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'merk', N'juan', N'morales', N'21515', CAST(0x21380B00 AS Date), 2, N'merk@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'mig', N'Miguel', N'Taborda', N'mig123', CAST(0xBC380B00 AS Date), 1, N'miguel@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'miguel', N'miguel', N'urango hernandez', N'521470', CAST(0xEF2C0B00 AS Date), 1, N'miguelurango66@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'mila', N'camila', N'velez', N'1267', CAST(0xBC380B00 AS Date), 1, N'mila348@gmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'monica', N'monica ', N'torres betancur', N'16', CAST(0xBC380B00 AS Date), 1, N'monica@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'n', N'n', N'i', N'cm', CAST(0x333A0B00 AS Date), 2, N'io@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'nana', N'Adriana', N'Guzman', N'adri7895', CAST(0xDC380B00 AS Date), 1, N'adri@Yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'nancy', N'nancy ', N'tamayo munera', N'18', CAST(0xBC380B00 AS Date), 1, N'nancy@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'naruto', N'cachucho', N'uzumaki', N'1010', CAST(0xBC380B00 AS Date), 1, N'aldea@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'navas', N'Bermudez', N'Henao', N'123', CAST(0xDC380B00 AS Date), 3, N'Astrid@Gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Navelis', N'Navelies', N'NavelisMieles', N'444445', CAST(0xBC380B00 AS Date), 1, N'Nave@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Negrito', N'Juan David', N'Quintero', N'368', CAST(0x0A380B00 AS Date), 1, N'JuanSDVSF@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'nimides', N'Nimides', N'Ochoa', N'nim9', CAST(0x36390B00 AS Date), 1, N'nimi@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Olvi', N'Olvis', N'Mieles', N'Ol123', CAST(0x8E271900 AS Date), 1, N'Olvis@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Or', N'Orledis', N'Mieles', N'o123', CAST(0x043D0B00 AS Date), 1, N'Orle@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Oscar', N'Esneider', N'Martinez', N'1234', CAST(0x59390B00 AS Date), 1, N'postocola@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'paola', N'paola', N'vargas', N'895314', CAST(0x71380B00 AS Date), 1, N'paolavargas@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'patrick', N'Patrick', N'orrego', N'ptrick', CAST(0x1B390B00 AS Date), 1, N'ptctickdes@hotmail.es')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'pedro', N'Pedro', N'Picapiedra', N'pedro85', CAST(0xBC380B00 AS Date), 3, N'vilma@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'pepito', N'brayan ', N'velez tamayo', N'5678', CAST(0xBC380B00 AS Date), 1, N'brayan@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'pocoyo', N'manuel', N'mejia', N'1313', CAST(0xBC380B00 AS Date), 1, N'mefia@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'podo', N'Polo', N'Duran', N'dur6', CAST(0xDE350B00 AS Date), 2, N'podo3@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'pododo', N'Sander', N'Duran', N'dur6', CAST(0xDE350B00 AS Date), 2, N'listick3@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'polaco', N'Alejandro', N'Garcia', N'123', CAST(0xDC380B00 AS Date), 3, N'Garcia@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'rob', N'roberto', N'bermudez', N'123344', CAST(0x7F1E0B00 AS Date), 2, N'robeertooo@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Robin', N'Robin', N'Hurado', N'Hurja123', CAST(0xBC380B00 AS Date), 1, N'Robinh@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Robinson', N'Pacheco', N'Pache', N'1745', CAST(0x9E380B00 AS Date), 3, N'Pache8@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'ronal', N'Ronal', N'Fernandez', N'ronal123.', CAST(0xC3380B00 AS Date), 3, N'ronal@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'san', N'Santiago', N'Renteria', N'san123', CAST(0xBC380B00 AS Date), 3, N'santirente@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'santiago ', N'brayan', N'Henao Peres', N'12448', CAST(0xDC390B00 AS Date), 1, N'henaoperes@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'santy', N'santiago', N'sanchez', N'5421', CAST(0xBC380B00 AS Date), 3, N'santyZanchez@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'sara', N'Sara', N'Gonzalez', N'Sara123', CAST(0xD8380B00 AS Date), 3, N'Sara@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'saris', N'sarabi', N'Lezcano', N'lute44', CAST(0xDC380B00 AS Date), 1, N'lili@Yaho.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Sebas', N'Sebastian', N'Orozco', N'123', CAST(0xD0380B00 AS Date), 1, N'sebaslamancha@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Sebas511', N'Sebastián', N'Vallejo', N'285', CAST(0x83380B00 AS Date), 1, N'sebasv511@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'SebasMello', N'Sebastián', N'Bedoya', N'657', CAST(0x53390B00 AS Date), 1, N'SMello@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'sempai', N'mariana', N'gonzales', N'21515', CAST(0x21380B00 AS Date), 2, N'sempai@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Shemo', N'Sherman', N'cardenas', N'787', CAST(0x5C380B00 AS Date), 1, N'Sherman7@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Tatabro', N'Sebastian', N'Orozco', N'348', CAST(0x88370B00 AS Date), 1, N'el_cigarrero@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'tatiana', N'Tatiana', N'Mazo', N'Mazo18', CAST(0xBC380B00 AS Date), 3, N'amarteti@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Tmuñoz', N'Estefani', N'Muñóz', N'574', CAST(0xFA380B00 AS Date), 1, N'Tefany62@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'tobi', N'Tobias', N'Perez', N'0087', CAST(0x95340B00 AS Date), 3, N'tobi@gmail.com')
GO
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'TulioVII', N'Tulio', N'Bermudez', N'558', CAST(0x1B380B00 AS Date), 1, N'Tulio01@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'u', N'i', N'a', N'j7', CAST(0x333A0B00 AS Date), 2, N's@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'vale', N'Valery', N'Zuluaga', N'vale123.', CAST(0xC3380B00 AS Date), 3, N'vale@yahoo.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'valeria', N'valeria', N'gonzales', N'689723', CAST(0x593A0B00 AS Date), 1, N'valeriabebe@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'vampi', N'Edward', N'sanchez', N'kend', CAST(0x07270B00 AS Date), 3, N'k.edward@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'Vane-C', N'Vanessa', N'Calderón', N'695', CAST(0xDD380B00 AS Date), 1, N'vane-cumbias@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'victor', N'Vict', N'gomez', N'ger34', CAST(0x66390B00 AS Date), 2, N'smigolo@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'William', N'Mario', N'Lopera Gallego', N'10101', CAST(0x7F380B00 AS Date), 1, N'william@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yamile', N'Yamile', N'Romero', N'Romero33', CAST(0xBC380B00 AS Date), 2, N'alfa@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'YaruLopez', N'Adrian', N'Lopez', N'564', CAST(0x38390B00 AS Date), 1, N'elyaru@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yeison', N'Yeison', N'Mosquera', N'Yeison123', CAST(0xD8380B00 AS Date), 1, N'Yei@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yepeto', N'Julian', N'Jose', N'jose3', CAST(0xA5350B00 AS Date), 3, N'yeye@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yesica', N'Guillerma', N'David', N'123', CAST(0xDC380B00 AS Date), 2, N'Guillermagmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'YesiNB', N'Yesica', N'Nava', N'248', CAST(0xFD370B00 AS Date), 1, N'YNavaB@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yeye', N'Julian', N'Jose', N'jose3', CAST(0xA5350B00 AS Date), 3, N'yeye@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yiyi', N'Julieth', N'cortes', N'9703', CAST(0xC4380B00 AS Date), 2, N'juliethcortes19@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yola', N'Yolanda', N'Pandeagua', N'6789', CAST(0xC6320B00 AS Date), 1, N'yoyola@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'yuli', N'yuli', N'estebina lambraño', N'885623', CAST(0x6A390B00 AS Date), 1, N'yulilambraño@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'zuares', N'el mordelon', N'zuares', N'1616', CAST(0xBC380B00 AS Date), 1, N'soyelmordelon@gmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'zul', N'Juan Carlos', N'Zuluaga', N'zul123', CAST(0xBC380B00 AS Date), 2, N'zulu@hotmail.com')
INSERT [dbo].[Usuario] ([IDUsuario], [Nombres], [Apellidos], [Clave], [FechaModificacionClave], [IDRol], [Correo]) VALUES (N'zulu', N'Juan', N'Zuluaga', N'zulu123.', CAST(0xC3380B00 AS Date), 1, N'jzuluaga55@gmail.com')
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_Minimo]  DEFAULT ((0)) FOR [Minimo]
GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_Maximo]  DEFAULT ((0)) FOR [Maximo]
GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_DiasReposicion]  DEFAULT ((1)) FOR [DiasReposicion]
GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_CantidadMinima]  DEFAULT ((1)) FOR [CantidadMinima]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_Entrada]  DEFAULT ((0)) FOR [Entrada]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_Salida]  DEFAULT ((0)) FOR [Salida]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_Saldo]  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_UltimoCosto]  DEFAULT ((0)) FOR [UltimoCosto]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_CostoPromedio]  DEFAULT ((0)) FOR [CostoPromedio]
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_Medida]  DEFAULT ((1)) FOR [Medida]
GO
ALTER TABLE [dbo].[Barra]  WITH CHECK ADD  CONSTRAINT [FK_Barra_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[Barra] CHECK CONSTRAINT [FK_Barra_Producto]
GO
ALTER TABLE [dbo].[BodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_BodegaProducto_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[BodegaProducto] CHECK CONSTRAINT [FK_BodegaProducto_Bodega]
GO
ALTER TABLE [dbo].[BodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_BodegaProducto_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[BodegaProducto] CHECK CONSTRAINT [FK_BodegaProducto_Producto]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoDocumento] FOREIGN KEY([IDTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IDTipoDocumento])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoDocumento]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Bodega]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedor] ([IDProveedor])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Proveedor]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY([IDCompra])
REFERENCES [dbo].[Compra] ([IDCompra])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Compra]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Kardex]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Producto]
GO
ALTER TABLE [dbo].[DevolucionCliente]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionCliente_Venta] FOREIGN KEY([IDVenta])
REFERENCES [dbo].[Venta] ([IDVenta])
GO
ALTER TABLE [dbo].[DevolucionCliente] CHECK CONSTRAINT [FK_DevolucionCliente_Venta]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_DevolucionCliente] FOREIGN KEY([IDDevolucionCliente])
REFERENCES [dbo].[DevolucionCliente] ([IDDevolucionCliente])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_DevolucionCliente]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_Kardex]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_Producto]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_Producto1] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_Producto1]
GO
ALTER TABLE [dbo].[DevolucionProveedor]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedor_Compra] FOREIGN KEY([IDCompra])
REFERENCES [dbo].[Compra] ([IDCompra])
GO
ALTER TABLE [dbo].[DevolucionProveedor] CHECK CONSTRAINT [FK_DevolucionProveedor_Compra]
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedorDetalle_DevolucionProveedor] FOREIGN KEY([IDDevolucionProveedor])
REFERENCES [dbo].[DevolucionProveedor] ([IDDevolucionProveedor])
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle] CHECK CONSTRAINT [FK_DevolucionProveedorDetalle_DevolucionProveedor]
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedorDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle] CHECK CONSTRAINT [FK_DevolucionProveedorDetalle_Kardex]
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedorDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle] CHECK CONSTRAINT [FK_DevolucionProveedorDetalle_Producto]
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [FK_Kardex_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [FK_Kardex_Bodega]
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [FK_Kardex_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [FK_Kardex_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Departamento] FOREIGN KEY([IDDepartamento])
REFERENCES [dbo].[Departamento] ([IDDepartamento])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Departamento]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_IVA] FOREIGN KEY([IDIVA])
REFERENCES [dbo].[IVA] ([IDIVA])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_IVA]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Medida] FOREIGN KEY([IDMedida])
REFERENCES [dbo].[Medida] ([IDMedida])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Medida]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_TipoDocumento] FOREIGN KEY([IDTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IDTipoDocumento])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_TipoDocumento]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Bodega]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Concepto] FOREIGN KEY([IDConcepto])
REFERENCES [dbo].[Concepto] ([IDConcepto])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Concepto]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Kardex]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Producto]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Salida] FOREIGN KEY([IDSalida])
REFERENCES [dbo].[Salida] ([IDSalida])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Salida]
GO
ALTER TABLE [dbo].[Traslado]  WITH CHECK ADD  CONSTRAINT [FK_Traslado_Bodega] FOREIGN KEY([IDBodegaOrigen])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Traslado] CHECK CONSTRAINT [FK_Traslado_Bodega]
GO
ALTER TABLE [dbo].[Traslado]  WITH CHECK ADD  CONSTRAINT [FK_Traslado_Bodega1] FOREIGN KEY([IDBodegaDestino])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Traslado] CHECK CONSTRAINT [FK_Traslado_Bodega1]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Kardex] FOREIGN KEY([IDKardexOrigen])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Kardex]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Kardex1] FOREIGN KEY([IDKardexDestino])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Kardex1]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Producto]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Traslado] FOREIGN KEY([IDTraslado])
REFERENCES [dbo].[Traslado] ([IDTraslado])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Traslado]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IDRol])
REFERENCES [dbo].[Rol] ([IDRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Bodega]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Kardex]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Venta] FOREIGN KEY([IDVenta])
REFERENCES [dbo].[Venta] ([IDVenta])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Venta]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cliente"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClienteUnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClienteUnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Producto"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 202
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "IVA"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 156
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductoConIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductoConIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Producto"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductoUnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductoUnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Proveedor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProveedorUnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProveedorUnico'
GO
