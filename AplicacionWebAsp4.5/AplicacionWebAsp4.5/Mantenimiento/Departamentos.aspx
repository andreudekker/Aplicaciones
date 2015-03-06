<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departamentos.aspx.cs" Inherits="AplicacionWebAsp4._5.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <p>
        Departamentos</p>
    <table class="auto-style1">
        <tr>
            <td>departamento<asp:TextBox ID="txtDepartamento" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFValidatorDescripcion" runat="server" ControlToValidate="txtDepartamento" ErrorMessage="DebeIngresarUnaDescripcion" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="btnNuevo" runat="server" OnClick="btnNuevo_Click" Text="Nuevo" />
            </td>
        </tr>
    </table>
    <p>
        <asp:GridView ID="gvDepartamento" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDDepartamento" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="IDDepartamento" HeaderText="IDDepartamento" ReadOnly="True" SortExpression="IDDepartamento" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FacturacionConnectionString1 %>" DeleteCommand="DELETE FROM [Departamento] WHERE [IDDepartamento] = @IDDepartamento" InsertCommand="INSERT INTO [Departamento] ([Descripcion]) VALUES (@Descripcion)" ProviderName="<%$ ConnectionStrings:FacturacionConnectionString1.ProviderName %>" SelectCommand="SELECT [IDDepartamento], [Descripcion] FROM [Departamento]" UpdateCommand="UPDATE [Departamento] SET [Descripcion] = @Descripcion WHERE [IDDepartamento] = @IDDepartamento">
            <DeleteParameters>
                <asp:Parameter Name="IDDepartamento" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="IDDepartamento" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
