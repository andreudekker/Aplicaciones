<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Iva.aspx.cs" Inherits="AplicacionWebAsp4._5.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Iva</h1>
    
        <table class="auto-style1">
            <tr>
                <td>Descripcion</td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFValidatorDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="DebeIngresarUnaDescripcion" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Tarifa</td>
                <td>
                    <asp:TextBox ID="txtTarifa" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFValidatorTarifa" runat="server" ControlToValidate="txtTarifa" ErrorMessage="DebeIngresarUnaTarifa" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidatorTarifa" runat="server" ControlToValidate="txtTarifa" ErrorMessage="Debe ingresar un valor entre 0 y 100" ForeColor="Red" MaximumValue="100" MinimumValue="0" Type="Double"></asp:RangeValidator>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
        <asp:GridView ID="gvIva" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDIVA" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="IDIVA" HeaderText="IDIVA" ReadOnly="True" SortExpression="IDIVA" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Tarifa" HeaderText="Tarifa" SortExpression="Tarifa" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FacturacionConnectionString1 %>" DeleteCommand="DELETE FROM [IVA] WHERE [IDIVA] = @IDIVA" InsertCommand="INSERT INTO [IVA] ([Descripcion], [Tarifa]) VALUES (@Descripcion, @Tarifa)" ProviderName="<%$ ConnectionStrings:FacturacionConnectionString1.ProviderName %>" SelectCommand="SELECT [IDIVA], [Descripcion], [Tarifa] FROM [IVA]" UpdateCommand="UPDATE [IVA] SET [Descripcion] = @Descripcion, [Tarifa] = @Tarifa WHERE [IDIVA] = @IDIVA">
            <DeleteParameters>
                <asp:Parameter Name="IDIVA" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Tarifa" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Tarifa" Type="Decimal" />
                <asp:Parameter Name="IDIVA" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

</asp:Content>
