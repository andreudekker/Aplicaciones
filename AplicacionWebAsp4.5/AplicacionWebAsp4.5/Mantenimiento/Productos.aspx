<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="AplicacionWebAsp4._5.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 255px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Productos</h1>
    <p>
        <asp:GridView ID="gvProductos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDProducto" DataSourceID="SqlDsProductos" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Operaciones" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="IDProducto" HeaderText="IDProducto" ReadOnly="True" SortExpression="IDProducto" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Notas" HeaderText="Notas" SortExpression="Notas" />
                <asp:BoundField DataField="IDIVA" HeaderText="IDIVA" SortExpression="ID IVA" />
                <asp:BoundField DataField="IDDepartamento" HeaderText="IDDepartamento" SortExpression="IDDepartamento" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:FacturacionConnectionString1 %>" DeleteCommand="DELETE FROM [Producto] WHERE [IDProducto] = @IDProducto" InsertCommand="INSERT INTO [Producto] ([Descripcion], [Precio], [Stock], [Notas], [IDIVA], [IDDepartamento]) VALUES (@Descripcion, @Precio, @Stock, @Notas, @IDIVA, @IDDepartamento)" ProviderName="<%$ ConnectionStrings:FacturacionConnectionString1.ProviderName %>" SelectCommand="SELECT [IDProducto], [Descripcion], [Precio], [Stock], [Notas], [IDIVA], [IDDepartamento] FROM [Producto]" UpdateCommand="UPDATE [Producto] SET [Descripcion] = @Descripcion, [Precio] = @Precio, [Stock] = @Stock, [Notas] = @Notas, [IDIVA] = @IDIVA, [IDDepartamento] = @IDDepartamento WHERE [IDProducto] = @IDProducto">
            <DeleteParameters>
                <asp:Parameter Name="IDProducto" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Precio" Type="Decimal" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="Notas" Type="String" />
                <asp:Parameter Name="IDIVA" Type="Int32" />
                <asp:Parameter Name="IDDepartamento" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Precio" Type="Decimal" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="Notas" Type="String" />
                <asp:Parameter Name="IDIVA" Type="Int32" />
                <asp:Parameter Name="IDDepartamento" Type="Int32" />
                <asp:Parameter Name="IDProducto" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <table class="auto-style1">
        <tr>
            <td>Descripcion*:</td>
            <td colspan="3">
                <asp:TextBox ID="txtIDdescripcion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFValidatorIdProducto0" runat="server" ControlToValidate="txtIDdescripcion" ErrorMessage="DebeIngresarUnaDescripcion" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Precio*:</td>
            <td>
                <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFValidatorIdProducto1" runat="server" ControlToValidate="txtPrecio" ErrorMessage="DebeIngresarUnprecio" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:RangeValidator ID="RangeValidatorPrecio" runat="server" ErrorMessage="DEbe ingresar un valor superior a 0" ForeColor="Red" MaximumValue="99999999" MinimumValue="0"></asp:RangeValidator>
            </td>
            <td class="auto-style2">Stock<asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFValidatorIdProducto2" runat="server" ControlToValidate="txtStock" ErrorMessage="DebeIngresarUnStcok" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidatorStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Debe Ingresar un valor superior a 0"></asp:RangeValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Notas</td>
            <td>
                <asp:TextBox ID="txtNotas" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Iva</td>
            <td>
                <asp:DropDownList ID="DDLIva" runat="server" DataSourceID="SqlDsIva" DataTextField="Descripcion" DataValueField="IDIVA">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDsIva" runat="server" ConnectionString="<%$ ConnectionStrings:FacturacionConnectionString1 %>" SelectCommand="SELECT IDIVA, Descripcion FROM IVA ORDER BY Descripcion"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlIva" runat="server"></asp:SqlDataSource>
            </td>
            <td class="auto-style2">Departamento</td>
            <td>
                <asp:DropDownList ID="DDLDepartamento" runat="server" DataSourceID="SqlSdsDepartamento" DataTextField="Descripcion" DataValueField="IDDepartamento">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlSdsDepartamento" runat="server" ConnectionString="<%$ ConnectionStrings:FacturacionConnectionString1 %>" SelectCommand="SELECT IDDepartamento, Descripcion FROM Departamento ORDER BY Descripcion"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
</asp:Content>
