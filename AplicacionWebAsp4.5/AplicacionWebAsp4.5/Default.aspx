<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AplicacionWebAsp4._5._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%:Title %>Sistema Facturacion</h1>
                <h2>Aplicacion permitira administrar productos clientes departamentos ivas generar facturar y obtener reportes de las mismas</h2>
            </hgroup>
            
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>We suggest the following:</h3>
    <ol class="round">
        <li class="one">
            <h5>Maestros</h5>
           
            <a href="#">Clientes</a>
            <a href="Mantenimiento/Departamentos.aspx">Departamentos</a>
            <a href="Mantenimiento/Iva.aspx">Iva</a>
             <a href="Mantenimiento/Productos.aspx">Productos</a>

            
        </li>
        <li class="two">
            <h5>Movimientos</h5>
            <a href="#">Nueva Factura</a>
            <a href="#">Reporte Facturas</a>
           
      
        </li>
        <li class="three">
            <h5>Administracion</h5>
            <a href="#">Gestion de permisos</a>
            
        </li>
    </ol>
</asp:Content>
