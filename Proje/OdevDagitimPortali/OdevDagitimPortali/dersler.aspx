<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="dersler.aspx.vb" Inherits="OdevDagitimPortali.dersler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9">
<h1>Ders Ekleme</h1><hr />
<table class="table">
<tr>
<td><b>Ders Adı</b></td>
<td><asp:TextBox ID="txtAdi" runat="server" CssClass="form-control"></asp:TextBox></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><asp:Button ID="btnKaydet" runat="server" CssClass="btn btn-primary" Text="Kaydet"></asp:Button></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><br /><asp:Label ID="lbSonuc" runat="server"></asp:Label></td>
</tr>
</table>
<hr />
<h1>Ders Yönetimi</h1>
<asp:GridView ID="gvResimler" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
<Columns>
<asp:TemplateField HeaderText="Id">
<ItemTemplate>
<asp:Literal ID="ltId" runat="server" Text='<%#Eval("dersId") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Ders Adı">
<EditItemTemplate>
<asp:TextBox ID="txtDers" runat="server" CssClass="form-control" Text='<%#Eval("dersAdi") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Literal ID="ltDers" runat="server" Text='<%#Eval("dersAdi") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:CommandField ButtonType="Button" CancelText="İptal" DeleteText="Sil" EditText="Düzenle" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Kaydet">
<ControlStyle CssClass="btn btn-warning" />
</asp:CommandField>
</Columns>
</asp:GridView>
</div>
</asp:Content>
