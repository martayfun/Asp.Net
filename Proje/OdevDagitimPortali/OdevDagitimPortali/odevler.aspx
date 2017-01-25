<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="odevler.aspx.vb" Inherits="OdevDagitimPortali.odevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9">
<h1>Resim Ekleme</h1><hr />
<table class="table">
<tr>
<td><b>Ders Adı</b></td>
<td>
    <asp:DropDownList ID="txtAdi" runat="server" Height="16px" Width="250px">
    </asp:DropDownList>
    </td>
</tr>
    <tr>
<td><b>Ödev Konusu</b></td>
<td><asp:TextBox ID="txtOdevkonu" runat="server" CssClass="form-control"></asp:TextBox></td>
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
<h1>Ödev Yönetimi</h1>
<asp:GridView ID="gvResimler" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
<Columns>
<asp:TemplateField HeaderText="Id">
<ItemTemplate>
<asp:Literal ID="ltId" runat="server" Text='<%#Eval("odevId") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Ders Adı">
<EditItemTemplate>
<asp:TextBox ID="txtAdi" runat="server" CssClass="form-control" Text='<%#Eval("dersId") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Literal ID="ltAdi" runat="server" Text='<%#Eval("dersId") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Ödev Konusu">
<EditItemTemplate>
<asp:TextBox ID="txtAciklama" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Eval("odevKonu") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Literal ID="ltAciklama" runat="server" Text='<%#Eval("odevKonu") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:CommandField ButtonType="Button" CancelText="İptal" DeleteText="Sil" EditText="Düzenle" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Kaydet">
<ControlStyle CssClass="btn btn-warning" />
</asp:CommandField>
</Columns>
</asp:GridView>
</div>
</asp:Content>
